#!/bin/bash
##########################################################
#     Automatically generated by the PandA framework     #
##########################################################

# Synthesis script for COMPONENT: matrix_multiplication

#configuration
. /opt/Xilinx/Vivado/2023.2/settings64.sh >& /dev/null; 

# STEP: vivado_flow
cd /root/Desktop/Projects/PD_project/matrix_multiplication_bench/mm_synth_XSIM
ulimit -s 131072; vivado -mode batch -nojournal -nolog -source /root/Desktop/Projects/PD_project/matrix_multiplication_bench/mm_synth_XSIM/HLS_output//Synthesis/vivado_flow_1/vivado.tcl

