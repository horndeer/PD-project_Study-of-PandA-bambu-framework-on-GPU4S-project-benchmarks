#!/bin/bash
##########################################################
#     Automatically generated by the PandA framework     #
##########################################################

# Synthesis script for COMPONENT: matrix_convolution

export PANDA_DATA_INSTALLDIR=/tmp/.mount_bambu-cZWC2P/usr/share/panda/
export CURR_WORKDIR=/home/paulevers/PD_project/PD_project/convolution_2D_bench/mm_synth_XSIM
: ${ABC_DRIVER_CELL:=BUFx2_ASAP7_75t_R}
export ABC_DRIVER_CELL
: ${ABC_LOAD_IN_FF:=3.898}
export ABC_LOAD_IN_FF
: ${ADDER_MAP_FILE:=${PANDA_DATA_INSTALLDIR}/asap7/yoSys/cells_adders.v}
export ADDER_MAP_FILE
: ${BLACKBOX_MAP_TCL:=${PANDA_DATA_INSTALLDIR}/asap7/yoSys/blackbox_map.tcl}
export BLACKBOX_MAP_TCL
: ${BLACKBOX_V_FILE:=${PANDA_DATA_INSTALLDIR}/asap7/yoSys/asap7sc7p5t.blackbox.v}
export BLACKBOX_V_FILE
: ${CELL_PAD_IN_SITES_DETAIL_PLACEMENT:=1}
export CELL_PAD_IN_SITES_DETAIL_PLACEMENT
: ${CELL_PAD_IN_SITES_GLOBAL_PLACEMENT:=2}
export CELL_PAD_IN_SITES_GLOBAL_PLACEMENT
: ${CLKGATE_MAP_FILE:=${PANDA_DATA_INSTALLDIR}/asap7/yoSys/cells_clkgate.v}
export CLKGATE_MAP_FILE
: ${CORE_AREA:="5.08 5.08 80 80"}
export CORE_AREA
: ${CTS_BUF_CELL:=BUFx4_ASAP7_75t_R}
export CTS_BUF_CELL
: ${CTS_BUF_DISTANCE:=60}
export CTS_BUF_DISTANCE
: ${DFF_LIB_FILE:=${PANDA_DATA_INSTALLDIR}/asap7/lib/asap7sc7p5t_SEQ_RVT_FF_nldm_201020.lib}
export DFF_LIB_FILE
: ${DIE_AREA:="0 0 90 90"}
export DIE_AREA
: ${DONT_USE_CELLS:="*x1_ASAP7* *x1p*_ASAP7* *xp*_ASAP7* SDF* ICG* DFFH*"}
export DONT_USE_CELLS
: ${FILL_CELLS:="FILLERxp5_ASAP7_75t_R"}
export FILL_CELLS
: ${GDS_FILES:=${PANDA_DATA_INSTALLDIR}/asap7/gds/asap7sc7p5t_27_R_1x_201211.gds ${ADDITIONAL_GDS}}
export GDS_FILES
: ${IO_PLACER_H:=M4}
export IO_PLACER_H
: ${IO_PLACER_V:=M5}
export IO_PLACER_V
: ${KLAYOUT_TECH_FILE:=${PANDA_DATA_INSTALLDIR}/asap7/KLayout/asap7.lyt}
export KLAYOUT_TECH_FILE
: ${LATCH_MAP_FILE:=${PANDA_DATA_INSTALLDIR}/asap7/yoSys/cells_latch.v}
export LATCH_MAP_FILE
: ${LIB_FILES:="${PANDA_DATA_INSTALLDIR}/asap7/lib/asap7sc7p5t_AO_RVT_FF_nldm_201020.lib ${PANDA_DATA_INSTALLDIR}/asap7/lib/asap7sc7p5t_INVBUF_RVT_FF_nldm_201020.lib ${PANDA_DATA_INSTALLDIR}/asap7/lib/asap7sc7p5t_OA_RVT_FF_nldm_201020.lib ${PANDA_DATA_INSTALLDIR}/asap7/lib/asap7sc7p5t_SIMPLE_RVT_FF_nldm_201020.lib ${PANDA_DATA_INSTALLDIR}/asap7/lib/asap7sc7p5t_SEQ_RVT_FF_nldm_201020.lib ${ADDITIONAL_LIBS} "}
export LIB_FILES
: ${MACRO_PLACE_CHANNEL:="12 12"}
export MACRO_PLACE_CHANNEL
: ${MACRO_PLACE_HALO:="10 10"}
export MACRO_PLACE_HALO
: ${MAKE_TRACKS:=${PANDA_DATA_INSTALLDIR}/asap7/openRoad/make_tracks.tcl}
export MAKE_TRACKS
: ${MAX_ROUTING_LAYER:=M7}
export MAX_ROUTING_LAYER
: ${MIN_BUF_CELL_AND_PORTS:="BUFx2_ASAP7_75t_R A Y"}
export MIN_BUF_CELL_AND_PORTS
: ${MIN_ROUTING_LAYER:=M2}
export MIN_ROUTING_LAYER
: ${PDN_CFG:=${PANDA_DATA_INSTALLDIR}/asap7/openRoad/pdn/grid_strategy-M2-M5-M7.cfg}
export PDN_CFG
: ${PLACE_DENSITY:=0.60}
export PLACE_DENSITY
: ${PLACE_SITE:=asap7sc7p5t}
export PLACE_SITE
: ${PLATFORM:=asap7}
export PLATFORM
: ${PROCESS:=45}
export PROCESS
: ${RCX_RULES:=${PANDA_DATA_INSTALLDIR}/asap7/rcx_patterns.rules}
export RCX_RULES
: ${SC_LEF:=${PANDA_DATA_INSTALLDIR}/asap7/lef/asap7sc7p5t_27_R_1x_201211.lef}
export SC_LEF
: ${SET_RC_TCL:=${PANDA_DATA_INSTALLDIR}/asap7/setRC.tcl}
export SET_RC_TCL
: ${TAPCELL_TCL:=${PANDA_DATA_INSTALLDIR}/asap7/openRoad/tapcell.tcl}
export TAPCELL_TCL
: ${TECH_LEF:=${PANDA_DATA_INSTALLDIR}/asap7/lef/asap7_tech_1x_201209.lef}
export TECH_LEF
: ${TEMPERATURE:=25C}
export TEMPERATURE
: ${TIEHI_CELL_AND_PORT:="TIEHIx1_ASAP7_75t_R H"}
export TIEHI_CELL_AND_PORT
: ${TIELO_CELL_AND_PORT:="TIELOx1_ASAP7_75t_R L"}
export TIELO_CELL_AND_PORT
: ${WIRE_RC_LAYER:=M3}
export WIRE_RC_LAYER
# STEP: bash_flow
cd /home/paulevers/PD_project/PD_project/convolution_2D_bench/mm_synth_XSIM
bash /home/paulevers/PD_project/PD_project/convolution_2D_bench/mm_synth_XSIM/HLS_output//Synthesis/bash_flow_3/bash_script.sh

