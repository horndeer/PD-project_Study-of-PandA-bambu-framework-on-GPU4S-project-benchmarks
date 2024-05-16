// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2023.1 - Revision 04336c437a53bc96ae90b74052c455629946ec8b-main - Date 2024-05-16T17:41:07
// /tmp/.mount_bambu-wwKqUi/usr/bin/bambu executed with: /tmp/.mount_bambu-wwKqUi/usr/bin/bambu --top-fname=relu --simulate --evaluation --device-name=asap7-BC --simulator=XSIM --experimental-setup=BAMBU-PERFORMANCE-MP /root/Desktop/Projects/PD_project/relu_bench/bambu_try1/cpu_functions.cpp 
// 
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************

`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module constant_value(out1);
  parameter BITSIZE_out1=1,
    value=1'b0;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = value;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_SE(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    if (wenable)
      reg_out1 <= in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_STD(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    reg_out1 <= in1;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module read_cond_FU(in1,
  out1);
  parameter BITSIZE_in1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output out1;
  assign out1 = in1 != {BITSIZE_in1{1'b0}};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UIdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BMEMORY_CTRLN(clock,
  in1,
  in2,
  in3,
  in4,
  sel_LOAD,
  sel_STORE,
  out1,
  Min_oe_ram,
  Mout_oe_ram,
  Min_we_ram,
  Mout_we_ram,
  Min_addr_ram,
  Mout_addr_ram,
  M_Rdata_ram,
  Min_Wdata_ram,
  Mout_Wdata_ram,
  Min_data_ram_size,
  Mout_data_ram_size,
  M_DataRdy);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_Min_oe_ram=1, PORTSIZE_Min_oe_ram=2,
    BITSIZE_Min_we_ram=1, PORTSIZE_Min_we_ram=2,
    BITSIZE_Mout_oe_ram=1, PORTSIZE_Mout_oe_ram=2,
    BITSIZE_Mout_we_ram=1, PORTSIZE_Mout_we_ram=2,
    BITSIZE_M_DataRdy=1, PORTSIZE_M_DataRdy=2,
    BITSIZE_Min_addr_ram=1, PORTSIZE_Min_addr_ram=2,
    BITSIZE_Mout_addr_ram=1, PORTSIZE_Mout_addr_ram=2,
    BITSIZE_M_Rdata_ram=8, PORTSIZE_M_Rdata_ram=2,
    BITSIZE_Min_Wdata_ram=8, PORTSIZE_Min_Wdata_ram=2,
    BITSIZE_Mout_Wdata_ram=8, PORTSIZE_Mout_Wdata_ram=2,
    BITSIZE_Min_data_ram_size=1, PORTSIZE_Min_data_ram_size=2,
    BITSIZE_Mout_data_ram_size=1, PORTSIZE_Mout_data_ram_size=2;
  // IN
  input clock;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_Min_oe_ram-1:0] Min_oe_ram;
  input [PORTSIZE_Min_we_ram-1:0] Min_we_ram;
  input [(PORTSIZE_Min_addr_ram*BITSIZE_Min_addr_ram)+(-1):0] Min_addr_ram;
  input [(PORTSIZE_M_Rdata_ram*BITSIZE_M_Rdata_ram)+(-1):0] M_Rdata_ram;
  input [(PORTSIZE_Min_Wdata_ram*BITSIZE_Min_Wdata_ram)+(-1):0] Min_Wdata_ram;
  input [(PORTSIZE_Min_data_ram_size*BITSIZE_Min_data_ram_size)+(-1):0] Min_data_ram_size;
  input [PORTSIZE_M_DataRdy-1:0] M_DataRdy;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [PORTSIZE_Mout_oe_ram-1:0] Mout_oe_ram;
  output [PORTSIZE_Mout_we_ram-1:0] Mout_we_ram;
  output [(PORTSIZE_Mout_addr_ram*BITSIZE_Mout_addr_ram)+(-1):0] Mout_addr_ram;
  output [(PORTSIZE_Mout_Wdata_ram*BITSIZE_Mout_Wdata_ram)+(-1):0] Mout_Wdata_ram;
  output [(PORTSIZE_Mout_data_ram_size*BITSIZE_Mout_data_ram_size)+(-1):0] Mout_data_ram_size;
  
  parameter max_n_writes = PORTSIZE_sel_STORE > PORTSIZE_Mout_we_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_we_ram;
  parameter max_n_reads = PORTSIZE_sel_LOAD > PORTSIZE_Mout_oe_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_oe_ram;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  wire  [(PORTSIZE_in2*BITSIZE_in2)-1:0] tmp_addr;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  assign tmp_addr = in2;
  generate
  genvar i;
    for (i=0; i<max_n_rw; i=i+1)
    begin : L0
      assign Mout_addr_ram[(i+1)*BITSIZE_Mout_addr_ram-1:i*BITSIZE_Mout_addr_ram] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (tmp_addr[(i+1)*BITSIZE_in2-1:i*BITSIZE_in2]) : Min_addr_ram[(i+1)*BITSIZE_Min_addr_ram-1:i*BITSIZE_Min_addr_ram];
    end
    endgenerate
  assign Mout_oe_ram = int_sel_LOAD | Min_oe_ram;
  assign Mout_we_ram = int_sel_STORE | Min_we_ram;
  generate
    for (i=0; i<max_n_reads; i=i+1)
    begin : L1
      assign out1[(i+1)*BITSIZE_out1-1:i*BITSIZE_out1] = M_Rdata_ram[i*BITSIZE_M_Rdata_ram+BITSIZE_out1-1:i*BITSIZE_M_Rdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L2
      assign Mout_Wdata_ram[(i+1)*BITSIZE_Mout_Wdata_ram-1:i*BITSIZE_Mout_Wdata_ram] = int_sel_STORE[i] ? in1[(i+1)*BITSIZE_in1-1:i*BITSIZE_in1] : Min_Wdata_ram[(i+1)*BITSIZE_Min_Wdata_ram-1:i*BITSIZE_Min_Wdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L3
      assign Mout_data_ram_size[(i+1)*BITSIZE_Mout_data_ram_size-1:i*BITSIZE_Mout_data_ram_size] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (in3[(i+1)*BITSIZE_in3-1:i*BITSIZE_in3]) : Min_data_ram_size[(i+1)*BITSIZE_Min_data_ram_size-1:i*BITSIZE_Min_data_ram_size];
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ne_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module truth_and_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 && in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module truth_not_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = !in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module truth_or_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 || in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_and_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_cond_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != 0 ? in2 : in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_eq_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 == in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 << in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 << in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 < in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ne_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_pointer_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    LSB_PARAMETER=-1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  wire [BITSIZE_out1-1:0] in1_tmp;
  wire [BITSIZE_out1-1:0] in2_tmp;
  assign in1_tmp = in1;
  assign in2_tmp = in2;generate if (BITSIZE_out1 > LSB_PARAMETER) assign out1[BITSIZE_out1-1:LSB_PARAMETER] = (in1_tmp[BITSIZE_out1-1:LSB_PARAMETER] + in2_tmp[BITSIZE_out1-1:LSB_PARAMETER]); else assign out1 = 0; endgenerate
  generate if (LSB_PARAMETER != 0 && BITSIZE_out1 > LSB_PARAMETER) assign out1[LSB_PARAMETER-1:0] = 0; endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >> in2;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module MUX_GATE(sel,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input sel;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = sel ? in1 : in2;
endmodule

// Datapath RTL description for relu
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_relu(clock,
  reset,
  in_port_A,
  in_port_B,
  in_port_size,
  M_Rdata_ram,
  M_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  fuselector_BMEMORY_CTRLN_18_i0_LOAD,
  fuselector_BMEMORY_CTRLN_18_i0_STORE,
  selector_MUX_17_reg_0_0_0_0,
  selector_MUX_18_reg_1_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0,
  selector_MUX_22_reg_5_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_relu_33985_34669,
  OUT_CONDITION_relu_33985_34677,
  OUT_CONDITION_relu_33985_34725,
  OUT_CONDITION_relu_33985_34728);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_B;
  input [31:0] in_port_size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_18_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_18_i0_STORE;
  input selector_MUX_17_reg_0_0_0_0;
  input selector_MUX_18_reg_1_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0;
  input selector_MUX_22_reg_5_0_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output OUT_CONDITION_relu_33985_34669;
  output OUT_CONDITION_relu_33985_34677;
  output OUT_CONDITION_relu_33985_34725;
  output OUT_CONDITION_relu_33985_34728;
  // Component and signal declarations
  wire [63:0] null_out_signal_BMEMORY_CTRLN_18_i0_out1_1;
  wire [63:0] out_BMEMORY_CTRLN_18_i0_BMEMORY_CTRLN_18_i0;
  wire [31:0] out_MUX_17_reg_0_0_0_0;
  wire [31:0] out_MUX_18_reg_1_0_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0;
  wire [31:0] out_MUX_22_reg_5_0_0_0;
  wire signed [1:0] out_UIdata_converter_FU_10_i0_fu_relu_33985_37416;
  wire [31:0] out_UUdata_converter_FU_2_i0_fu_relu_33985_37203;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu_relu_33985_37200;
  wire out_const_0;
  wire [7:0] out_const_1;
  wire [6:0] out_const_2;
  wire [6:0] out_const_3;
  wire out_const_4;
  wire [1:0] out_const_5;
  wire [10:0] out_const_6;
  wire [51:0] out_const_7;
  wire [63:0] out_const_8;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [6:0] out_conv_out_const_1_8_7;
  wire out_ne_expr_FU_0_8_8_19_i0_fu_relu_33985_37419;
  wire out_read_cond_FU_11_i0_fu_relu_33985_34677;
  wire out_read_cond_FU_14_i0_fu_relu_33985_34725;
  wire out_read_cond_FU_15_i0_fu_relu_33985_34728;
  wire out_read_cond_FU_4_i0_fu_relu_33985_34669;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [28:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire [63:0] out_reg_9_reg_9;
  wire out_truth_and_expr_FU_1_1_1_20_i0_fu_relu_33985_37422;
  wire out_truth_and_expr_FU_1_1_1_20_i1_fu_relu_33985_37428;
  wire out_truth_and_expr_FU_1_1_1_20_i2_fu_relu_33985_37431;
  wire out_truth_and_expr_FU_1_1_1_20_i3_fu_relu_33985_37437;
  wire out_truth_not_expr_FU_1_1_21_i0_fu_relu_33985_37401;
  wire out_truth_not_expr_FU_1_1_21_i1_fu_relu_33985_37425;
  wire out_truth_not_expr_FU_1_1_21_i2_fu_relu_33985_37434;
  wire out_truth_or_expr_FU_1_1_1_22_i0_fu_relu_33985_37440;
  wire [51:0] out_ui_bit_and_expr_FU_0_64_64_23_i0_fu_relu_33985_37386;
  wire [63:0] out_ui_bit_and_expr_FU_0_64_64_24_i0_fu_relu_33985_37404;
  wire [63:0] out_ui_bit_and_expr_FU_0_64_64_24_i1_fu_relu_33985_37410;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_25_i0_fu_relu_33985_37380;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_26_i0_fu_relu_33985_37443;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_26_i1_fu_relu_33985_37446;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_26_i2_fu_relu_33985_37449;
  wire out_ui_eq_expr_FU_0_16_16_27_i0_fu_relu_33985_37383;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_28_i0_fu_relu_33985_34714;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_28_i1_fu_relu_33985_36967;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_28_i2_fu_relu_33985_36980;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_28_i3_fu_relu_33985_37297;
  wire out_ui_lt_expr_FU_0_64_64_29_i0_fu_relu_33985_37413;
  wire out_ui_ne_expr_FU_0_1_1_30_i0_fu_relu_33985_37398;
  wire out_ui_ne_expr_FU_1_0_1_31_i0_fu_relu_33985_37395;
  wire out_ui_ne_expr_FU_32_0_32_32_i0_fu_relu_33985_36989;
  wire out_ui_ne_expr_FU_32_32_32_33_i0_fu_relu_33985_36993;
  wire out_ui_ne_expr_FU_32_32_32_33_i1_fu_relu_33985_36995;
  wire out_ui_ne_expr_FU_64_0_64_34_i0_fu_relu_33985_37389;
  wire out_ui_ne_expr_FU_64_0_64_35_i0_fu_relu_33985_37407;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_36_i0_fu_relu_33985_34682;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_36_i1_fu_relu_33985_34727;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_37_i0_fu_relu_33985_37294;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_38_i0_fu_relu_33985_34675;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_38_i1_fu_relu_33985_34699;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_38_i2_fu_relu_33985_36970;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_38_i3_fu_relu_33985_36983;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_39_i0_fu_relu_33985_37287;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_39_i1_fu_relu_33985_37292;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_40_i0_fu_relu_33985_37375;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_41_i0_fu_relu_33985_37392;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [63:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [31:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  
  BMEMORY_CTRLN #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(32),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_Min_addr_ram(32),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(32),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_18_i0 (.out1({null_out_signal_BMEMORY_CTRLN_18_i0_out1_1,
      out_BMEMORY_CTRLN_18_i0_BMEMORY_CTRLN_18_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0}),
    .in3({7'b0000000,
      out_conv_out_const_1_8_7}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_18_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_18_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_17_reg_0_0_0_0 (.out1(out_MUX_17_reg_0_0_0_0),
    .sel(selector_MUX_17_reg_0_0_0_0),
    .in1(out_ui_lshift_expr_FU_32_0_32_28_i3_fu_relu_33985_37297),
    .in2(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_18_reg_1_0_0_0 (.out1(out_MUX_18_reg_1_0_0_0),
    .sel(selector_MUX_18_reg_1_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_36_i1_fu_relu_33985_34727),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_38_i2_fu_relu_33985_36970));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_22_reg_5_0_0_0 (.out1(out_MUX_22_reg_5_0_0_0),
    .sel(selector_MUX_22_reg_5_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_36_i0_fu_relu_33985_34682),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_reg_9_reg_9));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2),
    .in1(out_conv_out_const_0_1_32));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b01000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110100)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111111)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111111111111111111111111111111111111111111111111111)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_8 (.out1(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(7)) conv_out_const_1_8_7 (.out1(out_conv_out_const_1_8_7),
    .in1(out_const_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_relu_33985_34669 (.out1(out_read_cond_FU_4_i0_fu_relu_33985_34669),
    .in1(out_ui_ne_expr_FU_32_0_32_32_i0_fu_relu_33985_36989));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_relu_33985_34675 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_38_i0_fu_relu_33985_34675),
    .in1(out_reg_2_reg_2),
    .in2(out_reg_0_reg_0));
  read_cond_FU #(.BITSIZE_in1(1)) fu_relu_33985_34677 (.out1(out_read_cond_FU_11_i0_fu_relu_33985_34677),
    .in1(out_ui_cond_expr_FU_1_1_1_1_26_i2_fu_relu_33985_37449));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_relu_33985_34682 (.out1(out_ui_plus_expr_FU_32_0_32_36_i0_fu_relu_33985_34682),
    .in1(out_reg_5_reg_5),
    .in2(out_const_4));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_relu_33985_34699 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_38_i1_fu_relu_33985_34699),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_0_reg_0));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_relu_33985_34714 (.out1(out_ui_lshift_expr_FU_32_0_32_28_i0_fu_relu_33985_34714),
    .in1(in_port_size),
    .in2(out_const_5));
  read_cond_FU #(.BITSIZE_in1(1)) fu_relu_33985_34725 (.out1(out_read_cond_FU_14_i0_fu_relu_33985_34725),
    .in1(out_ui_ne_expr_FU_32_32_32_33_i0_fu_relu_33985_36993));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_relu_33985_34727 (.out1(out_ui_plus_expr_FU_32_0_32_36_i1_fu_relu_33985_34727),
    .in1(out_reg_1_reg_1),
    .in2(out_const_4));
  read_cond_FU #(.BITSIZE_in1(1)) fu_relu_33985_34728 (.out1(out_read_cond_FU_15_i0_fu_relu_33985_34728),
    .in1(out_ui_ne_expr_FU_32_32_32_33_i1_fu_relu_33985_36995));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_relu_33985_36967 (.out1(out_ui_lshift_expr_FU_32_0_32_28_i1_fu_relu_33985_36967),
    .in1(out_reg_5_reg_5),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_relu_33985_36970 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_38_i2_fu_relu_33985_36970),
    .in1(out_reg_7_reg_7),
    .in2(out_ui_lshift_expr_FU_32_0_32_28_i1_fu_relu_33985_36967));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_relu_33985_36980 (.out1(out_ui_lshift_expr_FU_32_0_32_28_i2_fu_relu_33985_36980),
    .in1(out_reg_5_reg_5),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_relu_33985_36983 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_38_i3_fu_relu_33985_36983),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_lshift_expr_FU_32_0_32_28_i2_fu_relu_33985_36980));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_relu_33985_36989 (.out1(out_ui_ne_expr_FU_32_0_32_32_i0_fu_relu_33985_36989),
    .in1(in_port_size),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_relu_33985_36993 (.out1(out_ui_ne_expr_FU_32_32_32_33_i0_fu_relu_33985_36993),
    .in1(out_reg_5_reg_5),
    .in2(in_port_size));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_relu_33985_36995 (.out1(out_ui_ne_expr_FU_32_32_32_33_i1_fu_relu_33985_36995),
    .in1(out_reg_1_reg_1),
    .in2(in_port_size));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_relu_33985_37200 (.out1(out_UUdata_converter_FU_3_i0_fu_relu_33985_37200),
    .in1(in_port_A));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_relu_33985_37203 (.out1(out_UUdata_converter_FU_2_i0_fu_relu_33985_37203),
    .in1(in_port_B));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_relu_33985_37287 (.out1(out_ui_rshift_expr_FU_32_0_32_39_i0_fu_relu_33985_37287),
    .in1(out_reg_0_reg_0),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_relu_33985_37292 (.out1(out_ui_rshift_expr_FU_32_0_32_39_i1_fu_relu_33985_37292),
    .in1(out_ui_lshift_expr_FU_32_0_32_28_i0_fu_relu_33985_34714),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_relu_33985_37294 (.out1(out_ui_plus_expr_FU_32_32_32_37_i0_fu_relu_33985_37294),
    .in1(out_ui_rshift_expr_FU_32_0_32_39_i0_fu_relu_33985_37287),
    .in2(out_reg_4_reg_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_relu_33985_37297 (.out1(out_ui_lshift_expr_FU_32_0_32_28_i3_fu_relu_33985_37297),
    .in1(out_ui_plus_expr_FU_32_32_32_37_i0_fu_relu_33985_37294),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_relu_33985_37375 (.out1(out_ui_rshift_expr_FU_64_0_64_40_i0_fu_relu_33985_37375),
    .in1(out_BMEMORY_CTRLN_18_i0_BMEMORY_CTRLN_18_i0),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_relu_33985_37380 (.out1(out_ui_bit_and_expr_FU_16_0_16_25_i0_fu_relu_33985_37380),
    .in1(out_ui_rshift_expr_FU_64_0_64_40_i0_fu_relu_33985_37375),
    .in2(out_const_6));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu_relu_33985_37383 (.out1(out_ui_eq_expr_FU_0_16_16_27_i0_fu_relu_33985_37383),
    .in1(out_const_6),
    .in2(out_ui_bit_and_expr_FU_16_0_16_25_i0_fu_relu_33985_37380));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(52)) fu_relu_33985_37386 (.out1(out_ui_bit_and_expr_FU_0_64_64_23_i0_fu_relu_33985_37386),
    .in1(out_const_7),
    .in2(out_BMEMORY_CTRLN_18_i0_BMEMORY_CTRLN_18_i0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_relu_33985_37389 (.out1(out_ui_ne_expr_FU_64_0_64_34_i0_fu_relu_33985_37389),
    .in1(out_ui_bit_and_expr_FU_0_64_64_23_i0_fu_relu_33985_37386),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu_relu_33985_37392 (.out1(out_ui_rshift_expr_FU_64_0_64_41_i0_fu_relu_33985_37392),
    .in1(out_BMEMORY_CTRLN_18_i0_BMEMORY_CTRLN_18_i0),
    .in2(out_const_3));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_relu_33985_37395 (.out1(out_ui_ne_expr_FU_1_0_1_31_i0_fu_relu_33985_37395),
    .in1(out_ui_rshift_expr_FU_64_0_64_41_i0_fu_relu_33985_37392),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_relu_33985_37398 (.out1(out_ui_ne_expr_FU_0_1_1_30_i0_fu_relu_33985_37398),
    .in1(out_const_0),
    .in2(out_ui_ne_expr_FU_1_0_1_31_i0_fu_relu_33985_37395));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_relu_33985_37401 (.out1(out_truth_not_expr_FU_1_1_21_i0_fu_relu_33985_37401),
    .in1(out_ui_ne_expr_FU_0_1_1_30_i0_fu_relu_33985_37398));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_relu_33985_37404 (.out1(out_ui_bit_and_expr_FU_0_64_64_24_i0_fu_relu_33985_37404),
    .in1(out_const_8),
    .in2(out_BMEMORY_CTRLN_18_i0_BMEMORY_CTRLN_18_i0));
  ui_ne_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_relu_33985_37407 (.out1(out_ui_ne_expr_FU_64_0_64_35_i0_fu_relu_33985_37407),
    .in1(out_ui_bit_and_expr_FU_0_64_64_24_i0_fu_relu_33985_37404),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_relu_33985_37410 (.out1(out_ui_bit_and_expr_FU_0_64_64_24_i1_fu_relu_33985_37410),
    .in1(out_const_8),
    .in2(out_BMEMORY_CTRLN_18_i0_BMEMORY_CTRLN_18_i0));
  ui_lt_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_out1(1)) fu_relu_33985_37413 (.out1(out_ui_lt_expr_FU_0_64_64_29_i0_fu_relu_33985_37413),
    .in1(out_const_0),
    .in2(out_ui_bit_and_expr_FU_0_64_64_24_i1_fu_relu_33985_37410));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_relu_33985_37416 (.out1(out_UIdata_converter_FU_10_i0_fu_relu_33985_37416),
    .in1(out_ui_lt_expr_FU_0_64_64_29_i0_fu_relu_33985_37413));
  ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu_relu_33985_37419 (.out1(out_ne_expr_FU_0_8_8_19_i0_fu_relu_33985_37419),
    .in1(out_const_0),
    .in2(out_UIdata_converter_FU_10_i0_fu_relu_33985_37416));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_relu_33985_37422 (.out1(out_truth_and_expr_FU_1_1_1_20_i0_fu_relu_33985_37422),
    .in1(out_ui_eq_expr_FU_0_16_16_27_i0_fu_relu_33985_37383),
    .in2(out_ui_ne_expr_FU_64_0_64_34_i0_fu_relu_33985_37389));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_relu_33985_37425 (.out1(out_truth_not_expr_FU_1_1_21_i1_fu_relu_33985_37425),
    .in1(out_truth_and_expr_FU_1_1_1_20_i0_fu_relu_33985_37422));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_relu_33985_37428 (.out1(out_truth_and_expr_FU_1_1_1_20_i1_fu_relu_33985_37428),
    .in1(out_truth_not_expr_FU_1_1_21_i0_fu_relu_33985_37401),
    .in2(out_truth_not_expr_FU_1_1_21_i1_fu_relu_33985_37425));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_relu_33985_37431 (.out1(out_truth_and_expr_FU_1_1_1_20_i2_fu_relu_33985_37431),
    .in1(out_truth_and_expr_FU_1_1_1_20_i1_fu_relu_33985_37428),
    .in2(out_ui_ne_expr_FU_64_0_64_35_i0_fu_relu_33985_37407));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_relu_33985_37434 (.out1(out_truth_not_expr_FU_1_1_21_i2_fu_relu_33985_37434),
    .in1(out_ui_ne_expr_FU_64_0_64_35_i0_fu_relu_33985_37407));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_relu_33985_37437 (.out1(out_truth_and_expr_FU_1_1_1_20_i3_fu_relu_33985_37437),
    .in1(out_truth_and_expr_FU_1_1_1_20_i1_fu_relu_33985_37428),
    .in2(out_truth_not_expr_FU_1_1_21_i2_fu_relu_33985_37434));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_relu_33985_37440 (.out1(out_truth_or_expr_FU_1_1_1_22_i0_fu_relu_33985_37440),
    .in1(out_truth_and_expr_FU_1_1_1_20_i0_fu_relu_33985_37422),
    .in2(out_truth_and_expr_FU_1_1_1_20_i2_fu_relu_33985_37431));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu_relu_33985_37443 (.out1(out_ui_cond_expr_FU_1_1_1_1_26_i0_fu_relu_33985_37443),
    .in1(out_truth_and_expr_FU_1_1_1_20_i0_fu_relu_33985_37422),
    .in2(out_const_0),
    .in3(out_ne_expr_FU_0_8_8_19_i0_fu_relu_33985_37419));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu_relu_33985_37446 (.out1(out_ui_cond_expr_FU_1_1_1_1_26_i1_fu_relu_33985_37446),
    .in1(out_truth_or_expr_FU_1_1_1_22_i0_fu_relu_33985_37440),
    .in2(out_ui_cond_expr_FU_1_1_1_1_26_i0_fu_relu_33985_37443),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu_relu_33985_37449 (.out1(out_ui_cond_expr_FU_1_1_1_1_26_i2_fu_relu_33985_37449),
    .in1(out_truth_and_expr_FU_1_1_1_20_i3_fu_relu_33985_37437),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_1_1_1_1_26_i1_fu_relu_33985_37446));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_17_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_18_reg_1_0_0_0),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_3_i0_fu_relu_33985_37200),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_2_i0_fu_relu_33985_37203),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_39_i1_fu_relu_33985_37292),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_22_reg_5_0_0_0),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_38_i1_fu_relu_33985_34699),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_38_i0_fu_relu_33985_34675),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_38_i3_fu_relu_33985_36983),
    .wenable(wrenable_reg_8));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_18_i0_BMEMORY_CTRLN_18_i0),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION_relu_33985_34669 = out_read_cond_FU_4_i0_fu_relu_33985_34669;
  assign OUT_CONDITION_relu_33985_34677 = out_read_cond_FU_11_i0_fu_relu_33985_34677;
  assign OUT_CONDITION_relu_33985_34725 = out_read_cond_FU_14_i0_fu_relu_33985_34725;
  assign OUT_CONDITION_relu_33985_34728 = out_read_cond_FU_15_i0_fu_relu_33985_34728;

endmodule

// FSM based controller description for relu
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_relu(done_port,
  fuselector_BMEMORY_CTRLN_18_i0_LOAD,
  fuselector_BMEMORY_CTRLN_18_i0_STORE,
  selector_MUX_17_reg_0_0_0_0,
  selector_MUX_18_reg_1_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0,
  selector_MUX_22_reg_5_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_relu_33985_34669,
  OUT_CONDITION_relu_33985_34677,
  OUT_CONDITION_relu_33985_34725,
  OUT_CONDITION_relu_33985_34728,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_relu_33985_34669;
  input OUT_CONDITION_relu_33985_34677;
  input OUT_CONDITION_relu_33985_34725;
  input OUT_CONDITION_relu_33985_34728;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_18_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_18_i0_STORE;
  output selector_MUX_17_reg_0_0_0_0;
  output selector_MUX_18_reg_1_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0;
  output selector_MUX_22_reg_5_0_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [3:0] S_0 = 4'd0,
    S_7 = 4'd7,
    S_6 = 4'd6,
    S_1 = 4'd1,
    S_2 = 4'd2,
    S_3 = 4'd3,
    S_4 = 4'd4,
    S_5 = 4'd5,
    S_8 = 4'd8;
  reg [3:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_18_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_18_i0_STORE;
  reg selector_MUX_17_reg_0_0_0_0;
  reg selector_MUX_18_reg_1_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0;
  reg selector_MUX_22_reg_5_0_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_2;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_18_i0_STORE = 1'b0;
    selector_MUX_17_reg_0_0_0_0 = 1'b0;
    selector_MUX_18_reg_1_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0 = 1'b0;
    selector_MUX_22_reg_5_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          if (OUT_CONDITION_relu_33985_34669 == 1'b1)
            begin
              _next_state = S_6;
            end
          else
            begin
              _next_state = S_7;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
              wrenable_reg_2 = 1'b0;
              wrenable_reg_3 = 1'b0;
              wrenable_reg_4 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_7 :
        begin
          _next_state = S_0;
        end
      S_6 :
        begin
          selector_MUX_17_reg_0_0_0_0 = 1'b1;
          selector_MUX_18_reg_1_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          _next_state = S_1;
        end
      S_1 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          selector_MUX_22_reg_5_0_0_0 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_8 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION_relu_33985_34677 == 1'b1)
            begin
              _next_state = S_3;
            end
          else
            begin
              _next_state = S_4;
              wrenable_reg_9 = 1'b0;
            end
        end
      S_3 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          if (OUT_CONDITION_relu_33985_34725 == 1'b1)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_5;
            end
        end
      S_5 :
        begin
          if (OUT_CONDITION_relu_33985_34728 == 1'b1)
            begin
              _next_state = S_6;
            end
          else
            begin
              _next_state = S_8;
              done_port = 1'b1;
            end
        end
      S_8 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Marco Lattuada <marco.lattuada@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module flipflop_AR(clock,
  reset,
  in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input in1;
  // OUT
  output out1;
  
  reg reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock )
    if (reset == 1'b0)
      reg_out1 <= {BITSIZE_out1{1'b0}};
    else
      reg_out1 <= in1;
endmodule

// Top component for relu
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _relu(clock,
  reset,
  start_port,
  done_port,
  A,
  B,
  size,
  M_Rdata_ram,
  M_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] A;
  input [31:0] B;
  input [31:0] size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION_relu_33985_34669;
  wire OUT_CONDITION_relu_33985_34677;
  wire OUT_CONDITION_relu_33985_34725;
  wire OUT_CONDITION_relu_33985_34728;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_18_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_18_i0_STORE;
  wire selector_MUX_17_reg_0_0_0_0;
  wire selector_MUX_18_reg_1_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0;
  wire selector_MUX_22_reg_5_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_relu Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_18_i0_LOAD(fuselector_BMEMORY_CTRLN_18_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_18_i0_STORE(fuselector_BMEMORY_CTRLN_18_i0_STORE),
    .selector_MUX_17_reg_0_0_0_0(selector_MUX_17_reg_0_0_0_0),
    .selector_MUX_18_reg_1_0_0_0(selector_MUX_18_reg_1_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0),
    .selector_MUX_22_reg_5_0_0_0(selector_MUX_22_reg_5_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_relu_33985_34669(OUT_CONDITION_relu_33985_34669),
    .OUT_CONDITION_relu_33985_34677(OUT_CONDITION_relu_33985_34677),
    .OUT_CONDITION_relu_33985_34725(OUT_CONDITION_relu_33985_34725),
    .OUT_CONDITION_relu_33985_34728(OUT_CONDITION_relu_33985_34728),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_relu Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_relu_33985_34669(OUT_CONDITION_relu_33985_34669),
    .OUT_CONDITION_relu_33985_34677(OUT_CONDITION_relu_33985_34677),
    .OUT_CONDITION_relu_33985_34725(OUT_CONDITION_relu_33985_34725),
    .OUT_CONDITION_relu_33985_34728(OUT_CONDITION_relu_33985_34728),
    .clock(clock),
    .reset(reset),
    .in_port_A(A),
    .in_port_B(B),
    .in_port_size(size),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_18_i0_LOAD(fuselector_BMEMORY_CTRLN_18_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_18_i0_STORE(fuselector_BMEMORY_CTRLN_18_i0_STORE),
    .selector_MUX_17_reg_0_0_0_0(selector_MUX_17_reg_0_0_0_0),
    .selector_MUX_18_reg_1_0_0_0(selector_MUX_18_reg_1_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0),
    .selector_MUX_22_reg_5_0_0_0(selector_MUX_22_reg_5_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// Minimal interface for function: relu
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module relu(clock,
  reset,
  start_port,
  A,
  B,
  size,
  M_Rdata_ram,
  M_DataRdy,
  done_port,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] A;
  input [31:0] B;
  input [31:0] size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  // Component and signal declarations
  
  _relu _relu_i0 (.done_port(done_port),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .A(A),
    .B(B),
    .size(size),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram({1'b0,
      1'b0}),
    .Min_we_ram({1'b0,
      1'b0}),
    .Min_addr_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Min_Wdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Min_data_ram_size({7'b0000000,
      7'b0000000}));

endmodule


