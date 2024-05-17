// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2023.1 - Revision 04336c437a53bc96ae90b74052c455629946ec8b-main - Date 2024-05-16T21:35:50
// /tmp/.mount_bambu-i2Rg7Q/usr/bin/bambu executed with: /tmp/.mount_bambu-i2Rg7Q/usr/bin/bambu --top-fname=matrix_multiplication /home/paulevers/PD_project/PD_project/matrix_multiplication_bench_2/cpu_functions.cpp 
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
module mult_expr_FU(clock,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PIPE_PARAMETER=0;
  // IN
  input clock;
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
    if(PIPE_PARAMETER==1)
    begin
      reg signed [BITSIZE_out1-1:0] out1_reg;
      assign out1 = out1_reg;
      always @(posedge clock)
      begin
        out1_reg <= in1 * in2;
      end
    end
    else if(PIPE_PARAMETER>1)
    begin
      reg signed [BITSIZE_in1-1:0] in1_in;
      reg signed [BITSIZE_in2-1:0] in2_in;
      wire signed [BITSIZE_out1-1:0] mult_res;
      reg signed [BITSIZE_out1-1:0] mul [PIPE_PARAMETER-2:0];
      integer i;
      assign mult_res = in1_in * in2_in;
      always @(posedge clock)
      begin
        in1_in <= in1;
        in2_in <= in2;
        mul[PIPE_PARAMETER-2] <= mult_res;
        for (i=0; i<PIPE_PARAMETER-2; i=i+1)
          mul[i] <= mul[i+1];
      end
      assign out1 = mul[0];
    end
    else
    begin
      assign out1 = in1 * in2;
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
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
// Copyright (C) 2016-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_ior_concat_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1,
    OFFSET_PARAMETER=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  parameter nbit_out = BITSIZE_out1 > OFFSET_PARAMETER ? BITSIZE_out1 : 1+OFFSET_PARAMETER;
  wire [nbit_out-1:0] tmp_in1;
  wire [OFFSET_PARAMETER-1:0] tmp_in2;
  generate
    if(BITSIZE_in1 >= nbit_out)
      assign tmp_in1=in1[nbit_out-1:0];
    else
      assign tmp_in1={{(nbit_out-BITSIZE_in1){1'b0}},in1};
  endgenerate
  generate
    if(BITSIZE_in2 >= OFFSET_PARAMETER)
      assign tmp_in2=in2[OFFSET_PARAMETER-1:0];
    else
      assign tmp_in2={{(OFFSET_PARAMETER-BITSIZE_in2){1'b0}},in2};
  endgenerate
  assign out1 = {tmp_in1[nbit_out-1:OFFSET_PARAMETER] , tmp_in2};
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
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
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

// Datapath RTL description for matrix_multiplication
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_matrix_multiplication(clock,
  reset,
  in_port_A,
  in_port_B,
  in_port_C,
  in_port_n,
  in_port_m,
  in_port_w,
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
  fuselector_BMEMORY_CTRLN_30_i0_LOAD,
  fuselector_BMEMORY_CTRLN_30_i0_STORE,
  fuselector_BMEMORY_CTRLN_30_i1_LOAD,
  fuselector_BMEMORY_CTRLN_30_i1_STORE,
  selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1,
  selector_MUX_30_reg_0_0_0_0,
  selector_MUX_31_reg_1_0_0_0,
  selector_MUX_33_reg_11_0_0_0,
  selector_MUX_35_reg_13_0_0_0,
  selector_MUX_35_reg_13_0_0_1,
  selector_MUX_40_reg_18_0_0_0,
  selector_MUX_41_reg_19_0_0_0,
  selector_MUX_48_reg_3_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_matrix_multiplication_33985_34676,
  OUT_CONDITION_matrix_multiplication_33985_34693,
  OUT_CONDITION_matrix_multiplication_33985_34809,
  OUT_CONDITION_matrix_multiplication_33985_34811,
  OUT_CONDITION_matrix_multiplication_33985_34814,
  OUT_CONDITION_matrix_multiplication_33985_34821);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_B;
  input [31:0] in_port_C;
  input [31:0] in_port_n;
  input [31:0] in_port_m;
  input [31:0] in_port_w;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_30_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_30_i0_STORE;
  input fuselector_BMEMORY_CTRLN_30_i1_LOAD;
  input fuselector_BMEMORY_CTRLN_30_i1_STORE;
  input selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1;
  input selector_MUX_30_reg_0_0_0_0;
  input selector_MUX_31_reg_1_0_0_0;
  input selector_MUX_33_reg_11_0_0_0;
  input selector_MUX_35_reg_13_0_0_0;
  input selector_MUX_35_reg_13_0_0_1;
  input selector_MUX_40_reg_18_0_0_0;
  input selector_MUX_41_reg_19_0_0_0;
  input selector_MUX_48_reg_3_0_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_24;
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
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_CONDITION_matrix_multiplication_33985_34676;
  output OUT_CONDITION_matrix_multiplication_33985_34693;
  output OUT_CONDITION_matrix_multiplication_33985_34809;
  output OUT_CONDITION_matrix_multiplication_33985_34811;
  output OUT_CONDITION_matrix_multiplication_33985_34814;
  output OUT_CONDITION_matrix_multiplication_33985_34821;
  // Component and signal declarations
  wire [31:0] out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0;
  wire [31:0] out_BMEMORY_CTRLN_30_i1_BMEMORY_CTRLN_30_i0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1;
  wire [31:0] out_MUX_30_reg_0_0_0_0;
  wire [31:0] out_MUX_31_reg_1_0_0_0;
  wire [31:0] out_MUX_33_reg_11_0_0_0;
  wire [31:0] out_MUX_35_reg_13_0_0_0;
  wire [31:0] out_MUX_35_reg_13_0_0_1;
  wire [31:0] out_MUX_40_reg_18_0_0_0;
  wire [31:0] out_MUX_41_reg_19_0_0_0;
  wire [31:0] out_MUX_48_reg_3_0_0_0;
  wire [31:0] out_UUdata_converter_FU_12_i0_fu_matrix_multiplication_33985_34684;
  wire [31:0] out_UUdata_converter_FU_13_i0_fu_matrix_multiplication_33985_34686;
  wire [31:0] out_UUdata_converter_FU_28_i0_fu_matrix_multiplication_33985_34715;
  wire [31:0] out_UUdata_converter_FU_2_i0_fu_matrix_multiplication_33985_34756;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu_matrix_multiplication_33985_34725;
  wire [31:0] out_UUdata_converter_FU_4_i0_fu_matrix_multiplication_33985_34772;
  wire out_const_0;
  wire [6:0] out_const_1;
  wire out_const_2;
  wire [1:0] out_const_3;
  wire [1:0] out_const_4;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [5:0] out_conv_out_const_1_7_6;
  wire [31:0] out_iu_conv_conn_obj_0_IUdata_converter_FU_iu_conv_0;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_31_i0_fu_matrix_multiplication_33985_34688;
  wire signed [31:0] out_plus_expr_FU_32_32_32_32_i0_fu_matrix_multiplication_33985_34689;
  wire out_read_cond_FU_14_i0_fu_matrix_multiplication_33985_34693;
  wire out_read_cond_FU_17_i0_fu_matrix_multiplication_33985_34809;
  wire out_read_cond_FU_23_i0_fu_matrix_multiplication_33985_34811;
  wire out_read_cond_FU_24_i0_fu_matrix_multiplication_33985_34814;
  wire out_read_cond_FU_29_i0_fu_matrix_multiplication_33985_34821;
  wire out_read_cond_FU_5_i0_fu_matrix_multiplication_33985_34676;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [31:0] out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire [31:0] out_reg_16_reg_16;
  wire [31:0] out_reg_17_reg_17;
  wire [31:0] out_reg_18_reg_18;
  wire [31:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire out_reg_21_reg_21;
  wire [31:0] out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire [31:0] out_reg_24_reg_24;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire out_reg_4_reg_4;
  wire out_reg_5_reg_5;
  wire [29:0] out_reg_6_reg_6;
  wire [29:0] out_reg_7_reg_7;
  wire [29:0] out_reg_8_reg_8;
  wire [29:0] out_reg_9_reg_9;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_33_i0_fu_matrix_multiplication_33985_37124;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_33_i1_fu_matrix_multiplication_33985_37142;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_33_i2_fu_matrix_multiplication_33985_37154;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_33_i3_fu_matrix_multiplication_33985_37169;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_33_i4_fu_matrix_multiplication_33985_37184;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_33_i5_fu_matrix_multiplication_33985_37199;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_34_i0_fu_matrix_multiplication_33985_34691;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_34_i1_fu_matrix_multiplication_33985_34692;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_34_i2_fu_matrix_multiplication_33985_34729;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_34_i3_fu_matrix_multiplication_33985_34760;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_34_i4_fu_matrix_multiplication_33985_34776;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_34_i5_fu_matrix_multiplication_33985_34802;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_35_i0_fu_matrix_multiplication_33985_34732;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_35_i1_fu_matrix_multiplication_33985_34796;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_36_i0_fu_matrix_multiplication_33985_34805;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_36_i1_fu_matrix_multiplication_33985_37120;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_36_i2_fu_matrix_multiplication_33985_37139;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_36_i3_fu_matrix_multiplication_33985_37151;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_36_i4_fu_matrix_multiplication_33985_37166;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_36_i5_fu_matrix_multiplication_33985_37181;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_36_i6_fu_matrix_multiplication_33985_37196;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_37_i0_fu_matrix_multiplication_33985_37063;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_37_i1_fu_matrix_multiplication_33985_37074;
  wire out_ui_ne_expr_FU_32_0_32_38_i0_fu_matrix_multiplication_33985_37087;
  wire out_ui_ne_expr_FU_32_0_32_38_i1_fu_matrix_multiplication_33985_37093;
  wire out_ui_ne_expr_FU_32_0_32_38_i2_fu_matrix_multiplication_33985_37097;
  wire out_ui_ne_expr_FU_32_32_32_39_i0_fu_matrix_multiplication_33985_37089;
  wire out_ui_ne_expr_FU_32_32_32_39_i1_fu_matrix_multiplication_33985_37091;
  wire out_ui_ne_expr_FU_32_32_32_39_i2_fu_matrix_multiplication_33985_37095;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_40_i0_fu_matrix_multiplication_33985_34739;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_40_i1_fu_matrix_multiplication_33985_34813;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_41_i0_fu_matrix_multiplication_33985_37117;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_41_i1_fu_matrix_multiplication_33985_37148;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_42_i0_fu_matrix_multiplication_33985_37136;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_42_i1_fu_matrix_multiplication_33985_37163;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_42_i2_fu_matrix_multiplication_33985_37178;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_42_i3_fu_matrix_multiplication_33985_37193;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_43_i0_fu_matrix_multiplication_33985_37066;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_43_i1_fu_matrix_multiplication_33985_37077;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_44_i0_fu_matrix_multiplication_33985_37112;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_44_i1_fu_matrix_multiplication_33985_37129;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_44_i2_fu_matrix_multiplication_33985_37132;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_44_i3_fu_matrix_multiplication_33985_37146;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_44_i4_fu_matrix_multiplication_33985_37158;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_44_i5_fu_matrix_multiplication_33985_37161;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_44_i6_fu_matrix_multiplication_33985_37173;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_44_i7_fu_matrix_multiplication_33985_37176;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_44_i8_fu_matrix_multiplication_33985_37188;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_44_i9_fu_matrix_multiplication_33985_37191;
  wire [31:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  
  BMEMORY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(32),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
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
    .BITSIZE_M_Rdata_ram(32),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(32),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(32),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(6),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(6),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_30_i0 (.out1({out_BMEMORY_CTRLN_30_i1_BMEMORY_CTRLN_30_i0,
      out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({32'b00000000000000000000000000000000,
      out_iu_conv_conn_obj_0_IUdata_converter_FU_iu_conv_0}),
    .in2({out_UUdata_converter_FU_13_i0_fu_matrix_multiplication_33985_34686,
      out_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1}),
    .in3({out_conv_out_const_1_7_6,
      out_conv_out_const_1_7_6}),
    .in4({out_const_2,
      out_const_2}),
    .sel_LOAD({fuselector_BMEMORY_CTRLN_30_i1_LOAD,
      fuselector_BMEMORY_CTRLN_30_i0_LOAD}),
    .sel_STORE({fuselector_BMEMORY_CTRLN_30_i1_STORE,
      fuselector_BMEMORY_CTRLN_30_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_0 (.out1(out_iu_conv_conn_obj_0_IUdata_converter_FU_iu_conv_0),
    .in1(out_plus_expr_FU_32_32_32_32_i0_fu_matrix_multiplication_33985_34689));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_30_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0),
    .in1(out_reg_17_reg_17),
    .in2(out_reg_16_reg_16));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_30_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1),
    .in1(out_UUdata_converter_FU_12_i0_fu_matrix_multiplication_33985_34684),
    .in2(out_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_30_reg_0_0_0_0 (.out1(out_MUX_30_reg_0_0_0_0),
    .sel(selector_MUX_30_reg_0_0_0_0),
    .in1(out_UUdata_converter_FU_3_i0_fu_matrix_multiplication_33985_34725),
    .in2(out_ui_bit_ior_concat_expr_FU_34_i2_fu_matrix_multiplication_33985_34729));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_31_reg_1_0_0_0 (.out1(out_MUX_31_reg_1_0_0_0),
    .sel(selector_MUX_31_reg_1_0_0_0),
    .in1(out_reg_12_reg_12),
    .in2(out_UUdata_converter_FU_2_i0_fu_matrix_multiplication_33985_34756));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_33_reg_11_0_0_0 (.out1(out_MUX_33_reg_11_0_0_0),
    .sel(selector_MUX_33_reg_11_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_40_i0_fu_matrix_multiplication_33985_34739),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_35_reg_13_0_0_0 (.out1(out_MUX_35_reg_13_0_0_0),
    .sel(selector_MUX_35_reg_13_0_0_0),
    .in1(out_reg_20_reg_20),
    .in2(out_reg_2_reg_2));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_35_reg_13_0_0_1 (.out1(out_MUX_35_reg_13_0_0_1),
    .sel(selector_MUX_35_reg_13_0_0_1),
    .in1(out_reg_15_reg_15),
    .in2(out_MUX_35_reg_13_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_40_reg_18_0_0_0 (.out1(out_MUX_40_reg_18_0_0_0),
    .sel(selector_MUX_40_reg_18_0_0_0),
    .in1(out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0),
    .in2(out_plus_expr_FU_32_32_32_32_i0_fu_matrix_multiplication_33985_34689));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_41_reg_19_0_0_0 (.out1(out_MUX_41_reg_19_0_0_0),
    .sel(selector_MUX_41_reg_19_0_0_0),
    .in1(out_reg_1_reg_1),
    .in2(out_ui_bit_ior_concat_expr_FU_34_i0_fu_matrix_multiplication_33985_34691));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_48_reg_3_0_0_0 (.out1(out_MUX_48_reg_3_0_0_0),
    .sel(selector_MUX_48_reg_3_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_40_i1_fu_matrix_multiplication_33985_34813),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_const_0_1_32));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_4 (.out1(out_const_4));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_1_7_6 (.out1(out_conv_out_const_1_7_6),
    .in1(out_const_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_multiplication_33985_34676 (.out1(out_read_cond_FU_5_i0_fu_matrix_multiplication_33985_34676),
    .in1(out_ui_ne_expr_FU_32_0_32_38_i0_fu_matrix_multiplication_33985_37087));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_multiplication_33985_34684 (.out1(out_UUdata_converter_FU_12_i0_fu_matrix_multiplication_33985_34684),
    .in1(out_reg_19_reg_19));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_multiplication_33985_34686 (.out1(out_UUdata_converter_FU_13_i0_fu_matrix_multiplication_33985_34686),
    .in1(out_reg_13_reg_13));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_matrix_multiplication_33985_34688 (.out1(out_mult_expr_FU_32_32_32_0_31_i0_fu_matrix_multiplication_33985_34688),
    .clock(clock),
    .in1(out_reg_23_reg_23),
    .in2(out_reg_22_reg_22));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_matrix_multiplication_33985_34689 (.out1(out_plus_expr_FU_32_32_32_32_i0_fu_matrix_multiplication_33985_34689),
    .in1(out_reg_18_reg_18),
    .in2(out_reg_24_reg_24));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_matrix_multiplication_33985_34691 (.out1(out_ui_bit_ior_concat_expr_FU_34_i0_fu_matrix_multiplication_33985_34691),
    .in1(out_ui_lshift_expr_FU_32_0_32_36_i1_fu_matrix_multiplication_33985_37120),
    .in2(out_ui_bit_and_expr_FU_8_0_8_33_i0_fu_matrix_multiplication_33985_37124),
    .in3(out_const_3));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_matrix_multiplication_33985_34692 (.out1(out_ui_bit_ior_concat_expr_FU_34_i1_fu_matrix_multiplication_33985_34692),
    .in1(out_ui_lshift_expr_FU_32_0_32_36_i2_fu_matrix_multiplication_33985_37139),
    .in2(out_ui_bit_and_expr_FU_8_0_8_33_i1_fu_matrix_multiplication_33985_37142),
    .in3(out_const_3));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_multiplication_33985_34693 (.out1(out_read_cond_FU_14_i0_fu_matrix_multiplication_33985_34693),
    .in1(out_reg_21_reg_21));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_multiplication_33985_34715 (.out1(out_UUdata_converter_FU_28_i0_fu_matrix_multiplication_33985_34715),
    .in1(out_reg_0_reg_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_multiplication_33985_34725 (.out1(out_UUdata_converter_FU_3_i0_fu_matrix_multiplication_33985_34725),
    .in1(in_port_C));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_matrix_multiplication_33985_34729 (.out1(out_ui_bit_ior_concat_expr_FU_34_i2_fu_matrix_multiplication_33985_34729),
    .in1(out_ui_lshift_expr_FU_32_0_32_36_i6_fu_matrix_multiplication_33985_37196),
    .in2(out_ui_bit_and_expr_FU_8_0_8_33_i5_fu_matrix_multiplication_33985_37199),
    .in3(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_multiplication_33985_34732 (.out1(out_ui_lshift_expr_FU_32_0_32_35_i0_fu_matrix_multiplication_33985_34732),
    .in1(in_port_n),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_matrix_multiplication_33985_34739 (.out1(out_ui_plus_expr_FU_32_0_32_40_i0_fu_matrix_multiplication_33985_34739),
    .in1(out_reg_11_reg_11),
    .in2(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_multiplication_33985_34756 (.out1(out_UUdata_converter_FU_2_i0_fu_matrix_multiplication_33985_34756),
    .in1(in_port_A));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_matrix_multiplication_33985_34760 (.out1(out_ui_bit_ior_concat_expr_FU_34_i3_fu_matrix_multiplication_33985_34760),
    .in1(out_ui_lshift_expr_FU_32_0_32_36_i5_fu_matrix_multiplication_33985_37181),
    .in2(out_ui_bit_and_expr_FU_8_0_8_33_i4_fu_matrix_multiplication_33985_37184),
    .in3(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_multiplication_33985_34772 (.out1(out_UUdata_converter_FU_4_i0_fu_matrix_multiplication_33985_34772),
    .in1(in_port_B));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_matrix_multiplication_33985_34776 (.out1(out_ui_bit_ior_concat_expr_FU_34_i4_fu_matrix_multiplication_33985_34776),
    .in1(out_ui_lshift_expr_FU_32_0_32_36_i3_fu_matrix_multiplication_33985_37151),
    .in2(out_ui_bit_and_expr_FU_8_0_8_33_i2_fu_matrix_multiplication_33985_37154),
    .in3(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_multiplication_33985_34796 (.out1(out_ui_lshift_expr_FU_32_0_32_35_i1_fu_matrix_multiplication_33985_34796),
    .in1(in_port_w),
    .in2(out_const_3));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_matrix_multiplication_33985_34802 (.out1(out_ui_bit_ior_concat_expr_FU_34_i5_fu_matrix_multiplication_33985_34802),
    .in1(out_ui_lshift_expr_FU_32_0_32_36_i4_fu_matrix_multiplication_33985_37166),
    .in2(out_ui_bit_and_expr_FU_8_0_8_33_i3_fu_matrix_multiplication_33985_37169),
    .in3(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_multiplication_33985_34805 (.out1(out_ui_lshift_expr_FU_32_0_32_36_i0_fu_matrix_multiplication_33985_34805),
    .in1(in_port_m),
    .in2(out_const_3));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_multiplication_33985_34809 (.out1(out_read_cond_FU_17_i0_fu_matrix_multiplication_33985_34809),
    .in1(out_ui_ne_expr_FU_32_32_32_39_i1_fu_matrix_multiplication_33985_37091));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_multiplication_33985_34811 (.out1(out_read_cond_FU_23_i0_fu_matrix_multiplication_33985_34811),
    .in1(out_reg_4_reg_4));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_matrix_multiplication_33985_34813 (.out1(out_ui_plus_expr_FU_32_0_32_40_i1_fu_matrix_multiplication_33985_34813),
    .in1(out_reg_3_reg_3),
    .in2(out_const_2));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_multiplication_33985_34814 (.out1(out_read_cond_FU_24_i0_fu_matrix_multiplication_33985_34814),
    .in1(out_ui_ne_expr_FU_32_32_32_39_i2_fu_matrix_multiplication_33985_37095));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_multiplication_33985_34821 (.out1(out_read_cond_FU_29_i0_fu_matrix_multiplication_33985_34821),
    .in1(out_reg_5_reg_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_multiplication_33985_37063 (.out1(out_ui_lshift_expr_FU_32_0_32_37_i0_fu_matrix_multiplication_33985_37063),
    .in1(out_reg_11_reg_11),
    .in2(out_const_3));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_multiplication_33985_37066 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_43_i0_fu_matrix_multiplication_33985_37066),
    .in1(out_reg_10_reg_10),
    .in2(out_ui_lshift_expr_FU_32_0_32_37_i0_fu_matrix_multiplication_33985_37063));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_multiplication_33985_37074 (.out1(out_ui_lshift_expr_FU_32_0_32_37_i1_fu_matrix_multiplication_33985_37074),
    .in1(out_reg_11_reg_11),
    .in2(out_const_3));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_multiplication_33985_37077 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_43_i1_fu_matrix_multiplication_33985_37077),
    .in1(out_reg_10_reg_10),
    .in2(out_ui_lshift_expr_FU_32_0_32_37_i1_fu_matrix_multiplication_33985_37074));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_multiplication_33985_37087 (.out1(out_ui_ne_expr_FU_32_0_32_38_i0_fu_matrix_multiplication_33985_37087),
    .in1(in_port_n),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_multiplication_33985_37089 (.out1(out_ui_ne_expr_FU_32_32_32_39_i0_fu_matrix_multiplication_33985_37089),
    .in1(out_ui_bit_ior_concat_expr_FU_34_i0_fu_matrix_multiplication_33985_34691),
    .in2(out_reg_14_reg_14));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_multiplication_33985_37091 (.out1(out_ui_ne_expr_FU_32_32_32_39_i1_fu_matrix_multiplication_33985_37091),
    .in1(out_reg_11_reg_11),
    .in2(in_port_w));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_multiplication_33985_37093 (.out1(out_ui_ne_expr_FU_32_0_32_38_i1_fu_matrix_multiplication_33985_37093),
    .in1(in_port_m),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_multiplication_33985_37095 (.out1(out_ui_ne_expr_FU_32_32_32_39_i2_fu_matrix_multiplication_33985_37095),
    .in1(out_reg_3_reg_3),
    .in2(in_port_n));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_multiplication_33985_37097 (.out1(out_ui_ne_expr_FU_32_0_32_38_i2_fu_matrix_multiplication_33985_37097),
    .in1(in_port_w),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_multiplication_33985_37112 (.out1(out_ui_rshift_expr_FU_32_0_32_44_i0_fu_matrix_multiplication_33985_37112),
    .in1(out_reg_19_reg_19),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(1),
    .BITSIZE_out1(30)) fu_matrix_multiplication_33985_37117 (.out1(out_ui_plus_expr_FU_32_0_32_41_i0_fu_matrix_multiplication_33985_37117),
    .in1(out_ui_rshift_expr_FU_32_0_32_44_i0_fu_matrix_multiplication_33985_37112),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_multiplication_33985_37120 (.out1(out_ui_lshift_expr_FU_32_0_32_36_i1_fu_matrix_multiplication_33985_37120),
    .in1(out_ui_plus_expr_FU_32_0_32_41_i0_fu_matrix_multiplication_33985_37117),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_matrix_multiplication_33985_37124 (.out1(out_ui_bit_and_expr_FU_8_0_8_33_i0_fu_matrix_multiplication_33985_37124),
    .in1(out_reg_19_reg_19),
    .in2(out_const_4));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_multiplication_33985_37129 (.out1(out_ui_rshift_expr_FU_32_0_32_44_i1_fu_matrix_multiplication_33985_37129),
    .in1(out_reg_13_reg_13),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_multiplication_33985_37132 (.out1(out_ui_rshift_expr_FU_32_0_32_44_i2_fu_matrix_multiplication_33985_37132),
    .in1(out_ui_lshift_expr_FU_32_0_32_35_i1_fu_matrix_multiplication_33985_34796),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_matrix_multiplication_33985_37136 (.out1(out_ui_plus_expr_FU_32_32_32_42_i0_fu_matrix_multiplication_33985_37136),
    .in1(out_ui_rshift_expr_FU_32_0_32_44_i1_fu_matrix_multiplication_33985_37129),
    .in2(out_reg_6_reg_6));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_multiplication_33985_37139 (.out1(out_ui_lshift_expr_FU_32_0_32_36_i2_fu_matrix_multiplication_33985_37139),
    .in1(out_ui_plus_expr_FU_32_32_32_42_i0_fu_matrix_multiplication_33985_37136),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_matrix_multiplication_33985_37142 (.out1(out_ui_bit_and_expr_FU_8_0_8_33_i1_fu_matrix_multiplication_33985_37142),
    .in1(out_reg_13_reg_13),
    .in2(out_const_4));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_multiplication_33985_37146 (.out1(out_ui_rshift_expr_FU_32_0_32_44_i3_fu_matrix_multiplication_33985_37146),
    .in1(out_reg_13_reg_13),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(1),
    .BITSIZE_out1(30)) fu_matrix_multiplication_33985_37148 (.out1(out_ui_plus_expr_FU_32_0_32_41_i1_fu_matrix_multiplication_33985_37148),
    .in1(out_ui_rshift_expr_FU_32_0_32_44_i3_fu_matrix_multiplication_33985_37146),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_multiplication_33985_37151 (.out1(out_ui_lshift_expr_FU_32_0_32_36_i3_fu_matrix_multiplication_33985_37151),
    .in1(out_ui_plus_expr_FU_32_0_32_41_i1_fu_matrix_multiplication_33985_37148),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_matrix_multiplication_33985_37154 (.out1(out_ui_bit_and_expr_FU_8_0_8_33_i2_fu_matrix_multiplication_33985_37154),
    .in1(out_reg_13_reg_13),
    .in2(out_const_4));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_multiplication_33985_37158 (.out1(out_ui_rshift_expr_FU_32_0_32_44_i4_fu_matrix_multiplication_33985_37158),
    .in1(out_reg_1_reg_1),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_multiplication_33985_37161 (.out1(out_ui_rshift_expr_FU_32_0_32_44_i5_fu_matrix_multiplication_33985_37161),
    .in1(out_ui_lshift_expr_FU_32_0_32_36_i0_fu_matrix_multiplication_33985_34805),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_matrix_multiplication_33985_37163 (.out1(out_ui_plus_expr_FU_32_32_32_42_i1_fu_matrix_multiplication_33985_37163),
    .in1(out_ui_rshift_expr_FU_32_0_32_44_i4_fu_matrix_multiplication_33985_37158),
    .in2(out_reg_7_reg_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_multiplication_33985_37166 (.out1(out_ui_lshift_expr_FU_32_0_32_36_i4_fu_matrix_multiplication_33985_37166),
    .in1(out_ui_plus_expr_FU_32_32_32_42_i1_fu_matrix_multiplication_33985_37163),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_matrix_multiplication_33985_37169 (.out1(out_ui_bit_and_expr_FU_8_0_8_33_i3_fu_matrix_multiplication_33985_37169),
    .in1(out_reg_1_reg_1),
    .in2(out_const_4));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_multiplication_33985_37173 (.out1(out_ui_rshift_expr_FU_32_0_32_44_i6_fu_matrix_multiplication_33985_37173),
    .in1(out_reg_1_reg_1),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_multiplication_33985_37176 (.out1(out_ui_rshift_expr_FU_32_0_32_44_i7_fu_matrix_multiplication_33985_37176),
    .in1(out_ui_lshift_expr_FU_32_0_32_35_i0_fu_matrix_multiplication_33985_34732),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_matrix_multiplication_33985_37178 (.out1(out_ui_plus_expr_FU_32_32_32_42_i2_fu_matrix_multiplication_33985_37178),
    .in1(out_ui_rshift_expr_FU_32_0_32_44_i6_fu_matrix_multiplication_33985_37173),
    .in2(out_reg_8_reg_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_multiplication_33985_37181 (.out1(out_ui_lshift_expr_FU_32_0_32_36_i5_fu_matrix_multiplication_33985_37181),
    .in1(out_ui_plus_expr_FU_32_32_32_42_i2_fu_matrix_multiplication_33985_37178),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_matrix_multiplication_33985_37184 (.out1(out_ui_bit_and_expr_FU_8_0_8_33_i4_fu_matrix_multiplication_33985_37184),
    .in1(out_reg_1_reg_1),
    .in2(out_const_4));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_multiplication_33985_37188 (.out1(out_ui_rshift_expr_FU_32_0_32_44_i8_fu_matrix_multiplication_33985_37188),
    .in1(out_reg_0_reg_0),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_multiplication_33985_37191 (.out1(out_ui_rshift_expr_FU_32_0_32_44_i9_fu_matrix_multiplication_33985_37191),
    .in1(out_ui_lshift_expr_FU_32_0_32_35_i0_fu_matrix_multiplication_33985_34732),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_matrix_multiplication_33985_37193 (.out1(out_ui_plus_expr_FU_32_32_32_42_i3_fu_matrix_multiplication_33985_37193),
    .in1(out_ui_rshift_expr_FU_32_0_32_44_i8_fu_matrix_multiplication_33985_37188),
    .in2(out_reg_9_reg_9));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_multiplication_33985_37196 (.out1(out_ui_lshift_expr_FU_32_0_32_36_i6_fu_matrix_multiplication_33985_37196),
    .in1(out_ui_plus_expr_FU_32_32_32_42_i3_fu_matrix_multiplication_33985_37193),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_matrix_multiplication_33985_37199 (.out1(out_ui_bit_and_expr_FU_8_0_8_33_i5_fu_matrix_multiplication_33985_37199),
    .in1(out_reg_0_reg_0),
    .in2(out_const_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_30_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_31_reg_1_0_0_0),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_28_i0_fu_matrix_multiplication_33985_34715),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_33_reg_11_0_0_0),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_34_i3_fu_matrix_multiplication_33985_34760),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_35_reg_13_0_0_1),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_34_i5_fu_matrix_multiplication_33985_34802),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_34_i4_fu_matrix_multiplication_33985_34776),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_43_i0_fu_matrix_multiplication_33985_37066),
    .wenable(wrenable_reg_16));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_43_i1_fu_matrix_multiplication_33985_37077),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_40_reg_18_0_0_0),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_41_reg_19_0_0_0),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_4_i0_fu_matrix_multiplication_33985_34772),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_34_i1_fu_matrix_multiplication_33985_34692),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_39_i0_fu_matrix_multiplication_33985_37089),
    .wenable(wrenable_reg_21));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0),
    .wenable(wrenable_reg_22));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_30_i1_BMEMORY_CTRLN_30_i0),
    .wenable(wrenable_reg_23));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_31_i0_fu_matrix_multiplication_33985_34688),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_48_reg_3_0_0_0),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_38_i1_fu_matrix_multiplication_33985_37093),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_38_i2_fu_matrix_multiplication_33985_37097),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_44_i2_fu_matrix_multiplication_33985_37132),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_44_i5_fu_matrix_multiplication_33985_37161),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_44_i7_fu_matrix_multiplication_33985_37176),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_44_i9_fu_matrix_multiplication_33985_37191),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION_matrix_multiplication_33985_34676 = out_read_cond_FU_5_i0_fu_matrix_multiplication_33985_34676;
  assign OUT_CONDITION_matrix_multiplication_33985_34693 = out_read_cond_FU_14_i0_fu_matrix_multiplication_33985_34693;
  assign OUT_CONDITION_matrix_multiplication_33985_34809 = out_read_cond_FU_17_i0_fu_matrix_multiplication_33985_34809;
  assign OUT_CONDITION_matrix_multiplication_33985_34811 = out_read_cond_FU_23_i0_fu_matrix_multiplication_33985_34811;
  assign OUT_CONDITION_matrix_multiplication_33985_34814 = out_read_cond_FU_24_i0_fu_matrix_multiplication_33985_34814;
  assign OUT_CONDITION_matrix_multiplication_33985_34821 = out_read_cond_FU_29_i0_fu_matrix_multiplication_33985_34821;

endmodule

// FSM based controller description for matrix_multiplication
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_matrix_multiplication(done_port,
  fuselector_BMEMORY_CTRLN_30_i0_LOAD,
  fuselector_BMEMORY_CTRLN_30_i0_STORE,
  fuselector_BMEMORY_CTRLN_30_i1_LOAD,
  fuselector_BMEMORY_CTRLN_30_i1_STORE,
  selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1,
  selector_MUX_30_reg_0_0_0_0,
  selector_MUX_31_reg_1_0_0_0,
  selector_MUX_33_reg_11_0_0_0,
  selector_MUX_35_reg_13_0_0_0,
  selector_MUX_35_reg_13_0_0_1,
  selector_MUX_40_reg_18_0_0_0,
  selector_MUX_41_reg_19_0_0_0,
  selector_MUX_48_reg_3_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_matrix_multiplication_33985_34676,
  OUT_CONDITION_matrix_multiplication_33985_34693,
  OUT_CONDITION_matrix_multiplication_33985_34809,
  OUT_CONDITION_matrix_multiplication_33985_34811,
  OUT_CONDITION_matrix_multiplication_33985_34814,
  OUT_CONDITION_matrix_multiplication_33985_34821,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_matrix_multiplication_33985_34676;
  input OUT_CONDITION_matrix_multiplication_33985_34693;
  input OUT_CONDITION_matrix_multiplication_33985_34809;
  input OUT_CONDITION_matrix_multiplication_33985_34811;
  input OUT_CONDITION_matrix_multiplication_33985_34814;
  input OUT_CONDITION_matrix_multiplication_33985_34821;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_30_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_30_i0_STORE;
  output fuselector_BMEMORY_CTRLN_30_i1_LOAD;
  output fuselector_BMEMORY_CTRLN_30_i1_STORE;
  output selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1;
  output selector_MUX_30_reg_0_0_0_0;
  output selector_MUX_31_reg_1_0_0_0;
  output selector_MUX_33_reg_11_0_0_0;
  output selector_MUX_35_reg_13_0_0_0;
  output selector_MUX_35_reg_13_0_0_1;
  output selector_MUX_40_reg_18_0_0_0;
  output selector_MUX_41_reg_19_0_0_0;
  output selector_MUX_48_reg_3_0_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_24;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [12:0] S_0 = 13'b0000000000001,
    S_11 = 13'b0100000000000,
    S_10 = 13'b0010000000000,
    S_6 = 13'b0000001000000,
    S_7 = 13'b0000010000000,
    S_8 = 13'b0000100000000,
    S_1 = 13'b0000000000010,
    S_2 = 13'b0000000000100,
    S_3 = 13'b0000000001000,
    S_4 = 13'b0000000010000,
    S_5 = 13'b0000000100000,
    S_9 = 13'b0001000000000,
    S_12 = 13'b1000000000000;
  reg [12:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_30_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_30_i0_STORE;
  reg fuselector_BMEMORY_CTRLN_30_i1_LOAD;
  reg fuselector_BMEMORY_CTRLN_30_i1_STORE;
  reg selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1;
  reg selector_MUX_30_reg_0_0_0_0;
  reg selector_MUX_31_reg_1_0_0_0;
  reg selector_MUX_33_reg_11_0_0_0;
  reg selector_MUX_35_reg_13_0_0_0;
  reg selector_MUX_35_reg_13_0_0_1;
  reg selector_MUX_40_reg_18_0_0_0;
  reg selector_MUX_41_reg_19_0_0_0;
  reg selector_MUX_48_reg_3_0_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_24;
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
    fuselector_BMEMORY_CTRLN_30_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_30_i0_STORE = 1'b0;
    fuselector_BMEMORY_CTRLN_30_i1_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_30_i1_STORE = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1 = 1'b0;
    selector_MUX_30_reg_0_0_0_0 = 1'b0;
    selector_MUX_31_reg_1_0_0_0 = 1'b0;
    selector_MUX_33_reg_11_0_0_0 = 1'b0;
    selector_MUX_35_reg_13_0_0_0 = 1'b0;
    selector_MUX_35_reg_13_0_0_1 = 1'b0;
    selector_MUX_40_reg_18_0_0_0 = 1'b0;
    selector_MUX_41_reg_19_0_0_0 = 1'b0;
    selector_MUX_48_reg_3_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_24 = 1'b0;
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
          selector_MUX_30_reg_0_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION_matrix_multiplication_33985_34676 == 1'b1)
            begin
              _next_state = S_10;
            end
          else
            begin
              _next_state = S_11;
              done_port = 1'b1;
              selector_MUX_30_reg_0_0_0_0 = 1'b0;
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
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_11 :
        begin
          _next_state = S_0;
        end
      S_10 :
        begin
          selector_MUX_48_reg_3_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_3 = 1'b1;
          if (OUT_CONDITION_matrix_multiplication_33985_34821 == 1'b1)
            begin
              _next_state = S_6;
            end
          else
            begin
              _next_state = S_9;
              wrenable_reg_10 = 1'b0;
              wrenable_reg_11 = 1'b0;
              wrenable_reg_13 = 1'b0;
              wrenable_reg_14 = 1'b0;
            end
        end
      S_6 :
        begin
          selector_MUX_33_reg_11_0_0_0 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          if (OUT_CONDITION_matrix_multiplication_33985_34811 == 1'b1)
            begin
              _next_state = S_7;
            end
          else
            begin
              _next_state = S_5;
              wrenable_reg_16 = 1'b0;
              wrenable_reg_17 = 1'b0;
            end
        end
      S_7 :
        begin
          fuselector_BMEMORY_CTRLN_30_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          selector_MUX_40_reg_18_0_0_0 = 1'b1;
          selector_MUX_41_reg_19_0_0_0 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          _next_state = S_1;
        end
      S_1 :
        begin
          fuselector_BMEMORY_CTRLN_30_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_30_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          wrenable_reg_24 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          fuselector_BMEMORY_CTRLN_30_i0_STORE = 1'b1;
          selector_MUX_35_reg_13_0_0_0 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_18 = 1'b1;
          if (OUT_CONDITION_matrix_multiplication_33985_34693 == 1'b1)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_5;
              selector_MUX_35_reg_13_0_0_0 = 1'b0;
              wrenable_reg_13 = 1'b0;
              wrenable_reg_18 = 1'b0;
            end
        end
      S_5 :
        begin
          selector_MUX_35_reg_13_0_0_1 = 1'b1;
          wrenable_reg_13 = 1'b1;
          if (OUT_CONDITION_matrix_multiplication_33985_34809 == 1'b1)
            begin
              _next_state = S_6;
            end
          else
            begin
              _next_state = S_9;
              selector_MUX_35_reg_13_0_0_1 = 1'b0;
              wrenable_reg_13 = 1'b0;
            end
        end
      S_9 :
        begin
          selector_MUX_31_reg_1_0_0_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          if (OUT_CONDITION_matrix_multiplication_33985_34814 == 1'b1)
            begin
              _next_state = S_10;
            end
          else
            begin
              _next_state = S_12;
              done_port = 1'b1;
              selector_MUX_31_reg_1_0_0_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
            end
        end
      S_12 :
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

// Top component for matrix_multiplication
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _matrix_multiplication(clock,
  reset,
  start_port,
  done_port,
  A,
  B,
  C,
  n,
  m,
  w,
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
  input [31:0] C;
  input [31:0] n;
  input [31:0] m;
  input [31:0] w;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION_matrix_multiplication_33985_34676;
  wire OUT_CONDITION_matrix_multiplication_33985_34693;
  wire OUT_CONDITION_matrix_multiplication_33985_34809;
  wire OUT_CONDITION_matrix_multiplication_33985_34811;
  wire OUT_CONDITION_matrix_multiplication_33985_34814;
  wire OUT_CONDITION_matrix_multiplication_33985_34821;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_30_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_30_i0_STORE;
  wire fuselector_BMEMORY_CTRLN_30_i1_LOAD;
  wire fuselector_BMEMORY_CTRLN_30_i1_STORE;
  wire selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1;
  wire selector_MUX_30_reg_0_0_0_0;
  wire selector_MUX_31_reg_1_0_0_0;
  wire selector_MUX_33_reg_11_0_0_0;
  wire selector_MUX_35_reg_13_0_0_0;
  wire selector_MUX_35_reg_13_0_0_1;
  wire selector_MUX_40_reg_18_0_0_0;
  wire selector_MUX_41_reg_19_0_0_0;
  wire selector_MUX_48_reg_3_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_24;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_matrix_multiplication Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_30_i0_LOAD(fuselector_BMEMORY_CTRLN_30_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_30_i0_STORE(fuselector_BMEMORY_CTRLN_30_i0_STORE),
    .fuselector_BMEMORY_CTRLN_30_i1_LOAD(fuselector_BMEMORY_CTRLN_30_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_30_i1_STORE(fuselector_BMEMORY_CTRLN_30_i1_STORE),
    .selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1),
    .selector_MUX_30_reg_0_0_0_0(selector_MUX_30_reg_0_0_0_0),
    .selector_MUX_31_reg_1_0_0_0(selector_MUX_31_reg_1_0_0_0),
    .selector_MUX_33_reg_11_0_0_0(selector_MUX_33_reg_11_0_0_0),
    .selector_MUX_35_reg_13_0_0_0(selector_MUX_35_reg_13_0_0_0),
    .selector_MUX_35_reg_13_0_0_1(selector_MUX_35_reg_13_0_0_1),
    .selector_MUX_40_reg_18_0_0_0(selector_MUX_40_reg_18_0_0_0),
    .selector_MUX_41_reg_19_0_0_0(selector_MUX_41_reg_19_0_0_0),
    .selector_MUX_48_reg_3_0_0_0(selector_MUX_48_reg_3_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_matrix_multiplication_33985_34676(OUT_CONDITION_matrix_multiplication_33985_34676),
    .OUT_CONDITION_matrix_multiplication_33985_34693(OUT_CONDITION_matrix_multiplication_33985_34693),
    .OUT_CONDITION_matrix_multiplication_33985_34809(OUT_CONDITION_matrix_multiplication_33985_34809),
    .OUT_CONDITION_matrix_multiplication_33985_34811(OUT_CONDITION_matrix_multiplication_33985_34811),
    .OUT_CONDITION_matrix_multiplication_33985_34814(OUT_CONDITION_matrix_multiplication_33985_34814),
    .OUT_CONDITION_matrix_multiplication_33985_34821(OUT_CONDITION_matrix_multiplication_33985_34821),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_matrix_multiplication Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_matrix_multiplication_33985_34676(OUT_CONDITION_matrix_multiplication_33985_34676),
    .OUT_CONDITION_matrix_multiplication_33985_34693(OUT_CONDITION_matrix_multiplication_33985_34693),
    .OUT_CONDITION_matrix_multiplication_33985_34809(OUT_CONDITION_matrix_multiplication_33985_34809),
    .OUT_CONDITION_matrix_multiplication_33985_34811(OUT_CONDITION_matrix_multiplication_33985_34811),
    .OUT_CONDITION_matrix_multiplication_33985_34814(OUT_CONDITION_matrix_multiplication_33985_34814),
    .OUT_CONDITION_matrix_multiplication_33985_34821(OUT_CONDITION_matrix_multiplication_33985_34821),
    .clock(clock),
    .reset(reset),
    .in_port_A(A),
    .in_port_B(B),
    .in_port_C(C),
    .in_port_n(n),
    .in_port_m(m),
    .in_port_w(w),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_30_i0_LOAD(fuselector_BMEMORY_CTRLN_30_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_30_i0_STORE(fuselector_BMEMORY_CTRLN_30_i0_STORE),
    .fuselector_BMEMORY_CTRLN_30_i1_LOAD(fuselector_BMEMORY_CTRLN_30_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_30_i1_STORE(fuselector_BMEMORY_CTRLN_30_i1_STORE),
    .selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1),
    .selector_MUX_30_reg_0_0_0_0(selector_MUX_30_reg_0_0_0_0),
    .selector_MUX_31_reg_1_0_0_0(selector_MUX_31_reg_1_0_0_0),
    .selector_MUX_33_reg_11_0_0_0(selector_MUX_33_reg_11_0_0_0),
    .selector_MUX_35_reg_13_0_0_0(selector_MUX_35_reg_13_0_0_0),
    .selector_MUX_35_reg_13_0_0_1(selector_MUX_35_reg_13_0_0_1),
    .selector_MUX_40_reg_18_0_0_0(selector_MUX_40_reg_18_0_0_0),
    .selector_MUX_41_reg_19_0_0_0(selector_MUX_41_reg_19_0_0_0),
    .selector_MUX_48_reg_3_0_0_0(selector_MUX_48_reg_3_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
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

// Minimal interface for function: matrix_multiplication
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module matrix_multiplication(clock,
  reset,
  start_port,
  A,
  B,
  C,
  n,
  m,
  w,
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
  input [31:0] C;
  input [31:0] n;
  input [31:0] m;
  input [31:0] w;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  
  _matrix_multiplication _matrix_multiplication_i0 (.done_port(done_port),
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
    .C(C),
    .n(n),
    .m(m),
    .w(w),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram({1'b0,
      1'b0}),
    .Min_we_ram({1'b0,
      1'b0}),
    .Min_addr_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Min_Wdata_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Min_data_ram_size({6'b000000,
      6'b000000}));

endmodule


