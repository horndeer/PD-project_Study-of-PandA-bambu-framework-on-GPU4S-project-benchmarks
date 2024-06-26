#!/bin/bash
script=$(readlink -e $0)
root_dir=$(dirname $script)

# export NPROC=8
# export NCORE=8
# export DIE_AREA="0 0 180 180"
# export CORE_AREA="5.08 5.08 170 170"

mkdir -p mm_synth_XSIM
cd mm_synth_XSIM
echo "# HLS synthesis, testbench generation, simulation with XSiM and RTL synthesis with OpenRoad"
# timeout 2h bambu $root_dir/module.c --clock-period=1.5 --std=c99 -s --top-fname=mm --generate-tb=$root_dir/test.xml \
#                  --evaluation --simulator=ICARUS --device-name=asap7-BC --memory-allocation-policy=NO_BRAM \
#                  --channels-number=8 --experimental-setup=BAMBU-PERFORMANCE-MP --compiler=I386_CLANG12 -v4 "$@"
timeout 2h bambu $root_dir/../cpu_functions.cpp --top-fname=matrix_multiplication
              --simulate --evaluation --device-name=asap7-BC --simulator=XSIM --experimental-setup=BAMBU-PERFORMANCE-MP "$@"
return_value=$?
if test $return_value != 0; then
   exit $return_value
fi
cd ..
exit 0


# timeout 2h: This sets a timeout of 2 hours for the execution of the subsequent command. If the command takes longer than 2 hours to complete, it will be terminated.

# bambu: This is the name of the command or executable that will be executed.

# $root_dir/module.c: This is the path to the module.c file that will be passed as an argument to the bambu command. The $root_dir is likely a variable that holds the root directory path.

# --clock-period=1.5: This parameter sets the desired clock period to 1.5 (units depend on the specific application). The clock period is the time duration between consecutive clock cycles in a digital circuit.

# --std=c99: This specifies the C language standard to be used. In this case, it is set to C99, which is the 1999 version of the C programming language standard.

# -s: This is a shorthand option that enables the silent mode. It suppresses unnecessary output or prompts during the execution of the bambu command.

# --top-fname=mm: This parameter specifies the name of the top-level module or entity in the design. In this case, it is set to mm.

# --generate-tb=$root_dir/test.xml: This parameter specifies the path and name of the testbench file that will be generated by the bambu command. The $root_dir/test.xml is likely a variable that holds the path to the test.xml file.

# --evaluation: This parameter indicates that the execution is for evaluation purposes. It might enable additional features or optimizations specific to evaluation.

# --simulator=ICARUS: This parameter specifies the simulator to be used for simulation. In this case, it is set to ICARUS, which is a popular open-source Verilog simulator.

# --device-name=asap7-BC: This parameter specifies the name of the target device or FPGA (Field-Programmable Gate Array) to be used. In this case, it is set to asap7-BC.

# --memory-allocation-policy=NO_BRAM: This parameter sets the memory allocation policy to NO_BRAM, which likely means that the design should not use Block RAM (BRAM) resources.

# --channels-number=8: This parameter specifies the number of channels to be used. The purpose and meaning of channels depend on the specific application or design.

# --experimental-setup=BAMBU-PERFORMANCE-MP: This parameter specifies an experimental setup or configuration for the bambu command. The exact details of this setup depend on the specific application or experiment.

# --compiler=I386_CLANG12: This parameter specifies the compiler to be used. In this case, it is set to I386_CLANG12, which is likely a specific version of the Clang compiler for the x86 architecture.

# -v4: This is a shorthand option that sets the verbosity level to 4. It increases the amount of output or logging generated by the bambu command.

# "$@": This is a special parameter that represents all the command-line arguments passed to the shell script. It allows any additional arguments to be passed to the bambu command.

# These parameters and options control various aspects of the execution of the bambu command, such as specifying input files, setting simulation parameters, selecting target devices, and enabling specific features or optimizations. The exact purpose and behavior of each parameter depend on the specific application or tool being used.