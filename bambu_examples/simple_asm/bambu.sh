#!/bin/bash
script=$(readlink -e $0)
root_dir=$(dirname $script)

mkdir -p simple_asm_hls
cd simple_asm_hls
echo "#synthesis with VIVADO RTL and simulation"
timeout 2h bambu --simulator=MODELSIM --print-dot $root_dir/asm.c --simulate --generate-tb=$root_dir/test.xml --C-no-parse=$root_dir/c_stub.c "$@"
return_value=$? 
if test $return_value != 0; then
   exit $return_value
fi
cd ..
exit 0
