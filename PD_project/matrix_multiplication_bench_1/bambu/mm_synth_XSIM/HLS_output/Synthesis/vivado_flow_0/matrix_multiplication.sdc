create_clock -period 1.5 -name clock [get_ports clock]
set_max_delay 1.5 -from [all_inputs] -to [all_outputs]
set_max_delay 1.5 -from [all_inputs] -to [all_registers]
set_max_delay 1.5 -from [all_registers] -to [all_outputs]
