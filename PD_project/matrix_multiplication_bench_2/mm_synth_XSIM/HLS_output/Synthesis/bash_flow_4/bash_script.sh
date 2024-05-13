##########################################################
#     Automatically generated by the PandA framework     #
##########################################################

: ${NPROC:=1}
export NPROC
: ${NUM_CORES:=${NPROC}}
export NUM_CORES
export SCRIPTS_DIR=${PANDA_DATA_INSTALLDIR}/scripts/
export UTILS_DIR=${PANDA_DATA_INSTALLDIR}/util/
export PLATFORM_DIR=${PANDA_DATA_INSTALLDIR}/${PLATFORM}/
export DESIGN_NAME="matrix_multiplication"
: ${DESIGN_NICKNAME:=${DESIGN_NAME}}
export DESIGN_NICKNAME
export SDC_FILE=/home/paulevers/PD_project/PD_project/matrix_multiplication_bench_2/mm_synth_XSIM/HLS_output//Synthesis/matrix_multiplication.sdc
export VERILOG_FILES="/home/paulevers/PD_project/PD_project/matrix_multiplication_bench_2/mm_synth_XSIM/matrix_multiplication.v"
: ${FLOW_VARIANT:=base}
export FLOW_VARIANT
: ${GPL_TIMING_DRIVEN:=1}
export GPL_TIMING_DRIVEN
: ${GPL_ROUTABILITY_DRIVEN:=1}
export GPL_ROUTABILITY_DRIVEN
# Setup working directories
export DESIGN_DIR=${CURR_WORKDIR}
export LOG_DIR=${CURR_WORKDIR}/OpenROAD_logs/${PLATFORM}/${DESIGN_NICKNAME}/${FLOW_VARIANT}
export OBJECTS_DIR=${CURR_WORKDIR}/OpenROAD_objects/${PLATFORM}/${DESIGN_NICKNAME}/${FLOW_VARIANT}
export REPORTS_DIR=${CURR_WORKDIR}/OpenROAD_reports/${PLATFORM}/${DESIGN_NICKNAME}/${FLOW_VARIANT}
export RESULTS_DIR=${CURR_WORKDIR}/OpenROAD_results/${PLATFORM}/${DESIGN_NICKNAME}/${FLOW_VARIANT}
# Enables hierarchical yosys
: {SYNTH_HIERARCHICAL:=0}
export SYNTH_HIERARCHICAL
export SYNTH_STOP_MODULE_SCRIPT=${OBJECTS_DIR}/mark_hier_stop_modules.tcl
if [[ $SYNTH_HIERARCHICAL -eq 1 ]]
then
  export HIER_REPORT_SCRIPT=${SCRIPTS_DIR}/synth_hier_report.tcl
  : ${MAX_UNGROUP_SIZE:=0}
  export MAX_UNGROUP_SIZE
fi
# Enables Re-synthesis for area reclaim
: ${RESYNTH_AREA_RECOVER:=0}
export RESYNTH_AREA_RECOVER
: ${RESYNTH_TIMING_RECOVER:=0}
export RESYNTH_TIMING_RECOVER
: ${ABC_AREA:=0}
export ABC_AREA
# Global setting for Synthesis
: ${SYNTH_ARGS:=-flatten}
export SYNTH_ARGS
# Global setting for Floorplan
export PLACE_PINS_ARGS=""
: ${STREAM_SYSTEM:=GDS}
export STREAM_SYSTEM
: {ABC_CLOCK_PERIOD_IN_PS:=10000}
export ABC_CLOCK_PERIOD_IN_PS
rm -rf ${LOG_DIR}
mkdir -p ${LOG_DIR}
rm -rf ${OBJECTS_DIR}
mkdir -p ${OBJECTS_DIR}
rm -rf ${REPORTS_DIR}
mkdir -p ${REPORTS_DIR}
rm -rf ${RESULTS_DIR}
mkdir -p ${RESULTS_DIR}
mkdir -p ${OBJECTS_DIR}/lib
DONT_USE_LIBS=""
COUNTER=1
for lib in ${LIB_FILES} 
do
  ${UTILS_DIR}/markDontUse.py -p "${DONT_USE_CELLS}" -i ${lib} -o ${OBJECTS_DIR}/lib/tobemerged${COUNTER}.lib
  DONT_USE_LIBS+=" ${OBJECTS_DIR}/lib/tobemerged${COUNTER}.lib"
  COUNTER=$[$COUNTER +1]
done
export DONT_USE_LIBS
${UTILS_DIR}/mergeLib.pl ${PLATFORM}_merged ${DONT_USE_LIBS} > ${OBJECTS_DIR}/lib/merged.lib
: ${DONT_USE_SC_LIB:=${OBJECTS_DIR}/lib/merged.lib}
export DONT_USE_SC_LIB
: ${WRAP_LEFS:=""}
: ${WRAPPED_LEFS:=""}
: ${WRAPPED_GDSOAS:=""}
export WRAPPED_GDSOAS
sed '/OR_DEFAULT/d' ${TECH_LEF} > ${OBJECTS_DIR}/klayout_tech.lef
LEF_FILES_PATTERN=""
COUNTER=1
for lef_file in ${OBJECTS_DIR}/klayout_tech.lef ${SC_LEF} ${ADDITIONAL_LEFS} 
do
  LEF_FILES_PATTERN+=" <lef-files>${lef_file}</lef-files>"
done
sed "s;<lef-files>.*</lef-files>;${LEF_FILES_PATTERN};g" ${KLAYOUT_TECH_FILE} > ${OBJECTS_DIR}/klayout.lyt
if [[ ${STREAM_SYSTEM} == *"GDS"* ]];
then
  STREAM_SYSTEM_EXT=gds
  GDSOAS_FILES=${GDS_FILES}
  ADDITIONAL_GDSOAS=${ADDITIONAL_GDS}
  SEAL_GDSOAS=${SEAL_GDS}
else
  STREAM_SYSTEM_EXT=oas
  GDSOAS_FILES=${OAS_FILES}
  ADDITIONAL_GDSOAS=${ADDITIONAL_OAS}
  SEAL_GDSOAS=${SEAL_OAS}
fi
export STREAM_SYSTEM_EXT
export GDSOAS_FILES
export ADDITIONAL_GDSOAS
export SEAL_GDSOAS
openroad << EOT 
proc dump_statistics {  } {
  set DesignArea [sta::format_area [rsz::design_area] 0]
  set TotPower [lindex [sta::design_power [sta::find_corner "default"]] 3] 
  set design_req [get_property [lindex [all_clocks] 0] period]
  set design_slack [sta::worst_slack -max]
  set design_delay [expr {\$design_req - \$design_slack}]
  file delete -force /home/paulevers/PD_project/PD_project/matrix_multiplication_bench_2/mm_synth_XSIM/HLS_output//Synthesis/bash_flow_4/matrix_multiplication_report.xml 
  set ofile_report [open /home/paulevers/PD_project/PD_project/matrix_multiplication_bench_2/mm_synth_XSIM/HLS_output//Synthesis/bash_flow_4/matrix_multiplication_report.xml w]
  puts \$ofile_report "<?xml version=\"1.0\"?>"
  puts \$ofile_report "<document>"
  puts \$ofile_report "  <application>"
  puts \$ofile_report "    <section stringID=\"BASH_SYNTHESIS_SUMMARY\">"
  puts \$ofile_report "      <item stringID=\"BASHBACKEND_AREA\" value=\"\$DesignArea\"/>"
  puts \$ofile_report "      <item stringID=\"BASHBACKEND_POWER\" value=\"\$TotPower\"/>"
  puts \$ofile_report "      <item stringID=\"BASHBACKEND_DESIGN_DELAY\" value=\"\$design_delay\"/>"
  puts \$ofile_report "    </section>"
  puts \$ofile_report "  </application>"
  puts \$ofile_report "</document>"
  close \$ofile_report
}; #END PROC
set standalone 0
# Synthesis
source -verbose $::env(SCRIPTS_DIR)/yosys.tcl
# Read process / design
# Read lef
read_lef $::env(TECH_LEF)
read_lef $::env(SC_LEF)
if {[info exist ::env(ADDITIONAL_LEFS)]} {
    foreach lef $::env(ADDITIONAL_LEFS) {
      read_lef $lef
    }
}
# Read liberty files
source $::env(SCRIPTS_DIR)/read_liberty.tcl
read_verilog $::env(RESULTS_DIR)/1_1_yosys.v
link_design $::env(DESIGN_NAME)
read_sdc $::env(SDC_FILE)
if [file exists $::env(PLATFORM_DIR)/derate.tcl] {
  source $::env(PLATFORM_DIR)/derate.tcl
}
if [file exists $::env(PLATFORM_DIR)/setRC.tcl] {
  source $::env(PLATFORM_DIR)/setRC.tcl
}
# Floorplan
source -verbose $::env(SCRIPTS_DIR)/floorplan.tcl
source -verbose $::env(SCRIPTS_DIR)/io_placement_random.tcl
source -verbose $::env(SCRIPTS_DIR)/tdms_place.tcl
source -verbose $::env(SCRIPTS_DIR)/macro_place.tcl
source -verbose $::env(SCRIPTS_DIR)/tapcell.tcl
source -verbose $::env(SCRIPTS_DIR)/pdn.tcl
# Place
source -verbose $::env(SCRIPTS_DIR)/global_place.tcl
source -verbose $::env(SCRIPTS_DIR)/io_placement.tcl
source -verbose $::env(SCRIPTS_DIR)/resize.tcl
source -verbose $::env(SCRIPTS_DIR)/detail_place.tcl
# CTS
source -verbose $::env(SCRIPTS_DIR)/cts.tcl
source -verbose $::env(SCRIPTS_DIR)/fillcell.tcl
# Route
source -verbose $::env(SCRIPTS_DIR)/global_route.tcl
source -verbose $::env(SCRIPTS_DIR)/detail_route.tcl
# Finishing
if {[info exists ::env(USE_FILL)]} {
  source -verbose $::env(SCRIPTS_DIR)/density_fill.tcl
}
# Finishing
source -verbose $::env(SCRIPTS_DIR)/final_report.tcl
dump_statistics
source -verbose $::env(SCRIPTS_DIR)/klayout.tcl
exit
EOT

