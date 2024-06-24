// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2023.1 - Revision 04336c437a53bc96ae90b74052c455629946ec8b-main - Date 2024-05-16T18:56:59
// /tmp/.mount_bambu-cZWC2P/usr/bin/bambu executed with: /tmp/.mount_bambu-cZWC2P/usr/bin/bambu --top-fname=matrix_convolution --generate-tb=/home/paulevers/PD_project/PD_project/convolution_2D_bench/test.xml --simulate --evaluation --device-name=asap7-BC --simulator=XSIM --experimental-setup=BAMBU-PERFORMANCE-MP /home/paulevers/PD_project/PD_project/convolution_2D_bench/cpu_functions/cpu_functions.cpp 
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
module ASSIGN_SIGNED_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
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
module ge_expr_FU(in1,
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
  assign out1 = in1 >= in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module gt_expr_FU(in1,
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
  assign out1 = in1 > in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
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
      assign out1 = in1 <<< in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 <<< in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lt_expr_FU(in1,
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
  assign out1 = in1 < in2;

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
module negate_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = -in1;
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
module rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
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
      assign out1 = in1 >>> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >>> in2;
  endgenerate
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
module ui_bit_ior_expr_FU(in1,
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
  assign out1 = in1 | in2;
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
module ui_minus_expr_FU(in1,
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
  assign out1 = in1 - in2;
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
module UIconvert_expr_FU(in1,
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
module ASSIGN_UNSIGNED_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
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
module ui_bit_not_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = ~in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_xor_expr_FU(in1,
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
  assign out1 = in1 ^ in2;
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
module ui_gt_expr_FU(in1,
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
  assign out1 = in1 > in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_le_expr_FU(in1,
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
  assign out1 = in1 <= in2;
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
module ui_ternary_pm_expr_FU(in1,
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
  assign out1 = in1 + in2 - in3;
endmodule

// Datapath RTL description for __float_adde8m23b_127nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___float_adde8m23b_127nih(clock,
  reset,
  in_port_a,
  in_port_b,
  return_port);
  // IN
  input clock;
  input reset;
  input [63:0] in_port_a;
  input [63:0] in_port_b;
  // OUT
  output [63:0] return_port;
  // Component and signal declarations
  wire [4:0] out_ASSIGN_UNSIGNED_FU_22_i0_fu___float_adde8m23b_127nih_38397_40820;
  wire [7:0] out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_38397_40818;
  wire [4:0] out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_38397_38904;
  wire [0:0] out_IUdata_converter_FU_19_i0_fu___float_adde8m23b_127nih_38397_39309;
  wire [0:0] out_IUdata_converter_FU_20_i0_fu___float_adde8m23b_127nih_38397_39315;
  wire [31:0] out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_38397_38487;
  wire [26:0] out_IUdata_converter_FU_6_i0_fu___float_adde8m23b_127nih_38397_38566;
  wire signed [5:0] out_UIconvert_expr_FU_12_i0_fu___float_adde8m23b_127nih_38397_38916;
  wire signed [1:0] out_UIconvert_expr_FU_2_i0_fu___float_adde8m23b_127nih_38397_38478;
  wire signed [1:0] out_UIconvert_expr_FU_5_i0_fu___float_adde8m23b_127nih_38397_38557;
  wire signed [1:0] out_UIconvert_expr_FU_9_i0_fu___float_adde8m23b_127nih_38397_38895;
  wire signed [1:0] out_UIdata_converter_FU_16_i0_fu___float_adde8m23b_127nih_38397_40749;
  wire signed [1:0] out_UIdata_converter_FU_17_i0_fu___float_adde8m23b_127nih_38397_40759;
  wire [4:0] out_UUdata_converter_FU_11_i0_fu___float_adde8m23b_127nih_38397_38907;
  wire out_UUdata_converter_FU_13_i0_fu___float_adde8m23b_127nih_38397_38986;
  wire out_UUdata_converter_FU_14_i0_fu___float_adde8m23b_127nih_38397_39601;
  wire out_UUdata_converter_FU_15_i0_fu___float_adde8m23b_127nih_38397_39716;
  wire out_UUdata_converter_FU_18_i0_fu___float_adde8m23b_127nih_38397_40810;
  wire out_UUdata_converter_FU_21_i0_fu___float_adde8m23b_127nih_38397_40786;
  wire out_UUdata_converter_FU_23_i0_fu___float_adde8m23b_127nih_38397_39689;
  wire out_UUdata_converter_FU_7_i0_fu___float_adde8m23b_127nih_38397_38699;
  wire out_UUdata_converter_FU_8_i0_fu___float_adde8m23b_127nih_38397_38713;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [5:0] out_const_10;
  wire [2:0] out_const_11;
  wire [5:0] out_const_12;
  wire [5:0] out_const_13;
  wire [5:0] out_const_14;
  wire [5:0] out_const_15;
  wire [6:0] out_const_16;
  wire out_const_17;
  wire [1:0] out_const_18;
  wire [4:0] out_const_19;
  wire [2:0] out_const_2;
  wire [1:0] out_const_20;
  wire [3:0] out_const_21;
  wire [4:0] out_const_22;
  wire [5:0] out_const_23;
  wire [7:0] out_const_24;
  wire [7:0] out_const_25;
  wire [15:0] out_const_26;
  wire [22:0] out_const_27;
  wire [25:0] out_const_28;
  wire [26:0] out_const_29;
  wire [3:0] out_const_3;
  wire [30:0] out_const_30;
  wire [63:0] out_const_31;
  wire [4:0] out_const_4;
  wire [5:0] out_const_5;
  wire [5:0] out_const_6;
  wire [3:0] out_const_7;
  wire [4:0] out_const_8;
  wire [5:0] out_const_9;
  wire [31:0] out_conv_in_port_a_64_32;
  wire [31:0] out_conv_in_port_b_64_32;
  wire [63:0] out_conv_out_ui_bit_ior_expr_FU_0_32_32_56_i0_fu___float_adde8m23b_127nih_38397_39756_32_64;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_25_i0_fu___float_adde8m23b_127nih_38397_38898;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_26_i0_fu___float_adde8m23b_127nih_38397_40753;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_26_i1_fu___float_adde8m23b_127nih_38397_40762;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_27_i0_fu___float_adde8m23b_127nih_38397_38481;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_27_i1_fu___float_adde8m23b_127nih_38397_38560;
  wire signed [0:0] out_rshift_expr_FU_32_0_32_28_i0_fu___float_adde8m23b_127nih_38397_38901;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_29_i0_fu___float_adde8m23b_127nih_38397_40756;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_29_i1_fu___float_adde8m23b_127nih_38397_40765;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_30_i0_fu___float_adde8m23b_127nih_38397_38484;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_30_i1_fu___float_adde8m23b_127nih_38397_38563;
  wire out_truth_and_expr_FU_1_1_1_31_i0_fu___float_adde8m23b_127nih_38397_40667;
  wire out_truth_not_expr_FU_1_1_32_i0_fu___float_adde8m23b_127nih_38397_38653;
  wire out_truth_not_expr_FU_1_1_32_i1_fu___float_adde8m23b_127nih_38397_38661;
  wire out_truth_not_expr_FU_1_1_32_i2_fu___float_adde8m23b_127nih_38397_38939;
  wire out_truth_not_expr_FU_1_1_32_i3_fu___float_adde8m23b_127nih_38397_39636;
  wire out_truth_not_expr_FU_1_1_32_i4_fu___float_adde8m23b_127nih_38397_39641;
  wire out_truth_not_expr_FU_1_1_32_i5_fu___float_adde8m23b_127nih_38397_39695;
  wire [30:0] out_ui_bit_and_expr_FU_0_32_32_33_i0_fu___float_adde8m23b_127nih_38397_38459;
  wire [30:0] out_ui_bit_and_expr_FU_0_32_32_33_i1_fu___float_adde8m23b_127nih_38397_38466;
  wire [22:0] out_ui_bit_and_expr_FU_0_32_32_34_i0_fu___float_adde8m23b_127nih_38397_38609;
  wire [7:0] out_ui_bit_and_expr_FU_0_8_8_35_i0_fu___float_adde8m23b_127nih_38397_38615;
  wire [15:0] out_ui_bit_and_expr_FU_16_0_16_36_i0_fu___float_adde8m23b_127nih_38397_39035;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_37_i0_fu___float_adde8m23b_127nih_38397_38656;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_37_i1_fu___float_adde8m23b_127nih_38397_38664;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_38_i0_fu___float_adde8m23b_127nih_38397_39251;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_38_i1_fu___float_adde8m23b_127nih_38397_39610;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_39_i0_fu___float_adde8m23b_127nih_38397_39468;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_39_i1_fu___float_adde8m23b_127nih_38397_39598;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_40_i0_fu___float_adde8m23b_127nih_38397_38983;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_40_i1_fu___float_adde8m23b_127nih_38397_39613;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_40_i2_fu___float_adde8m23b_127nih_38397_39697;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_40_i3_fu___float_adde8m23b_127nih_38397_39700;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_40_i4_fu___float_adde8m23b_127nih_38397_39710;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_40_i5_fu___float_adde8m23b_127nih_38397_39713;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_41_i0_fu___float_adde8m23b_127nih_38397_38531;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_41_i1_fu___float_adde8m23b_127nih_38397_39574;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_41_i2_fu___float_adde8m23b_127nih_38397_39646;
  wire [25:0] out_ui_bit_and_expr_FU_32_0_32_42_i0_fu___float_adde8m23b_127nih_38397_38960;
  wire [26:0] out_ui_bit_and_expr_FU_32_0_32_43_i0_fu___float_adde8m23b_127nih_38397_38977;
  wire [26:0] out_ui_bit_and_expr_FU_32_0_32_43_i1_fu___float_adde8m23b_127nih_38397_38994;
  wire [31:0] out_ui_bit_and_expr_FU_32_32_32_44_i0_fu___float_adde8m23b_127nih_38397_38490;
  wire [31:0] out_ui_bit_and_expr_FU_32_32_32_44_i1_fu___float_adde8m23b_127nih_38397_38496;
  wire [31:0] out_ui_bit_and_expr_FU_32_32_32_44_i2_fu___float_adde8m23b_127nih_38397_38504;
  wire [31:0] out_ui_bit_and_expr_FU_32_32_32_44_i3_fu___float_adde8m23b_127nih_38397_38507;
  wire [23:0] out_ui_bit_and_expr_FU_32_32_32_44_i4_fu___float_adde8m23b_127nih_38397_38929;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_45_i0_fu___float_adde8m23b_127nih_38397_38545;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_45_i1_fu___float_adde8m23b_127nih_38397_38696;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_45_i2_fu___float_adde8m23b_127nih_38397_39563;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_45_i3_fu___float_adde8m23b_127nih_38397_39631;
  wire [4:0] out_ui_bit_and_expr_FU_8_0_8_46_i0_fu___float_adde8m23b_127nih_38397_38913;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_47_i0_fu___float_adde8m23b_127nih_38397_39065;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_48_i0_fu___float_adde8m23b_127nih_38397_39097;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_49_i0_fu___float_adde8m23b_127nih_38397_39173;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_50_i0_fu___float_adde8m23b_127nih_38397_40566;
  wire [26:0] out_ui_bit_ior_concat_expr_FU_51_i0_fu___float_adde8m23b_127nih_38397_38980;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_52_i0_fu___float_adde8m23b_127nih_38397_38705;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_53_i0_fu___float_adde8m23b_127nih_38397_38719;
  wire [30:0] out_ui_bit_ior_expr_FU_0_32_32_54_i0_fu___float_adde8m23b_127nih_38397_39579;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_55_i0_fu___float_adde8m23b_127nih_38397_39753;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_56_i0_fu___float_adde8m23b_127nih_38397_39756;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_57_i0_fu___float_adde8m23b_127nih_38397_39275;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_58_i0_fu___float_adde8m23b_127nih_38397_39321;
  wire [4:0] out_ui_bit_ior_expr_FU_0_8_8_59_i0_fu___float_adde8m23b_127nih_38397_39324;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_60_i0_fu___float_adde8m23b_127nih_38397_39548;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_60_i1_fu___float_adde8m23b_127nih_38397_39595;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_60_i2_fu___float_adde8m23b_127nih_38397_39604;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_60_i3_fu___float_adde8m23b_127nih_38397_39607;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_60_i4_fu___float_adde8m23b_127nih_38397_39623;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_60_i5_fu___float_adde8m23b_127nih_38397_39703;
  wire [31:0] out_ui_bit_ior_expr_FU_32_32_32_61_i0_fu___float_adde8m23b_127nih_38397_38499;
  wire [31:0] out_ui_bit_ior_expr_FU_32_32_32_61_i1_fu___float_adde8m23b_127nih_38397_38510;
  wire [22:0] out_ui_bit_ior_expr_FU_32_32_32_61_i2_fu___float_adde8m23b_127nih_38397_39727;
  wire [4:0] out_ui_bit_ior_expr_FU_8_8_8_62_i0_fu___float_adde8m23b_127nih_38397_38910;
  wire [31:0] out_ui_bit_not_expr_FU_32_32_63_i0_fu___float_adde8m23b_127nih_38397_38493;
  wire [25:0] out_ui_bit_not_expr_FU_32_32_63_i1_fu___float_adde8m23b_127nih_38397_38926;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_64_i0_fu___float_adde8m23b_127nih_38397_38554;
  wire [26:0] out_ui_bit_xor_expr_FU_32_32_32_65_i0_fu___float_adde8m23b_127nih_38397_38963;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_66_i0_fu___float_adde8m23b_127nih_38397_40700;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_66_i1_fu___float_adde8m23b_127nih_38397_40706;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_66_i2_fu___float_adde8m23b_127nih_38397_40746;
  wire [22:0] out_ui_cond_expr_FU_32_32_32_32_67_i0_fu___float_adde8m23b_127nih_38397_40704;
  wire [26:0] out_ui_cond_expr_FU_32_32_32_32_67_i1_fu___float_adde8m23b_127nih_38397_40708;
  wire [26:0] out_ui_cond_expr_FU_32_32_32_32_67_i2_fu___float_adde8m23b_127nih_38397_40712;
  wire [26:0] out_ui_cond_expr_FU_32_32_32_32_67_i3_fu___float_adde8m23b_127nih_38397_40718;
  wire [26:0] out_ui_cond_expr_FU_32_32_32_32_67_i4_fu___float_adde8m23b_127nih_38397_40728;
  wire [25:0] out_ui_cond_expr_FU_32_32_32_32_67_i5_fu___float_adde8m23b_127nih_38397_40736;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_68_i0_fu___float_adde8m23b_127nih_38397_40702;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_68_i1_fu___float_adde8m23b_127nih_38397_40726;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_68_i2_fu___float_adde8m23b_127nih_38397_40734;
  wire [7:0] out_ui_cond_expr_FU_8_8_8_8_68_i3_fu___float_adde8m23b_127nih_38397_40744;
  wire out_ui_eq_expr_FU_0_8_8_69_i0_fu___float_adde8m23b_127nih_38397_38638;
  wire out_ui_eq_expr_FU_0_8_8_69_i1_fu___float_adde8m23b_127nih_38397_38643;
  wire out_ui_eq_expr_FU_0_8_8_70_i0_fu___float_adde8m23b_127nih_38397_39451;
  wire out_ui_eq_expr_FU_16_0_16_71_i0_fu___float_adde8m23b_127nih_38397_39922;
  wire out_ui_eq_expr_FU_1_0_1_72_i0_fu___float_adde8m23b_127nih_38397_39938;
  wire out_ui_eq_expr_FU_8_0_8_73_i0_fu___float_adde8m23b_127nih_38397_38618;
  wire out_ui_eq_expr_FU_8_0_8_73_i1_fu___float_adde8m23b_127nih_38397_38623;
  wire out_ui_eq_expr_FU_8_0_8_74_i0_fu___float_adde8m23b_127nih_38397_39926;
  wire out_ui_eq_expr_FU_8_0_8_74_i1_fu___float_adde8m23b_127nih_38397_39930;
  wire out_ui_eq_expr_FU_8_0_8_74_i2_fu___float_adde8m23b_127nih_38397_39934;
  wire out_ui_eq_expr_FU_8_0_8_75_i0_fu___float_adde8m23b_127nih_38397_39964;
  wire out_ui_gt_expr_FU_1_1_1_76_i0_fu___float_adde8m23b_127nih_38397_39984;
  wire out_ui_le_expr_FU_1_1_1_77_i0_fu___float_adde8m23b_127nih_38397_39692;
  wire [25:0] out_ui_lshift_expr_FU_0_64_64_78_i0_fu___float_adde8m23b_127nih_38397_38923;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_79_i0_fu___float_adde8m23b_127nih_38397_38702;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_79_i1_fu___float_adde8m23b_127nih_38397_38716;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_79_i2_fu___float_adde8m23b_127nih_38397_39560;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_79_i3_fu___float_adde8m23b_127nih_38397_39750;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_80_i0_fu___float_adde8m23b_127nih_38397_38708;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_80_i1_fu___float_adde8m23b_127nih_38397_38722;
  wire [26:0] out_ui_lshift_expr_FU_32_0_32_81_i0_fu___float_adde8m23b_127nih_38397_39051;
  wire [26:0] out_ui_lshift_expr_FU_32_0_32_82_i0_fu___float_adde8m23b_127nih_38397_39081;
  wire [26:0] out_ui_lshift_expr_FU_32_0_32_83_i0_fu___float_adde8m23b_127nih_38397_39127;
  wire [26:0] out_ui_lshift_expr_FU_32_0_32_84_i0_fu___float_adde8m23b_127nih_38397_39203;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_85_i0_fu___float_adde8m23b_127nih_38397_39259;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_86_i0_fu___float_adde8m23b_127nih_38397_39686;
  wire [22:0] out_ui_lshift_expr_FU_32_0_32_87_i0_fu___float_adde8m23b_127nih_38397_39724;
  wire [25:0] out_ui_lshift_expr_FU_32_0_32_88_i0_fu___float_adde8m23b_127nih_38397_40543;
  wire [26:0] out_ui_lshift_expr_FU_32_0_32_89_i0_fu___float_adde8m23b_127nih_38397_40562;
  wire [30:0] out_ui_lshift_expr_FU_32_0_32_90_i0_fu___float_adde8m23b_127nih_38397_40800;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_91_i0_fu___float_adde8m23b_127nih_38397_40807;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_adde8m23b_127nih_38397_40789;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_92_i1_fu___float_adde8m23b_127nih_38397_40813;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_93_i0_fu___float_adde8m23b_127nih_38397_39312;
  wire [4:0] out_ui_lshift_expr_FU_8_0_8_94_i0_fu___float_adde8m23b_127nih_38397_39318;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_95_i0_fu___float_adde8m23b_127nih_38397_40769;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_95_i1_fu___float_adde8m23b_127nih_38397_40783;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_96_i0_fu___float_adde8m23b_127nih_38397_40773;
  wire out_ui_lt_expr_FU_1_1_1_97_i0_fu___float_adde8m23b_127nih_38397_39986;
  wire out_ui_lt_expr_FU_32_32_32_98_i0_fu___float_adde8m23b_127nih_38397_38473;
  wire out_ui_lt_expr_FU_8_8_8_99_i0_fu___float_adde8m23b_127nih_38397_39401;
  wire [7:0] out_ui_minus_expr_FU_8_8_8_100_i0_fu___float_adde8m23b_127nih_38397_38691;
  wire out_ui_ne_expr_FU_1_0_1_101_i0_fu___float_adde8m23b_127nih_38397_38522;
  wire out_ui_ne_expr_FU_1_0_1_101_i1_fu___float_adde8m23b_127nih_38397_38551;
  wire out_ui_ne_expr_FU_1_0_1_101_i2_fu___float_adde8m23b_127nih_38397_39966;
  wire out_ui_ne_expr_FU_32_0_32_102_i0_fu___float_adde8m23b_127nih_38397_38628;
  wire out_ui_ne_expr_FU_32_0_32_102_i1_fu___float_adde8m23b_127nih_38397_38633;
  wire out_ui_ne_expr_FU_32_0_32_103_i0_fu___float_adde8m23b_127nih_38397_38934;
  wire out_ui_ne_expr_FU_8_0_8_104_i0_fu___float_adde8m23b_127nih_38397_38892;
  wire [26:0] out_ui_plus_expr_FU_32_32_32_105_i0_fu___float_adde8m23b_127nih_38397_38989;
  wire [30:0] out_ui_plus_expr_FU_32_32_32_105_i1_fu___float_adde8m23b_127nih_38397_39616;
  wire [24:0] out_ui_plus_expr_FU_32_32_32_105_i2_fu___float_adde8m23b_127nih_38397_40559;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_106_i0_fu___float_adde8m23b_127nih_38397_38519;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_106_i1_fu___float_adde8m23b_127nih_38397_38548;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_107_i0_fu___float_adde8m23b_127nih_38397_38534;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_107_i1_fu___float_adde8m23b_127nih_38397_38612;
  wire [3:0] out_ui_rshift_expr_FU_32_0_32_107_i2_fu___float_adde8m23b_127nih_38397_39094;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_107_i3_fu___float_adde8m23b_127nih_38397_39628;
  wire [15:0] out_ui_rshift_expr_FU_32_0_32_108_i0_fu___float_adde8m23b_127nih_38397_39032;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_109_i0_fu___float_adde8m23b_127nih_38397_39062;
  wire [1:0] out_ui_rshift_expr_FU_32_0_32_110_i0_fu___float_adde8m23b_127nih_38397_39170;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_111_i0_fu___float_adde8m23b_127nih_38397_39248;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_111_i1_fu___float_adde8m23b_127nih_38397_39465;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_112_i0_fu___float_adde8m23b_127nih_38397_39571;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_113_i0_fu___float_adde8m23b_127nih_38397_39586;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_114_i0_fu___float_adde8m23b_127nih_38397_39589;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_115_i0_fu___float_adde8m23b_127nih_38397_39592;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_116_i0_fu___float_adde8m23b_127nih_38397_40534;
  wire [24:0] out_ui_rshift_expr_FU_32_0_32_116_i1_fu___float_adde8m23b_127nih_38397_40553;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_116_i2_fu___float_adde8m23b_127nih_38397_40557;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_117_i0_fu___float_adde8m23b_127nih_38397_40538;
  wire [23:0] out_ui_rshift_expr_FU_32_0_32_117_i1_fu___float_adde8m23b_127nih_38397_40546;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_118_i0_fu___float_adde8m23b_127nih_38397_40796;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_119_i0_fu___float_adde8m23b_127nih_38397_40803;
  wire [25:0] out_ui_rshift_expr_FU_32_32_32_120_i0_fu___float_adde8m23b_127nih_38397_38946;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_121_i0_fu___float_adde8m23b_127nih_38397_40792;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_121_i1_fu___float_adde8m23b_127nih_38397_40816;
  wire [2:0] out_ui_rshift_expr_FU_8_0_8_122_i0_fu___float_adde8m23b_127nih_38397_38889;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_123_i0_fu___float_adde8m23b_127nih_38397_40776;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_123_i1_fu___float_adde8m23b_127nih_38397_40779;
  wire [7:0] out_ui_ternary_pm_expr_FU_8_0_8_8_124_i0_fu___float_adde8m23b_127nih_38397_39566;
  
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010111)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b011)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011001)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011010)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011110)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011111)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10111)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11111110)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11111111)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111111111111111)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(23),
    .value(23'b11111111111111111111111)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(26),
    .value(26'b11111111111111111111111111)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(27),
    .value(27'b111111111111111111111111111)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1111111111111111111111111111111)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010011)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0101)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01011)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010110)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_in_port_a_64_32 (.out1(out_conv_in_port_a_64_32),
    .in1(in_port_a));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_in_port_b_64_32 (.out1(out_conv_in_port_b_64_32),
    .in1(in_port_b));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_ui_bit_ior_expr_FU_0_32_32_56_i0_fu___float_adde8m23b_127nih_38397_39756_32_64 (.out1(out_conv_out_ui_bit_ior_expr_FU_0_32_32_56_i0_fu___float_adde8m23b_127nih_38397_39756_32_64),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_56_i0_fu___float_adde8m23b_127nih_38397_39756));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_38397_38459 (.out1(out_ui_bit_and_expr_FU_0_32_32_33_i0_fu___float_adde8m23b_127nih_38397_38459),
    .in1(out_const_30),
    .in2(out_conv_in_port_a_64_32));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_38397_38466 (.out1(out_ui_bit_and_expr_FU_0_32_32_33_i1_fu___float_adde8m23b_127nih_38397_38466),
    .in1(out_const_30),
    .in2(out_conv_in_port_b_64_32));
  ui_lt_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(31),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38473 (.out1(out_ui_lt_expr_FU_32_32_32_98_i0_fu___float_adde8m23b_127nih_38397_38473),
    .in1(out_ui_bit_and_expr_FU_0_32_32_33_i0_fu___float_adde8m23b_127nih_38397_38459),
    .in2(out_ui_bit_and_expr_FU_0_32_32_33_i1_fu___float_adde8m23b_127nih_38397_38466));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_38397_38478 (.out1(out_UIconvert_expr_FU_2_i0_fu___float_adde8m23b_127nih_38397_38478),
    .in1(out_ui_lt_expr_FU_32_32_32_98_i0_fu___float_adde8m23b_127nih_38397_38473));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38481 (.out1(out_lshift_expr_FU_64_0_64_27_i0_fu___float_adde8m23b_127nih_38397_38481),
    .in1(out_UIconvert_expr_FU_2_i0_fu___float_adde8m23b_127nih_38397_38478),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38484 (.out1(out_rshift_expr_FU_64_0_64_30_i0_fu___float_adde8m23b_127nih_38397_38484),
    .in1(out_lshift_expr_FU_64_0_64_27_i0_fu___float_adde8m23b_127nih_38397_38481),
    .in2(out_const_16));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_38397_38487 (.out1(out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_38397_38487),
    .in1(out_rshift_expr_FU_64_0_64_30_i0_fu___float_adde8m23b_127nih_38397_38484));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_38397_38490 (.out1(out_ui_bit_and_expr_FU_32_32_32_44_i0_fu___float_adde8m23b_127nih_38397_38490),
    .in1(out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_38397_38487),
    .in2(out_conv_in_port_b_64_32));
  ui_bit_not_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_38397_38493 (.out1(out_ui_bit_not_expr_FU_32_32_63_i0_fu___float_adde8m23b_127nih_38397_38493),
    .in1(out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_38397_38487));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_38397_38496 (.out1(out_ui_bit_and_expr_FU_32_32_32_44_i1_fu___float_adde8m23b_127nih_38397_38496),
    .in1(out_ui_bit_not_expr_FU_32_32_63_i0_fu___float_adde8m23b_127nih_38397_38493),
    .in2(out_conv_in_port_a_64_32));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_38397_38499 (.out1(out_ui_bit_ior_expr_FU_32_32_32_61_i0_fu___float_adde8m23b_127nih_38397_38499),
    .in1(out_ui_bit_and_expr_FU_32_32_32_44_i1_fu___float_adde8m23b_127nih_38397_38496),
    .in2(out_ui_bit_and_expr_FU_32_32_32_44_i0_fu___float_adde8m23b_127nih_38397_38490));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_38397_38504 (.out1(out_ui_bit_and_expr_FU_32_32_32_44_i2_fu___float_adde8m23b_127nih_38397_38504),
    .in1(out_IUdata_converter_FU_3_i0_fu___float_adde8m23b_127nih_38397_38487),
    .in2(out_conv_in_port_a_64_32));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_38397_38507 (.out1(out_ui_bit_and_expr_FU_32_32_32_44_i3_fu___float_adde8m23b_127nih_38397_38507),
    .in1(out_ui_bit_not_expr_FU_32_32_63_i0_fu___float_adde8m23b_127nih_38397_38493),
    .in2(out_conv_in_port_b_64_32));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_38397_38510 (.out1(out_ui_bit_ior_expr_FU_32_32_32_61_i1_fu___float_adde8m23b_127nih_38397_38510),
    .in1(out_ui_bit_and_expr_FU_32_32_32_44_i3_fu___float_adde8m23b_127nih_38397_38507),
    .in2(out_ui_bit_and_expr_FU_32_32_32_44_i2_fu___float_adde8m23b_127nih_38397_38504));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38519 (.out1(out_ui_rshift_expr_FU_32_0_32_106_i0_fu___float_adde8m23b_127nih_38397_38519),
    .in1(out_ui_bit_ior_expr_FU_32_32_32_61_i0_fu___float_adde8m23b_127nih_38397_38499),
    .in2(out_const_15));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38522 (.out1(out_ui_ne_expr_FU_1_0_1_101_i0_fu___float_adde8m23b_127nih_38397_38522),
    .in1(out_ui_rshift_expr_FU_32_0_32_106_i0_fu___float_adde8m23b_127nih_38397_38519),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_38397_38531 (.out1(out_ui_bit_and_expr_FU_32_0_32_41_i0_fu___float_adde8m23b_127nih_38397_38531),
    .in1(out_ui_bit_ior_expr_FU_32_32_32_61_i0_fu___float_adde8m23b_127nih_38397_38499),
    .in2(out_const_27));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38534 (.out1(out_ui_rshift_expr_FU_32_0_32_107_i0_fu___float_adde8m23b_127nih_38397_38534),
    .in1(out_ui_bit_ior_expr_FU_32_32_32_61_i0_fu___float_adde8m23b_127nih_38397_38499),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_38397_38545 (.out1(out_ui_bit_and_expr_FU_8_0_8_45_i0_fu___float_adde8m23b_127nih_38397_38545),
    .in1(out_ui_rshift_expr_FU_32_0_32_107_i0_fu___float_adde8m23b_127nih_38397_38534),
    .in2(out_const_25));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38548 (.out1(out_ui_rshift_expr_FU_32_0_32_106_i1_fu___float_adde8m23b_127nih_38397_38548),
    .in1(out_ui_bit_ior_expr_FU_32_32_32_61_i1_fu___float_adde8m23b_127nih_38397_38510),
    .in2(out_const_15));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38551 (.out1(out_ui_ne_expr_FU_1_0_1_101_i1_fu___float_adde8m23b_127nih_38397_38551),
    .in1(out_ui_rshift_expr_FU_32_0_32_106_i1_fu___float_adde8m23b_127nih_38397_38548),
    .in2(out_const_0));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38554 (.out1(out_ui_bit_xor_expr_FU_1_1_1_64_i0_fu___float_adde8m23b_127nih_38397_38554),
    .in1(out_ui_ne_expr_FU_1_0_1_101_i1_fu___float_adde8m23b_127nih_38397_38551),
    .in2(out_ui_ne_expr_FU_1_0_1_101_i0_fu___float_adde8m23b_127nih_38397_38522));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_38397_38557 (.out1(out_UIconvert_expr_FU_5_i0_fu___float_adde8m23b_127nih_38397_38557),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_64_i0_fu___float_adde8m23b_127nih_38397_38554));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38560 (.out1(out_lshift_expr_FU_64_0_64_27_i1_fu___float_adde8m23b_127nih_38397_38560),
    .in1(out_UIconvert_expr_FU_5_i0_fu___float_adde8m23b_127nih_38397_38557),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38563 (.out1(out_rshift_expr_FU_64_0_64_30_i1_fu___float_adde8m23b_127nih_38397_38563),
    .in1(out_lshift_expr_FU_64_0_64_27_i1_fu___float_adde8m23b_127nih_38397_38560),
    .in2(out_const_16));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_38397_38566 (.out1(out_IUdata_converter_FU_6_i0_fu___float_adde8m23b_127nih_38397_38566),
    .in1(out_rshift_expr_FU_64_0_64_30_i1_fu___float_adde8m23b_127nih_38397_38563));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_38397_38609 (.out1(out_ui_bit_and_expr_FU_0_32_32_34_i0_fu___float_adde8m23b_127nih_38397_38609),
    .in1(out_const_27),
    .in2(out_ui_bit_ior_expr_FU_32_32_32_61_i1_fu___float_adde8m23b_127nih_38397_38510));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38612 (.out1(out_ui_rshift_expr_FU_32_0_32_107_i1_fu___float_adde8m23b_127nih_38397_38612),
    .in1(out_ui_bit_ior_expr_FU_32_32_32_61_i1_fu___float_adde8m23b_127nih_38397_38510),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_38397_38615 (.out1(out_ui_bit_and_expr_FU_0_8_8_35_i0_fu___float_adde8m23b_127nih_38397_38615),
    .in1(out_const_25),
    .in2(out_ui_rshift_expr_FU_32_0_32_107_i1_fu___float_adde8m23b_127nih_38397_38612));
  ui_eq_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38618 (.out1(out_ui_eq_expr_FU_8_0_8_73_i0_fu___float_adde8m23b_127nih_38397_38618),
    .in1(out_ui_bit_and_expr_FU_8_0_8_45_i0_fu___float_adde8m23b_127nih_38397_38545),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38623 (.out1(out_ui_eq_expr_FU_8_0_8_73_i1_fu___float_adde8m23b_127nih_38397_38623),
    .in1(out_ui_bit_and_expr_FU_0_8_8_35_i0_fu___float_adde8m23b_127nih_38397_38615),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38628 (.out1(out_ui_ne_expr_FU_32_0_32_102_i0_fu___float_adde8m23b_127nih_38397_38628),
    .in1(out_ui_bit_and_expr_FU_32_0_32_41_i0_fu___float_adde8m23b_127nih_38397_38531),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38633 (.out1(out_ui_ne_expr_FU_32_0_32_102_i1_fu___float_adde8m23b_127nih_38397_38633),
    .in1(out_ui_bit_and_expr_FU_0_32_32_34_i0_fu___float_adde8m23b_127nih_38397_38609),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38638 (.out1(out_ui_eq_expr_FU_0_8_8_69_i0_fu___float_adde8m23b_127nih_38397_38638),
    .in1(out_const_25),
    .in2(out_ui_bit_and_expr_FU_8_0_8_45_i0_fu___float_adde8m23b_127nih_38397_38545));
  ui_eq_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38643 (.out1(out_ui_eq_expr_FU_0_8_8_69_i1_fu___float_adde8m23b_127nih_38397_38643),
    .in1(out_const_25),
    .in2(out_ui_bit_and_expr_FU_0_8_8_35_i0_fu___float_adde8m23b_127nih_38397_38615));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38653 (.out1(out_truth_not_expr_FU_1_1_32_i0_fu___float_adde8m23b_127nih_38397_38653),
    .in1(out_ui_eq_expr_FU_8_0_8_73_i0_fu___float_adde8m23b_127nih_38397_38618));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38656 (.out1(out_ui_bit_and_expr_FU_1_0_1_37_i0_fu___float_adde8m23b_127nih_38397_38656),
    .in1(out_truth_not_expr_FU_1_1_32_i0_fu___float_adde8m23b_127nih_38397_38653),
    .in2(out_const_17));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38661 (.out1(out_truth_not_expr_FU_1_1_32_i1_fu___float_adde8m23b_127nih_38397_38661),
    .in1(out_ui_eq_expr_FU_8_0_8_73_i1_fu___float_adde8m23b_127nih_38397_38623));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38664 (.out1(out_ui_bit_and_expr_FU_1_0_1_37_i1_fu___float_adde8m23b_127nih_38397_38664),
    .in1(out_truth_not_expr_FU_1_1_32_i1_fu___float_adde8m23b_127nih_38397_38661),
    .in2(out_const_17));
  ui_minus_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_38397_38691 (.out1(out_ui_minus_expr_FU_8_8_8_100_i0_fu___float_adde8m23b_127nih_38397_38691),
    .in1(out_ui_bit_and_expr_FU_8_0_8_45_i0_fu___float_adde8m23b_127nih_38397_38545),
    .in2(out_ui_bit_and_expr_FU_0_8_8_35_i0_fu___float_adde8m23b_127nih_38397_38615));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_38397_38696 (.out1(out_ui_bit_and_expr_FU_8_0_8_45_i1_fu___float_adde8m23b_127nih_38397_38696),
    .in1(out_ui_minus_expr_FU_8_8_8_100_i0_fu___float_adde8m23b_127nih_38397_38691),
    .in2(out_const_25));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38699 (.out1(out_UUdata_converter_FU_7_i0_fu___float_adde8m23b_127nih_38397_38699),
    .in1(out_ui_bit_and_expr_FU_1_0_1_37_i0_fu___float_adde8m23b_127nih_38397_38656));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38702 (.out1(out_ui_lshift_expr_FU_32_0_32_79_i0_fu___float_adde8m23b_127nih_38397_38702),
    .in1(out_UUdata_converter_FU_7_i0_fu___float_adde8m23b_127nih_38397_38699),
    .in2(out_const_10));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_adde8m23b_127nih_38397_38705 (.out1(out_ui_bit_ior_expr_FU_0_32_32_52_i0_fu___float_adde8m23b_127nih_38397_38705),
    .in1(out_ui_lshift_expr_FU_32_0_32_79_i0_fu___float_adde8m23b_127nih_38397_38702),
    .in2(out_ui_bit_and_expr_FU_32_0_32_41_i0_fu___float_adde8m23b_127nih_38397_38531));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38708 (.out1(out_ui_lshift_expr_FU_32_0_32_80_i0_fu___float_adde8m23b_127nih_38397_38708),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_52_i0_fu___float_adde8m23b_127nih_38397_38705),
    .in2(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38713 (.out1(out_UUdata_converter_FU_8_i0_fu___float_adde8m23b_127nih_38397_38713),
    .in1(out_ui_bit_and_expr_FU_1_0_1_37_i1_fu___float_adde8m23b_127nih_38397_38664));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38716 (.out1(out_ui_lshift_expr_FU_32_0_32_79_i1_fu___float_adde8m23b_127nih_38397_38716),
    .in1(out_UUdata_converter_FU_8_i0_fu___float_adde8m23b_127nih_38397_38713),
    .in2(out_const_10));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_adde8m23b_127nih_38397_38719 (.out1(out_ui_bit_ior_expr_FU_0_32_32_53_i0_fu___float_adde8m23b_127nih_38397_38719),
    .in1(out_ui_lshift_expr_FU_32_0_32_79_i1_fu___float_adde8m23b_127nih_38397_38716),
    .in2(out_ui_bit_and_expr_FU_0_32_32_34_i0_fu___float_adde8m23b_127nih_38397_38609));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38722 (.out1(out_ui_lshift_expr_FU_32_0_32_80_i1_fu___float_adde8m23b_127nih_38397_38722),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_53_i0_fu___float_adde8m23b_127nih_38397_38719),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(4),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38889 (.out1(out_ui_rshift_expr_FU_8_0_8_122_i0_fu___float_adde8m23b_127nih_38397_38889),
    .in1(out_ui_bit_and_expr_FU_8_0_8_45_i1_fu___float_adde8m23b_127nih_38397_38696),
    .in2(out_const_7));
  ui_ne_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38892 (.out1(out_ui_ne_expr_FU_8_0_8_104_i0_fu___float_adde8m23b_127nih_38397_38892),
    .in1(out_ui_rshift_expr_FU_8_0_8_122_i0_fu___float_adde8m23b_127nih_38397_38889),
    .in2(out_const_0));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_38397_38895 (.out1(out_UIconvert_expr_FU_9_i0_fu___float_adde8m23b_127nih_38397_38895),
    .in1(out_ui_ne_expr_FU_8_0_8_104_i0_fu___float_adde8m23b_127nih_38397_38892));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_38397_38898 (.out1(out_lshift_expr_FU_32_0_32_25_i0_fu___float_adde8m23b_127nih_38397_38898),
    .in1(out_UIconvert_expr_FU_9_i0_fu___float_adde8m23b_127nih_38397_38895),
    .in2(out_const_15));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(32)) fu___float_adde8m23b_127nih_38397_38901 (.out1(out_rshift_expr_FU_32_0_32_28_i0_fu___float_adde8m23b_127nih_38397_38901),
    .in1(out_lshift_expr_FU_32_0_32_25_i0_fu___float_adde8m23b_127nih_38397_38898),
    .in2(out_const_15));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_38397_38904 (.out1(out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_38397_38904),
    .in1(out_rshift_expr_FU_32_0_32_28_i0_fu___float_adde8m23b_127nih_38397_38901));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_38397_38907 (.out1(out_UUdata_converter_FU_11_i0_fu___float_adde8m23b_127nih_38397_38907),
    .in1(out_IUdata_converter_FU_10_i0_fu___float_adde8m23b_127nih_38397_38904));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(8),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_38397_38910 (.out1(out_ui_bit_ior_expr_FU_8_8_8_62_i0_fu___float_adde8m23b_127nih_38397_38910),
    .in1(out_UUdata_converter_FU_11_i0_fu___float_adde8m23b_127nih_38397_38907),
    .in2(out_ui_bit_and_expr_FU_8_0_8_45_i1_fu___float_adde8m23b_127nih_38397_38696));
  ui_bit_and_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_38397_38913 (.out1(out_ui_bit_and_expr_FU_8_0_8_46_i0_fu___float_adde8m23b_127nih_38397_38913),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_62_i0_fu___float_adde8m23b_127nih_38397_38910),
    .in2(out_const_22));
  UIconvert_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(6)) fu___float_adde8m23b_127nih_38397_38916 (.out1(out_UIconvert_expr_FU_12_i0_fu___float_adde8m23b_127nih_38397_38916),
    .in1(out_ui_bit_and_expr_FU_8_0_8_46_i0_fu___float_adde8m23b_127nih_38397_38913));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38923 (.out1(out_ui_lshift_expr_FU_0_64_64_78_i0_fu___float_adde8m23b_127nih_38397_38923),
    .in1(out_const_31),
    .in2(out_UIconvert_expr_FU_12_i0_fu___float_adde8m23b_127nih_38397_38916));
  ui_bit_not_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_38397_38926 (.out1(out_ui_bit_not_expr_FU_32_32_63_i1_fu___float_adde8m23b_127nih_38397_38926),
    .in1(out_ui_lshift_expr_FU_0_64_64_78_i0_fu___float_adde8m23b_127nih_38397_38923));
  ui_bit_and_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(24),
    .BITSIZE_out1(24)) fu___float_adde8m23b_127nih_38397_38929 (.out1(out_ui_bit_and_expr_FU_32_32_32_44_i4_fu___float_adde8m23b_127nih_38397_38929),
    .in1(out_ui_rshift_expr_FU_32_0_32_116_i0_fu___float_adde8m23b_127nih_38397_40534),
    .in2(out_ui_rshift_expr_FU_32_0_32_117_i0_fu___float_adde8m23b_127nih_38397_40538));
  ui_ne_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38934 (.out1(out_ui_ne_expr_FU_32_0_32_103_i0_fu___float_adde8m23b_127nih_38397_38934),
    .in1(out_ui_rshift_expr_FU_32_0_32_117_i1_fu___float_adde8m23b_127nih_38397_40546),
    .in2(out_const_0));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38939 (.out1(out_truth_not_expr_FU_1_1_32_i2_fu___float_adde8m23b_127nih_38397_38939),
    .in1(out_ui_ne_expr_FU_32_0_32_103_i0_fu___float_adde8m23b_127nih_38397_38934));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(6),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_38946 (.out1(out_ui_rshift_expr_FU_32_32_32_120_i0_fu___float_adde8m23b_127nih_38397_38946),
    .in1(out_ui_lshift_expr_FU_32_0_32_80_i1_fu___float_adde8m23b_127nih_38397_38722),
    .in2(out_UIconvert_expr_FU_12_i0_fu___float_adde8m23b_127nih_38397_38916));
  ui_bit_and_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(26),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_38397_38960 (.out1(out_ui_bit_and_expr_FU_32_0_32_42_i0_fu___float_adde8m23b_127nih_38397_38960),
    .in1(out_ui_rshift_expr_FU_32_32_32_120_i0_fu___float_adde8m23b_127nih_38397_38946),
    .in2(out_const_28));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_38397_38963 (.out1(out_ui_bit_xor_expr_FU_32_32_32_65_i0_fu___float_adde8m23b_127nih_38397_38963),
    .in1(out_ui_bit_and_expr_FU_32_0_32_42_i0_fu___float_adde8m23b_127nih_38397_38960),
    .in2(out_IUdata_converter_FU_6_i0_fu___float_adde8m23b_127nih_38397_38566));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_38397_38977 (.out1(out_ui_bit_and_expr_FU_32_0_32_43_i0_fu___float_adde8m23b_127nih_38397_38977),
    .in1(out_ui_bit_xor_expr_FU_32_32_32_65_i0_fu___float_adde8m23b_127nih_38397_38963),
    .in2(out_const_29));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(27),
    .OFFSET_PARAMETER(2)) fu___float_adde8m23b_127nih_38397_38980 (.out1(out_ui_bit_ior_concat_expr_FU_51_i0_fu___float_adde8m23b_127nih_38397_38980),
    .in1(out_ui_lshift_expr_FU_32_0_32_89_i0_fu___float_adde8m23b_127nih_38397_40562),
    .in2(out_ui_bit_and_expr_FU_8_0_8_50_i0_fu___float_adde8m23b_127nih_38397_40566),
    .in3(out_const_18));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38983 (.out1(out_ui_bit_and_expr_FU_1_1_1_40_i0_fu___float_adde8m23b_127nih_38397_38983),
    .in1(out_truth_not_expr_FU_1_1_32_i2_fu___float_adde8m23b_127nih_38397_38939),
    .in2(out_ui_bit_xor_expr_FU_1_1_1_64_i0_fu___float_adde8m23b_127nih_38397_38554));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_38986 (.out1(out_UUdata_converter_FU_13_i0_fu___float_adde8m23b_127nih_38397_38986),
    .in1(out_ui_bit_and_expr_FU_1_1_1_40_i0_fu___float_adde8m23b_127nih_38397_38983));
  ui_plus_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_38397_38989 (.out1(out_ui_plus_expr_FU_32_32_32_105_i0_fu___float_adde8m23b_127nih_38397_38989),
    .in1(out_ui_bit_ior_concat_expr_FU_51_i0_fu___float_adde8m23b_127nih_38397_38980),
    .in2(out_UUdata_converter_FU_13_i0_fu___float_adde8m23b_127nih_38397_38986));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_38397_38994 (.out1(out_ui_bit_and_expr_FU_32_0_32_43_i1_fu___float_adde8m23b_127nih_38397_38994),
    .in1(out_ui_plus_expr_FU_32_32_32_105_i0_fu___float_adde8m23b_127nih_38397_38989),
    .in2(out_const_29));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5),
    .BITSIZE_out1(16),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39032 (.out1(out_ui_rshift_expr_FU_32_0_32_108_i0_fu___float_adde8m23b_127nih_38397_39032),
    .in1(out_ui_bit_and_expr_FU_32_0_32_43_i1_fu___float_adde8m23b_127nih_38397_38994),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu___float_adde8m23b_127nih_38397_39035 (.out1(out_ui_bit_and_expr_FU_16_0_16_36_i0_fu___float_adde8m23b_127nih_38397_39035),
    .in1(out_ui_rshift_expr_FU_32_0_32_108_i0_fu___float_adde8m23b_127nih_38397_39032),
    .in2(out_const_26));
  ui_lshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(6),
    .BITSIZE_out1(27),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39051 (.out1(out_ui_lshift_expr_FU_32_0_32_81_i0_fu___float_adde8m23b_127nih_38397_39051),
    .in1(out_ui_bit_and_expr_FU_32_0_32_43_i1_fu___float_adde8m23b_127nih_38397_38994),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39062 (.out1(out_ui_rshift_expr_FU_32_0_32_109_i0_fu___float_adde8m23b_127nih_38397_39062),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i1_fu___float_adde8m23b_127nih_38397_40708),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_38397_39065 (.out1(out_ui_bit_and_expr_FU_8_0_8_47_i0_fu___float_adde8m23b_127nih_38397_39065),
    .in1(out_ui_rshift_expr_FU_32_0_32_109_i0_fu___float_adde8m23b_127nih_38397_39062),
    .in2(out_const_25));
  ui_lshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(5),
    .BITSIZE_out1(27),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39081 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i0_fu___float_adde8m23b_127nih_38397_39081),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i1_fu___float_adde8m23b_127nih_38397_40708),
    .in2(out_const_4));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39094 (.out1(out_ui_rshift_expr_FU_32_0_32_107_i2_fu___float_adde8m23b_127nih_38397_39094),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i2_fu___float_adde8m23b_127nih_38397_40712),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu___float_adde8m23b_127nih_38397_39097 (.out1(out_ui_bit_and_expr_FU_8_0_8_48_i0_fu___float_adde8m23b_127nih_38397_39097),
    .in1(out_ui_rshift_expr_FU_32_0_32_107_i2_fu___float_adde8m23b_127nih_38397_39094),
    .in2(out_const_21));
  ui_lshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(4),
    .BITSIZE_out1(27),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39127 (.out1(out_ui_lshift_expr_FU_32_0_32_83_i0_fu___float_adde8m23b_127nih_38397_39127),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i2_fu___float_adde8m23b_127nih_38397_40712),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39170 (.out1(out_ui_rshift_expr_FU_32_0_32_110_i0_fu___float_adde8m23b_127nih_38397_39170),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i3_fu___float_adde8m23b_127nih_38397_40718),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_38397_39173 (.out1(out_ui_bit_and_expr_FU_8_0_8_49_i0_fu___float_adde8m23b_127nih_38397_39173),
    .in1(out_ui_rshift_expr_FU_32_0_32_110_i0_fu___float_adde8m23b_127nih_38397_39170),
    .in2(out_const_20));
  ui_lshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3),
    .BITSIZE_out1(27),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39203 (.out1(out_ui_lshift_expr_FU_32_0_32_84_i0_fu___float_adde8m23b_127nih_38397_39203),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i3_fu___float_adde8m23b_127nih_38397_40718),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39248 (.out1(out_ui_rshift_expr_FU_32_0_32_111_i0_fu___float_adde8m23b_127nih_38397_39248),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i4_fu___float_adde8m23b_127nih_38397_40728),
    .in2(out_const_13));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39251 (.out1(out_ui_bit_and_expr_FU_1_0_1_38_i0_fu___float_adde8m23b_127nih_38397_39251),
    .in1(out_ui_rshift_expr_FU_32_0_32_111_i0_fu___float_adde8m23b_127nih_38397_39248),
    .in2(out_const_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39259 (.out1(out_ui_lshift_expr_FU_32_0_32_85_i0_fu___float_adde8m23b_127nih_38397_39259),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i4_fu___float_adde8m23b_127nih_38397_40728),
    .in2(out_const_1));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___float_adde8m23b_127nih_38397_39275 (.out1(out_ui_bit_ior_expr_FU_0_8_8_57_i0_fu___float_adde8m23b_127nih_38397_39275),
    .in1(out_ui_rshift_expr_FU_64_0_64_121_i0_fu___float_adde8m23b_127nih_38397_40792),
    .in2(out_ui_lshift_expr_FU_8_0_8_95_i1_fu___float_adde8m23b_127nih_38397_40783));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39309 (.out1(out_IUdata_converter_FU_19_i0_fu___float_adde8m23b_127nih_38397_39309),
    .in1(out_rshift_expr_FU_32_0_32_29_i1_fu___float_adde8m23b_127nih_38397_40765));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39312 (.out1(out_ui_lshift_expr_FU_8_0_8_93_i0_fu___float_adde8m23b_127nih_38397_39312),
    .in1(out_IUdata_converter_FU_19_i0_fu___float_adde8m23b_127nih_38397_39309),
    .in2(out_const_11));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39315 (.out1(out_IUdata_converter_FU_20_i0_fu___float_adde8m23b_127nih_38397_39315),
    .in1(out_rshift_expr_FU_32_0_32_29_i0_fu___float_adde8m23b_127nih_38397_40756));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39318 (.out1(out_ui_lshift_expr_FU_8_0_8_94_i0_fu___float_adde8m23b_127nih_38397_39318),
    .in1(out_IUdata_converter_FU_20_i0_fu___float_adde8m23b_127nih_38397_39315),
    .in2(out_const_3));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_38397_39321 (.out1(out_ui_bit_ior_expr_FU_0_8_8_58_i0_fu___float_adde8m23b_127nih_38397_39321),
    .in1(out_ui_lshift_expr_FU_8_0_8_93_i0_fu___float_adde8m23b_127nih_38397_39312),
    .in2(out_ui_lshift_expr_FU_8_0_8_94_i0_fu___float_adde8m23b_127nih_38397_39318));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(3),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_38397_39324 (.out1(out_ui_bit_ior_expr_FU_0_8_8_59_i0_fu___float_adde8m23b_127nih_38397_39324),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_58_i0_fu___float_adde8m23b_127nih_38397_39321),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_57_i0_fu___float_adde8m23b_127nih_38397_39275));
  ui_lt_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(5),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39401 (.out1(out_ui_lt_expr_FU_8_8_8_99_i0_fu___float_adde8m23b_127nih_38397_39401),
    .in1(out_ui_bit_and_expr_FU_8_0_8_45_i0_fu___float_adde8m23b_127nih_38397_38545),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_59_i0_fu___float_adde8m23b_127nih_38397_39324));
  ui_eq_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(5),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39451 (.out1(out_ui_eq_expr_FU_0_8_8_70_i0_fu___float_adde8m23b_127nih_38397_39451),
    .in1(out_const_22),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_59_i0_fu___float_adde8m23b_127nih_38397_39324));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39465 (.out1(out_ui_rshift_expr_FU_32_0_32_111_i1_fu___float_adde8m23b_127nih_38397_39465),
    .in1(out_ui_bit_and_expr_FU_32_0_32_43_i1_fu___float_adde8m23b_127nih_38397_38994),
    .in2(out_const_13));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39468 (.out1(out_ui_bit_and_expr_FU_1_0_1_39_i0_fu___float_adde8m23b_127nih_38397_39468),
    .in1(out_ui_rshift_expr_FU_32_0_32_111_i1_fu___float_adde8m23b_127nih_38397_39465),
    .in2(out_const_17));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39548 (.out1(out_ui_bit_ior_expr_FU_1_1_1_60_i0_fu___float_adde8m23b_127nih_38397_39548),
    .in1(out_ui_eq_expr_FU_0_8_8_70_i0_fu___float_adde8m23b_127nih_38397_39451),
    .in2(out_ui_lt_expr_FU_8_8_8_99_i0_fu___float_adde8m23b_127nih_38397_39401));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(6),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39560 (.out1(out_ui_lshift_expr_FU_32_0_32_79_i2_fu___float_adde8m23b_127nih_38397_39560),
    .in1(out_ui_bit_and_expr_FU_8_0_8_45_i2_fu___float_adde8m23b_127nih_38397_39563),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_38397_39563 (.out1(out_ui_bit_and_expr_FU_8_0_8_45_i2_fu___float_adde8m23b_127nih_38397_39563),
    .in1(out_ui_ternary_pm_expr_FU_8_0_8_8_124_i0_fu___float_adde8m23b_127nih_38397_39566),
    .in2(out_const_25));
  ui_ternary_pm_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_in3(5),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_38397_39566 (.out1(out_ui_ternary_pm_expr_FU_8_0_8_8_124_i0_fu___float_adde8m23b_127nih_38397_39566),
    .in1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_38397_40818),
    .in2(out_const_17),
    .in3(out_ASSIGN_UNSIGNED_FU_22_i0_fu___float_adde8m23b_127nih_38397_40820));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39571 (.out1(out_ui_rshift_expr_FU_32_0_32_112_i0_fu___float_adde8m23b_127nih_38397_39571),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i5_fu___float_adde8m23b_127nih_38397_40736),
    .in2(out_const_11));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_38397_39574 (.out1(out_ui_bit_and_expr_FU_32_0_32_41_i1_fu___float_adde8m23b_127nih_38397_39574),
    .in1(out_ui_rshift_expr_FU_32_0_32_112_i0_fu___float_adde8m23b_127nih_38397_39571),
    .in2(out_const_27));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_38397_39579 (.out1(out_ui_bit_ior_expr_FU_0_32_32_54_i0_fu___float_adde8m23b_127nih_38397_39579),
    .in1(out_ui_bit_and_expr_FU_32_0_32_41_i1_fu___float_adde8m23b_127nih_38397_39574),
    .in2(out_ui_lshift_expr_FU_32_0_32_90_i0_fu___float_adde8m23b_127nih_38397_40800));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39586 (.out1(out_ui_rshift_expr_FU_32_0_32_113_i0_fu___float_adde8m23b_127nih_38397_39586),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i5_fu___float_adde8m23b_127nih_38397_40736),
    .in2(out_const_11));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39589 (.out1(out_ui_rshift_expr_FU_32_0_32_114_i0_fu___float_adde8m23b_127nih_38397_39589),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i5_fu___float_adde8m23b_127nih_38397_40736),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39592 (.out1(out_ui_rshift_expr_FU_32_0_32_115_i0_fu___float_adde8m23b_127nih_38397_39592),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i5_fu___float_adde8m23b_127nih_38397_40736),
    .in2(out_const_1));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39595 (.out1(out_ui_bit_ior_expr_FU_1_1_1_60_i1_fu___float_adde8m23b_127nih_38397_39595),
    .in1(out_ui_rshift_expr_FU_32_0_32_115_i0_fu___float_adde8m23b_127nih_38397_39592),
    .in2(out_ui_rshift_expr_FU_32_0_32_113_i0_fu___float_adde8m23b_127nih_38397_39586));
  ui_bit_and_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39598 (.out1(out_ui_bit_and_expr_FU_1_0_1_39_i1_fu___float_adde8m23b_127nih_38397_39598),
    .in1(out_ui_cond_expr_FU_32_32_32_32_67_i5_fu___float_adde8m23b_127nih_38397_40736),
    .in2(out_const_17));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39601 (.out1(out_UUdata_converter_FU_14_i0_fu___float_adde8m23b_127nih_38397_39601),
    .in1(out_ui_ne_expr_FU_32_0_32_103_i0_fu___float_adde8m23b_127nih_38397_38934));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39604 (.out1(out_ui_bit_ior_expr_FU_1_1_1_60_i2_fu___float_adde8m23b_127nih_38397_39604),
    .in1(out_ui_bit_and_expr_FU_1_0_1_39_i1_fu___float_adde8m23b_127nih_38397_39598),
    .in2(out_UUdata_converter_FU_14_i0_fu___float_adde8m23b_127nih_38397_39601));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39607 (.out1(out_ui_bit_ior_expr_FU_1_1_1_60_i3_fu___float_adde8m23b_127nih_38397_39607),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_60_i1_fu___float_adde8m23b_127nih_38397_39595),
    .in2(out_ui_bit_ior_expr_FU_1_1_1_60_i2_fu___float_adde8m23b_127nih_38397_39604));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39610 (.out1(out_ui_bit_and_expr_FU_1_0_1_38_i1_fu___float_adde8m23b_127nih_38397_39610),
    .in1(out_ui_rshift_expr_FU_32_0_32_114_i0_fu___float_adde8m23b_127nih_38397_39589),
    .in2(out_const_17));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39613 (.out1(out_ui_bit_and_expr_FU_1_1_1_40_i1_fu___float_adde8m23b_127nih_38397_39613),
    .in1(out_ui_bit_and_expr_FU_1_0_1_38_i1_fu___float_adde8m23b_127nih_38397_39610),
    .in2(out_ui_bit_ior_expr_FU_1_1_1_60_i3_fu___float_adde8m23b_127nih_38397_39607));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_adde8m23b_127nih_38397_39616 (.out1(out_ui_plus_expr_FU_32_32_32_105_i1_fu___float_adde8m23b_127nih_38397_39616),
    .in1(out_ui_bit_and_expr_FU_1_1_1_40_i1_fu___float_adde8m23b_127nih_38397_39613),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_54_i0_fu___float_adde8m23b_127nih_38397_39579));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39623 (.out1(out_ui_bit_ior_expr_FU_1_1_1_60_i4_fu___float_adde8m23b_127nih_38397_39623),
    .in1(out_ui_eq_expr_FU_0_8_8_69_i1_fu___float_adde8m23b_127nih_38397_38643),
    .in2(out_ui_eq_expr_FU_0_8_8_69_i0_fu___float_adde8m23b_127nih_38397_38638));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39628 (.out1(out_ui_rshift_expr_FU_32_0_32_107_i3_fu___float_adde8m23b_127nih_38397_39628),
    .in1(out_ui_plus_expr_FU_32_32_32_105_i1_fu___float_adde8m23b_127nih_38397_39616),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_38397_39631 (.out1(out_ui_bit_and_expr_FU_8_0_8_45_i3_fu___float_adde8m23b_127nih_38397_39631),
    .in1(out_ui_rshift_expr_FU_32_0_32_107_i3_fu___float_adde8m23b_127nih_38397_39628),
    .in2(out_const_25));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39636 (.out1(out_truth_not_expr_FU_1_1_32_i3_fu___float_adde8m23b_127nih_38397_39636),
    .in1(out_ui_eq_expr_FU_0_8_8_69_i0_fu___float_adde8m23b_127nih_38397_38638));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39641 (.out1(out_truth_not_expr_FU_1_1_32_i4_fu___float_adde8m23b_127nih_38397_39641),
    .in1(out_ui_cond_expr_FU_1_1_1_1_66_i0_fu___float_adde8m23b_127nih_38397_40700));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_38397_39646 (.out1(out_ui_bit_and_expr_FU_32_0_32_41_i2_fu___float_adde8m23b_127nih_38397_39646),
    .in1(out_ui_plus_expr_FU_32_32_32_105_i1_fu___float_adde8m23b_127nih_38397_39616),
    .in2(out_const_27));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39686 (.out1(out_ui_lshift_expr_FU_32_0_32_86_i0_fu___float_adde8m23b_127nih_38397_39686),
    .in1(out_UUdata_converter_FU_23_i0_fu___float_adde8m23b_127nih_38397_39689),
    .in2(out_const_15));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39689 (.out1(out_UUdata_converter_FU_23_i0_fu___float_adde8m23b_127nih_38397_39689),
    .in1(out_ui_le_expr_FU_1_1_1_77_i0_fu___float_adde8m23b_127nih_38397_39692));
  ui_le_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39692 (.out1(out_ui_le_expr_FU_1_1_1_77_i0_fu___float_adde8m23b_127nih_38397_39692),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_60_i0_fu___float_adde8m23b_127nih_38397_39548),
    .in2(out_truth_not_expr_FU_1_1_32_i5_fu___float_adde8m23b_127nih_38397_39695));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39695 (.out1(out_truth_not_expr_FU_1_1_32_i5_fu___float_adde8m23b_127nih_38397_39695),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_64_i0_fu___float_adde8m23b_127nih_38397_38554));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39697 (.out1(out_ui_bit_and_expr_FU_1_1_1_40_i2_fu___float_adde8m23b_127nih_38397_39697),
    .in1(out_ui_eq_expr_FU_0_8_8_69_i1_fu___float_adde8m23b_127nih_38397_38643),
    .in2(out_ui_ne_expr_FU_32_0_32_102_i1_fu___float_adde8m23b_127nih_38397_38633));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39700 (.out1(out_ui_bit_and_expr_FU_1_1_1_40_i3_fu___float_adde8m23b_127nih_38397_39700),
    .in1(out_ui_eq_expr_FU_0_8_8_69_i0_fu___float_adde8m23b_127nih_38397_38638),
    .in2(out_ui_ne_expr_FU_32_0_32_102_i0_fu___float_adde8m23b_127nih_38397_38628));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39703 (.out1(out_ui_bit_ior_expr_FU_1_1_1_60_i5_fu___float_adde8m23b_127nih_38397_39703),
    .in1(out_ui_bit_and_expr_FU_1_1_1_40_i2_fu___float_adde8m23b_127nih_38397_39697),
    .in2(out_ui_bit_and_expr_FU_1_1_1_40_i3_fu___float_adde8m23b_127nih_38397_39700));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39710 (.out1(out_ui_bit_and_expr_FU_1_1_1_40_i4_fu___float_adde8m23b_127nih_38397_39710),
    .in1(out_ui_eq_expr_FU_0_8_8_69_i0_fu___float_adde8m23b_127nih_38397_38638),
    .in2(out_ui_bit_xor_expr_FU_1_1_1_64_i0_fu___float_adde8m23b_127nih_38397_38554));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39713 (.out1(out_ui_bit_and_expr_FU_1_1_1_40_i5_fu___float_adde8m23b_127nih_38397_39713),
    .in1(out_ui_bit_and_expr_FU_1_1_1_40_i4_fu___float_adde8m23b_127nih_38397_39710),
    .in2(out_ui_eq_expr_FU_0_8_8_69_i1_fu___float_adde8m23b_127nih_38397_38643));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39716 (.out1(out_UUdata_converter_FU_15_i0_fu___float_adde8m23b_127nih_38397_39716),
    .in1(out_ui_bit_and_expr_FU_1_1_1_40_i5_fu___float_adde8m23b_127nih_38397_39713));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39724 (.out1(out_ui_lshift_expr_FU_32_0_32_87_i0_fu___float_adde8m23b_127nih_38397_39724),
    .in1(out_ui_cond_expr_FU_1_1_1_1_66_i1_fu___float_adde8m23b_127nih_38397_40706),
    .in2(out_const_9));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_38397_39727 (.out1(out_ui_bit_ior_expr_FU_32_32_32_61_i2_fu___float_adde8m23b_127nih_38397_39727),
    .in1(out_ui_lshift_expr_FU_32_0_32_87_i0_fu___float_adde8m23b_127nih_38397_39724),
    .in2(out_ui_cond_expr_FU_32_32_32_32_67_i0_fu___float_adde8m23b_127nih_38397_40704));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(6),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_39750 (.out1(out_ui_lshift_expr_FU_32_0_32_79_i3_fu___float_adde8m23b_127nih_38397_39750),
    .in1(out_ui_cond_expr_FU_8_8_8_8_68_i0_fu___float_adde8m23b_127nih_38397_40702),
    .in2(out_const_10));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_38397_39753 (.out1(out_ui_bit_ior_expr_FU_0_32_32_55_i0_fu___float_adde8m23b_127nih_38397_39753),
    .in1(out_ui_lshift_expr_FU_32_0_32_91_i0_fu___float_adde8m23b_127nih_38397_40807),
    .in2(out_ui_bit_ior_expr_FU_32_32_32_61_i2_fu___float_adde8m23b_127nih_38397_39727));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(32)) fu___float_adde8m23b_127nih_38397_39756 (.out1(out_ui_bit_ior_expr_FU_0_32_32_56_i0_fu___float_adde8m23b_127nih_38397_39756),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_55_i0_fu___float_adde8m23b_127nih_38397_39753),
    .in2(out_ui_lshift_expr_FU_32_0_32_79_i3_fu___float_adde8m23b_127nih_38397_39750));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39922 (.out1(out_ui_eq_expr_FU_16_0_16_71_i0_fu___float_adde8m23b_127nih_38397_39922),
    .in1(out_ui_bit_and_expr_FU_16_0_16_36_i0_fu___float_adde8m23b_127nih_38397_39035),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39926 (.out1(out_ui_eq_expr_FU_8_0_8_74_i0_fu___float_adde8m23b_127nih_38397_39926),
    .in1(out_ui_bit_and_expr_FU_8_0_8_47_i0_fu___float_adde8m23b_127nih_38397_39065),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39930 (.out1(out_ui_eq_expr_FU_8_0_8_74_i1_fu___float_adde8m23b_127nih_38397_39930),
    .in1(out_ui_bit_and_expr_FU_8_0_8_48_i0_fu___float_adde8m23b_127nih_38397_39097),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39934 (.out1(out_ui_eq_expr_FU_8_0_8_74_i2_fu___float_adde8m23b_127nih_38397_39934),
    .in1(out_ui_bit_and_expr_FU_8_0_8_49_i0_fu___float_adde8m23b_127nih_38397_39173),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39938 (.out1(out_ui_eq_expr_FU_1_0_1_72_i0_fu___float_adde8m23b_127nih_38397_39938),
    .in1(out_ui_bit_and_expr_FU_1_0_1_38_i0_fu___float_adde8m23b_127nih_38397_39251),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39964 (.out1(out_ui_eq_expr_FU_8_0_8_75_i0_fu___float_adde8m23b_127nih_38397_39964),
    .in1(out_ui_bit_and_expr_FU_8_0_8_45_i0_fu___float_adde8m23b_127nih_38397_38545),
    .in2(out_const_24));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39966 (.out1(out_ui_ne_expr_FU_1_0_1_101_i2_fu___float_adde8m23b_127nih_38397_39966),
    .in1(out_ui_bit_and_expr_FU_1_0_1_39_i0_fu___float_adde8m23b_127nih_38397_39468),
    .in2(out_const_0));
  ui_gt_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39984 (.out1(out_ui_gt_expr_FU_1_1_1_76_i0_fu___float_adde8m23b_127nih_38397_39984),
    .in1(out_truth_not_expr_FU_1_1_32_i3_fu___float_adde8m23b_127nih_38397_39636),
    .in2(out_ui_bit_ior_expr_FU_1_1_1_60_i0_fu___float_adde8m23b_127nih_38397_39548));
  ui_lt_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_39986 (.out1(out_ui_lt_expr_FU_1_1_1_97_i0_fu___float_adde8m23b_127nih_38397_39986),
    .in1(out_ui_eq_expr_FU_0_8_8_69_i1_fu___float_adde8m23b_127nih_38397_38643),
    .in2(out_truth_not_expr_FU_1_1_32_i4_fu___float_adde8m23b_127nih_38397_39641));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40534 (.out1(out_ui_rshift_expr_FU_32_0_32_116_i0_fu___float_adde8m23b_127nih_38397_40534),
    .in1(out_ui_bit_not_expr_FU_32_32_63_i1_fu___float_adde8m23b_127nih_38397_38926),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40538 (.out1(out_ui_rshift_expr_FU_32_0_32_117_i0_fu___float_adde8m23b_127nih_38397_40538),
    .in1(out_ui_lshift_expr_FU_32_0_32_80_i1_fu___float_adde8m23b_127nih_38397_38722),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(26),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40543 (.out1(out_ui_lshift_expr_FU_32_0_32_88_i0_fu___float_adde8m23b_127nih_38397_40543),
    .in1(out_ui_bit_and_expr_FU_32_32_32_44_i4_fu___float_adde8m23b_127nih_38397_38929),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40546 (.out1(out_ui_rshift_expr_FU_32_0_32_117_i1_fu___float_adde8m23b_127nih_38397_40546),
    .in1(out_ui_lshift_expr_FU_32_0_32_88_i0_fu___float_adde8m23b_127nih_38397_40543),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_out1(25),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40553 (.out1(out_ui_rshift_expr_FU_32_0_32_116_i1_fu___float_adde8m23b_127nih_38397_40553),
    .in1(out_ui_bit_and_expr_FU_32_0_32_43_i0_fu___float_adde8m23b_127nih_38397_38977),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40557 (.out1(out_ui_rshift_expr_FU_32_0_32_116_i2_fu___float_adde8m23b_127nih_38397_40557),
    .in1(out_ui_lshift_expr_FU_32_0_32_80_i0_fu___float_adde8m23b_127nih_38397_38708),
    .in2(out_const_18));
  ui_plus_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_in2(24),
    .BITSIZE_out1(25)) fu___float_adde8m23b_127nih_38397_40559 (.out1(out_ui_plus_expr_FU_32_32_32_105_i2_fu___float_adde8m23b_127nih_38397_40559),
    .in1(out_ui_rshift_expr_FU_32_0_32_116_i1_fu___float_adde8m23b_127nih_38397_40553),
    .in2(out_ui_rshift_expr_FU_32_0_32_116_i2_fu___float_adde8m23b_127nih_38397_40557));
  ui_lshift_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_in2(2),
    .BITSIZE_out1(27),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40562 (.out1(out_ui_lshift_expr_FU_32_0_32_89_i0_fu___float_adde8m23b_127nih_38397_40562),
    .in1(out_ui_plus_expr_FU_32_32_32_105_i2_fu___float_adde8m23b_127nih_38397_40559),
    .in2(out_const_18));
  ui_bit_and_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_38397_40566 (.out1(out_ui_bit_and_expr_FU_8_0_8_50_i0_fu___float_adde8m23b_127nih_38397_40566),
    .in1(out_ui_bit_and_expr_FU_32_0_32_43_i0_fu___float_adde8m23b_127nih_38397_38977),
    .in2(out_const_20));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_40667 (.out1(out_truth_and_expr_FU_1_1_1_31_i0_fu___float_adde8m23b_127nih_38397_40667),
    .in1(out_ui_gt_expr_FU_1_1_1_76_i0_fu___float_adde8m23b_127nih_38397_39984),
    .in2(out_ui_lt_expr_FU_1_1_1_97_i0_fu___float_adde8m23b_127nih_38397_39986));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_40700 (.out1(out_ui_cond_expr_FU_1_1_1_1_66_i0_fu___float_adde8m23b_127nih_38397_40700),
    .in1(out_ui_eq_expr_FU_8_0_8_75_i0_fu___float_adde8m23b_127nih_38397_39964),
    .in2(out_ui_ne_expr_FU_1_0_1_101_i2_fu___float_adde8m23b_127nih_38397_39966),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(8),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_38397_40702 (.out1(out_ui_cond_expr_FU_8_8_8_8_68_i0_fu___float_adde8m23b_127nih_38397_40702),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_60_i4_fu___float_adde8m23b_127nih_38397_39623),
    .in2(out_const_25),
    .in3(out_ui_bit_and_expr_FU_8_0_8_45_i3_fu___float_adde8m23b_127nih_38397_39631));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(23),
    .BITSIZE_in3(1),
    .BITSIZE_out1(23)) fu___float_adde8m23b_127nih_38397_40704 (.out1(out_ui_cond_expr_FU_32_32_32_32_67_i0_fu___float_adde8m23b_127nih_38397_40704),
    .in1(out_truth_and_expr_FU_1_1_1_31_i0_fu___float_adde8m23b_127nih_38397_40667),
    .in2(out_ui_bit_and_expr_FU_32_0_32_41_i2_fu___float_adde8m23b_127nih_38397_39646),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_40706 (.out1(out_ui_cond_expr_FU_1_1_1_1_66_i1_fu___float_adde8m23b_127nih_38397_40706),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_60_i5_fu___float_adde8m23b_127nih_38397_39703),
    .in2(out_const_17),
    .in3(out_UUdata_converter_FU_15_i0_fu___float_adde8m23b_127nih_38397_39716));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(27),
    .BITSIZE_in3(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_38397_40708 (.out1(out_ui_cond_expr_FU_32_32_32_32_67_i1_fu___float_adde8m23b_127nih_38397_40708),
    .in1(out_ui_eq_expr_FU_16_0_16_71_i0_fu___float_adde8m23b_127nih_38397_39922),
    .in2(out_ui_lshift_expr_FU_32_0_32_81_i0_fu___float_adde8m23b_127nih_38397_39051),
    .in3(out_ui_bit_and_expr_FU_32_0_32_43_i1_fu___float_adde8m23b_127nih_38397_38994));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(27),
    .BITSIZE_in3(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_38397_40712 (.out1(out_ui_cond_expr_FU_32_32_32_32_67_i2_fu___float_adde8m23b_127nih_38397_40712),
    .in1(out_ui_eq_expr_FU_8_0_8_74_i0_fu___float_adde8m23b_127nih_38397_39926),
    .in2(out_ui_lshift_expr_FU_32_0_32_82_i0_fu___float_adde8m23b_127nih_38397_39081),
    .in3(out_ui_cond_expr_FU_32_32_32_32_67_i1_fu___float_adde8m23b_127nih_38397_40708));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(27),
    .BITSIZE_in3(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_38397_40718 (.out1(out_ui_cond_expr_FU_32_32_32_32_67_i3_fu___float_adde8m23b_127nih_38397_40718),
    .in1(out_ui_eq_expr_FU_8_0_8_74_i1_fu___float_adde8m23b_127nih_38397_39930),
    .in2(out_ui_lshift_expr_FU_32_0_32_83_i0_fu___float_adde8m23b_127nih_38397_39127),
    .in3(out_ui_cond_expr_FU_32_32_32_32_67_i2_fu___float_adde8m23b_127nih_38397_40712));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_38397_40726 (.out1(out_ui_cond_expr_FU_8_8_8_8_68_i1_fu___float_adde8m23b_127nih_38397_40726),
    .in1(out_ui_eq_expr_FU_8_0_8_74_i1_fu___float_adde8m23b_127nih_38397_39930),
    .in2(out_const_20),
    .in3(out_const_17));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(27),
    .BITSIZE_in3(27),
    .BITSIZE_out1(27)) fu___float_adde8m23b_127nih_38397_40728 (.out1(out_ui_cond_expr_FU_32_32_32_32_67_i4_fu___float_adde8m23b_127nih_38397_40728),
    .in1(out_ui_eq_expr_FU_8_0_8_74_i2_fu___float_adde8m23b_127nih_38397_39934),
    .in2(out_ui_lshift_expr_FU_32_0_32_84_i0_fu___float_adde8m23b_127nih_38397_39203),
    .in3(out_ui_cond_expr_FU_32_32_32_32_67_i3_fu___float_adde8m23b_127nih_38397_40718));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_38397_40734 (.out1(out_ui_cond_expr_FU_8_8_8_8_68_i2_fu___float_adde8m23b_127nih_38397_40734),
    .in1(out_ui_eq_expr_FU_8_0_8_74_i2_fu___float_adde8m23b_127nih_38397_39934),
    .in2(out_ui_rshift_expr_FU_8_0_8_123_i0_fu___float_adde8m23b_127nih_38397_40776),
    .in3(out_ui_rshift_expr_FU_8_0_8_123_i1_fu___float_adde8m23b_127nih_38397_40779));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(26),
    .BITSIZE_in3(27),
    .BITSIZE_out1(26)) fu___float_adde8m23b_127nih_38397_40736 (.out1(out_ui_cond_expr_FU_32_32_32_32_67_i5_fu___float_adde8m23b_127nih_38397_40736),
    .in1(out_ui_eq_expr_FU_1_0_1_72_i0_fu___float_adde8m23b_127nih_38397_39938),
    .in2(out_ui_lshift_expr_FU_32_0_32_85_i0_fu___float_adde8m23b_127nih_38397_39259),
    .in3(out_ui_cond_expr_FU_32_32_32_32_67_i4_fu___float_adde8m23b_127nih_38397_40728));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_38397_40744 (.out1(out_ui_cond_expr_FU_8_8_8_8_68_i3_fu___float_adde8m23b_127nih_38397_40744),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_60_i0_fu___float_adde8m23b_127nih_38397_39548),
    .in2(out_const_0),
    .in3(out_ui_rshift_expr_FU_32_0_32_118_i0_fu___float_adde8m23b_127nih_38397_40796));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_40746 (.out1(out_ui_cond_expr_FU_1_1_1_1_66_i2_fu___float_adde8m23b_127nih_38397_40746),
    .in1(out_ui_ne_expr_FU_1_0_1_101_i0_fu___float_adde8m23b_127nih_38397_38522),
    .in2(out_ui_rshift_expr_FU_32_0_32_119_i0_fu___float_adde8m23b_127nih_38397_40803),
    .in3(out_const_0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_38397_40749 (.out1(out_UIdata_converter_FU_16_i0_fu___float_adde8m23b_127nih_38397_40749),
    .in1(out_ui_eq_expr_FU_16_0_16_71_i0_fu___float_adde8m23b_127nih_38397_39922));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_38397_40753 (.out1(out_lshift_expr_FU_32_0_32_26_i0_fu___float_adde8m23b_127nih_38397_40753),
    .in1(out_UIdata_converter_FU_16_i0_fu___float_adde8m23b_127nih_38397_40749),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_38397_40756 (.out1(out_rshift_expr_FU_32_0_32_29_i0_fu___float_adde8m23b_127nih_38397_40756),
    .in1(out_lshift_expr_FU_32_0_32_26_i0_fu___float_adde8m23b_127nih_38397_40753),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde8m23b_127nih_38397_40759 (.out1(out_UIdata_converter_FU_17_i0_fu___float_adde8m23b_127nih_38397_40759),
    .in1(out_ui_eq_expr_FU_8_0_8_74_i0_fu___float_adde8m23b_127nih_38397_39926));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde8m23b_127nih_38397_40762 (.out1(out_lshift_expr_FU_32_0_32_26_i1_fu___float_adde8m23b_127nih_38397_40762),
    .in1(out_UIdata_converter_FU_17_i0_fu___float_adde8m23b_127nih_38397_40759),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde8m23b_127nih_38397_40765 (.out1(out_rshift_expr_FU_32_0_32_29_i1_fu___float_adde8m23b_127nih_38397_40765),
    .in1(out_lshift_expr_FU_32_0_32_26_i1_fu___float_adde8m23b_127nih_38397_40762),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40769 (.out1(out_ui_lshift_expr_FU_8_0_8_95_i0_fu___float_adde8m23b_127nih_38397_40769),
    .in1(out_ui_cond_expr_FU_8_8_8_8_68_i1_fu___float_adde8m23b_127nih_38397_40726),
    .in2(out_const_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40773 (.out1(out_ui_lshift_expr_FU_8_0_8_96_i0_fu___float_adde8m23b_127nih_38397_40773),
    .in1(out_ui_rshift_expr_FU_64_0_64_121_i1_fu___float_adde8m23b_127nih_38397_40816),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40776 (.out1(out_ui_rshift_expr_FU_8_0_8_123_i0_fu___float_adde8m23b_127nih_38397_40776),
    .in1(out_ui_lshift_expr_FU_8_0_8_95_i0_fu___float_adde8m23b_127nih_38397_40769),
    .in2(out_const_17));
  ui_rshift_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40779 (.out1(out_ui_rshift_expr_FU_8_0_8_123_i1_fu___float_adde8m23b_127nih_38397_40779),
    .in1(out_ui_lshift_expr_FU_8_0_8_96_i0_fu___float_adde8m23b_127nih_38397_40773),
    .in2(out_const_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40783 (.out1(out_ui_lshift_expr_FU_8_0_8_95_i1_fu___float_adde8m23b_127nih_38397_40783),
    .in1(out_ui_cond_expr_FU_8_8_8_8_68_i2_fu___float_adde8m23b_127nih_38397_40734),
    .in2(out_const_17));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_40786 (.out1(out_UUdata_converter_FU_21_i0_fu___float_adde8m23b_127nih_38397_40786),
    .in1(out_ui_eq_expr_FU_1_0_1_72_i0_fu___float_adde8m23b_127nih_38397_39938));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40789 (.out1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_adde8m23b_127nih_38397_40789),
    .in1(out_UUdata_converter_FU_21_i0_fu___float_adde8m23b_127nih_38397_40786),
    .in2(out_const_23));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40792 (.out1(out_ui_rshift_expr_FU_64_0_64_121_i0_fu___float_adde8m23b_127nih_38397_40792),
    .in1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_adde8m23b_127nih_38397_40789),
    .in2(out_const_23));
  ui_rshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40796 (.out1(out_ui_rshift_expr_FU_32_0_32_118_i0_fu___float_adde8m23b_127nih_38397_40796),
    .in1(out_ui_lshift_expr_FU_32_0_32_79_i2_fu___float_adde8m23b_127nih_38397_39560),
    .in2(out_const_19));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(5),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40800 (.out1(out_ui_lshift_expr_FU_32_0_32_90_i0_fu___float_adde8m23b_127nih_38397_40800),
    .in1(out_ui_cond_expr_FU_8_8_8_8_68_i3_fu___float_adde8m23b_127nih_38397_40744),
    .in2(out_const_19));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40803 (.out1(out_ui_rshift_expr_FU_32_0_32_119_i0_fu___float_adde8m23b_127nih_38397_40803),
    .in1(out_ui_lshift_expr_FU_32_0_32_86_i0_fu___float_adde8m23b_127nih_38397_39686),
    .in2(out_const_22));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40807 (.out1(out_ui_lshift_expr_FU_32_0_32_91_i0_fu___float_adde8m23b_127nih_38397_40807),
    .in1(out_ui_cond_expr_FU_1_1_1_1_66_i2_fu___float_adde8m23b_127nih_38397_40746),
    .in2(out_const_22));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde8m23b_127nih_38397_40810 (.out1(out_UUdata_converter_FU_18_i0_fu___float_adde8m23b_127nih_38397_40810),
    .in1(out_ui_eq_expr_FU_8_0_8_74_i1_fu___float_adde8m23b_127nih_38397_39930));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40813 (.out1(out_ui_lshift_expr_FU_64_0_64_92_i1_fu___float_adde8m23b_127nih_38397_40813),
    .in1(out_UUdata_converter_FU_18_i0_fu___float_adde8m23b_127nih_38397_40810),
    .in2(out_const_23));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde8m23b_127nih_38397_40816 (.out1(out_ui_rshift_expr_FU_64_0_64_121_i1_fu___float_adde8m23b_127nih_38397_40816),
    .in1(out_ui_lshift_expr_FU_64_0_64_92_i1_fu___float_adde8m23b_127nih_38397_40813),
    .in2(out_const_23));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_adde8m23b_127nih_38397_40818 (.out1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde8m23b_127nih_38397_40818),
    .in1(out_ui_bit_and_expr_FU_8_0_8_45_i0_fu___float_adde8m23b_127nih_38397_38545));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(5)) fu___float_adde8m23b_127nih_38397_40820 (.out1(out_ASSIGN_UNSIGNED_FU_22_i0_fu___float_adde8m23b_127nih_38397_40820),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_59_i0_fu___float_adde8m23b_127nih_38397_39324));
  // io-signal post fix
  assign return_port = out_conv_out_ui_bit_ior_expr_FU_0_32_32_56_i0_fu___float_adde8m23b_127nih_38397_39756_32_64;

endmodule

// FSM based controller description for __float_adde8m23b_127nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___float_adde8m23b_127nih(done_port,
  clock,
  reset,
  start_port);
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  parameter [0:0] S_0 = 1'd0;
  reg [0:0] _present_state=S_0, _next_state;
  reg done_port;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          _next_state = S_0;
          done_port = 1'b1;
        end
        else
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

// Top component for __float_adde8m23b_127nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __float_adde8m23b_127nih(clock,
  reset,
  start_port,
  done_port,
  a,
  b,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [63:0] a;
  input [63:0] b;
  // OUT
  output done_port;
  output [63:0] return_port;
  // Component and signal declarations
  
  controller___float_adde8m23b_127nih Controller_i (.done_port(done_port),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___float_adde8m23b_127nih Datapath_i (.return_port(return_port),
    .clock(clock),
    .reset(reset),
    .in_port_a(a),
    .in_port_b(b));

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UUconvert_expr_FU(in1,
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
module IIconvert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
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
// Copyright (C) 2020-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_extract_bit_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output out1;
  assign out1 = (in1 >> in2)&1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bit_and_expr_FU(in1,
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
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bit_ior_expr_FU(in1,
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
  assign out1 = in1 | in2;
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
module ui_mult_expr_FU(clock,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PIPE_PARAMETER=0;
  // IN
  input clock;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
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
      reg [BITSIZE_in1-1:0] in1_in;
      reg [BITSIZE_in2-1:0] in2_in;
      wire [BITSIZE_out1-1:0] mult_res;
      reg [BITSIZE_out1-1:0] mul [PIPE_PARAMETER-2:0];
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
module ui_ternary_plus_expr_FU(in1,
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
  assign out1 = in1 + in2 + in3;
endmodule

// Datapath RTL description for __float_mule8m23b_127nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___float_mule8m23b_127nih(clock,
  reset,
  in_port_a,
  in_port_b,
  return_port);
  // IN
  input clock;
  input reset;
  input [63:0] in_port_a;
  input [63:0] in_port_b;
  // OUT
  output [63:0] return_port;
  // Component and signal declarations
  wire [7:0] out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_37254_40952;
  wire [7:0] out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_37254_40954;
  wire signed [2:0] out_IIconvert_expr_FU_16_i0_fu___float_mule8m23b_127nih_37254_37593;
  wire signed [2:0] out_IIconvert_expr_FU_20_i0_fu___float_mule8m23b_127nih_37254_37634;
  wire signed [2:0] out_IIconvert_expr_FU_9_i0_fu___float_mule8m23b_127nih_37254_37495;
  wire [0:0] out_IUdata_converter_FU_11_i0_fu___float_mule8m23b_127nih_37254_37504;
  wire [0:0] out_IUdata_converter_FU_18_i0_fu___float_mule8m23b_127nih_37254_37602;
  wire [1:0] out_IUdata_converter_FU_25_i0_fu___float_mule8m23b_127nih_37254_37709;
  wire [1:0] out_IUdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_37254_38252;
  wire signed [1:0] out_UIconvert_expr_FU_10_i0_fu___float_mule8m23b_127nih_37254_37498;
  wire signed [1:0] out_UIconvert_expr_FU_15_i0_fu___float_mule8m23b_127nih_37254_37587;
  wire signed [1:0] out_UIconvert_expr_FU_17_i0_fu___float_mule8m23b_127nih_37254_37596;
  wire signed [1:0] out_UIconvert_expr_FU_37_i0_fu___float_mule8m23b_127nih_37254_38246;
  wire signed [1:0] out_UIconvert_expr_FU_8_i0_fu___float_mule8m23b_127nih_37254_37489;
  wire signed [1:0] out_UIdata_converter_FU_12_i0_fu___float_mule8m23b_127nih_37254_37640;
  wire signed [1:0] out_UIdata_converter_FU_19_i0_fu___float_mule8m23b_127nih_37254_37628;
  wire signed [1:0] out_UIdata_converter_FU_21_i0_fu___float_mule8m23b_127nih_37254_37646;
  wire signed [2:0] out_UIdata_converter_FU_22_i0_fu___float_mule8m23b_127nih_37254_37652;
  wire signed [1:0] out_UIdata_converter_FU_23_i0_fu___float_mule8m23b_127nih_37254_37682;
  wire signed [1:0] out_UIdata_converter_FU_24_i0_fu___float_mule8m23b_127nih_37254_37700;
  wire signed [1:0] out_UIdata_converter_FU_28_i0_fu___float_mule8m23b_127nih_37254_38021;
  wire [7:0] out_UUconvert_expr_FU_2_i0_fu___float_mule8m23b_127nih_37254_37337;
  wire [7:0] out_UUconvert_expr_FU_4_i0_fu___float_mule8m23b_127nih_37254_37363;
  wire out_UUdata_converter_FU_13_i0_fu___float_mule8m23b_127nih_37254_41014;
  wire out_UUdata_converter_FU_14_i0_fu___float_mule8m23b_127nih_37254_41026;
  wire out_UUdata_converter_FU_27_i0_fu___float_mule8m23b_127nih_37254_38012;
  wire [9:0] out_UUdata_converter_FU_29_i0_fu___float_mule8m23b_127nih_37254_38040;
  wire out_UUdata_converter_FU_31_i0_fu___float_mule8m23b_127nih_37254_38161;
  wire out_UUdata_converter_FU_33_i0_fu___float_mule8m23b_127nih_37254_38178;
  wire out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_37254_38208;
  wire out_UUdata_converter_FU_36_i0_fu___float_mule8m23b_127nih_37254_38237;
  wire out_UUdata_converter_FU_6_i0_fu___float_mule8m23b_127nih_37254_37376;
  wire out_UUdata_converter_FU_7_i0_fu___float_mule8m23b_127nih_37254_41004;
  wire signed [1:0] out_bit_and_expr_FU_8_0_8_40_i0_fu___float_mule8m23b_127nih_37254_37661;
  wire signed [2:0] out_bit_ior_expr_FU_0_8_8_41_i0_fu___float_mule8m23b_127nih_37254_37501;
  wire signed [2:0] out_bit_ior_expr_FU_0_8_8_42_i0_fu___float_mule8m23b_127nih_37254_37599;
  wire signed [2:0] out_bit_ior_expr_FU_0_8_8_43_i0_fu___float_mule8m23b_127nih_37254_37664;
  wire signed [2:0] out_bit_ior_expr_FU_8_8_8_44_i0_fu___float_mule8m23b_127nih_37254_37655;
  wire signed [1:0] out_bit_ior_expr_FU_8_8_8_44_i1_fu___float_mule8m23b_127nih_37254_37658;
  wire signed [1:0] out_bit_ior_expr_FU_8_8_8_44_i2_fu___float_mule8m23b_127nih_37254_37703;
  wire signed [2:0] out_bit_ior_expr_FU_8_8_8_44_i3_fu___float_mule8m23b_127nih_37254_37706;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [23:0] out_const_10;
  wire [3:0] out_const_11;
  wire [4:0] out_const_12;
  wire [5:0] out_const_13;
  wire [1:0] out_const_14;
  wire [2:0] out_const_15;
  wire [7:0] out_const_16;
  wire [30:0] out_const_17;
  wire [9:0] out_const_18;
  wire [22:0] out_const_19;
  wire [6:0] out_const_2;
  wire [31:0] out_const_20;
  wire [30:0] out_const_21;
  wire [31:0] out_const_22;
  wire [32:0] out_const_23;
  wire [46:0] out_const_24;
  wire [5:0] out_const_3;
  wire [6:0] out_const_4;
  wire [5:0] out_const_5;
  wire [5:0] out_const_6;
  wire [5:0] out_const_7;
  wire out_const_8;
  wire [1:0] out_const_9;
  wire [31:0] out_conv_in_port_a_64_32;
  wire [31:0] out_conv_in_port_b_64_32;
  wire [63:0] out_conv_out_ui_cond_expr_FU_32_32_32_32_78_i2_fu___float_mule8m23b_127nih_37254_40944_32_64;
  wire signed [2:0] out_lshift_expr_FU_8_0_8_45_i0_fu___float_mule8m23b_127nih_37254_37492;
  wire signed [2:0] out_lshift_expr_FU_8_0_8_45_i1_fu___float_mule8m23b_127nih_37254_37590;
  wire signed [2:0] out_lshift_expr_FU_8_0_8_45_i2_fu___float_mule8m23b_127nih_37254_37631;
  wire signed [2:0] out_lshift_expr_FU_8_0_8_45_i3_fu___float_mule8m23b_127nih_37254_38249;
  wire out_truth_and_expr_FU_1_0_1_46_i0_fu___float_mule8m23b_127nih_37254_38009;
  wire out_truth_and_expr_FU_1_0_1_46_i1_fu___float_mule8m23b_127nih_37254_38092;
  wire out_truth_and_expr_FU_1_0_1_46_i2_fu___float_mule8m23b_127nih_37254_38173;
  wire out_truth_and_expr_FU_1_0_1_46_i3_fu___float_mule8m23b_127nih_37254_38214;
  wire out_truth_and_expr_FU_1_0_1_47_i0_fu___float_mule8m23b_127nih_37254_40300;
  wire out_truth_and_expr_FU_1_0_1_47_i1_fu___float_mule8m23b_127nih_37254_40306;
  wire out_truth_and_expr_FU_1_0_1_47_i2_fu___float_mule8m23b_127nih_37254_40358;
  wire out_truth_and_expr_FU_1_1_1_48_i0_fu___float_mule8m23b_127nih_37254_40828;
  wire out_truth_and_expr_FU_1_1_1_48_i10_fu___float_mule8m23b_127nih_37254_40882;
  wire out_truth_and_expr_FU_1_1_1_48_i1_fu___float_mule8m23b_127nih_37254_40832;
  wire out_truth_and_expr_FU_1_1_1_48_i2_fu___float_mule8m23b_127nih_37254_40838;
  wire out_truth_and_expr_FU_1_1_1_48_i3_fu___float_mule8m23b_127nih_37254_40845;
  wire out_truth_and_expr_FU_1_1_1_48_i4_fu___float_mule8m23b_127nih_37254_40849;
  wire out_truth_and_expr_FU_1_1_1_48_i5_fu___float_mule8m23b_127nih_37254_40855;
  wire out_truth_and_expr_FU_1_1_1_48_i6_fu___float_mule8m23b_127nih_37254_40862;
  wire out_truth_and_expr_FU_1_1_1_48_i7_fu___float_mule8m23b_127nih_37254_40866;
  wire out_truth_and_expr_FU_1_1_1_48_i8_fu___float_mule8m23b_127nih_37254_40872;
  wire out_truth_and_expr_FU_1_1_1_48_i9_fu___float_mule8m23b_127nih_37254_40876;
  wire out_truth_not_expr_FU_1_1_49_i0_fu___float_mule8m23b_127nih_37254_37444;
  wire out_truth_not_expr_FU_1_1_49_i10_fu___float_mule8m23b_127nih_37254_38018;
  wire out_truth_not_expr_FU_1_1_49_i11_fu___float_mule8m23b_127nih_37254_40825;
  wire out_truth_not_expr_FU_1_1_49_i12_fu___float_mule8m23b_127nih_37254_40835;
  wire out_truth_not_expr_FU_1_1_49_i13_fu___float_mule8m23b_127nih_37254_40842;
  wire out_truth_not_expr_FU_1_1_49_i14_fu___float_mule8m23b_127nih_37254_40852;
  wire out_truth_not_expr_FU_1_1_49_i15_fu___float_mule8m23b_127nih_37254_40859;
  wire out_truth_not_expr_FU_1_1_49_i16_fu___float_mule8m23b_127nih_37254_40869;
  wire out_truth_not_expr_FU_1_1_49_i17_fu___float_mule8m23b_127nih_37254_40879;
  wire out_truth_not_expr_FU_1_1_49_i18_fu___float_mule8m23b_127nih_37254_41023;
  wire out_truth_not_expr_FU_1_1_49_i1_fu___float_mule8m23b_127nih_37254_37448;
  wire out_truth_not_expr_FU_1_1_49_i2_fu___float_mule8m23b_127nih_37254_37460;
  wire out_truth_not_expr_FU_1_1_49_i3_fu___float_mule8m23b_127nih_37254_37463;
  wire out_truth_not_expr_FU_1_1_49_i4_fu___float_mule8m23b_127nih_37254_37469;
  wire out_truth_not_expr_FU_1_1_49_i5_fu___float_mule8m23b_127nih_37254_37472;
  wire out_truth_not_expr_FU_1_1_49_i6_fu___float_mule8m23b_127nih_37254_37558;
  wire out_truth_not_expr_FU_1_1_49_i7_fu___float_mule8m23b_127nih_37254_37561;
  wire out_truth_not_expr_FU_1_1_49_i8_fu___float_mule8m23b_127nih_37254_37567;
  wire out_truth_not_expr_FU_1_1_49_i9_fu___float_mule8m23b_127nih_37254_37570;
  wire out_truth_or_expr_FU_1_1_1_50_i0_fu___float_mule8m23b_127nih_37254_40885;
  wire out_truth_or_expr_FU_1_1_1_50_i1_fu___float_mule8m23b_127nih_37254_40898;
  wire out_truth_or_expr_FU_1_1_1_50_i2_fu___float_mule8m23b_127nih_37254_40932;
  wire out_truth_or_expr_FU_1_1_1_50_i3_fu___float_mule8m23b_127nih_37254_40939;
  wire [0:0] out_ui_bit_and_expr_FU_0_1_1_51_i0_fu___float_mule8m23b_127nih_37254_37428;
  wire [0:0] out_ui_bit_and_expr_FU_0_1_1_51_i1_fu___float_mule8m23b_127nih_37254_37533;
  wire [22:0] out_ui_bit_and_expr_FU_0_32_32_52_i0_fu___float_mule8m23b_127nih_37254_37317;
  wire [22:0] out_ui_bit_and_expr_FU_0_32_32_52_i1_fu___float_mule8m23b_127nih_37254_37352;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_53_i0_fu___float_mule8m23b_127nih_37254_37437;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_53_i1_fu___float_mule8m23b_127nih_37254_37536;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_53_i2_fu___float_mule8m23b_127nih_37254_38290;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_54_i0_fu___float_mule8m23b_127nih_37254_37507;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_54_i1_fu___float_mule8m23b_127nih_37254_37605;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_54_i2_fu___float_mule8m23b_127nih_37254_37670;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_54_i3_fu___float_mule8m23b_127nih_37254_37688;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_55_i0_fu___float_mule8m23b_127nih_37254_38006;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_55_i1_fu___float_mule8m23b_127nih_37254_38146;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_55_i2_fu___float_mule8m23b_127nih_37254_38164;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_56_i0_fu___float_mule8m23b_127nih_37254_38243;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i0_fu___float_mule8m23b_127nih_37254_37431;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i10_fu___float_mule8m23b_127nih_37254_37679;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i11_fu___float_mule8m23b_127nih_37254_37694;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i12_fu___float_mule8m23b_127nih_37254_37697;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i13_fu___float_mule8m23b_127nih_37254_38170;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i14_fu___float_mule8m23b_127nih_37254_38205;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i15_fu___float_mule8m23b_127nih_37254_38211;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i16_fu___float_mule8m23b_127nih_37254_38353;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i17_fu___float_mule8m23b_127nih_37254_38363;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i18_fu___float_mule8m23b_127nih_37254_38371;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i1_fu___float_mule8m23b_127nih_37254_37451;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i2_fu___float_mule8m23b_127nih_37254_37457;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i3_fu___float_mule8m23b_127nih_37254_37466;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i4_fu___float_mule8m23b_127nih_37254_37539;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i5_fu___float_mule8m23b_127nih_37254_37555;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i6_fu___float_mule8m23b_127nih_37254_37564;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i7_fu___float_mule8m23b_127nih_37254_37637;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i8_fu___float_mule8m23b_127nih_37254_37643;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_57_i9_fu___float_mule8m23b_127nih_37254_37676;
  wire [23:0] out_ui_bit_and_expr_FU_32_0_32_58_i0_fu___float_mule8m23b_127nih_37254_37990;
  wire [23:0] out_ui_bit_and_expr_FU_32_0_32_58_i1_fu___float_mule8m23b_127nih_37254_37993;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_59_i0_fu___float_mule8m23b_127nih_37254_38052;
  wire [22:0] out_ui_bit_and_expr_FU_32_0_32_59_i1_fu___float_mule8m23b_127nih_37254_38155;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_60_i0_fu___float_mule8m23b_127nih_37254_38272;
  wire [46:0] out_ui_bit_and_expr_FU_64_0_64_61_i0_fu___float_mule8m23b_127nih_37254_38034;
  wire [32:0] out_ui_bit_and_expr_FU_64_0_64_62_i0_fu___float_mule8m23b_127nih_37254_38081;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_63_i0_fu___float_mule8m23b_127nih_37254_37334;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_63_i1_fu___float_mule8m23b_127nih_37254_37360;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_63_i2_fu___float_mule8m23b_127nih_37254_38231;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_64_i0_fu___float_mule8m23b_127nih_37254_37407;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_64_i1_fu___float_mule8m23b_127nih_37254_37517;
  wire [1:0] out_ui_bit_and_expr_FU_8_8_8_65_i0_fu___float_mule8m23b_127nih_37254_37649;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_66_i0_fu___float_mule8m23b_127nih_37254_37767;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_66_i1_fu___float_mule8m23b_127nih_37254_37783;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_67_i0_fu___float_mule8m23b_127nih_37254_38275;
  wire [32:0] out_ui_bit_ior_expr_FU_0_64_64_68_i0_fu___float_mule8m23b_127nih_37254_38055;
  wire [1:0] out_ui_bit_ior_expr_FU_0_8_8_69_i0_fu___float_mule8m23b_127nih_37254_38255;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_70_i0_fu___float_mule8m23b_127nih_37254_37625;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_70_i1_fu___float_mule8m23b_127nih_37254_38167;
  wire [31:0] out_ui_bit_ior_expr_FU_32_0_32_71_i0_fu___float_mule8m23b_127nih_37254_38334;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_72_i0_fu___float_mule8m23b_127nih_37254_37510;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_72_i1_fu___float_mule8m23b_127nih_37254_37513;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_72_i2_fu___float_mule8m23b_127nih_37254_37608;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_72_i3_fu___float_mule8m23b_127nih_37254_37611;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_72_i4_fu___float_mule8m23b_127nih_37254_38258;
  wire [0:0] out_ui_bit_xor_expr_FU_1_0_1_73_i0_fu___float_mule8m23b_127nih_37254_37667;
  wire [0:0] out_ui_bit_xor_expr_FU_1_0_1_73_i1_fu___float_mule8m23b_127nih_37254_37685;
  wire [0:0] out_ui_bit_xor_expr_FU_1_0_1_74_i0_fu___float_mule8m23b_127nih_37254_37673;
  wire [0:0] out_ui_bit_xor_expr_FU_1_0_1_74_i1_fu___float_mule8m23b_127nih_37254_37691;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_75_i0_fu___float_mule8m23b_127nih_37254_37373;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_75_i1_fu___float_mule8m23b_127nih_37254_38219;
  wire [9:0] out_ui_cond_expr_FU_16_16_16_16_76_i0_fu___float_mule8m23b_127nih_37254_40904;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_77_i0_fu___float_mule8m23b_127nih_37254_40889;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_77_i1_fu___float_mule8m23b_127nih_37254_40908;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_77_i2_fu___float_mule8m23b_127nih_37254_40911;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_77_i3_fu___float_mule8m23b_127nih_37254_40917;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_77_i4_fu___float_mule8m23b_127nih_37254_40925;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_77_i5_fu___float_mule8m23b_127nih_37254_40927;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_77_i6_fu___float_mule8m23b_127nih_37254_40946;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_77_i7_fu___float_mule8m23b_127nih_37254_40948;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_78_i0_fu___float_mule8m23b_127nih_37254_40901;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_78_i1_fu___float_mule8m23b_127nih_37254_40942;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_78_i2_fu___float_mule8m23b_127nih_37254_40944;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_79_i0_fu___float_mule8m23b_127nih_37254_40895;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_79_i1_fu___float_mule8m23b_127nih_37254_40914;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_79_i2_fu___float_mule8m23b_127nih_37254_40929;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_79_i3_fu___float_mule8m23b_127nih_37254_40936;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_79_i4_fu___float_mule8m23b_127nih_37254_40950;
  wire out_ui_eq_expr_FU_1_0_1_80_i0_fu___float_mule8m23b_127nih_37254_38202;
  wire out_ui_eq_expr_FU_32_0_32_81_i0_fu___float_mule8m23b_127nih_37254_37417;
  wire out_ui_eq_expr_FU_32_0_32_81_i1_fu___float_mule8m23b_127nih_37254_37527;
  wire out_ui_eq_expr_FU_8_0_8_82_i0_fu___float_mule8m23b_127nih_37254_37410;
  wire out_ui_eq_expr_FU_8_0_8_82_i1_fu___float_mule8m23b_127nih_37254_37520;
  wire out_ui_eq_expr_FU_8_0_8_82_i2_fu___float_mule8m23b_127nih_37254_38234;
  wire out_ui_eq_expr_FU_8_0_8_83_i0_fu___float_mule8m23b_127nih_37254_37414;
  wire out_ui_eq_expr_FU_8_0_8_83_i1_fu___float_mule8m23b_127nih_37254_37524;
  wire out_ui_eq_expr_FU_8_0_8_84_i0_fu___float_mule8m23b_127nih_37254_38287;
  wire out_ui_eq_expr_FU_8_0_8_85_i0_fu___float_mule8m23b_127nih_37254_40026;
  wire out_ui_eq_expr_FU_8_0_8_86_i0_fu___float_mule8m23b_127nih_37254_40028;
  wire out_ui_eq_expr_FU_8_0_8_87_i0_fu___float_mule8m23b_127nih_37254_40030;
  wire out_ui_eq_expr_FU_8_0_8_88_i0_fu___float_mule8m23b_127nih_37254_40032;
  wire out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_37254_40382;
  wire out_ui_extract_bit_expr_FU_30_i0_fu___float_mule8m23b_127nih_37254_40367;
  wire out_ui_extract_bit_expr_FU_32_i0_fu___float_mule8m23b_127nih_37254_40332;
  wire out_ui_extract_bit_expr_FU_35_i0_fu___float_mule8m23b_127nih_37254_40337;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_89_i0_fu___float_mule8m23b_127nih_37254_37379;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_90_i0_fu___float_mule8m23b_127nih_37254_40326;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_91_i0_fu___float_mule8m23b_127nih_37254_41001;
  wire [47:0] out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule8m23b_127nih_37254_38037;
  wire [32:0] out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_mule8m23b_127nih_37254_38043;
  wire [46:0] out_ui_lshift_expr_FU_64_64_64_94_i0_fu___float_mule8m23b_127nih_37254_38024;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_95_i0_fu___float_mule8m23b_127nih_37254_40958;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_95_i1_fu___float_mule8m23b_127nih_37254_40965;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_95_i2_fu___float_mule8m23b_127nih_37254_40972;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_95_i3_fu___float_mule8m23b_127nih_37254_40976;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_95_i4_fu___float_mule8m23b_127nih_37254_40980;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_95_i5_fu___float_mule8m23b_127nih_37254_40990;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_96_i0_fu___float_mule8m23b_127nih_37254_41008;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_96_i1_fu___float_mule8m23b_127nih_37254_41017;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_96_i2_fu___float_mule8m23b_127nih_37254_41029;
  wire [47:0] out_ui_mult_expr_FU_32_32_32_0_97_i0_fu___float_mule8m23b_127nih_37254_37996;
  wire out_ui_ne_expr_FU_1_0_1_98_i0_fu___float_mule8m23b_127nih_37254_37349;
  wire out_ui_ne_expr_FU_1_0_1_98_i1_fu___float_mule8m23b_127nih_37254_37370;
  wire out_ui_ne_expr_FU_32_0_32_100_i0_fu___float_mule8m23b_127nih_37254_38350;
  wire out_ui_ne_expr_FU_32_0_32_100_i1_fu___float_mule8m23b_127nih_37254_38360;
  wire out_ui_ne_expr_FU_32_0_32_100_i2_fu___float_mule8m23b_127nih_37254_38368;
  wire out_ui_ne_expr_FU_32_0_32_100_i3_fu___float_mule8m23b_127nih_37254_40040;
  wire out_ui_ne_expr_FU_32_0_32_99_i0_fu___float_mule8m23b_127nih_37254_38158;
  wire [9:0] out_ui_plus_expr_FU_16_16_16_101_i0_fu___float_mule8m23b_127nih_37254_38015;
  wire [32:0] out_ui_plus_expr_FU_32_32_32_102_i0_fu___float_mule8m23b_127nih_37254_38181;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_103_i0_fu___float_mule8m23b_127nih_37254_37322;
  wire [7:0] out_ui_rshift_expr_FU_32_0_32_103_i1_fu___float_mule8m23b_127nih_37254_37357;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_104_i0_fu___float_mule8m23b_127nih_37254_37346;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_104_i1_fu___float_mule8m23b_127nih_37254_37367;
  wire [22:0] out_ui_rshift_expr_FU_32_0_32_105_i0_fu___float_mule8m23b_127nih_37254_40329;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_106_i0_fu___float_mule8m23b_127nih_37254_40995;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_107_i0_fu___float_mule8m23b_127nih_37254_38003;
  wire [22:0] out_ui_rshift_expr_FU_64_0_64_108_i0_fu___float_mule8m23b_127nih_37254_38049;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_109_i0_fu___float_mule8m23b_127nih_37254_38143;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule8m23b_127nih_37254_38196;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule8m23b_127nih_37254_38199;
  wire [7:0] out_ui_rshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_37254_38228;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_37254_38240;
  wire [22:0] out_ui_rshift_expr_FU_64_0_64_113_i0_fu___float_mule8m23b_127nih_37254_40316;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_37254_37615;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_37254_37620;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_37254_40961;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_37254_40968;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_115_i2_fu___float_mule8m23b_127nih_37254_40983;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_115_i3_fu___float_mule8m23b_127nih_37254_40986;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_116_i0_fu___float_mule8m23b_127nih_37254_41011;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_116_i1_fu___float_mule8m23b_127nih_37254_41020;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_116_i2_fu___float_mule8m23b_127nih_37254_41032;
  wire [9:0] out_ui_ternary_plus_expr_FU_16_0_16_16_117_i0_fu___float_mule8m23b_127nih_37254_37749;
  
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(24),
    .value(24'b100000000000000000000000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1001)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10110)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101111)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11111111)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1111111100000000000000000000000)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1111111111)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(23),
    .value(23'b11111111111111111111111)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111110000001)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1111111111111111111111111111111)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(33),
    .value(33'b111111111111111111111111111111111)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(47),
    .value(47'b11111111111111111111111111111111111111111111111)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010111)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0101111)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011001)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011111)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_in_port_a_64_32 (.out1(out_conv_in_port_a_64_32),
    .in1(in_port_a));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_in_port_b_64_32 (.out1(out_conv_in_port_b_64_32),
    .in1(in_port_b));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_ui_cond_expr_FU_32_32_32_32_78_i2_fu___float_mule8m23b_127nih_37254_40944_32_64 (.out1(out_conv_out_ui_cond_expr_FU_32_32_32_32_78_i2_fu___float_mule8m23b_127nih_37254_40944_32_64),
    .in1(out_ui_cond_expr_FU_32_32_32_32_78_i2_fu___float_mule8m23b_127nih_37254_40944));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_37254_37317 (.out1(out_ui_bit_and_expr_FU_0_32_32_52_i0_fu___float_mule8m23b_127nih_37254_37317),
    .in1(out_const_19),
    .in2(out_conv_in_port_a_64_32));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_37322 (.out1(out_ui_rshift_expr_FU_32_0_32_103_i0_fu___float_mule8m23b_127nih_37254_37322),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_37254_37334 (.out1(out_ui_bit_and_expr_FU_8_0_8_63_i0_fu___float_mule8m23b_127nih_37254_37334),
    .in1(out_ui_rshift_expr_FU_32_0_32_103_i0_fu___float_mule8m23b_127nih_37254_37322),
    .in2(out_const_16));
  UUconvert_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_37254_37337 (.out1(out_UUconvert_expr_FU_2_i0_fu___float_mule8m23b_127nih_37254_37337),
    .in1(out_ui_bit_and_expr_FU_8_0_8_63_i0_fu___float_mule8m23b_127nih_37254_37334));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_37346 (.out1(out_ui_rshift_expr_FU_32_0_32_104_i0_fu___float_mule8m23b_127nih_37254_37346),
    .in1(out_conv_in_port_a_64_32),
    .in2(out_const_7));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37349 (.out1(out_ui_ne_expr_FU_1_0_1_98_i0_fu___float_mule8m23b_127nih_37254_37349),
    .in1(out_ui_rshift_expr_FU_32_0_32_104_i0_fu___float_mule8m23b_127nih_37254_37346),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(32),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_37254_37352 (.out1(out_ui_bit_and_expr_FU_0_32_32_52_i1_fu___float_mule8m23b_127nih_37254_37352),
    .in1(out_const_19),
    .in2(out_conv_in_port_b_64_32));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_37357 (.out1(out_ui_rshift_expr_FU_32_0_32_103_i1_fu___float_mule8m23b_127nih_37254_37357),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_37254_37360 (.out1(out_ui_bit_and_expr_FU_8_0_8_63_i1_fu___float_mule8m23b_127nih_37254_37360),
    .in1(out_ui_rshift_expr_FU_32_0_32_103_i1_fu___float_mule8m23b_127nih_37254_37357),
    .in2(out_const_16));
  UUconvert_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_37254_37363 (.out1(out_UUconvert_expr_FU_4_i0_fu___float_mule8m23b_127nih_37254_37363),
    .in1(out_ui_bit_and_expr_FU_8_0_8_63_i1_fu___float_mule8m23b_127nih_37254_37360));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_37367 (.out1(out_ui_rshift_expr_FU_32_0_32_104_i1_fu___float_mule8m23b_127nih_37254_37367),
    .in1(out_conv_in_port_b_64_32),
    .in2(out_const_7));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37370 (.out1(out_ui_ne_expr_FU_1_0_1_98_i1_fu___float_mule8m23b_127nih_37254_37370),
    .in1(out_ui_rshift_expr_FU_32_0_32_104_i1_fu___float_mule8m23b_127nih_37254_37367),
    .in2(out_const_0));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37373 (.out1(out_ui_bit_xor_expr_FU_1_1_1_75_i0_fu___float_mule8m23b_127nih_37254_37373),
    .in1(out_ui_ne_expr_FU_1_0_1_98_i1_fu___float_mule8m23b_127nih_37254_37370),
    .in2(out_ui_ne_expr_FU_1_0_1_98_i0_fu___float_mule8m23b_127nih_37254_37349));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37376 (.out1(out_UUdata_converter_FU_6_i0_fu___float_mule8m23b_127nih_37254_37376),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_75_i0_fu___float_mule8m23b_127nih_37254_37373));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_37379 (.out1(out_ui_lshift_expr_FU_32_0_32_89_i0_fu___float_mule8m23b_127nih_37254_37379),
    .in1(out_UUdata_converter_FU_6_i0_fu___float_mule8m23b_127nih_37254_37376),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(32),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_37254_37407 (.out1(out_ui_bit_and_expr_FU_8_0_8_64_i0_fu___float_mule8m23b_127nih_37254_37407),
    .in1(out_ui_bit_and_expr_FU_8_0_8_63_i0_fu___float_mule8m23b_127nih_37254_37334),
    .in2(out_const_22));
  ui_eq_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37410 (.out1(out_ui_eq_expr_FU_8_0_8_82_i0_fu___float_mule8m23b_127nih_37254_37410),
    .in1(out_ui_bit_and_expr_FU_8_0_8_64_i0_fu___float_mule8m23b_127nih_37254_37407),
    .in2(out_const_16));
  ui_eq_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37414 (.out1(out_ui_eq_expr_FU_8_0_8_83_i0_fu___float_mule8m23b_127nih_37254_37414),
    .in1(out_UUconvert_expr_FU_2_i0_fu___float_mule8m23b_127nih_37254_37337),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37417 (.out1(out_ui_eq_expr_FU_32_0_32_81_i0_fu___float_mule8m23b_127nih_37254_37417),
    .in1(out_ui_bit_and_expr_FU_0_32_32_52_i0_fu___float_mule8m23b_127nih_37254_37317),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37428 (.out1(out_ui_bit_and_expr_FU_0_1_1_51_i0_fu___float_mule8m23b_127nih_37254_37428),
    .in1(out_const_8),
    .in2(out_ui_eq_expr_FU_8_0_8_83_i0_fu___float_mule8m23b_127nih_37254_37414));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37431 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i0_fu___float_mule8m23b_127nih_37254_37431),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i0_fu___float_mule8m23b_127nih_37254_37410),
    .in2(out_ui_eq_expr_FU_32_0_32_81_i0_fu___float_mule8m23b_127nih_37254_37417));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37437 (.out1(out_ui_bit_and_expr_FU_1_0_1_53_i0_fu___float_mule8m23b_127nih_37254_37437),
    .in1(out_ui_bit_and_expr_FU_1_1_1_57_i0_fu___float_mule8m23b_127nih_37254_37431),
    .in2(out_const_8));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37444 (.out1(out_truth_not_expr_FU_1_1_49_i0_fu___float_mule8m23b_127nih_37254_37444),
    .in1(out_ui_bit_and_expr_FU_0_1_1_51_i0_fu___float_mule8m23b_127nih_37254_37428));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37448 (.out1(out_truth_not_expr_FU_1_1_49_i1_fu___float_mule8m23b_127nih_37254_37448),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i0_fu___float_mule8m23b_127nih_37254_37410));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37451 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i1_fu___float_mule8m23b_127nih_37254_37451),
    .in1(out_truth_not_expr_FU_1_1_49_i0_fu___float_mule8m23b_127nih_37254_37444),
    .in2(out_truth_not_expr_FU_1_1_49_i1_fu___float_mule8m23b_127nih_37254_37448));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37457 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i2_fu___float_mule8m23b_127nih_37254_37457),
    .in1(out_truth_not_expr_FU_1_1_49_i2_fu___float_mule8m23b_127nih_37254_37460),
    .in2(out_truth_not_expr_FU_1_1_49_i3_fu___float_mule8m23b_127nih_37254_37463));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37460 (.out1(out_truth_not_expr_FU_1_1_49_i2_fu___float_mule8m23b_127nih_37254_37460),
    .in1(out_ui_bit_and_expr_FU_0_1_1_51_i0_fu___float_mule8m23b_127nih_37254_37428));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37463 (.out1(out_truth_not_expr_FU_1_1_49_i3_fu___float_mule8m23b_127nih_37254_37463),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i0_fu___float_mule8m23b_127nih_37254_37410));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37466 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i3_fu___float_mule8m23b_127nih_37254_37466),
    .in1(out_truth_not_expr_FU_1_1_49_i4_fu___float_mule8m23b_127nih_37254_37469),
    .in2(out_truth_not_expr_FU_1_1_49_i5_fu___float_mule8m23b_127nih_37254_37472));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37469 (.out1(out_truth_not_expr_FU_1_1_49_i4_fu___float_mule8m23b_127nih_37254_37469),
    .in1(out_ui_bit_and_expr_FU_0_1_1_51_i0_fu___float_mule8m23b_127nih_37254_37428));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37472 (.out1(out_truth_not_expr_FU_1_1_49_i5_fu___float_mule8m23b_127nih_37254_37472),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i0_fu___float_mule8m23b_127nih_37254_37410));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37489 (.out1(out_UIconvert_expr_FU_8_i0_fu___float_mule8m23b_127nih_37254_37489),
    .in1(out_ui_cond_expr_FU_1_1_1_1_77_i4_fu___float_mule8m23b_127nih_37254_40925));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(32)) fu___float_mule8m23b_127nih_37254_37492 (.out1(out_lshift_expr_FU_8_0_8_45_i0_fu___float_mule8m23b_127nih_37254_37492),
    .in1(out_UIconvert_expr_FU_8_i0_fu___float_mule8m23b_127nih_37254_37489),
    .in2(out_const_1));
  IIconvert_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_37254_37495 (.out1(out_IIconvert_expr_FU_9_i0_fu___float_mule8m23b_127nih_37254_37495),
    .in1(out_lshift_expr_FU_8_0_8_45_i0_fu___float_mule8m23b_127nih_37254_37492));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37498 (.out1(out_UIconvert_expr_FU_10_i0_fu___float_mule8m23b_127nih_37254_37498),
    .in1(out_ui_cond_expr_FU_1_1_1_1_77_i4_fu___float_mule8m23b_127nih_37254_40925));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_37254_37501 (.out1(out_bit_ior_expr_FU_0_8_8_41_i0_fu___float_mule8m23b_127nih_37254_37501),
    .in1(out_IIconvert_expr_FU_9_i0_fu___float_mule8m23b_127nih_37254_37495),
    .in2(out_UIconvert_expr_FU_10_i0_fu___float_mule8m23b_127nih_37254_37498));
  IUdata_converter_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37504 (.out1(out_IUdata_converter_FU_11_i0_fu___float_mule8m23b_127nih_37254_37504),
    .in1(out_bit_ior_expr_FU_0_8_8_41_i0_fu___float_mule8m23b_127nih_37254_37501));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37507 (.out1(out_ui_bit_and_expr_FU_1_0_1_54_i0_fu___float_mule8m23b_127nih_37254_37507),
    .in1(out_IUdata_converter_FU_11_i0_fu___float_mule8m23b_127nih_37254_37504),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37510 (.out1(out_ui_bit_ior_expr_FU_8_8_8_72_i0_fu___float_mule8m23b_127nih_37254_37510),
    .in1(out_ui_cond_expr_FU_8_8_8_8_79_i2_fu___float_mule8m23b_127nih_37254_40929),
    .in2(out_ui_lshift_expr_FU_8_0_8_95_i2_fu___float_mule8m23b_127nih_37254_40972));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37513 (.out1(out_ui_bit_ior_expr_FU_8_8_8_72_i1_fu___float_mule8m23b_127nih_37254_37513),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_72_i0_fu___float_mule8m23b_127nih_37254_37510),
    .in2(out_ui_bit_and_expr_FU_1_0_1_54_i0_fu___float_mule8m23b_127nih_37254_37507));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(32),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_37254_37517 (.out1(out_ui_bit_and_expr_FU_8_0_8_64_i1_fu___float_mule8m23b_127nih_37254_37517),
    .in1(out_ui_bit_and_expr_FU_8_0_8_63_i1_fu___float_mule8m23b_127nih_37254_37360),
    .in2(out_const_22));
  ui_eq_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37520 (.out1(out_ui_eq_expr_FU_8_0_8_82_i1_fu___float_mule8m23b_127nih_37254_37520),
    .in1(out_ui_bit_and_expr_FU_8_0_8_64_i1_fu___float_mule8m23b_127nih_37254_37517),
    .in2(out_const_16));
  ui_eq_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37524 (.out1(out_ui_eq_expr_FU_8_0_8_83_i1_fu___float_mule8m23b_127nih_37254_37524),
    .in1(out_UUconvert_expr_FU_4_i0_fu___float_mule8m23b_127nih_37254_37363),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37527 (.out1(out_ui_eq_expr_FU_32_0_32_81_i1_fu___float_mule8m23b_127nih_37254_37527),
    .in1(out_ui_bit_and_expr_FU_0_32_32_52_i1_fu___float_mule8m23b_127nih_37254_37352),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37533 (.out1(out_ui_bit_and_expr_FU_0_1_1_51_i1_fu___float_mule8m23b_127nih_37254_37533),
    .in1(out_const_8),
    .in2(out_ui_eq_expr_FU_8_0_8_83_i1_fu___float_mule8m23b_127nih_37254_37524));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37536 (.out1(out_ui_bit_and_expr_FU_1_0_1_53_i1_fu___float_mule8m23b_127nih_37254_37536),
    .in1(out_ui_eq_expr_FU_32_0_32_81_i1_fu___float_mule8m23b_127nih_37254_37527),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37539 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i4_fu___float_mule8m23b_127nih_37254_37539),
    .in1(out_ui_bit_and_expr_FU_1_0_1_53_i1_fu___float_mule8m23b_127nih_37254_37536),
    .in2(out_ui_eq_expr_FU_8_0_8_82_i1_fu___float_mule8m23b_127nih_37254_37520));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37555 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i5_fu___float_mule8m23b_127nih_37254_37555),
    .in1(out_truth_not_expr_FU_1_1_49_i6_fu___float_mule8m23b_127nih_37254_37558),
    .in2(out_truth_not_expr_FU_1_1_49_i7_fu___float_mule8m23b_127nih_37254_37561));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37558 (.out1(out_truth_not_expr_FU_1_1_49_i6_fu___float_mule8m23b_127nih_37254_37558),
    .in1(out_ui_bit_and_expr_FU_0_1_1_51_i1_fu___float_mule8m23b_127nih_37254_37533));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37561 (.out1(out_truth_not_expr_FU_1_1_49_i7_fu___float_mule8m23b_127nih_37254_37561),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i1_fu___float_mule8m23b_127nih_37254_37520));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37564 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i6_fu___float_mule8m23b_127nih_37254_37564),
    .in1(out_truth_not_expr_FU_1_1_49_i8_fu___float_mule8m23b_127nih_37254_37567),
    .in2(out_truth_not_expr_FU_1_1_49_i9_fu___float_mule8m23b_127nih_37254_37570));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37567 (.out1(out_truth_not_expr_FU_1_1_49_i8_fu___float_mule8m23b_127nih_37254_37567),
    .in1(out_ui_bit_and_expr_FU_0_1_1_51_i1_fu___float_mule8m23b_127nih_37254_37533));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37570 (.out1(out_truth_not_expr_FU_1_1_49_i9_fu___float_mule8m23b_127nih_37254_37570),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i1_fu___float_mule8m23b_127nih_37254_37520));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37587 (.out1(out_UIconvert_expr_FU_15_i0_fu___float_mule8m23b_127nih_37254_37587),
    .in1(out_ui_cond_expr_FU_1_1_1_1_77_i6_fu___float_mule8m23b_127nih_37254_40946));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(32)) fu___float_mule8m23b_127nih_37254_37590 (.out1(out_lshift_expr_FU_8_0_8_45_i1_fu___float_mule8m23b_127nih_37254_37590),
    .in1(out_UIconvert_expr_FU_15_i0_fu___float_mule8m23b_127nih_37254_37587),
    .in2(out_const_1));
  IIconvert_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_37254_37593 (.out1(out_IIconvert_expr_FU_16_i0_fu___float_mule8m23b_127nih_37254_37593),
    .in1(out_lshift_expr_FU_8_0_8_45_i1_fu___float_mule8m23b_127nih_37254_37590));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37596 (.out1(out_UIconvert_expr_FU_17_i0_fu___float_mule8m23b_127nih_37254_37596),
    .in1(out_ui_cond_expr_FU_1_1_1_1_77_i6_fu___float_mule8m23b_127nih_37254_40946));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_37254_37599 (.out1(out_bit_ior_expr_FU_0_8_8_42_i0_fu___float_mule8m23b_127nih_37254_37599),
    .in1(out_IIconvert_expr_FU_16_i0_fu___float_mule8m23b_127nih_37254_37593),
    .in2(out_UIconvert_expr_FU_17_i0_fu___float_mule8m23b_127nih_37254_37596));
  IUdata_converter_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37602 (.out1(out_IUdata_converter_FU_18_i0_fu___float_mule8m23b_127nih_37254_37602),
    .in1(out_bit_ior_expr_FU_0_8_8_42_i0_fu___float_mule8m23b_127nih_37254_37599));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37605 (.out1(out_ui_bit_and_expr_FU_1_0_1_54_i1_fu___float_mule8m23b_127nih_37254_37605),
    .in1(out_IUdata_converter_FU_18_i0_fu___float_mule8m23b_127nih_37254_37602),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37608 (.out1(out_ui_bit_ior_expr_FU_8_8_8_72_i2_fu___float_mule8m23b_127nih_37254_37608),
    .in1(out_ui_cond_expr_FU_8_8_8_8_79_i4_fu___float_mule8m23b_127nih_37254_40950),
    .in2(out_ui_lshift_expr_FU_8_0_8_95_i5_fu___float_mule8m23b_127nih_37254_40990));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37611 (.out1(out_ui_bit_ior_expr_FU_8_8_8_72_i3_fu___float_mule8m23b_127nih_37254_37611),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_72_i2_fu___float_mule8m23b_127nih_37254_37608),
    .in2(out_ui_bit_and_expr_FU_1_0_1_54_i1_fu___float_mule8m23b_127nih_37254_37605));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_37615 (.out1(out_ui_rshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_37254_37615),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_72_i1_fu___float_mule8m23b_127nih_37254_37513),
    .in2(out_const_1));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_37620 (.out1(out_ui_rshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_37254_37620),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_72_i3_fu___float_mule8m23b_127nih_37254_37611),
    .in2(out_const_1));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37625 (.out1(out_ui_bit_ior_expr_FU_1_1_1_70_i0_fu___float_mule8m23b_127nih_37254_37625),
    .in1(out_ui_rshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_37254_37620),
    .in2(out_ui_rshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_37254_37615));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37628 (.out1(out_UIdata_converter_FU_19_i0_fu___float_mule8m23b_127nih_37254_37628),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_70_i0_fu___float_mule8m23b_127nih_37254_37625));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(32)) fu___float_mule8m23b_127nih_37254_37631 (.out1(out_lshift_expr_FU_8_0_8_45_i2_fu___float_mule8m23b_127nih_37254_37631),
    .in1(out_UIdata_converter_FU_19_i0_fu___float_mule8m23b_127nih_37254_37628),
    .in2(out_const_1));
  IIconvert_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_37254_37634 (.out1(out_IIconvert_expr_FU_20_i0_fu___float_mule8m23b_127nih_37254_37634),
    .in1(out_lshift_expr_FU_8_0_8_45_i2_fu___float_mule8m23b_127nih_37254_37631));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37637 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i7_fu___float_mule8m23b_127nih_37254_37637),
    .in1(out_ui_rshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_37254_37615),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_72_i1_fu___float_mule8m23b_127nih_37254_37513));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37640 (.out1(out_UIdata_converter_FU_12_i0_fu___float_mule8m23b_127nih_37254_37640),
    .in1(out_ui_bit_and_expr_FU_1_1_1_57_i7_fu___float_mule8m23b_127nih_37254_37637));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37643 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i8_fu___float_mule8m23b_127nih_37254_37643),
    .in1(out_ui_rshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_37254_37620),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_72_i3_fu___float_mule8m23b_127nih_37254_37611));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37646 (.out1(out_UIdata_converter_FU_21_i0_fu___float_mule8m23b_127nih_37254_37646),
    .in1(out_ui_bit_and_expr_FU_1_1_1_57_i8_fu___float_mule8m23b_127nih_37254_37643));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37649 (.out1(out_ui_bit_and_expr_FU_8_8_8_65_i0_fu___float_mule8m23b_127nih_37254_37649),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_72_i3_fu___float_mule8m23b_127nih_37254_37611),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_72_i1_fu___float_mule8m23b_127nih_37254_37513));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_37254_37652 (.out1(out_UIdata_converter_FU_22_i0_fu___float_mule8m23b_127nih_37254_37652),
    .in1(out_ui_bit_and_expr_FU_8_8_8_65_i0_fu___float_mule8m23b_127nih_37254_37649));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_37254_37655 (.out1(out_bit_ior_expr_FU_8_8_8_44_i0_fu___float_mule8m23b_127nih_37254_37655),
    .in1(out_UIdata_converter_FU_22_i0_fu___float_mule8m23b_127nih_37254_37652),
    .in2(out_UIdata_converter_FU_12_i0_fu___float_mule8m23b_127nih_37254_37640));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37658 (.out1(out_bit_ior_expr_FU_8_8_8_44_i1_fu___float_mule8m23b_127nih_37254_37658),
    .in1(out_bit_ior_expr_FU_8_8_8_44_i0_fu___float_mule8m23b_127nih_37254_37655),
    .in2(out_UIdata_converter_FU_21_i0_fu___float_mule8m23b_127nih_37254_37646));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37661 (.out1(out_bit_and_expr_FU_8_0_8_40_i0_fu___float_mule8m23b_127nih_37254_37661),
    .in1(out_bit_ior_expr_FU_8_8_8_44_i1_fu___float_mule8m23b_127nih_37254_37658),
    .in2(out_const_1));
  bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_37254_37664 (.out1(out_bit_ior_expr_FU_0_8_8_43_i0_fu___float_mule8m23b_127nih_37254_37664),
    .in1(out_bit_and_expr_FU_8_0_8_40_i0_fu___float_mule8m23b_127nih_37254_37661),
    .in2(out_IIconvert_expr_FU_20_i0_fu___float_mule8m23b_127nih_37254_37634));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37667 (.out1(out_ui_bit_xor_expr_FU_1_0_1_73_i0_fu___float_mule8m23b_127nih_37254_37667),
    .in1(out_ui_rshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_37254_37615),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37670 (.out1(out_ui_bit_and_expr_FU_1_0_1_54_i2_fu___float_mule8m23b_127nih_37254_37670),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_72_i1_fu___float_mule8m23b_127nih_37254_37513),
    .in2(out_const_8));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37673 (.out1(out_ui_bit_xor_expr_FU_1_0_1_74_i0_fu___float_mule8m23b_127nih_37254_37673),
    .in1(out_ui_bit_and_expr_FU_1_0_1_54_i2_fu___float_mule8m23b_127nih_37254_37670),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37676 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i9_fu___float_mule8m23b_127nih_37254_37676),
    .in1(out_ui_bit_xor_expr_FU_1_0_1_74_i0_fu___float_mule8m23b_127nih_37254_37673),
    .in2(out_ui_bit_xor_expr_FU_1_0_1_73_i0_fu___float_mule8m23b_127nih_37254_37667));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37679 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i10_fu___float_mule8m23b_127nih_37254_37679),
    .in1(out_ui_bit_and_expr_FU_1_1_1_57_i9_fu___float_mule8m23b_127nih_37254_37676),
    .in2(out_ui_rshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_37254_37620));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37682 (.out1(out_UIdata_converter_FU_23_i0_fu___float_mule8m23b_127nih_37254_37682),
    .in1(out_ui_bit_and_expr_FU_1_1_1_57_i10_fu___float_mule8m23b_127nih_37254_37679));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37685 (.out1(out_ui_bit_xor_expr_FU_1_0_1_73_i1_fu___float_mule8m23b_127nih_37254_37685),
    .in1(out_ui_rshift_expr_FU_8_0_8_114_i1_fu___float_mule8m23b_127nih_37254_37620),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37688 (.out1(out_ui_bit_and_expr_FU_1_0_1_54_i3_fu___float_mule8m23b_127nih_37254_37688),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_72_i3_fu___float_mule8m23b_127nih_37254_37611),
    .in2(out_const_8));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37691 (.out1(out_ui_bit_xor_expr_FU_1_0_1_74_i1_fu___float_mule8m23b_127nih_37254_37691),
    .in1(out_ui_bit_and_expr_FU_1_0_1_54_i3_fu___float_mule8m23b_127nih_37254_37688),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37694 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i11_fu___float_mule8m23b_127nih_37254_37694),
    .in1(out_ui_bit_xor_expr_FU_1_0_1_74_i1_fu___float_mule8m23b_127nih_37254_37691),
    .in2(out_ui_bit_xor_expr_FU_1_0_1_73_i1_fu___float_mule8m23b_127nih_37254_37685));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_37697 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i12_fu___float_mule8m23b_127nih_37254_37697),
    .in1(out_ui_rshift_expr_FU_8_0_8_114_i0_fu___float_mule8m23b_127nih_37254_37615),
    .in2(out_ui_bit_and_expr_FU_1_1_1_57_i11_fu___float_mule8m23b_127nih_37254_37694));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37700 (.out1(out_UIdata_converter_FU_24_i0_fu___float_mule8m23b_127nih_37254_37700),
    .in1(out_ui_bit_and_expr_FU_1_1_1_57_i12_fu___float_mule8m23b_127nih_37254_37697));
  bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37703 (.out1(out_bit_ior_expr_FU_8_8_8_44_i2_fu___float_mule8m23b_127nih_37254_37703),
    .in1(out_UIdata_converter_FU_24_i0_fu___float_mule8m23b_127nih_37254_37700),
    .in2(out_UIdata_converter_FU_23_i0_fu___float_mule8m23b_127nih_37254_37682));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule8m23b_127nih_37254_37706 (.out1(out_bit_ior_expr_FU_8_8_8_44_i3_fu___float_mule8m23b_127nih_37254_37706),
    .in1(out_bit_ior_expr_FU_0_8_8_43_i0_fu___float_mule8m23b_127nih_37254_37664),
    .in2(out_bit_ior_expr_FU_8_8_8_44_i2_fu___float_mule8m23b_127nih_37254_37703));
  IUdata_converter_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_37709 (.out1(out_IUdata_converter_FU_25_i0_fu___float_mule8m23b_127nih_37254_37709),
    .in1(out_bit_ior_expr_FU_8_8_8_44_i3_fu___float_mule8m23b_127nih_37254_37706));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(32),
    .BITSIZE_in3(8),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_37254_37749 (.out1(out_ui_ternary_plus_expr_FU_16_0_16_16_117_i0_fu___float_mule8m23b_127nih_37254_37749),
    .in1(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_37254_40952),
    .in2(out_const_20),
    .in3(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_37254_40954));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_37254_37767 (.out1(out_ui_bit_ior_expr_FU_0_32_32_66_i0_fu___float_mule8m23b_127nih_37254_37767),
    .in1(out_const_10),
    .in2(out_ui_bit_and_expr_FU_0_32_32_52_i0_fu___float_mule8m23b_127nih_37254_37317));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(23),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_37254_37783 (.out1(out_ui_bit_ior_expr_FU_0_32_32_66_i1_fu___float_mule8m23b_127nih_37254_37783),
    .in1(out_const_10),
    .in2(out_ui_bit_and_expr_FU_0_32_32_52_i1_fu___float_mule8m23b_127nih_37254_37352));
  ui_bit_and_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(32),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_37254_37990 (.out1(out_ui_bit_and_expr_FU_32_0_32_58_i0_fu___float_mule8m23b_127nih_37254_37990),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_66_i0_fu___float_mule8m23b_127nih_37254_37767),
    .in2(out_const_22));
  ui_bit_and_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(32),
    .BITSIZE_out1(24)) fu___float_mule8m23b_127nih_37254_37993 (.out1(out_ui_bit_and_expr_FU_32_0_32_58_i1_fu___float_mule8m23b_127nih_37254_37993),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_66_i1_fu___float_mule8m23b_127nih_37254_37783),
    .in2(out_const_22));
  ui_mult_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(24),
    .BITSIZE_out1(48),
    .PIPE_PARAMETER(0)) fu___float_mule8m23b_127nih_37254_37996 (.out1(out_ui_mult_expr_FU_32_32_32_0_97_i0_fu___float_mule8m23b_127nih_37254_37996),
    .clock(clock),
    .in1(out_ui_bit_and_expr_FU_32_0_32_58_i1_fu___float_mule8m23b_127nih_37254_37993),
    .in2(out_ui_bit_and_expr_FU_32_0_32_58_i0_fu___float_mule8m23b_127nih_37254_37990));
  ui_rshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_38003 (.out1(out_ui_rshift_expr_FU_64_0_64_107_i0_fu___float_mule8m23b_127nih_37254_38003),
    .in1(out_ui_mult_expr_FU_32_32_32_0_97_i0_fu___float_mule8m23b_127nih_37254_37996),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38006 (.out1(out_ui_bit_and_expr_FU_1_0_1_55_i0_fu___float_mule8m23b_127nih_37254_38006),
    .in1(out_ui_rshift_expr_FU_64_0_64_107_i0_fu___float_mule8m23b_127nih_37254_38003),
    .in2(out_const_8));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38009 (.out1(out_truth_and_expr_FU_1_0_1_46_i0_fu___float_mule8m23b_127nih_37254_38009),
    .in1(out_truth_and_expr_FU_1_0_1_47_i0_fu___float_mule8m23b_127nih_37254_40300),
    .in2(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38012 (.out1(out_UUdata_converter_FU_27_i0_fu___float_mule8m23b_127nih_37254_38012),
    .in1(out_ui_bit_and_expr_FU_1_0_1_55_i0_fu___float_mule8m23b_127nih_37254_38006));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_37254_38015 (.out1(out_ui_plus_expr_FU_16_16_16_101_i0_fu___float_mule8m23b_127nih_37254_38015),
    .in1(out_UUdata_converter_FU_27_i0_fu___float_mule8m23b_127nih_37254_38012),
    .in2(out_ui_ternary_plus_expr_FU_16_0_16_16_117_i0_fu___float_mule8m23b_127nih_37254_37749));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38018 (.out1(out_truth_not_expr_FU_1_1_49_i10_fu___float_mule8m23b_127nih_37254_38018),
    .in1(out_truth_and_expr_FU_1_0_1_46_i0_fu___float_mule8m23b_127nih_37254_38009));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_38021 (.out1(out_UIdata_converter_FU_28_i0_fu___float_mule8m23b_127nih_37254_38021),
    .in1(out_truth_not_expr_FU_1_1_49_i10_fu___float_mule8m23b_127nih_37254_38018));
  ui_lshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(2),
    .BITSIZE_out1(47),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_38024 (.out1(out_ui_lshift_expr_FU_64_64_64_94_i0_fu___float_mule8m23b_127nih_37254_38024),
    .in1(out_ui_mult_expr_FU_32_32_32_0_97_i0_fu___float_mule8m23b_127nih_37254_37996),
    .in2(out_UIdata_converter_FU_28_i0_fu___float_mule8m23b_127nih_37254_38021));
  ui_bit_and_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(47),
    .BITSIZE_out1(47)) fu___float_mule8m23b_127nih_37254_38034 (.out1(out_ui_bit_and_expr_FU_64_0_64_61_i0_fu___float_mule8m23b_127nih_37254_38034),
    .in1(out_ui_lshift_expr_FU_64_64_64_94_i0_fu___float_mule8m23b_127nih_37254_38024),
    .in2(out_const_24));
  ui_lshift_expr_FU #(.BITSIZE_in1(47),
    .BITSIZE_in2(2),
    .BITSIZE_out1(48),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_38037 (.out1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule8m23b_127nih_37254_38037),
    .in1(out_ui_bit_and_expr_FU_64_0_64_61_i0_fu___float_mule8m23b_127nih_37254_38034),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_37254_38040 (.out1(out_UUdata_converter_FU_29_i0_fu___float_mule8m23b_127nih_37254_38040),
    .in1(out_ui_plus_expr_FU_16_16_16_101_i0_fu___float_mule8m23b_127nih_37254_38015));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(6),
    .BITSIZE_out1(33),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_38043 (.out1(out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_mule8m23b_127nih_37254_38043),
    .in1(out_UUdata_converter_FU_29_i0_fu___float_mule8m23b_127nih_37254_38040),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(6),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_38049 (.out1(out_ui_rshift_expr_FU_64_0_64_108_i0_fu___float_mule8m23b_127nih_37254_38049),
    .in1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule8m23b_127nih_37254_38037),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_37254_38052 (.out1(out_ui_bit_and_expr_FU_32_0_32_59_i0_fu___float_mule8m23b_127nih_37254_38052),
    .in1(out_ui_rshift_expr_FU_64_0_64_108_i0_fu___float_mule8m23b_127nih_37254_38049),
    .in2(out_const_19));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(33),
    .BITSIZE_out1(33)) fu___float_mule8m23b_127nih_37254_38055 (.out1(out_ui_bit_ior_expr_FU_0_64_64_68_i0_fu___float_mule8m23b_127nih_37254_38055),
    .in1(out_ui_bit_and_expr_FU_32_0_32_59_i0_fu___float_mule8m23b_127nih_37254_38052),
    .in2(out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_mule8m23b_127nih_37254_38043));
  ui_bit_and_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(33),
    .BITSIZE_out1(33)) fu___float_mule8m23b_127nih_37254_38081 (.out1(out_ui_bit_and_expr_FU_64_0_64_62_i0_fu___float_mule8m23b_127nih_37254_38081),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_68_i0_fu___float_mule8m23b_127nih_37254_38055),
    .in2(out_const_23));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38092 (.out1(out_truth_and_expr_FU_1_0_1_46_i1_fu___float_mule8m23b_127nih_37254_38092),
    .in1(out_truth_and_expr_FU_1_0_1_47_i1_fu___float_mule8m23b_127nih_37254_40306),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_38143 (.out1(out_ui_rshift_expr_FU_64_0_64_109_i0_fu___float_mule8m23b_127nih_37254_38143),
    .in1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule8m23b_127nih_37254_38037),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38146 (.out1(out_ui_bit_and_expr_FU_1_0_1_55_i1_fu___float_mule8m23b_127nih_37254_38146),
    .in1(out_ui_rshift_expr_FU_64_0_64_109_i0_fu___float_mule8m23b_127nih_37254_38143),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(23),
    .BITSIZE_out1(23)) fu___float_mule8m23b_127nih_37254_38155 (.out1(out_ui_bit_and_expr_FU_32_0_32_59_i1_fu___float_mule8m23b_127nih_37254_38155),
    .in1(out_ui_rshift_expr_FU_64_0_64_113_i0_fu___float_mule8m23b_127nih_37254_40316),
    .in2(out_const_19));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38158 (.out1(out_ui_ne_expr_FU_32_0_32_99_i0_fu___float_mule8m23b_127nih_37254_38158),
    .in1(out_ui_rshift_expr_FU_32_0_32_105_i0_fu___float_mule8m23b_127nih_37254_40329),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38161 (.out1(out_UUdata_converter_FU_31_i0_fu___float_mule8m23b_127nih_37254_38161),
    .in1(out_ui_ne_expr_FU_32_0_32_99_i0_fu___float_mule8m23b_127nih_37254_38158));
  ui_bit_and_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38164 (.out1(out_ui_bit_and_expr_FU_1_0_1_55_i2_fu___float_mule8m23b_127nih_37254_38164),
    .in1(out_ui_rshift_expr_FU_64_0_64_108_i0_fu___float_mule8m23b_127nih_37254_38049),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38167 (.out1(out_ui_bit_ior_expr_FU_1_1_1_70_i1_fu___float_mule8m23b_127nih_37254_38167),
    .in1(out_UUdata_converter_FU_31_i0_fu___float_mule8m23b_127nih_37254_38161),
    .in2(out_ui_bit_and_expr_FU_1_0_1_55_i2_fu___float_mule8m23b_127nih_37254_38164));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38170 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i13_fu___float_mule8m23b_127nih_37254_38170),
    .in1(out_ui_bit_and_expr_FU_1_0_1_55_i1_fu___float_mule8m23b_127nih_37254_38146),
    .in2(out_ui_bit_ior_expr_FU_1_1_1_70_i1_fu___float_mule8m23b_127nih_37254_38167));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38173 (.out1(out_truth_and_expr_FU_1_0_1_46_i2_fu___float_mule8m23b_127nih_37254_38173),
    .in1(out_ui_extract_bit_expr_FU_32_i0_fu___float_mule8m23b_127nih_37254_40332),
    .in2(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38178 (.out1(out_UUdata_converter_FU_33_i0_fu___float_mule8m23b_127nih_37254_38178),
    .in1(out_truth_and_expr_FU_1_0_1_46_i2_fu___float_mule8m23b_127nih_37254_38173));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(33),
    .BITSIZE_out1(33)) fu___float_mule8m23b_127nih_37254_38181 (.out1(out_ui_plus_expr_FU_32_32_32_102_i0_fu___float_mule8m23b_127nih_37254_38181),
    .in1(out_UUdata_converter_FU_33_i0_fu___float_mule8m23b_127nih_37254_38178),
    .in2(out_ui_bit_and_expr_FU_64_0_64_62_i0_fu___float_mule8m23b_127nih_37254_38081));
  ui_rshift_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_38196 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule8m23b_127nih_37254_38196),
    .in1(out_ui_plus_expr_FU_32_32_32_102_i0_fu___float_mule8m23b_127nih_37254_38181),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_38199 (.out1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule8m23b_127nih_37254_38199),
    .in1(out_ui_bit_and_expr_FU_64_0_64_62_i0_fu___float_mule8m23b_127nih_37254_38081),
    .in2(out_const_2));
  ui_eq_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38202 (.out1(out_ui_eq_expr_FU_1_0_1_80_i0_fu___float_mule8m23b_127nih_37254_38202),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i1_fu___float_mule8m23b_127nih_37254_38199),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38205 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i14_fu___float_mule8m23b_127nih_37254_38205),
    .in1(out_truth_and_expr_FU_1_0_1_46_i2_fu___float_mule8m23b_127nih_37254_38173),
    .in2(out_ui_eq_expr_FU_1_0_1_80_i0_fu___float_mule8m23b_127nih_37254_38202));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38208 (.out1(out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_37254_38208),
    .in1(out_ui_bit_and_expr_FU_1_1_1_57_i14_fu___float_mule8m23b_127nih_37254_38205));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38211 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i15_fu___float_mule8m23b_127nih_37254_38211),
    .in1(out_ui_rshift_expr_FU_64_0_64_110_i0_fu___float_mule8m23b_127nih_37254_38196),
    .in2(out_UUdata_converter_FU_34_i0_fu___float_mule8m23b_127nih_37254_38208));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38214 (.out1(out_truth_and_expr_FU_1_0_1_46_i3_fu___float_mule8m23b_127nih_37254_38214),
    .in1(out_ui_extract_bit_expr_FU_35_i0_fu___float_mule8m23b_127nih_37254_40337),
    .in2(out_const_8));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38219 (.out1(out_ui_bit_xor_expr_FU_1_1_1_75_i1_fu___float_mule8m23b_127nih_37254_38219),
    .in1(out_truth_and_expr_FU_1_0_1_46_i3_fu___float_mule8m23b_127nih_37254_38214),
    .in2(out_truth_and_expr_FU_1_0_1_46_i1_fu___float_mule8m23b_127nih_37254_38092));
  ui_rshift_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(6),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_38228 (.out1(out_ui_rshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_37254_38228),
    .in1(out_ui_plus_expr_FU_32_32_32_102_i0_fu___float_mule8m23b_127nih_37254_38181),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_37254_38231 (.out1(out_ui_bit_and_expr_FU_8_0_8_63_i2_fu___float_mule8m23b_127nih_37254_38231),
    .in1(out_ui_rshift_expr_FU_64_0_64_111_i0_fu___float_mule8m23b_127nih_37254_38228),
    .in2(out_const_16));
  ui_eq_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38234 (.out1(out_ui_eq_expr_FU_8_0_8_82_i2_fu___float_mule8m23b_127nih_37254_38234),
    .in1(out_ui_bit_and_expr_FU_8_0_8_63_i2_fu___float_mule8m23b_127nih_37254_38231),
    .in2(out_const_16));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38237 (.out1(out_UUdata_converter_FU_36_i0_fu___float_mule8m23b_127nih_37254_38237),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i2_fu___float_mule8m23b_127nih_37254_38234));
  ui_rshift_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_38240 (.out1(out_ui_rshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_37254_38240),
    .in1(out_ui_plus_expr_FU_32_32_32_102_i0_fu___float_mule8m23b_127nih_37254_38181),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38243 (.out1(out_ui_bit_and_expr_FU_1_0_1_56_i0_fu___float_mule8m23b_127nih_37254_38243),
    .in1(out_ui_rshift_expr_FU_64_0_64_112_i0_fu___float_mule8m23b_127nih_37254_38240),
    .in2(out_const_8));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_38246 (.out1(out_UIconvert_expr_FU_37_i0_fu___float_mule8m23b_127nih_37254_38246),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_75_i1_fu___float_mule8m23b_127nih_37254_38219));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(32)) fu___float_mule8m23b_127nih_37254_38249 (.out1(out_lshift_expr_FU_8_0_8_45_i3_fu___float_mule8m23b_127nih_37254_38249),
    .in1(out_UIconvert_expr_FU_37_i0_fu___float_mule8m23b_127nih_37254_38246),
    .in2(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_38252 (.out1(out_IUdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_37254_38252),
    .in1(out_lshift_expr_FU_8_0_8_45_i3_fu___float_mule8m23b_127nih_37254_38249));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_38255 (.out1(out_ui_bit_ior_expr_FU_0_8_8_69_i0_fu___float_mule8m23b_127nih_37254_38255),
    .in1(out_IUdata_converter_FU_38_i0_fu___float_mule8m23b_127nih_37254_38252),
    .in2(out_ui_bit_and_expr_FU_1_0_1_56_i0_fu___float_mule8m23b_127nih_37254_38243));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_38258 (.out1(out_ui_bit_ior_expr_FU_8_8_8_72_i4_fu___float_mule8m23b_127nih_37254_38258),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_69_i0_fu___float_mule8m23b_127nih_37254_38255),
    .in2(out_UUdata_converter_FU_36_i0_fu___float_mule8m23b_127nih_37254_38237));
  ui_bit_and_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___float_mule8m23b_127nih_37254_38272 (.out1(out_ui_bit_and_expr_FU_32_0_32_60_i0_fu___float_mule8m23b_127nih_37254_38272),
    .in1(out_ui_plus_expr_FU_32_32_32_102_i0_fu___float_mule8m23b_127nih_37254_38181),
    .in2(out_const_21));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_37254_38275 (.out1(out_ui_bit_ior_expr_FU_0_32_32_67_i0_fu___float_mule8m23b_127nih_37254_38275),
    .in1(out_ui_bit_and_expr_FU_32_0_32_60_i0_fu___float_mule8m23b_127nih_37254_38272),
    .in2(out_ui_lshift_expr_FU_32_0_32_89_i0_fu___float_mule8m23b_127nih_37254_37379));
  ui_eq_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38287 (.out1(out_ui_eq_expr_FU_8_0_8_84_i0_fu___float_mule8m23b_127nih_37254_38287),
    .in1(out_ui_cond_expr_FU_8_8_8_8_79_i3_fu___float_mule8m23b_127nih_37254_40936),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38290 (.out1(out_ui_bit_and_expr_FU_1_0_1_53_i2_fu___float_mule8m23b_127nih_37254_38290),
    .in1(out_ui_eq_expr_FU_8_0_8_84_i0_fu___float_mule8m23b_127nih_37254_38287),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_37254_38334 (.out1(out_ui_bit_ior_expr_FU_32_0_32_71_i0_fu___float_mule8m23b_127nih_37254_38334),
    .in1(out_ui_lshift_expr_FU_32_0_32_89_i0_fu___float_mule8m23b_127nih_37254_37379),
    .in2(out_const_17));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38350 (.out1(out_ui_ne_expr_FU_32_0_32_100_i0_fu___float_mule8m23b_127nih_37254_38350),
    .in1(out_ui_bit_and_expr_FU_0_32_32_52_i0_fu___float_mule8m23b_127nih_37254_37317),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38353 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i16_fu___float_mule8m23b_127nih_37254_38353),
    .in1(out_ui_ne_expr_FU_32_0_32_100_i0_fu___float_mule8m23b_127nih_37254_38350),
    .in2(out_ui_eq_expr_FU_8_0_8_82_i0_fu___float_mule8m23b_127nih_37254_37410));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38360 (.out1(out_ui_ne_expr_FU_32_0_32_100_i1_fu___float_mule8m23b_127nih_37254_38360),
    .in1(out_ui_bit_and_expr_FU_0_32_32_52_i0_fu___float_mule8m23b_127nih_37254_37317),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38363 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i17_fu___float_mule8m23b_127nih_37254_38363),
    .in1(out_ui_ne_expr_FU_32_0_32_100_i1_fu___float_mule8m23b_127nih_37254_38360),
    .in2(out_ui_eq_expr_FU_8_0_8_82_i0_fu___float_mule8m23b_127nih_37254_37410));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38368 (.out1(out_ui_ne_expr_FU_32_0_32_100_i2_fu___float_mule8m23b_127nih_37254_38368),
    .in1(out_ui_bit_and_expr_FU_0_32_32_52_i1_fu___float_mule8m23b_127nih_37254_37352),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_38371 (.out1(out_ui_bit_and_expr_FU_1_1_1_57_i18_fu___float_mule8m23b_127nih_37254_38371),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i1_fu___float_mule8m23b_127nih_37254_37520),
    .in2(out_ui_ne_expr_FU_32_0_32_100_i2_fu___float_mule8m23b_127nih_37254_38368));
  ui_eq_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40026 (.out1(out_ui_eq_expr_FU_8_0_8_85_i0_fu___float_mule8m23b_127nih_37254_40026),
    .in1(out_IUdata_converter_FU_25_i0_fu___float_mule8m23b_127nih_37254_37709),
    .in2(out_const_8));
  ui_eq_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40028 (.out1(out_ui_eq_expr_FU_8_0_8_86_i0_fu___float_mule8m23b_127nih_37254_40028),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_72_i4_fu___float_mule8m23b_127nih_37254_38258),
    .in2(out_const_8));
  ui_eq_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40030 (.out1(out_ui_eq_expr_FU_8_0_8_87_i0_fu___float_mule8m23b_127nih_37254_40030),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_72_i4_fu___float_mule8m23b_127nih_37254_38258),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40032 (.out1(out_ui_eq_expr_FU_8_0_8_88_i0_fu___float_mule8m23b_127nih_37254_40032),
    .in1(out_IUdata_converter_FU_25_i0_fu___float_mule8m23b_127nih_37254_37709),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40040 (.out1(out_ui_ne_expr_FU_32_0_32_100_i3_fu___float_mule8m23b_127nih_37254_40040),
    .in1(out_ui_bit_and_expr_FU_0_32_32_52_i1_fu___float_mule8m23b_127nih_37254_37352),
    .in2(out_const_0));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40300 (.out1(out_truth_and_expr_FU_1_0_1_47_i0_fu___float_mule8m23b_127nih_37254_40300),
    .in1(out_truth_and_expr_FU_1_0_1_47_i2_fu___float_mule8m23b_127nih_37254_40358),
    .in2(out_const_8));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40306 (.out1(out_truth_and_expr_FU_1_0_1_47_i1_fu___float_mule8m23b_127nih_37254_40306),
    .in1(out_ui_extract_bit_expr_FU_30_i0_fu___float_mule8m23b_127nih_37254_40367),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_40316 (.out1(out_ui_rshift_expr_FU_64_0_64_113_i0_fu___float_mule8m23b_127nih_37254_40316),
    .in1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_mule8m23b_127nih_37254_38037),
    .in2(out_const_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(23),
    .BITSIZE_in2(1),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_40326 (.out1(out_ui_lshift_expr_FU_32_0_32_90_i0_fu___float_mule8m23b_127nih_37254_40326),
    .in1(out_ui_bit_and_expr_FU_32_0_32_59_i1_fu___float_mule8m23b_127nih_37254_38155),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(1),
    .BITSIZE_out1(23),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_40329 (.out1(out_ui_rshift_expr_FU_32_0_32_105_i0_fu___float_mule8m23b_127nih_37254_40329),
    .in1(out_ui_lshift_expr_FU_32_0_32_90_i0_fu___float_mule8m23b_127nih_37254_40326),
    .in2(out_const_8));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_37254_40332 (.out1(out_ui_extract_bit_expr_FU_32_i0_fu___float_mule8m23b_127nih_37254_40332),
    .in1(out_ui_bit_and_expr_FU_1_1_1_57_i13_fu___float_mule8m23b_127nih_37254_38170),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___float_mule8m23b_127nih_37254_40337 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu___float_mule8m23b_127nih_37254_40337),
    .in1(out_ui_bit_and_expr_FU_1_1_1_57_i15_fu___float_mule8m23b_127nih_37254_38211),
    .in2(out_const_0));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40358 (.out1(out_truth_and_expr_FU_1_0_1_47_i2_fu___float_mule8m23b_127nih_37254_40358),
    .in1(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_37254_40382),
    .in2(out_const_8));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(4)) fu___float_mule8m23b_127nih_37254_40367 (.out1(out_ui_extract_bit_expr_FU_30_i0_fu___float_mule8m23b_127nih_37254_40367),
    .in1(out_ui_plus_expr_FU_16_16_16_101_i0_fu___float_mule8m23b_127nih_37254_38015),
    .in2(out_const_11));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(6)) fu___float_mule8m23b_127nih_37254_40382 (.out1(out_ui_extract_bit_expr_FU_26_i0_fu___float_mule8m23b_127nih_37254_40382),
    .in1(out_ui_mult_expr_FU_32_32_32_0_97_i0_fu___float_mule8m23b_127nih_37254_37996),
    .in2(out_const_13));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40825 (.out1(out_truth_not_expr_FU_1_1_49_i11_fu___float_mule8m23b_127nih_37254_40825),
    .in1(out_ui_bit_and_expr_FU_1_0_1_53_i0_fu___float_mule8m23b_127nih_37254_37437));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40828 (.out1(out_truth_and_expr_FU_1_1_1_48_i0_fu___float_mule8m23b_127nih_37254_40828),
    .in1(out_truth_not_expr_FU_1_1_49_i11_fu___float_mule8m23b_127nih_37254_40825),
    .in2(out_ui_bit_and_expr_FU_1_1_1_57_i17_fu___float_mule8m23b_127nih_37254_38363));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40832 (.out1(out_truth_and_expr_FU_1_1_1_48_i1_fu___float_mule8m23b_127nih_37254_40832),
    .in1(out_ui_bit_and_expr_FU_1_0_1_53_i0_fu___float_mule8m23b_127nih_37254_37437),
    .in2(out_ui_bit_and_expr_FU_1_1_1_57_i16_fu___float_mule8m23b_127nih_37254_38353));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40835 (.out1(out_truth_not_expr_FU_1_1_49_i12_fu___float_mule8m23b_127nih_37254_40835),
    .in1(out_ui_bit_and_expr_FU_1_1_1_57_i16_fu___float_mule8m23b_127nih_37254_38353));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40838 (.out1(out_truth_and_expr_FU_1_1_1_48_i2_fu___float_mule8m23b_127nih_37254_40838),
    .in1(out_ui_bit_and_expr_FU_1_0_1_53_i0_fu___float_mule8m23b_127nih_37254_37437),
    .in2(out_truth_not_expr_FU_1_1_49_i12_fu___float_mule8m23b_127nih_37254_40835));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40842 (.out1(out_truth_not_expr_FU_1_1_49_i13_fu___float_mule8m23b_127nih_37254_40842),
    .in1(out_ui_bit_and_expr_FU_1_1_1_57_i4_fu___float_mule8m23b_127nih_37254_37539));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40845 (.out1(out_truth_and_expr_FU_1_1_1_48_i3_fu___float_mule8m23b_127nih_37254_40845),
    .in1(out_truth_not_expr_FU_1_1_49_i13_fu___float_mule8m23b_127nih_37254_40842),
    .in2(out_ui_bit_and_expr_FU_1_1_1_57_i18_fu___float_mule8m23b_127nih_37254_38371));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40849 (.out1(out_truth_and_expr_FU_1_1_1_48_i4_fu___float_mule8m23b_127nih_37254_40849),
    .in1(out_ui_bit_and_expr_FU_1_1_1_57_i4_fu___float_mule8m23b_127nih_37254_37539),
    .in2(out_ui_ne_expr_FU_32_0_32_100_i3_fu___float_mule8m23b_127nih_37254_40040));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40852 (.out1(out_truth_not_expr_FU_1_1_49_i14_fu___float_mule8m23b_127nih_37254_40852),
    .in1(out_ui_ne_expr_FU_32_0_32_100_i3_fu___float_mule8m23b_127nih_37254_40040));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40855 (.out1(out_truth_and_expr_FU_1_1_1_48_i5_fu___float_mule8m23b_127nih_37254_40855),
    .in1(out_truth_not_expr_FU_1_1_49_i14_fu___float_mule8m23b_127nih_37254_40852),
    .in2(out_ui_bit_and_expr_FU_1_1_1_57_i4_fu___float_mule8m23b_127nih_37254_37539));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40859 (.out1(out_truth_not_expr_FU_1_1_49_i15_fu___float_mule8m23b_127nih_37254_40859),
    .in1(out_ui_eq_expr_FU_8_0_8_85_i0_fu___float_mule8m23b_127nih_37254_40026));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40862 (.out1(out_truth_and_expr_FU_1_1_1_48_i6_fu___float_mule8m23b_127nih_37254_40862),
    .in1(out_ui_eq_expr_FU_8_0_8_88_i0_fu___float_mule8m23b_127nih_37254_40032),
    .in2(out_truth_not_expr_FU_1_1_49_i15_fu___float_mule8m23b_127nih_37254_40859));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40866 (.out1(out_truth_and_expr_FU_1_1_1_48_i7_fu___float_mule8m23b_127nih_37254_40866),
    .in1(out_ui_eq_expr_FU_8_0_8_85_i0_fu___float_mule8m23b_127nih_37254_40026),
    .in2(out_ui_eq_expr_FU_8_0_8_86_i0_fu___float_mule8m23b_127nih_37254_40028));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40869 (.out1(out_truth_not_expr_FU_1_1_49_i16_fu___float_mule8m23b_127nih_37254_40869),
    .in1(out_ui_eq_expr_FU_8_0_8_86_i0_fu___float_mule8m23b_127nih_37254_40028));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40872 (.out1(out_truth_and_expr_FU_1_1_1_48_i8_fu___float_mule8m23b_127nih_37254_40872),
    .in1(out_ui_eq_expr_FU_8_0_8_85_i0_fu___float_mule8m23b_127nih_37254_40026),
    .in2(out_truth_not_expr_FU_1_1_49_i16_fu___float_mule8m23b_127nih_37254_40869));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40876 (.out1(out_truth_and_expr_FU_1_1_1_48_i9_fu___float_mule8m23b_127nih_37254_40876),
    .in1(out_truth_and_expr_FU_1_1_1_48_i8_fu___float_mule8m23b_127nih_37254_40872),
    .in2(out_ui_eq_expr_FU_8_0_8_87_i0_fu___float_mule8m23b_127nih_37254_40030));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40879 (.out1(out_truth_not_expr_FU_1_1_49_i17_fu___float_mule8m23b_127nih_37254_40879),
    .in1(out_ui_eq_expr_FU_8_0_8_87_i0_fu___float_mule8m23b_127nih_37254_40030));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40882 (.out1(out_truth_and_expr_FU_1_1_1_48_i10_fu___float_mule8m23b_127nih_37254_40882),
    .in1(out_truth_and_expr_FU_1_1_1_48_i8_fu___float_mule8m23b_127nih_37254_40872),
    .in2(out_truth_not_expr_FU_1_1_49_i17_fu___float_mule8m23b_127nih_37254_40879));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40885 (.out1(out_truth_or_expr_FU_1_1_1_50_i0_fu___float_mule8m23b_127nih_37254_40885),
    .in1(out_truth_and_expr_FU_1_1_1_48_i2_fu___float_mule8m23b_127nih_37254_40838),
    .in2(out_truth_and_expr_FU_1_1_1_48_i0_fu___float_mule8m23b_127nih_37254_40828));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40889 (.out1(out_ui_cond_expr_FU_1_1_1_1_77_i0_fu___float_mule8m23b_127nih_37254_40889),
    .in1(out_truth_and_expr_FU_1_1_1_48_i2_fu___float_mule8m23b_127nih_37254_40838),
    .in2(out_ui_bit_and_expr_FU_1_1_1_57_i1_fu___float_mule8m23b_127nih_37254_37451),
    .in3(out_ui_bit_and_expr_FU_1_1_1_57_i2_fu___float_mule8m23b_127nih_37254_37457));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_40895 (.out1(out_ui_cond_expr_FU_8_8_8_8_79_i0_fu___float_mule8m23b_127nih_37254_40895),
    .in1(out_truth_and_expr_FU_1_1_1_48_i2_fu___float_mule8m23b_127nih_37254_40838),
    .in2(out_const_0),
    .in3(out_const_14));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40898 (.out1(out_truth_or_expr_FU_1_1_1_50_i1_fu___float_mule8m23b_127nih_37254_40898),
    .in1(out_truth_and_expr_FU_1_1_1_48_i9_fu___float_mule8m23b_127nih_37254_40876),
    .in2(out_truth_and_expr_FU_1_1_1_48_i6_fu___float_mule8m23b_127nih_37254_40862));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_37254_40901 (.out1(out_ui_cond_expr_FU_32_32_32_32_78_i0_fu___float_mule8m23b_127nih_37254_40901),
    .in1(out_truth_and_expr_FU_1_1_1_48_i9_fu___float_mule8m23b_127nih_37254_40876),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_67_i0_fu___float_mule8m23b_127nih_37254_38275),
    .in3(out_ui_lshift_expr_FU_32_0_32_89_i0_fu___float_mule8m23b_127nih_37254_37379));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(10),
    .BITSIZE_in3(10),
    .BITSIZE_out1(10)) fu___float_mule8m23b_127nih_37254_40904 (.out1(out_ui_cond_expr_FU_16_16_16_16_76_i0_fu___float_mule8m23b_127nih_37254_40904),
    .in1(out_ui_bit_and_expr_FU_1_0_1_53_i2_fu___float_mule8m23b_127nih_37254_38290),
    .in2(out_const_18),
    .in3(out_ui_rshift_expr_FU_32_0_32_106_i0_fu___float_mule8m23b_127nih_37254_40995));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40908 (.out1(out_ui_cond_expr_FU_1_1_1_1_77_i1_fu___float_mule8m23b_127nih_37254_40908),
    .in1(out_truth_or_expr_FU_1_1_1_50_i0_fu___float_mule8m23b_127nih_37254_40885),
    .in2(out_ui_cond_expr_FU_1_1_1_1_77_i0_fu___float_mule8m23b_127nih_37254_40889),
    .in3(out_ui_bit_and_expr_FU_1_1_1_57_i3_fu___float_mule8m23b_127nih_37254_37466));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40911 (.out1(out_ui_cond_expr_FU_1_1_1_1_77_i2_fu___float_mule8m23b_127nih_37254_40911),
    .in1(out_truth_or_expr_FU_1_1_1_50_i0_fu___float_mule8m23b_127nih_37254_40885),
    .in2(out_ui_rshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_37254_40961),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_40914 (.out1(out_ui_cond_expr_FU_8_8_8_8_79_i1_fu___float_mule8m23b_127nih_37254_40914),
    .in1(out_truth_or_expr_FU_1_1_1_50_i0_fu___float_mule8m23b_127nih_37254_40885),
    .in2(out_ui_cond_expr_FU_8_8_8_8_79_i0_fu___float_mule8m23b_127nih_37254_40895),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40917 (.out1(out_ui_cond_expr_FU_1_1_1_1_77_i3_fu___float_mule8m23b_127nih_37254_40917),
    .in1(out_truth_and_expr_FU_1_1_1_48_i5_fu___float_mule8m23b_127nih_37254_40855),
    .in2(out_const_0),
    .in3(out_ui_bit_and_expr_FU_1_1_1_57_i6_fu___float_mule8m23b_127nih_37254_37564));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40925 (.out1(out_ui_cond_expr_FU_1_1_1_1_77_i4_fu___float_mule8m23b_127nih_37254_40925),
    .in1(out_truth_and_expr_FU_1_1_1_48_i1_fu___float_mule8m23b_127nih_37254_40832),
    .in2(out_ui_bit_and_expr_FU_1_1_1_57_i2_fu___float_mule8m23b_127nih_37254_37457),
    .in3(out_ui_cond_expr_FU_1_1_1_1_77_i1_fu___float_mule8m23b_127nih_37254_40908));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40927 (.out1(out_ui_cond_expr_FU_1_1_1_1_77_i5_fu___float_mule8m23b_127nih_37254_40927),
    .in1(out_truth_and_expr_FU_1_1_1_48_i1_fu___float_mule8m23b_127nih_37254_40832),
    .in2(out_const_8),
    .in3(out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_37254_40968));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_40929 (.out1(out_ui_cond_expr_FU_8_8_8_8_79_i2_fu___float_mule8m23b_127nih_37254_40929),
    .in1(out_truth_and_expr_FU_1_1_1_48_i1_fu___float_mule8m23b_127nih_37254_40832),
    .in2(out_const_14),
    .in3(out_ui_cond_expr_FU_8_8_8_8_79_i1_fu___float_mule8m23b_127nih_37254_40914));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40932 (.out1(out_truth_or_expr_FU_1_1_1_50_i2_fu___float_mule8m23b_127nih_37254_40932),
    .in1(out_truth_and_expr_FU_1_1_1_48_i3_fu___float_mule8m23b_127nih_37254_40845),
    .in2(out_truth_and_expr_FU_1_1_1_48_i4_fu___float_mule8m23b_127nih_37254_40849));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_40936 (.out1(out_ui_cond_expr_FU_8_8_8_8_79_i3_fu___float_mule8m23b_127nih_37254_40936),
    .in1(out_truth_and_expr_FU_1_1_1_48_i7_fu___float_mule8m23b_127nih_37254_40866),
    .in2(out_const_9),
    .in3(out_IUdata_converter_FU_25_i0_fu___float_mule8m23b_127nih_37254_37709));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40939 (.out1(out_truth_or_expr_FU_1_1_1_50_i3_fu___float_mule8m23b_127nih_37254_40939),
    .in1(out_truth_or_expr_FU_1_1_1_50_i1_fu___float_mule8m23b_127nih_37254_40898),
    .in2(out_truth_and_expr_FU_1_1_1_48_i10_fu___float_mule8m23b_127nih_37254_40882));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_37254_40942 (.out1(out_ui_cond_expr_FU_32_32_32_32_78_i1_fu___float_mule8m23b_127nih_37254_40942),
    .in1(out_truth_or_expr_FU_1_1_1_50_i1_fu___float_mule8m23b_127nih_37254_40898),
    .in2(out_ui_cond_expr_FU_32_32_32_32_78_i0_fu___float_mule8m23b_127nih_37254_40901),
    .in3(out_ui_lshift_expr_FU_32_0_32_89_i0_fu___float_mule8m23b_127nih_37254_37379));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___float_mule8m23b_127nih_37254_40944 (.out1(out_ui_cond_expr_FU_32_32_32_32_78_i2_fu___float_mule8m23b_127nih_37254_40944),
    .in1(out_truth_or_expr_FU_1_1_1_50_i3_fu___float_mule8m23b_127nih_37254_40939),
    .in2(out_ui_cond_expr_FU_32_32_32_32_78_i1_fu___float_mule8m23b_127nih_37254_40942),
    .in3(out_ui_lshift_expr_FU_32_0_32_91_i0_fu___float_mule8m23b_127nih_37254_41001));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40946 (.out1(out_ui_cond_expr_FU_1_1_1_1_77_i6_fu___float_mule8m23b_127nih_37254_40946),
    .in1(out_truth_or_expr_FU_1_1_1_50_i2_fu___float_mule8m23b_127nih_37254_40932),
    .in2(out_ui_bit_and_expr_FU_1_1_1_57_i5_fu___float_mule8m23b_127nih_37254_37555),
    .in3(out_ui_cond_expr_FU_1_1_1_1_77_i3_fu___float_mule8m23b_127nih_37254_40917));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_40948 (.out1(out_ui_cond_expr_FU_1_1_1_1_77_i7_fu___float_mule8m23b_127nih_37254_40948),
    .in1(out_truth_or_expr_FU_1_1_1_50_i2_fu___float_mule8m23b_127nih_37254_40932),
    .in2(out_ui_rshift_expr_FU_8_0_8_115_i2_fu___float_mule8m23b_127nih_37254_40983),
    .in3(out_ui_rshift_expr_FU_8_0_8_115_i3_fu___float_mule8m23b_127nih_37254_40986));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule8m23b_127nih_37254_40950 (.out1(out_ui_cond_expr_FU_8_8_8_8_79_i4_fu___float_mule8m23b_127nih_37254_40950),
    .in1(out_truth_or_expr_FU_1_1_1_50_i2_fu___float_mule8m23b_127nih_37254_40932),
    .in2(out_const_14),
    .in3(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_37254_40952 (.out1(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule8m23b_127nih_37254_40952),
    .in1(out_UUconvert_expr_FU_2_i0_fu___float_mule8m23b_127nih_37254_37337));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu___float_mule8m23b_127nih_37254_40954 (.out1(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule8m23b_127nih_37254_40954),
    .in1(out_UUconvert_expr_FU_4_i0_fu___float_mule8m23b_127nih_37254_37363));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_40958 (.out1(out_ui_lshift_expr_FU_8_0_8_95_i0_fu___float_mule8m23b_127nih_37254_40958),
    .in1(out_ui_rshift_expr_FU_8_0_8_116_i0_fu___float_mule8m23b_127nih_37254_41011),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_40961 (.out1(out_ui_rshift_expr_FU_8_0_8_115_i0_fu___float_mule8m23b_127nih_37254_40961),
    .in1(out_ui_lshift_expr_FU_8_0_8_95_i0_fu___float_mule8m23b_127nih_37254_40958),
    .in2(out_const_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_40965 (.out1(out_ui_lshift_expr_FU_8_0_8_95_i1_fu___float_mule8m23b_127nih_37254_40965),
    .in1(out_ui_cond_expr_FU_1_1_1_1_77_i2_fu___float_mule8m23b_127nih_37254_40911),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_40968 (.out1(out_ui_rshift_expr_FU_8_0_8_115_i1_fu___float_mule8m23b_127nih_37254_40968),
    .in1(out_ui_lshift_expr_FU_8_0_8_95_i1_fu___float_mule8m23b_127nih_37254_40965),
    .in2(out_const_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_40972 (.out1(out_ui_lshift_expr_FU_8_0_8_95_i2_fu___float_mule8m23b_127nih_37254_40972),
    .in1(out_ui_cond_expr_FU_1_1_1_1_77_i5_fu___float_mule8m23b_127nih_37254_40927),
    .in2(out_const_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_40976 (.out1(out_ui_lshift_expr_FU_8_0_8_95_i3_fu___float_mule8m23b_127nih_37254_40976),
    .in1(out_ui_rshift_expr_FU_8_0_8_116_i1_fu___float_mule8m23b_127nih_37254_41020),
    .in2(out_const_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_40980 (.out1(out_ui_lshift_expr_FU_8_0_8_95_i4_fu___float_mule8m23b_127nih_37254_40980),
    .in1(out_ui_rshift_expr_FU_8_0_8_116_i2_fu___float_mule8m23b_127nih_37254_41032),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_40983 (.out1(out_ui_rshift_expr_FU_8_0_8_115_i2_fu___float_mule8m23b_127nih_37254_40983),
    .in1(out_ui_lshift_expr_FU_8_0_8_95_i4_fu___float_mule8m23b_127nih_37254_40980),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_40986 (.out1(out_ui_rshift_expr_FU_8_0_8_115_i3_fu___float_mule8m23b_127nih_37254_40986),
    .in1(out_ui_lshift_expr_FU_8_0_8_95_i3_fu___float_mule8m23b_127nih_37254_40976),
    .in2(out_const_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_40990 (.out1(out_ui_lshift_expr_FU_8_0_8_95_i5_fu___float_mule8m23b_127nih_37254_40990),
    .in1(out_ui_cond_expr_FU_1_1_1_1_77_i7_fu___float_mule8m23b_127nih_37254_40948),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_40995 (.out1(out_ui_rshift_expr_FU_32_0_32_106_i0_fu___float_mule8m23b_127nih_37254_40995),
    .in1(out_ui_bit_ior_expr_FU_32_0_32_71_i0_fu___float_mule8m23b_127nih_37254_38334),
    .in2(out_const_12));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule8m23b_127nih_37254_41001 (.out1(out_ui_lshift_expr_FU_32_0_32_91_i0_fu___float_mule8m23b_127nih_37254_41001),
    .in1(out_ui_cond_expr_FU_16_16_16_16_76_i0_fu___float_mule8m23b_127nih_37254_40904),
    .in2(out_const_12));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_41004 (.out1(out_UUdata_converter_FU_7_i0_fu___float_mule8m23b_127nih_37254_41004),
    .in1(out_truth_and_expr_FU_1_1_1_48_i2_fu___float_mule8m23b_127nih_37254_40838));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_41008 (.out1(out_ui_lshift_expr_FU_8_0_8_96_i0_fu___float_mule8m23b_127nih_37254_41008),
    .in1(out_UUdata_converter_FU_7_i0_fu___float_mule8m23b_127nih_37254_41004),
    .in2(out_const_15));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_41011 (.out1(out_ui_rshift_expr_FU_8_0_8_116_i0_fu___float_mule8m23b_127nih_37254_41011),
    .in1(out_ui_lshift_expr_FU_8_0_8_96_i0_fu___float_mule8m23b_127nih_37254_41008),
    .in2(out_const_15));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_41014 (.out1(out_UUdata_converter_FU_13_i0_fu___float_mule8m23b_127nih_37254_41014),
    .in1(out_truth_and_expr_FU_1_1_1_48_i5_fu___float_mule8m23b_127nih_37254_40855));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_41017 (.out1(out_ui_lshift_expr_FU_8_0_8_96_i1_fu___float_mule8m23b_127nih_37254_41017),
    .in1(out_UUdata_converter_FU_13_i0_fu___float_mule8m23b_127nih_37254_41014),
    .in2(out_const_15));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_41020 (.out1(out_ui_rshift_expr_FU_8_0_8_116_i1_fu___float_mule8m23b_127nih_37254_41020),
    .in1(out_ui_lshift_expr_FU_8_0_8_96_i1_fu___float_mule8m23b_127nih_37254_41017),
    .in2(out_const_15));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_41023 (.out1(out_truth_not_expr_FU_1_1_49_i18_fu___float_mule8m23b_127nih_37254_41023),
    .in1(out_truth_and_expr_FU_1_1_1_48_i3_fu___float_mule8m23b_127nih_37254_40845));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule8m23b_127nih_37254_41026 (.out1(out_UUdata_converter_FU_14_i0_fu___float_mule8m23b_127nih_37254_41026),
    .in1(out_truth_not_expr_FU_1_1_49_i18_fu___float_mule8m23b_127nih_37254_41023));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_41029 (.out1(out_ui_lshift_expr_FU_8_0_8_96_i2_fu___float_mule8m23b_127nih_37254_41029),
    .in1(out_UUdata_converter_FU_14_i0_fu___float_mule8m23b_127nih_37254_41026),
    .in2(out_const_15));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule8m23b_127nih_37254_41032 (.out1(out_ui_rshift_expr_FU_8_0_8_116_i2_fu___float_mule8m23b_127nih_37254_41032),
    .in1(out_ui_lshift_expr_FU_8_0_8_96_i2_fu___float_mule8m23b_127nih_37254_41029),
    .in2(out_const_15));
  // io-signal post fix
  assign return_port = out_conv_out_ui_cond_expr_FU_32_32_32_32_78_i2_fu___float_mule8m23b_127nih_37254_40944_32_64;

endmodule

// FSM based controller description for __float_mule8m23b_127nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___float_mule8m23b_127nih(done_port,
  clock,
  reset,
  start_port);
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  parameter [0:0] S_0 = 1'd0;
  reg [0:0] _present_state=S_0, _next_state;
  reg done_port;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          _next_state = S_0;
          done_port = 1'b1;
        end
        else
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

// Top component for __float_mule8m23b_127nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __float_mule8m23b_127nih(clock,
  reset,
  start_port,
  done_port,
  a,
  b,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [63:0] a;
  input [63:0] b;
  // OUT
  output done_port;
  output [63:0] return_port;
  // Component and signal declarations
  
  controller___float_mule8m23b_127nih Controller_i (.done_port(done_port),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___float_mule8m23b_127nih Datapath_i (.return_port(return_port),
    .clock(clock),
    .reset(reset),
    .in_port_a(a),
    .in_port_b(b));

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

// Datapath RTL description for matrix_convolution
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_matrix_convolution(clock,
  reset,
  in_port_A,
  in_port_kernel,
  in_port_B,
  in_port_size,
  in_port_kernel_size,
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
  fuselector_BMEMORY_CTRLN_65_i0_LOAD,
  fuselector_BMEMORY_CTRLN_65_i0_STORE,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34794,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34799,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34830,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34834,
  selector_MUX_100_reg_15_0_0_0,
  selector_MUX_104_reg_19_0_0_0,
  selector_MUX_109_reg_23_0_0_0,
  selector_MUX_110_reg_24_0_0_0,
  selector_MUX_110_reg_24_0_0_1,
  selector_MUX_111_reg_25_0_0_0,
  selector_MUX_113_reg_27_0_0_0,
  selector_MUX_114_reg_28_0_0_0,
  selector_MUX_118_reg_31_0_0_0,
  selector_MUX_120_reg_33_0_0_0,
  selector_MUX_128_reg_40_0_0_0,
  selector_MUX_131_reg_43_0_0_0,
  selector_MUX_133_reg_45_0_0_0,
  selector_MUX_136_reg_48_0_0_0,
  selector_MUX_136_reg_48_0_0_1,
  selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0,
  selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1,
  selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0,
  selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0,
  selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0,
  selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0,
  selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0,
  selector_MUX_99_reg_14_0_0_0,
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
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_39,
  wrenable_reg_4,
  wrenable_reg_40,
  wrenable_reg_41,
  wrenable_reg_42,
  wrenable_reg_43,
  wrenable_reg_44,
  wrenable_reg_45,
  wrenable_reg_46,
  wrenable_reg_47,
  wrenable_reg_48,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_matrix_convolution_33984_34675,
  OUT_CONDITION_matrix_convolution_33984_34757,
  OUT_CONDITION_matrix_convolution_33984_34891,
  OUT_CONDITION_matrix_convolution_33984_34895,
  OUT_CONDITION_matrix_convolution_33984_34912,
  OUT_CONDITION_matrix_convolution_33984_34917,
  OUT_CONDITION_matrix_convolution_33984_34925,
  OUT_CONDITION_matrix_convolution_33984_34939,
  OUT_CONDITION_matrix_convolution_33984_34941,
  OUT_CONDITION_matrix_convolution_33984_34943,
  OUT_UNBOUNDED_matrix_convolution_33984_34794,
  OUT_UNBOUNDED_matrix_convolution_33984_34799,
  OUT_UNBOUNDED_matrix_convolution_33984_34830,
  OUT_UNBOUNDED_matrix_convolution_33984_34834);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_kernel;
  input [31:0] in_port_B;
  input signed [31:0] in_port_size;
  input signed [31:0] in_port_kernel_size;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_65_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_65_i0_STORE;
  input selector_IN_UNBOUNDED_matrix_convolution_33984_34794;
  input selector_IN_UNBOUNDED_matrix_convolution_33984_34799;
  input selector_IN_UNBOUNDED_matrix_convolution_33984_34830;
  input selector_IN_UNBOUNDED_matrix_convolution_33984_34834;
  input selector_MUX_100_reg_15_0_0_0;
  input selector_MUX_104_reg_19_0_0_0;
  input selector_MUX_109_reg_23_0_0_0;
  input selector_MUX_110_reg_24_0_0_0;
  input selector_MUX_110_reg_24_0_0_1;
  input selector_MUX_111_reg_25_0_0_0;
  input selector_MUX_113_reg_27_0_0_0;
  input selector_MUX_114_reg_28_0_0_0;
  input selector_MUX_118_reg_31_0_0_0;
  input selector_MUX_120_reg_33_0_0_0;
  input selector_MUX_128_reg_40_0_0_0;
  input selector_MUX_131_reg_43_0_0_0;
  input selector_MUX_133_reg_45_0_0_0;
  input selector_MUX_136_reg_48_0_0_0;
  input selector_MUX_136_reg_48_0_0_1;
  input selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0;
  input selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1;
  input selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0;
  input selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0;
  input selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0;
  input selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0;
  input selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0;
  input selector_MUX_99_reg_14_0_0_0;
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
  input wrenable_reg_25;
  input wrenable_reg_26;
  input wrenable_reg_27;
  input wrenable_reg_28;
  input wrenable_reg_29;
  input wrenable_reg_3;
  input wrenable_reg_30;
  input wrenable_reg_31;
  input wrenable_reg_32;
  input wrenable_reg_33;
  input wrenable_reg_34;
  input wrenable_reg_35;
  input wrenable_reg_36;
  input wrenable_reg_37;
  input wrenable_reg_38;
  input wrenable_reg_39;
  input wrenable_reg_4;
  input wrenable_reg_40;
  input wrenable_reg_41;
  input wrenable_reg_42;
  input wrenable_reg_43;
  input wrenable_reg_44;
  input wrenable_reg_45;
  input wrenable_reg_46;
  input wrenable_reg_47;
  input wrenable_reg_48;
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
  output OUT_CONDITION_matrix_convolution_33984_34675;
  output OUT_CONDITION_matrix_convolution_33984_34757;
  output OUT_CONDITION_matrix_convolution_33984_34891;
  output OUT_CONDITION_matrix_convolution_33984_34895;
  output OUT_CONDITION_matrix_convolution_33984_34912;
  output OUT_CONDITION_matrix_convolution_33984_34917;
  output OUT_CONDITION_matrix_convolution_33984_34925;
  output OUT_CONDITION_matrix_convolution_33984_34939;
  output OUT_CONDITION_matrix_convolution_33984_34941;
  output OUT_CONDITION_matrix_convolution_33984_34943;
  output OUT_UNBOUNDED_matrix_convolution_33984_34794;
  output OUT_UNBOUNDED_matrix_convolution_33984_34799;
  output OUT_UNBOUNDED_matrix_convolution_33984_34830;
  output OUT_UNBOUNDED_matrix_convolution_33984_34834;
  // Component and signal declarations
  wire [31:0] null_out_signal_BMEMORY_CTRLN_65_i0_out1_1;
  wire signed [31:0] out_ASSIGN_SIGNED_FU_11_i0_fu_matrix_convolution_33984_41034;
  wire [31:0] out_BMEMORY_CTRLN_65_i0_BMEMORY_CTRLN_65_i0;
  wire [31:0] out_IUdata_converter_FU_12_i0_fu_matrix_convolution_33984_34692;
  wire [29:0] out_IUdata_converter_FU_14_i0_fu_matrix_convolution_33984_34701;
  wire [29:0] out_IUdata_converter_FU_24_i0_fu_matrix_convolution_33984_34814;
  wire [29:0] out_IUdata_converter_FU_49_i0_fu_matrix_convolution_33984_34844;
  wire [31:0] out_IUdata_converter_FU_6_i0_fu_matrix_convolution_33984_34690;
  wire [29:0] out_IUdata_converter_FU_7_i0_fu_matrix_convolution_33984_34694;
  wire [29:0] out_IUdata_converter_FU_8_i0_fu_matrix_convolution_33984_34696;
  wire [31:0] out_MUX_100_reg_15_0_0_0;
  wire [31:0] out_MUX_104_reg_19_0_0_0;
  wire [31:0] out_MUX_109_reg_23_0_0_0;
  wire [31:0] out_MUX_110_reg_24_0_0_0;
  wire [31:0] out_MUX_110_reg_24_0_0_1;
  wire [31:0] out_MUX_111_reg_25_0_0_0;
  wire [31:0] out_MUX_113_reg_27_0_0_0;
  wire [31:0] out_MUX_114_reg_28_0_0_0;
  wire [31:0] out_MUX_118_reg_31_0_0_0;
  wire [31:0] out_MUX_120_reg_33_0_0_0;
  wire [31:0] out_MUX_128_reg_40_0_0_0;
  wire [31:0] out_MUX_131_reg_43_0_0_0;
  wire [31:0] out_MUX_133_reg_45_0_0_0;
  wire [31:0] out_MUX_136_reg_48_0_0_0;
  wire [31:0] out_MUX_136_reg_48_0_0_1;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0;
  wire [63:0] out_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0;
  wire [63:0] out_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0;
  wire [63:0] out_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0;
  wire [63:0] out_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0;
  wire [31:0] out_MUX_99_reg_14_0_0_0;
  wire signed [31:0] out_UIdata_converter_FU_39_i0_fu_matrix_convolution_33984_34911;
  wire signed [31:0] out_UIdata_converter_FU_48_i0_fu_matrix_convolution_33984_34916;
  wire signed [1:0] out_UIdata_converter_FU_5_i0_fu_matrix_convolution_33984_40423;
  wire [31:0] out_UUdata_converter_FU_13_i0_fu_matrix_convolution_33984_34699;
  wire [31:0] out_UUdata_converter_FU_25_i0_fu_matrix_convolution_33984_39799;
  wire [31:0] out_UUdata_converter_FU_26_i0_fu_matrix_convolution_33984_39796;
  wire [31:0] out_UUdata_converter_FU_27_i0_fu_matrix_convolution_33984_39824;
  wire [31:0] out_UUdata_converter_FU_28_i0_fu_matrix_convolution_33984_39827;
  wire [31:0] out_UUdata_converter_FU_29_i0_fu_matrix_convolution_33984_39821;
  wire [31:0] out_UUdata_converter_FU_2_i0_fu_matrix_convolution_33984_39792;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu_matrix_convolution_33984_39789;
  wire [31:0] out_UUdata_converter_FU_40_i0_fu_matrix_convolution_33984_34860;
  wire [31:0] out_UUdata_converter_FU_41_i0_fu_matrix_convolution_33984_34842;
  wire [31:0] out_UUdata_converter_FU_42_i0_fu_matrix_convolution_33984_34807;
  wire [31:0] out_UUdata_converter_FU_4_i0_fu_matrix_convolution_33984_39786;
  wire [31:0] out_UUdata_converter_FU_50_i0_fu_matrix_convolution_33984_39877;
  wire [31:0] out_UUdata_converter_FU_54_i0_fu_matrix_convolution_33984_39849;
  wire [31:0] out_UUdata_converter_FU_55_i0_fu_matrix_convolution_33984_39852;
  wire [31:0] out_UUdata_converter_FU_56_i0_fu_matrix_convolution_33984_39846;
  wire [31:0] out_UUdata_converter_FU_57_i0_fu_matrix_convolution_33984_39874;
  wire [31:0] out_UUdata_converter_FU_58_i0_fu_matrix_convolution_33984_39871;
  wire [31:0] out_UUdata_converter_FU_64_i0_fu_matrix_convolution_33984_34867;
  wire [63:0] out___float_adde8m23b_127nih_91_i0___float_adde8m23b_127nih_91_i0;
  wire [63:0] out___float_mule8m23b_127nih_92_i0___float_mule8m23b_127nih_92_i0;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [6:0] out_const_2;
  wire [5:0] out_const_3;
  wire out_const_4;
  wire [1:0] out_const_5;
  wire [1:0] out_const_6;
  wire [63:0] out_conv_out_UUdata_converter_FU_25_i0_fu_matrix_convolution_33984_39799_32_64;
  wire [63:0] out_conv_out_UUdata_converter_FU_27_i0_fu_matrix_convolution_33984_39824_32_64;
  wire [63:0] out_conv_out_UUdata_converter_FU_54_i0_fu_matrix_convolution_33984_39849_32_64;
  wire [63:0] out_conv_out_UUdata_converter_FU_57_i0_fu_matrix_convolution_33984_39874_32_64;
  wire [31:0] out_conv_out___float_adde8m23b_127nih_91_i0___float_adde8m23b_127nih_91_i0_64_32;
  wire [31:0] out_conv_out___float_mule8m23b_127nih_92_i0___float_mule8m23b_127nih_92_i0_64_32;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [63:0] out_conv_out_const_0_1_64;
  wire [5:0] out_conv_out_const_2_7_6;
  wire [63:0] out_conv_out_reg_39_reg_39_32_64;
  wire [63:0] out_conv_out_reg_42_reg_42_32_64;
  wire [63:0] out_conv_out_reg_47_reg_47_32_64;
  wire out_ge_expr_FU_32_32_32_66_i0_fu_matrix_convolution_33984_37239;
  wire out_ge_expr_FU_32_32_32_66_i1_fu_matrix_convolution_33984_37241;
  wire out_ge_expr_FU_32_32_32_66_i2_fu_matrix_convolution_33984_37243;
  wire out_ge_expr_FU_32_32_32_66_i3_fu_matrix_convolution_33984_37247;
  wire out_gt_expr_FU_32_0_32_67_i0_fu_matrix_convolution_33984_37237;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_68_i0_fu_matrix_convolution_33984_40427;
  wire out_lt_expr_FU_32_0_32_69_i0_fu_matrix_convolution_33984_37168;
  wire out_lt_expr_FU_32_0_32_70_i0_fu_matrix_convolution_33984_37198;
  wire out_lt_expr_FU_32_0_32_70_i1_fu_matrix_convolution_33984_37200;
  wire out_lt_expr_FU_32_32_32_71_i0_fu_matrix_convolution_33984_34922;
  wire out_lt_expr_FU_32_32_32_71_i1_fu_matrix_convolution_33984_34923;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_72_i0_fu_matrix_convolution_33984_34700;
  wire signed [31:0] out_negate_expr_FU_32_32_73_i0_fu_matrix_convolution_33984_34689;
  wire signed [31:0] out_plus_expr_FU_32_0_32_74_i0_fu_matrix_convolution_33984_34821;
  wire signed [31:0] out_plus_expr_FU_32_0_32_74_i1_fu_matrix_convolution_33984_34849;
  wire signed [31:0] out_plus_expr_FU_32_0_32_74_i2_fu_matrix_convolution_33984_34893;
  wire signed [31:0] out_plus_expr_FU_32_0_32_75_i0_fu_matrix_convolution_33984_34921;
  wire signed [31:0] out_plus_expr_FU_32_32_32_76_i0_fu_matrix_convolution_33984_37175;
  wire out_read_cond_FU_18_i0_fu_matrix_convolution_33984_34757;
  wire out_read_cond_FU_30_i0_fu_matrix_convolution_33984_34891;
  wire out_read_cond_FU_33_i0_fu_matrix_convolution_33984_34895;
  wire out_read_cond_FU_43_i0_fu_matrix_convolution_33984_34912;
  wire out_read_cond_FU_51_i0_fu_matrix_convolution_33984_34917;
  wire out_read_cond_FU_53_i0_fu_matrix_convolution_33984_34925;
  wire out_read_cond_FU_59_i0_fu_matrix_convolution_33984_34939;
  wire out_read_cond_FU_61_i0_fu_matrix_convolution_33984_34941;
  wire out_read_cond_FU_62_i0_fu_matrix_convolution_33984_34943;
  wire out_read_cond_FU_9_i0_fu_matrix_convolution_33984_34675;
  wire [30:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [31:0] out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire [29:0] out_reg_16_reg_16;
  wire [29:0] out_reg_17_reg_17;
  wire [31:0] out_reg_18_reg_18;
  wire [31:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire [31:0] out_reg_24_reg_24;
  wire [31:0] out_reg_25_reg_25;
  wire [31:0] out_reg_26_reg_26;
  wire [31:0] out_reg_27_reg_27;
  wire [31:0] out_reg_28_reg_28;
  wire [31:0] out_reg_29_reg_29;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_30_reg_30;
  wire [31:0] out_reg_31_reg_31;
  wire [31:0] out_reg_32_reg_32;
  wire [31:0] out_reg_33_reg_33;
  wire [31:0] out_reg_34_reg_34;
  wire [31:0] out_reg_35_reg_35;
  wire out_reg_36_reg_36;
  wire [31:0] out_reg_37_reg_37;
  wire [31:0] out_reg_38_reg_38;
  wire [31:0] out_reg_39_reg_39;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_40_reg_40;
  wire out_reg_41_reg_41;
  wire [31:0] out_reg_42_reg_42;
  wire [31:0] out_reg_43_reg_43;
  wire [31:0] out_reg_44_reg_44;
  wire [31:0] out_reg_45_reg_45;
  wire out_reg_46_reg_46;
  wire [31:0] out_reg_47_reg_47;
  wire [31:0] out_reg_48_reg_48;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [29:0] out_reg_7_reg_7;
  wire [29:0] out_reg_8_reg_8;
  wire [29:0] out_reg_9_reg_9;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_77_i0_fu_matrix_convolution_33984_34674;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_78_i0_fu_matrix_convolution_33984_40430;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_79_i0_fu_matrix_convolution_33984_40450;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_79_i1_fu_matrix_convolution_33984_40466;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_80_i0_fu_matrix_convolution_33984_34812;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_80_i1_fu_matrix_convolution_33984_34877;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_81_i0_fu_matrix_convolution_33984_34924;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_82_i0_fu_matrix_convolution_33984_34691;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_82_i1_fu_matrix_convolution_33984_34695;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_82_i2_fu_matrix_convolution_33984_34697;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_82_i3_fu_matrix_convolution_33984_37192;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_82_i4_fu_matrix_convolution_33984_37209;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_82_i5_fu_matrix_convolution_33984_37220;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_82_i6_fu_matrix_convolution_33984_37231;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_82_i7_fu_matrix_convolution_33984_40478;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_82_i8_fu_matrix_convolution_33984_40489;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_82_i9_fu_matrix_convolution_33984_40500;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_83_i0_fu_matrix_convolution_33984_34702;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_83_i1_fu_matrix_convolution_33984_34703;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_83_i2_fu_matrix_convolution_33984_40446;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_83_i3_fu_matrix_convolution_33984_40463;
  wire [29:0] out_ui_minus_expr_FU_32_32_32_84_i0_fu_matrix_convolution_33984_40497;
  wire out_ui_ne_expr_FU_32_32_32_85_i0_fu_matrix_convolution_33984_37249;
  wire out_ui_ne_expr_FU_32_32_32_85_i1_fu_matrix_convolution_33984_37251;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_86_i0_fu_matrix_convolution_33984_34883;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_86_i1_fu_matrix_convolution_33984_34888;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_86_i2_fu_matrix_convolution_33984_34894;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_86_i3_fu_matrix_convolution_33984_34908;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_87_i0_fu_matrix_convolution_33984_34693;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_87_i1_fu_matrix_convolution_33984_40443;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_87_i2_fu_matrix_convolution_33984_40460;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_87_i3_fu_matrix_convolution_33984_40475;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_87_i4_fu_matrix_convolution_33984_40486;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_88_i0_fu_matrix_convolution_33984_34698;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_88_i1_fu_matrix_convolution_33984_34770;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_88_i2_fu_matrix_convolution_33984_34870;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_88_i3_fu_matrix_convolution_33984_37195;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_88_i4_fu_matrix_convolution_33984_37212;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_88_i5_fu_matrix_convolution_33984_37223;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_88_i6_fu_matrix_convolution_33984_37234;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_89_i0_fu_matrix_convolution_33984_40434;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_89_i1_fu_matrix_convolution_33984_40439;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_89_i2_fu_matrix_convolution_33984_40455;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_89_i3_fu_matrix_convolution_33984_40458;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_90_i0_fu_matrix_convolution_33984_40470;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_90_i1_fu_matrix_convolution_33984_40473;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_90_i2_fu_matrix_convolution_33984_40481;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_90_i3_fu_matrix_convolution_33984_40484;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_90_i4_fu_matrix_convolution_33984_40492;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_90_i5_fu_matrix_convolution_33984_40495;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [31:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [31:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  wire s___float_adde8m23b_127nih_91_i00;
  wire s___float_mule8m23b_127nih_92_i01;
  wire s_done___float_adde8m23b_127nih_91_i0;
  wire s_done___float_mule8m23b_127nih_92_i0;
  
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_65_i0 (.out1({null_out_signal_BMEMORY_CTRLN_65_i0_out1_1,
      out_BMEMORY_CTRLN_65_i0_BMEMORY_CTRLN_65_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({32'b00000000000000000000000000000000,
      out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0}),
    .in3({6'b000000,
      out_conv_out_const_2_7_6}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_65_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_65_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_100_reg_15_0_0_0 (.out1(out_MUX_100_reg_15_0_0_0),
    .sel(selector_MUX_100_reg_15_0_0_0),
    .in1(out_reg_21_reg_21),
    .in2(out_IUdata_converter_FU_12_i0_fu_matrix_convolution_33984_34692));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_104_reg_19_0_0_0 (.out1(out_MUX_104_reg_19_0_0_0),
    .sel(selector_MUX_104_reg_19_0_0_0),
    .in1(out_reg_26_reg_26),
    .in2(out_reg_11_reg_11));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_109_reg_23_0_0_0 (.out1(out_MUX_109_reg_23_0_0_0),
    .sel(selector_MUX_109_reg_23_0_0_0),
    .in1(out_reg_13_reg_13),
    .in2(out_ui_bit_ior_concat_expr_FU_80_i0_fu_matrix_convolution_33984_34812));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_110_reg_24_0_0_0 (.out1(out_MUX_110_reg_24_0_0_0),
    .sel(selector_MUX_110_reg_24_0_0_0),
    .in1(out_reg_48_reg_48),
    .in2(out_UUdata_converter_FU_58_i0_fu_matrix_convolution_33984_39871));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_110_reg_24_0_0_1 (.out1(out_MUX_110_reg_24_0_0_1),
    .sel(selector_MUX_110_reg_24_0_0_1),
    .in1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in2(out_MUX_110_reg_24_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_111_reg_25_0_0_0 (.out1(out_MUX_111_reg_25_0_0_0),
    .sel(selector_MUX_111_reg_25_0_0_0),
    .in1(out_reg_20_reg_20),
    .in2(out_ui_bit_ior_concat_expr_FU_80_i1_fu_matrix_convolution_33984_34877));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_113_reg_27_0_0_0 (.out1(out_MUX_113_reg_27_0_0_0),
    .sel(selector_MUX_113_reg_27_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_plus_expr_FU_32_0_32_74_i2_fu_matrix_convolution_33984_34893));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_114_reg_28_0_0_0 (.out1(out_MUX_114_reg_28_0_0_0),
    .sel(selector_MUX_114_reg_28_0_0_0),
    .in1(out_reg_15_reg_15),
    .in2(out_ui_plus_expr_FU_32_0_32_86_i2_fu_matrix_convolution_33984_34894));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_118_reg_31_0_0_0 (.out1(out_MUX_118_reg_31_0_0_0),
    .sel(selector_MUX_118_reg_31_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_plus_expr_FU_32_0_32_74_i1_fu_matrix_convolution_33984_34849));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_120_reg_33_0_0_0 (.out1(out_MUX_120_reg_33_0_0_0),
    .sel(selector_MUX_120_reg_33_0_0_0),
    .in1(out_reg_19_reg_19),
    .in2(out_ui_plus_expr_FU_32_0_32_86_i0_fu_matrix_convolution_33984_34883));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_128_reg_40_0_0_0 (.out1(out_MUX_128_reg_40_0_0_0),
    .sel(selector_MUX_128_reg_40_0_0_0),
    .in1(out_BMEMORY_CTRLN_65_i0_BMEMORY_CTRLN_65_i0),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_131_reg_43_0_0_0 (.out1(out_MUX_131_reg_43_0_0_0),
    .sel(selector_MUX_131_reg_43_0_0_0),
    .in1(out_reg_24_reg_24),
    .in2(out_UUdata_converter_FU_29_i0_fu_matrix_convolution_33984_39821));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_133_reg_45_0_0_0 (.out1(out_MUX_133_reg_45_0_0_0),
    .sel(selector_MUX_133_reg_45_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_plus_expr_FU_32_0_32_74_i0_fu_matrix_convolution_33984_34821));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_136_reg_48_0_0_0 (.out1(out_MUX_136_reg_48_0_0_0),
    .sel(selector_MUX_136_reg_48_0_0_0),
    .in1(out_UUdata_converter_FU_29_i0_fu_matrix_convolution_33984_39821),
    .in2(out_UUdata_converter_FU_58_i0_fu_matrix_convolution_33984_39871));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_136_reg_48_0_0_1 (.out1(out_MUX_136_reg_48_0_0_1),
    .sel(selector_MUX_136_reg_48_0_0_1),
    .in1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in2(out_MUX_136_reg_48_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_65_i0_1_0_0 (.out1(out_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0),
    .sel(selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0),
    .in1(out_reg_38_reg_38),
    .in2(out_reg_37_reg_37));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_65_i0_1_0_1 (.out1(out_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1),
    .sel(selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1),
    .in1(out_reg_29_reg_29),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_88_i3_fu_matrix_convolution_33984_37195));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_65_i0_1_1_0 (.out1(out_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0),
    .sel(selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0),
    .in1(out_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0),
    .in2(out_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_44___float_adde8m23b_127nih_91_i0_0_0_0 (.out1(out_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0),
    .sel(selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0),
    .in1(out_conv_out_UUdata_converter_FU_27_i0_fu_matrix_convolution_33984_39824_32_64),
    .in2(out_conv_out_UUdata_converter_FU_57_i0_fu_matrix_convolution_33984_39874_32_64));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_45___float_adde8m23b_127nih_91_i0_1_0_0 (.out1(out_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0),
    .sel(selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0),
    .in1(out_conv_out_reg_47_reg_47_32_64),
    .in2(out_conv_out_reg_39_reg_39_32_64));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_46___float_mule8m23b_127nih_92_i0_0_0_0 (.out1(out_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0),
    .sel(selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0),
    .in1(out_conv_out_UUdata_converter_FU_25_i0_fu_matrix_convolution_33984_39799_32_64),
    .in2(out_conv_out_UUdata_converter_FU_54_i0_fu_matrix_convolution_33984_39849_32_64));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_47___float_mule8m23b_127nih_92_i0_1_0_0 (.out1(out_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0),
    .sel(selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0),
    .in1(out_conv_out_reg_42_reg_42_32_64),
    .in2(out_conv_out_const_0_1_64));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_99_reg_14_0_0_0 (.out1(out_MUX_99_reg_14_0_0_0),
    .sel(selector_MUX_99_reg_14_0_0_0),
    .in1(out_ui_lshift_expr_FU_32_0_32_82_i7_fu_matrix_convolution_33984_40478),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2),
    .in1(out_reg_48_reg_48));
  __float_adde8m23b_127nih __float_adde8m23b_127nih_91_i0 (.done_port(s_done___float_adde8m23b_127nih_91_i0),
    .return_port(out___float_adde8m23b_127nih_91_i0___float_adde8m23b_127nih_91_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___float_adde8m23b_127nih_91_i00),
    .a(out_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0),
    .b(out_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0));
  __float_mule8m23b_127nih __float_mule8m23b_127nih_92_i0 (.done_port(s_done___float_mule8m23b_127nih_92_i0),
    .return_port(out___float_mule8m23b_127nih_92_i0___float_mule8m23b_127nih_92_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___float_mule8m23b_127nih_92_i01),
    .a(out_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0),
    .b(out_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011110)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_6 (.out1(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_UUdata_converter_FU_25_i0_fu_matrix_convolution_33984_39799_32_64 (.out1(out_conv_out_UUdata_converter_FU_25_i0_fu_matrix_convolution_33984_39799_32_64),
    .in1(out_UUdata_converter_FU_25_i0_fu_matrix_convolution_33984_39799));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_UUdata_converter_FU_27_i0_fu_matrix_convolution_33984_39824_32_64 (.out1(out_conv_out_UUdata_converter_FU_27_i0_fu_matrix_convolution_33984_39824_32_64),
    .in1(out_UUdata_converter_FU_27_i0_fu_matrix_convolution_33984_39824));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_UUdata_converter_FU_54_i0_fu_matrix_convolution_33984_39849_32_64 (.out1(out_conv_out_UUdata_converter_FU_54_i0_fu_matrix_convolution_33984_39849_32_64),
    .in1(out_UUdata_converter_FU_54_i0_fu_matrix_convolution_33984_39849));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_UUdata_converter_FU_57_i0_fu_matrix_convolution_33984_39874_32_64 (.out1(out_conv_out_UUdata_converter_FU_57_i0_fu_matrix_convolution_33984_39874_32_64),
    .in1(out_UUdata_converter_FU_57_i0_fu_matrix_convolution_33984_39874));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_out___float_adde8m23b_127nih_91_i0___float_adde8m23b_127nih_91_i0_64_32 (.out1(out_conv_out___float_adde8m23b_127nih_91_i0___float_adde8m23b_127nih_91_i0_64_32),
    .in1(out___float_adde8m23b_127nih_91_i0___float_adde8m23b_127nih_91_i0));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(32)) conv_out___float_mule8m23b_127nih_92_i0___float_mule8m23b_127nih_92_i0_64_32 (.out1(out_conv_out___float_mule8m23b_127nih_92_i0___float_mule8m23b_127nih_92_i0_64_32),
    .in1(out___float_mule8m23b_127nih_92_i0___float_mule8m23b_127nih_92_i0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(64)) conv_out_const_0_1_64 (.out1(out_conv_out_const_0_1_64),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_2_7_6 (.out1(out_conv_out_const_2_7_6),
    .in1(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_39_reg_39_32_64 (.out1(out_conv_out_reg_39_reg_39_32_64),
    .in1(out_reg_39_reg_39));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_42_reg_42_32_64 (.out1(out_conv_out_reg_42_reg_42_32_64),
    .in1(out_reg_42_reg_42));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(64)) conv_out_reg_47_reg_47_32_64 (.out1(out_conv_out_reg_47_reg_47_32_64),
    .in1(out_reg_47_reg_47));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_matrix_convolution_33984_34674 (.out1(out_rshift_expr_FU_32_0_32_77_i0_fu_matrix_convolution_33984_34674),
    .in1(out_plus_expr_FU_32_32_32_76_i0_fu_matrix_convolution_33984_37175),
    .in2(out_const_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34675 (.out1(out_read_cond_FU_9_i0_fu_matrix_convolution_33984_34675),
    .in1(out_gt_expr_FU_32_0_32_67_i0_fu_matrix_convolution_33984_37237));
  negate_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34689 (.out1(out_negate_expr_FU_32_32_73_i0_fu_matrix_convolution_33984_34689),
    .in1(out_reg_0_reg_0));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34690 (.out1(out_IUdata_converter_FU_6_i0_fu_matrix_convolution_33984_34690),
    .in1(in_port_size));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_34691 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i0_fu_matrix_convolution_33984_34691),
    .in1(out_IUdata_converter_FU_6_i0_fu_matrix_convolution_33984_34690),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34692 (.out1(out_IUdata_converter_FU_12_i0_fu_matrix_convolution_33984_34692),
    .in1(out_negate_expr_FU_32_32_73_i0_fu_matrix_convolution_33984_34689));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34693 (.out1(out_ui_plus_expr_FU_32_32_32_87_i0_fu_matrix_convolution_33984_34693),
    .in1(out_reg_1_reg_1),
    .in2(out_IUdata_converter_FU_12_i0_fu_matrix_convolution_33984_34692));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_matrix_convolution_33984_34694 (.out1(out_IUdata_converter_FU_7_i0_fu_matrix_convolution_33984_34694),
    .in1(in_port_kernel_size));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_34695 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i1_fu_matrix_convolution_33984_34695),
    .in1(out_IUdata_converter_FU_7_i0_fu_matrix_convolution_33984_34694),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(30)) fu_matrix_convolution_33984_34696 (.out1(out_IUdata_converter_FU_8_i0_fu_matrix_convolution_33984_34696),
    .in1(out_rshift_expr_FU_32_0_32_77_i0_fu_matrix_convolution_33984_34674));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_34697 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i2_fu_matrix_convolution_33984_34697),
    .in1(out_IUdata_converter_FU_8_i0_fu_matrix_convolution_33984_34696),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_34698 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_88_i0_fu_matrix_convolution_33984_34698),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_2_reg_2));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34699 (.out1(out_UUdata_converter_FU_13_i0_fu_matrix_convolution_33984_34699),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_88_i0_fu_matrix_convolution_33984_34698));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_matrix_convolution_33984_34700 (.out1(out_mult_expr_FU_32_32_32_0_72_i0_fu_matrix_convolution_33984_34700),
    .clock(clock),
    .in1(out_ASSIGN_SIGNED_FU_11_i0_fu_matrix_convolution_33984_41034),
    .in2(in_port_size));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_matrix_convolution_33984_34701 (.out1(out_IUdata_converter_FU_14_i0_fu_matrix_convolution_33984_34701),
    .in1(out_mult_expr_FU_32_32_32_0_72_i0_fu_matrix_convolution_33984_34700));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_34702 (.out1(out_ui_lshift_expr_FU_32_0_32_83_i0_fu_matrix_convolution_33984_34702),
    .in1(out_IUdata_converter_FU_14_i0_fu_matrix_convolution_33984_34701),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_34703 (.out1(out_ui_lshift_expr_FU_32_0_32_83_i1_fu_matrix_convolution_33984_34703),
    .in1(out_IUdata_converter_FU_12_i0_fu_matrix_convolution_33984_34692),
    .in2(out_const_5));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34757 (.out1(out_read_cond_FU_18_i0_fu_matrix_convolution_33984_34757),
    .in1(out_reg_22_reg_22));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_34770 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_88_i1_fu_matrix_convolution_33984_34770),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_lshift_expr_FU_32_0_32_82_i9_fu_matrix_convolution_33984_40500));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34807 (.out1(out_UUdata_converter_FU_42_i0_fu_matrix_convolution_33984_34807),
    .in1(out_reg_23_reg_23));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_matrix_convolution_33984_34812 (.out1(out_ui_bit_ior_concat_expr_FU_80_i0_fu_matrix_convolution_33984_34812),
    .in1(out_ui_lshift_expr_FU_32_0_32_83_i2_fu_matrix_convolution_33984_40446),
    .in2(out_ui_bit_and_expr_FU_8_0_8_79_i0_fu_matrix_convolution_33984_40450),
    .in3(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_matrix_convolution_33984_34814 (.out1(out_IUdata_converter_FU_24_i0_fu_matrix_convolution_33984_34814),
    .in1(out_reg_45_reg_45));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34821 (.out1(out_plus_expr_FU_32_0_32_74_i0_fu_matrix_convolution_33984_34821),
    .in1(out_reg_45_reg_45),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34842 (.out1(out_UUdata_converter_FU_41_i0_fu_matrix_convolution_33984_34842),
    .in1(out_reg_23_reg_23));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_matrix_convolution_33984_34844 (.out1(out_IUdata_converter_FU_49_i0_fu_matrix_convolution_33984_34844),
    .in1(out_reg_31_reg_31));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34849 (.out1(out_plus_expr_FU_32_0_32_74_i1_fu_matrix_convolution_33984_34849),
    .in1(out_reg_31_reg_31),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34860 (.out1(out_UUdata_converter_FU_40_i0_fu_matrix_convolution_33984_34860),
    .in1(out_reg_25_reg_25));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34867 (.out1(out_UUdata_converter_FU_64_i0_fu_matrix_convolution_33984_34867),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_88_i2_fu_matrix_convolution_33984_34870));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_34870 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_88_i2_fu_matrix_convolution_33984_34870),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_lshift_expr_FU_32_0_32_82_i8_fu_matrix_convolution_33984_40489));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_matrix_convolution_33984_34877 (.out1(out_ui_bit_ior_concat_expr_FU_80_i1_fu_matrix_convolution_33984_34877),
    .in1(out_ui_lshift_expr_FU_32_0_32_83_i3_fu_matrix_convolution_33984_40463),
    .in2(out_ui_bit_and_expr_FU_8_0_8_79_i1_fu_matrix_convolution_33984_40466),
    .in3(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34883 (.out1(out_ui_plus_expr_FU_32_0_32_86_i0_fu_matrix_convolution_33984_34883),
    .in1(out_reg_33_reg_33),
    .in2(out_const_4));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34888 (.out1(out_ui_plus_expr_FU_32_0_32_86_i1_fu_matrix_convolution_33984_34888),
    .in1(out_reg_19_reg_19),
    .in2(out_const_4));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34891 (.out1(out_read_cond_FU_30_i0_fu_matrix_convolution_33984_34891),
    .in1(out_reg_46_reg_46));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34893 (.out1(out_plus_expr_FU_32_0_32_74_i2_fu_matrix_convolution_33984_34893),
    .in1(out_reg_27_reg_27),
    .in2(out_const_1));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34894 (.out1(out_ui_plus_expr_FU_32_0_32_86_i2_fu_matrix_convolution_33984_34894),
    .in1(out_reg_28_reg_28),
    .in2(out_const_4));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34895 (.out1(out_read_cond_FU_33_i0_fu_matrix_convolution_33984_34895),
    .in1(out_ge_expr_FU_32_32_32_66_i2_fu_matrix_convolution_33984_37243));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34908 (.out1(out_ui_plus_expr_FU_32_0_32_86_i3_fu_matrix_convolution_33984_34908),
    .in1(out_reg_15_reg_15),
    .in2(out_const_4));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34911 (.out1(out_UIdata_converter_FU_39_i0_fu_matrix_convolution_33984_34911),
    .in1(out_reg_28_reg_28));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34912 (.out1(out_read_cond_FU_43_i0_fu_matrix_convolution_33984_34912),
    .in1(out_lt_expr_FU_32_0_32_70_i0_fu_matrix_convolution_33984_37198));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34916 (.out1(out_UIdata_converter_FU_48_i0_fu_matrix_convolution_33984_34916),
    .in1(out_reg_33_reg_33));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34917 (.out1(out_read_cond_FU_51_i0_fu_matrix_convolution_33984_34917),
    .in1(out_lt_expr_FU_32_0_32_70_i1_fu_matrix_convolution_33984_37200));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34921 (.out1(out_plus_expr_FU_32_0_32_75_i0_fu_matrix_convolution_33984_34921),
    .in1(in_port_size),
    .in2(out_const_4));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_34922 (.out1(out_lt_expr_FU_32_32_32_71_i0_fu_matrix_convolution_33984_34922),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_35_reg_35));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_34923 (.out1(out_lt_expr_FU_32_32_32_71_i1_fu_matrix_convolution_33984_34923),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_34_reg_34));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_34924 (.out1(out_ui_bit_ior_expr_FU_1_1_1_81_i0_fu_matrix_convolution_33984_34924),
    .in1(out_reg_36_reg_36),
    .in2(out_lt_expr_FU_32_32_32_71_i0_fu_matrix_convolution_33984_34922));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34925 (.out1(out_read_cond_FU_53_i0_fu_matrix_convolution_33984_34925),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_81_i0_fu_matrix_convolution_33984_34924));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34939 (.out1(out_read_cond_FU_59_i0_fu_matrix_convolution_33984_34939),
    .in1(out_reg_41_reg_41));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34941 (.out1(out_read_cond_FU_61_i0_fu_matrix_convolution_33984_34941),
    .in1(out_ui_ne_expr_FU_32_32_32_85_i0_fu_matrix_convolution_33984_37249));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34943 (.out1(out_read_cond_FU_62_i0_fu_matrix_convolution_33984_34943),
    .in1(out_ui_ne_expr_FU_32_32_32_85_i1_fu_matrix_convolution_33984_37251));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37168 (.out1(out_lt_expr_FU_32_0_32_69_i0_fu_matrix_convolution_33984_37168),
    .in1(in_port_kernel_size),
    .in2(out_const_0));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_37175 (.out1(out_plus_expr_FU_32_32_32_76_i0_fu_matrix_convolution_33984_37175),
    .in1(in_port_kernel_size),
    .in2(out_rshift_expr_FU_32_0_32_78_i0_fu_matrix_convolution_33984_40430));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_37192 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i3_fu_matrix_convolution_33984_37192),
    .in1(out_IUdata_converter_FU_24_i0_fu_matrix_convolution_33984_34814),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_37195 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_88_i3_fu_matrix_convolution_33984_37195),
    .in1(out_reg_44_reg_44),
    .in2(out_ui_lshift_expr_FU_32_0_32_82_i3_fu_matrix_convolution_33984_37192));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37198 (.out1(out_lt_expr_FU_32_0_32_70_i0_fu_matrix_convolution_33984_37198),
    .in1(out_UIdata_converter_FU_39_i0_fu_matrix_convolution_33984_34911),
    .in2(out_const_0));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37200 (.out1(out_lt_expr_FU_32_0_32_70_i1_fu_matrix_convolution_33984_37200),
    .in1(out_UIdata_converter_FU_48_i0_fu_matrix_convolution_33984_34916),
    .in2(out_const_0));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_37209 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i4_fu_matrix_convolution_33984_37209),
    .in1(out_reg_33_reg_33),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_37212 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_88_i4_fu_matrix_convolution_33984_37212),
    .in1(out_reg_32_reg_32),
    .in2(out_ui_lshift_expr_FU_32_0_32_82_i4_fu_matrix_convolution_33984_37209));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_37220 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i5_fu_matrix_convolution_33984_37220),
    .in1(out_IUdata_converter_FU_49_i0_fu_matrix_convolution_33984_34844),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_37223 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_88_i5_fu_matrix_convolution_33984_37223),
    .in1(out_reg_30_reg_30),
    .in2(out_ui_lshift_expr_FU_32_0_32_82_i5_fu_matrix_convolution_33984_37220));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_37231 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i6_fu_matrix_convolution_33984_37231),
    .in1(out_reg_19_reg_19),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_37234 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_88_i6_fu_matrix_convolution_33984_37234),
    .in1(out_reg_18_reg_18),
    .in2(out_ui_lshift_expr_FU_32_0_32_82_i6_fu_matrix_convolution_33984_37231));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37237 (.out1(out_gt_expr_FU_32_0_32_67_i0_fu_matrix_convolution_33984_37237),
    .in1(in_port_size),
    .in2(out_const_0));
  ge_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37239 (.out1(out_ge_expr_FU_32_32_32_66_i0_fu_matrix_convolution_33984_37239),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_10_reg_10));
  ge_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37241 (.out1(out_ge_expr_FU_32_32_32_66_i1_fu_matrix_convolution_33984_37241),
    .in1(out_reg_0_reg_0),
    .in2(out_plus_expr_FU_32_0_32_74_i0_fu_matrix_convolution_33984_34821));
  ge_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37243 (.out1(out_ge_expr_FU_32_32_32_66_i2_fu_matrix_convolution_33984_37243),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_27_reg_27));
  ge_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37247 (.out1(out_ge_expr_FU_32_32_32_66_i3_fu_matrix_convolution_33984_37247),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_31_reg_31));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37249 (.out1(out_ui_ne_expr_FU_32_32_32_85_i0_fu_matrix_convolution_33984_37249),
    .in1(out_reg_12_reg_12),
    .in2(out_reg_26_reg_26));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37251 (.out1(out_ui_ne_expr_FU_32_32_32_85_i1_fu_matrix_convolution_33984_37251),
    .in1(out_reg_21_reg_21),
    .in2(out_reg_12_reg_12));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39786 (.out1(out_UUdata_converter_FU_4_i0_fu_matrix_convolution_33984_39786),
    .in1(in_port_A));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39789 (.out1(out_UUdata_converter_FU_3_i0_fu_matrix_convolution_33984_39789),
    .in1(in_port_kernel));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39792 (.out1(out_UUdata_converter_FU_2_i0_fu_matrix_convolution_33984_39792),
    .in1(in_port_B));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39796 (.out1(out_UUdata_converter_FU_26_i0_fu_matrix_convolution_33984_39796),
    .in1(out_conv_out___float_mule8m23b_127nih_92_i0___float_mule8m23b_127nih_92_i0_64_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39799 (.out1(out_UUdata_converter_FU_25_i0_fu_matrix_convolution_33984_39799),
    .in1(out_BMEMORY_CTRLN_65_i0_BMEMORY_CTRLN_65_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39821 (.out1(out_UUdata_converter_FU_29_i0_fu_matrix_convolution_33984_39821),
    .in1(out_conv_out___float_adde8m23b_127nih_91_i0___float_adde8m23b_127nih_91_i0_64_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39824 (.out1(out_UUdata_converter_FU_27_i0_fu_matrix_convolution_33984_39824),
    .in1(out_UUdata_converter_FU_26_i0_fu_matrix_convolution_33984_39796));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39827 (.out1(out_UUdata_converter_FU_28_i0_fu_matrix_convolution_33984_39827),
    .in1(out_reg_43_reg_43));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39846 (.out1(out_UUdata_converter_FU_56_i0_fu_matrix_convolution_33984_39846),
    .in1(out_conv_out___float_mule8m23b_127nih_92_i0___float_mule8m23b_127nih_92_i0_64_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39849 (.out1(out_UUdata_converter_FU_54_i0_fu_matrix_convolution_33984_39849),
    .in1(out_BMEMORY_CTRLN_65_i0_BMEMORY_CTRLN_65_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39852 (.out1(out_UUdata_converter_FU_55_i0_fu_matrix_convolution_33984_39852),
    .in1(out_reg_40_reg_40));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39871 (.out1(out_UUdata_converter_FU_58_i0_fu_matrix_convolution_33984_39871),
    .in1(out_conv_out___float_adde8m23b_127nih_91_i0___float_adde8m23b_127nih_91_i0_64_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39874 (.out1(out_UUdata_converter_FU_57_i0_fu_matrix_convolution_33984_39874),
    .in1(out_UUdata_converter_FU_56_i0_fu_matrix_convolution_33984_39846));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39877 (.out1(out_UUdata_converter_FU_50_i0_fu_matrix_convolution_33984_39877),
    .in1(out_reg_24_reg_24));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_matrix_convolution_33984_40423 (.out1(out_UIdata_converter_FU_5_i0_fu_matrix_convolution_33984_40423),
    .in1(out_lt_expr_FU_32_0_32_69_i0_fu_matrix_convolution_33984_37168));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_40427 (.out1(out_lshift_expr_FU_32_0_32_68_i0_fu_matrix_convolution_33984_40427),
    .in1(out_UIdata_converter_FU_5_i0_fu_matrix_convolution_33984_40423),
    .in2(out_const_3));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu_matrix_convolution_33984_40430 (.out1(out_rshift_expr_FU_32_0_32_78_i0_fu_matrix_convolution_33984_40430),
    .in1(out_lshift_expr_FU_32_0_32_68_i0_fu_matrix_convolution_33984_40427),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_convolution_33984_40434 (.out1(out_ui_rshift_expr_FU_32_0_32_89_i0_fu_matrix_convolution_33984_40434),
    .in1(out_reg_23_reg_23),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_convolution_33984_40439 (.out1(out_ui_rshift_expr_FU_32_0_32_89_i1_fu_matrix_convolution_33984_40439),
    .in1(out_ui_lshift_expr_FU_32_0_32_82_i1_fu_matrix_convolution_33984_34695),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_matrix_convolution_33984_40443 (.out1(out_ui_plus_expr_FU_32_32_32_87_i1_fu_matrix_convolution_33984_40443),
    .in1(out_ui_rshift_expr_FU_32_0_32_89_i0_fu_matrix_convolution_33984_40434),
    .in2(out_reg_7_reg_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_40446 (.out1(out_ui_lshift_expr_FU_32_0_32_83_i2_fu_matrix_convolution_33984_40446),
    .in1(out_ui_plus_expr_FU_32_32_32_87_i1_fu_matrix_convolution_33984_40443),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_matrix_convolution_33984_40450 (.out1(out_ui_bit_and_expr_FU_8_0_8_79_i0_fu_matrix_convolution_33984_40450),
    .in1(out_reg_23_reg_23),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_convolution_33984_40455 (.out1(out_ui_rshift_expr_FU_32_0_32_89_i2_fu_matrix_convolution_33984_40455),
    .in1(out_ui_lshift_expr_FU_32_0_32_82_i0_fu_matrix_convolution_33984_34691),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_convolution_33984_40458 (.out1(out_ui_rshift_expr_FU_32_0_32_89_i3_fu_matrix_convolution_33984_40458),
    .in1(out_reg_25_reg_25),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_matrix_convolution_33984_40460 (.out1(out_ui_plus_expr_FU_32_32_32_87_i2_fu_matrix_convolution_33984_40460),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_rshift_expr_FU_32_0_32_89_i3_fu_matrix_convolution_33984_40458));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_40463 (.out1(out_ui_lshift_expr_FU_32_0_32_83_i3_fu_matrix_convolution_33984_40463),
    .in1(out_ui_plus_expr_FU_32_32_32_87_i2_fu_matrix_convolution_33984_40460),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_matrix_convolution_33984_40466 (.out1(out_ui_bit_and_expr_FU_8_0_8_79_i1_fu_matrix_convolution_33984_40466),
    .in1(out_reg_25_reg_25),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_convolution_33984_40470 (.out1(out_ui_rshift_expr_FU_32_0_32_90_i0_fu_matrix_convolution_33984_40470),
    .in1(out_reg_14_reg_14),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_convolution_33984_40473 (.out1(out_ui_rshift_expr_FU_32_0_32_90_i1_fu_matrix_convolution_33984_40473),
    .in1(out_ui_lshift_expr_FU_32_0_32_82_i0_fu_matrix_convolution_33984_34691),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_matrix_convolution_33984_40475 (.out1(out_ui_plus_expr_FU_32_32_32_87_i3_fu_matrix_convolution_33984_40475),
    .in1(out_ui_rshift_expr_FU_32_0_32_90_i0_fu_matrix_convolution_33984_40470),
    .in2(out_reg_9_reg_9));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_40478 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i7_fu_matrix_convolution_33984_40478),
    .in1(out_ui_plus_expr_FU_32_32_32_87_i3_fu_matrix_convolution_33984_40475),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_convolution_33984_40481 (.out1(out_ui_rshift_expr_FU_32_0_32_90_i2_fu_matrix_convolution_33984_40481),
    .in1(out_reg_14_reg_14),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_convolution_33984_40484 (.out1(out_ui_rshift_expr_FU_32_0_32_90_i3_fu_matrix_convolution_33984_40484),
    .in1(out_ui_lshift_expr_FU_32_0_32_83_i0_fu_matrix_convolution_33984_34702),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_matrix_convolution_33984_40486 (.out1(out_ui_plus_expr_FU_32_32_32_87_i4_fu_matrix_convolution_33984_40486),
    .in1(out_ui_rshift_expr_FU_32_0_32_90_i2_fu_matrix_convolution_33984_40481),
    .in2(out_reg_16_reg_16));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_40489 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i8_fu_matrix_convolution_33984_40489),
    .in1(out_ui_plus_expr_FU_32_32_32_87_i4_fu_matrix_convolution_33984_40486),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_convolution_33984_40492 (.out1(out_ui_rshift_expr_FU_32_0_32_90_i4_fu_matrix_convolution_33984_40492),
    .in1(out_reg_14_reg_14),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_matrix_convolution_33984_40495 (.out1(out_ui_rshift_expr_FU_32_0_32_90_i5_fu_matrix_convolution_33984_40495),
    .in1(out_ui_lshift_expr_FU_32_0_32_83_i1_fu_matrix_convolution_33984_34703),
    .in2(out_const_5));
  ui_minus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_matrix_convolution_33984_40497 (.out1(out_ui_minus_expr_FU_32_32_32_84_i0_fu_matrix_convolution_33984_40497),
    .in1(out_ui_rshift_expr_FU_32_0_32_90_i4_fu_matrix_convolution_33984_40492),
    .in2(out_reg_17_reg_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_40500 (.out1(out_ui_lshift_expr_FU_32_0_32_82_i9_fu_matrix_convolution_33984_40500),
    .in1(out_ui_minus_expr_FU_32_32_32_84_i0_fu_matrix_convolution_33984_40497),
    .in2(out_const_5));
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_41034 (.out1(out_ASSIGN_SIGNED_FU_11_i0_fu_matrix_convolution_33984_41034),
    .in1(out_negate_expr_FU_32_32_73_i0_fu_matrix_convolution_33984_34689));
  or or_or___float_adde8m23b_127nih_91_i00( s___float_adde8m23b_127nih_91_i00, selector_IN_UNBOUNDED_matrix_convolution_33984_34794, selector_IN_UNBOUNDED_matrix_convolution_33984_34830);
  or or_or___float_mule8m23b_127nih_92_i01( s___float_mule8m23b_127nih_92_i01, selector_IN_UNBOUNDED_matrix_convolution_33984_34799, selector_IN_UNBOUNDED_matrix_convolution_33984_34834);
  register_SE #(.BITSIZE_in1(31),
    .BITSIZE_out1(31)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_rshift_expr_FU_32_0_32_77_i0_fu_matrix_convolution_33984_34674),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_6_i0_fu_matrix_convolution_33984_34690),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_negate_expr_FU_32_32_73_i0_fu_matrix_convolution_33984_34689),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_12_i0_fu_matrix_convolution_33984_34692),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_87_i0_fu_matrix_convolution_33984_34693),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_13_i0_fu_matrix_convolution_33984_34699),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_99_reg_14_0_0_0),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_100_reg_15_0_0_0),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_90_i3_fu_matrix_convolution_33984_40484),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_90_i5_fu_matrix_convolution_33984_40495),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_88_i1_fu_matrix_convolution_33984_34770),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_104_reg_19_0_0_0),
    .wenable(wrenable_reg_19));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_82_i2_fu_matrix_convolution_33984_34697),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_64_i0_fu_matrix_convolution_33984_34867),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_86_i3_fu_matrix_convolution_33984_34908),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_32_32_66_i0_fu_matrix_convolution_33984_37239),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_109_reg_23_0_0_0),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_110_reg_24_0_0_1),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_111_reg_25_0_0_0),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_86_i1_fu_matrix_convolution_33984_34888),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_113_reg_27_0_0_0),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_114_reg_28_0_0_0),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_88_i6_fu_matrix_convolution_33984_37234),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_75_i0_fu_matrix_convolution_33984_34921),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_41_i0_fu_matrix_convolution_33984_34842),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_118_reg_31_0_0_0),
    .wenable(wrenable_reg_31));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_40_i0_fu_matrix_convolution_33984_34860),
    .wenable(wrenable_reg_32));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_120_reg_33_0_0_0),
    .wenable(wrenable_reg_33));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_39_i0_fu_matrix_convolution_33984_34911),
    .wenable(wrenable_reg_34));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_48_i0_fu_matrix_convolution_33984_34916),
    .wenable(wrenable_reg_35));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_lt_expr_FU_32_32_32_71_i1_fu_matrix_convolution_33984_34923),
    .wenable(wrenable_reg_36));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_88_i4_fu_matrix_convolution_33984_37212),
    .wenable(wrenable_reg_37));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_88_i5_fu_matrix_convolution_33984_37223),
    .wenable(wrenable_reg_38));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_50_i0_fu_matrix_convolution_33984_39877),
    .wenable(wrenable_reg_39));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_4_i0_fu_matrix_convolution_33984_39786),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_128_reg_40_0_0_0),
    .wenable(wrenable_reg_40));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_41 (.out1(out_reg_41_reg_41),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_32_32_66_i3_fu_matrix_convolution_33984_37247),
    .wenable(wrenable_reg_41));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_42 (.out1(out_reg_42_reg_42),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_55_i0_fu_matrix_convolution_33984_39852),
    .wenable(wrenable_reg_42));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_43 (.out1(out_reg_43_reg_43),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_131_reg_43_0_0_0),
    .wenable(wrenable_reg_43));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_44 (.out1(out_reg_44_reg_44),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_42_i0_fu_matrix_convolution_33984_34807),
    .wenable(wrenable_reg_44));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_45 (.out1(out_reg_45_reg_45),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_133_reg_45_0_0_0),
    .wenable(wrenable_reg_45));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_46 (.out1(out_reg_46_reg_46),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_32_32_66_i1_fu_matrix_convolution_33984_37241),
    .wenable(wrenable_reg_46));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_47 (.out1(out_reg_47_reg_47),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_28_i0_fu_matrix_convolution_33984_39827),
    .wenable(wrenable_reg_47));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_48 (.out1(out_reg_48_reg_48),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_136_reg_48_0_0_1),
    .wenable(wrenable_reg_48));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_3_i0_fu_matrix_convolution_33984_39789),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_2_i0_fu_matrix_convolution_33984_39792),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_89_i1_fu_matrix_convolution_33984_40439),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_89_i2_fu_matrix_convolution_33984_40455),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_90_i1_fu_matrix_convolution_33984_40473),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION_matrix_convolution_33984_34675 = out_read_cond_FU_9_i0_fu_matrix_convolution_33984_34675;
  assign OUT_CONDITION_matrix_convolution_33984_34757 = out_read_cond_FU_18_i0_fu_matrix_convolution_33984_34757;
  assign OUT_CONDITION_matrix_convolution_33984_34891 = out_read_cond_FU_30_i0_fu_matrix_convolution_33984_34891;
  assign OUT_CONDITION_matrix_convolution_33984_34895 = out_read_cond_FU_33_i0_fu_matrix_convolution_33984_34895;
  assign OUT_CONDITION_matrix_convolution_33984_34912 = out_read_cond_FU_43_i0_fu_matrix_convolution_33984_34912;
  assign OUT_CONDITION_matrix_convolution_33984_34917 = out_read_cond_FU_51_i0_fu_matrix_convolution_33984_34917;
  assign OUT_CONDITION_matrix_convolution_33984_34925 = out_read_cond_FU_53_i0_fu_matrix_convolution_33984_34925;
  assign OUT_CONDITION_matrix_convolution_33984_34939 = out_read_cond_FU_59_i0_fu_matrix_convolution_33984_34939;
  assign OUT_CONDITION_matrix_convolution_33984_34941 = out_read_cond_FU_61_i0_fu_matrix_convolution_33984_34941;
  assign OUT_CONDITION_matrix_convolution_33984_34943 = out_read_cond_FU_62_i0_fu_matrix_convolution_33984_34943;
  assign OUT_UNBOUNDED_matrix_convolution_33984_34794 = s_done___float_adde8m23b_127nih_91_i0;
  assign OUT_UNBOUNDED_matrix_convolution_33984_34799 = s_done___float_mule8m23b_127nih_92_i0;
  assign OUT_UNBOUNDED_matrix_convolution_33984_34830 = s_done___float_adde8m23b_127nih_91_i0;
  assign OUT_UNBOUNDED_matrix_convolution_33984_34834 = s_done___float_mule8m23b_127nih_92_i0;

endmodule

// FSM based controller description for matrix_convolution
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_matrix_convolution(done_port,
  fuselector_BMEMORY_CTRLN_65_i0_LOAD,
  fuselector_BMEMORY_CTRLN_65_i0_STORE,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34794,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34799,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34830,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34834,
  selector_MUX_100_reg_15_0_0_0,
  selector_MUX_104_reg_19_0_0_0,
  selector_MUX_109_reg_23_0_0_0,
  selector_MUX_110_reg_24_0_0_0,
  selector_MUX_110_reg_24_0_0_1,
  selector_MUX_111_reg_25_0_0_0,
  selector_MUX_113_reg_27_0_0_0,
  selector_MUX_114_reg_28_0_0_0,
  selector_MUX_118_reg_31_0_0_0,
  selector_MUX_120_reg_33_0_0_0,
  selector_MUX_128_reg_40_0_0_0,
  selector_MUX_131_reg_43_0_0_0,
  selector_MUX_133_reg_45_0_0_0,
  selector_MUX_136_reg_48_0_0_0,
  selector_MUX_136_reg_48_0_0_1,
  selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0,
  selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1,
  selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0,
  selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0,
  selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0,
  selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0,
  selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0,
  selector_MUX_99_reg_14_0_0_0,
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
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_39,
  wrenable_reg_4,
  wrenable_reg_40,
  wrenable_reg_41,
  wrenable_reg_42,
  wrenable_reg_43,
  wrenable_reg_44,
  wrenable_reg_45,
  wrenable_reg_46,
  wrenable_reg_47,
  wrenable_reg_48,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_matrix_convolution_33984_34675,
  OUT_CONDITION_matrix_convolution_33984_34757,
  OUT_CONDITION_matrix_convolution_33984_34891,
  OUT_CONDITION_matrix_convolution_33984_34895,
  OUT_CONDITION_matrix_convolution_33984_34912,
  OUT_CONDITION_matrix_convolution_33984_34917,
  OUT_CONDITION_matrix_convolution_33984_34925,
  OUT_CONDITION_matrix_convolution_33984_34939,
  OUT_CONDITION_matrix_convolution_33984_34941,
  OUT_CONDITION_matrix_convolution_33984_34943,
  OUT_UNBOUNDED_matrix_convolution_33984_34794,
  OUT_UNBOUNDED_matrix_convolution_33984_34799,
  OUT_UNBOUNDED_matrix_convolution_33984_34830,
  OUT_UNBOUNDED_matrix_convolution_33984_34834,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_matrix_convolution_33984_34675;
  input OUT_CONDITION_matrix_convolution_33984_34757;
  input OUT_CONDITION_matrix_convolution_33984_34891;
  input OUT_CONDITION_matrix_convolution_33984_34895;
  input OUT_CONDITION_matrix_convolution_33984_34912;
  input OUT_CONDITION_matrix_convolution_33984_34917;
  input OUT_CONDITION_matrix_convolution_33984_34925;
  input OUT_CONDITION_matrix_convolution_33984_34939;
  input OUT_CONDITION_matrix_convolution_33984_34941;
  input OUT_CONDITION_matrix_convolution_33984_34943;
  input OUT_UNBOUNDED_matrix_convolution_33984_34794;
  input OUT_UNBOUNDED_matrix_convolution_33984_34799;
  input OUT_UNBOUNDED_matrix_convolution_33984_34830;
  input OUT_UNBOUNDED_matrix_convolution_33984_34834;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_65_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_65_i0_STORE;
  output selector_IN_UNBOUNDED_matrix_convolution_33984_34794;
  output selector_IN_UNBOUNDED_matrix_convolution_33984_34799;
  output selector_IN_UNBOUNDED_matrix_convolution_33984_34830;
  output selector_IN_UNBOUNDED_matrix_convolution_33984_34834;
  output selector_MUX_100_reg_15_0_0_0;
  output selector_MUX_104_reg_19_0_0_0;
  output selector_MUX_109_reg_23_0_0_0;
  output selector_MUX_110_reg_24_0_0_0;
  output selector_MUX_110_reg_24_0_0_1;
  output selector_MUX_111_reg_25_0_0_0;
  output selector_MUX_113_reg_27_0_0_0;
  output selector_MUX_114_reg_28_0_0_0;
  output selector_MUX_118_reg_31_0_0_0;
  output selector_MUX_120_reg_33_0_0_0;
  output selector_MUX_128_reg_40_0_0_0;
  output selector_MUX_131_reg_43_0_0_0;
  output selector_MUX_133_reg_45_0_0_0;
  output selector_MUX_136_reg_48_0_0_0;
  output selector_MUX_136_reg_48_0_0_1;
  output selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0;
  output selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1;
  output selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0;
  output selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0;
  output selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0;
  output selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0;
  output selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0;
  output selector_MUX_99_reg_14_0_0_0;
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
  output wrenable_reg_25;
  output wrenable_reg_26;
  output wrenable_reg_27;
  output wrenable_reg_28;
  output wrenable_reg_29;
  output wrenable_reg_3;
  output wrenable_reg_30;
  output wrenable_reg_31;
  output wrenable_reg_32;
  output wrenable_reg_33;
  output wrenable_reg_34;
  output wrenable_reg_35;
  output wrenable_reg_36;
  output wrenable_reg_37;
  output wrenable_reg_38;
  output wrenable_reg_39;
  output wrenable_reg_4;
  output wrenable_reg_40;
  output wrenable_reg_41;
  output wrenable_reg_42;
  output wrenable_reg_43;
  output wrenable_reg_44;
  output wrenable_reg_45;
  output wrenable_reg_46;
  output wrenable_reg_47;
  output wrenable_reg_48;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [4:0] S_0 = 5'd0,
    S_16 = 5'd16,
    S_1 = 5'd1,
    S_15 = 5'd15,
    S_2 = 5'd2,
    S_6 = 5'd6,
    S_7 = 5'd7,
    S_8 = 5'd8,
    S_9 = 5'd9,
    S_10 = 5'd10,
    S_11 = 5'd11,
    S_12 = 5'd12,
    S_3 = 5'd3,
    S_4 = 5'd4,
    S_5 = 5'd5,
    S_13 = 5'd13,
    S_14 = 5'd14,
    S_17 = 5'd17;
  reg [4:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_65_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_65_i0_STORE;
  reg selector_IN_UNBOUNDED_matrix_convolution_33984_34794;
  reg selector_IN_UNBOUNDED_matrix_convolution_33984_34799;
  reg selector_IN_UNBOUNDED_matrix_convolution_33984_34830;
  reg selector_IN_UNBOUNDED_matrix_convolution_33984_34834;
  reg selector_MUX_100_reg_15_0_0_0;
  reg selector_MUX_104_reg_19_0_0_0;
  reg selector_MUX_109_reg_23_0_0_0;
  reg selector_MUX_110_reg_24_0_0_0;
  reg selector_MUX_110_reg_24_0_0_1;
  reg selector_MUX_111_reg_25_0_0_0;
  reg selector_MUX_113_reg_27_0_0_0;
  reg selector_MUX_114_reg_28_0_0_0;
  reg selector_MUX_118_reg_31_0_0_0;
  reg selector_MUX_120_reg_33_0_0_0;
  reg selector_MUX_128_reg_40_0_0_0;
  reg selector_MUX_131_reg_43_0_0_0;
  reg selector_MUX_133_reg_45_0_0_0;
  reg selector_MUX_136_reg_48_0_0_0;
  reg selector_MUX_136_reg_48_0_0_1;
  reg selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0;
  reg selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1;
  reg selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0;
  reg selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0;
  reg selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0;
  reg selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0;
  reg selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0;
  reg selector_MUX_99_reg_14_0_0_0;
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
  reg wrenable_reg_25;
  reg wrenable_reg_26;
  reg wrenable_reg_27;
  reg wrenable_reg_28;
  reg wrenable_reg_29;
  reg wrenable_reg_3;
  reg wrenable_reg_30;
  reg wrenable_reg_31;
  reg wrenable_reg_32;
  reg wrenable_reg_33;
  reg wrenable_reg_34;
  reg wrenable_reg_35;
  reg wrenable_reg_36;
  reg wrenable_reg_37;
  reg wrenable_reg_38;
  reg wrenable_reg_39;
  reg wrenable_reg_4;
  reg wrenable_reg_40;
  reg wrenable_reg_41;
  reg wrenable_reg_42;
  reg wrenable_reg_43;
  reg wrenable_reg_44;
  reg wrenable_reg_45;
  reg wrenable_reg_46;
  reg wrenable_reg_47;
  reg wrenable_reg_48;
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
    fuselector_BMEMORY_CTRLN_65_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_65_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED_matrix_convolution_33984_34794 = 1'b0;
    selector_IN_UNBOUNDED_matrix_convolution_33984_34799 = 1'b0;
    selector_IN_UNBOUNDED_matrix_convolution_33984_34830 = 1'b0;
    selector_IN_UNBOUNDED_matrix_convolution_33984_34834 = 1'b0;
    selector_MUX_100_reg_15_0_0_0 = 1'b0;
    selector_MUX_104_reg_19_0_0_0 = 1'b0;
    selector_MUX_109_reg_23_0_0_0 = 1'b0;
    selector_MUX_110_reg_24_0_0_0 = 1'b0;
    selector_MUX_110_reg_24_0_0_1 = 1'b0;
    selector_MUX_111_reg_25_0_0_0 = 1'b0;
    selector_MUX_113_reg_27_0_0_0 = 1'b0;
    selector_MUX_114_reg_28_0_0_0 = 1'b0;
    selector_MUX_118_reg_31_0_0_0 = 1'b0;
    selector_MUX_120_reg_33_0_0_0 = 1'b0;
    selector_MUX_128_reg_40_0_0_0 = 1'b0;
    selector_MUX_131_reg_43_0_0_0 = 1'b0;
    selector_MUX_133_reg_45_0_0_0 = 1'b0;
    selector_MUX_136_reg_48_0_0_0 = 1'b0;
    selector_MUX_136_reg_48_0_0_1 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0 = 1'b0;
    selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0 = 1'b0;
    selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0 = 1'b0;
    selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0 = 1'b0;
    selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0 = 1'b0;
    selector_MUX_99_reg_14_0_0_0 = 1'b0;
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
    wrenable_reg_25 = 1'b0;
    wrenable_reg_26 = 1'b0;
    wrenable_reg_27 = 1'b0;
    wrenable_reg_28 = 1'b0;
    wrenable_reg_29 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_30 = 1'b0;
    wrenable_reg_31 = 1'b0;
    wrenable_reg_32 = 1'b0;
    wrenable_reg_33 = 1'b0;
    wrenable_reg_34 = 1'b0;
    wrenable_reg_35 = 1'b0;
    wrenable_reg_36 = 1'b0;
    wrenable_reg_37 = 1'b0;
    wrenable_reg_38 = 1'b0;
    wrenable_reg_39 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_40 = 1'b0;
    wrenable_reg_41 = 1'b0;
    wrenable_reg_42 = 1'b0;
    wrenable_reg_43 = 1'b0;
    wrenable_reg_44 = 1'b0;
    wrenable_reg_45 = 1'b0;
    wrenable_reg_46 = 1'b0;
    wrenable_reg_47 = 1'b0;
    wrenable_reg_48 = 1'b0;
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
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34675 == 1'b1)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_16;
              done_port = 1'b1;
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
      S_16 :
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          selector_MUX_99_reg_14_0_0_0 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          selector_MUX_109_reg_23_0_0_0 = 1'b1;
          selector_MUX_110_reg_24_0_0_1 = 1'b1;
          selector_MUX_111_reg_25_0_0_0 = 1'b1;
          selector_MUX_113_reg_27_0_0_0 = 1'b1;
          selector_MUX_114_reg_28_0_0_0 = 1'b1;
          selector_MUX_136_reg_48_0_0_1 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_48 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34757 == 1'b1)
            begin
              _next_state = S_6;
              selector_MUX_136_reg_48_0_0_1 = 1'b0;
              wrenable_reg_48 = 1'b0;
            end
          else
            begin
              _next_state = S_13;
              selector_MUX_109_reg_23_0_0_0 = 1'b0;
              selector_MUX_110_reg_24_0_0_1 = 1'b0;
              selector_MUX_111_reg_25_0_0_0 = 1'b0;
              selector_MUX_113_reg_27_0_0_0 = 1'b0;
              selector_MUX_114_reg_28_0_0_0 = 1'b0;
              wrenable_reg_23 = 1'b0;
              wrenable_reg_24 = 1'b0;
              wrenable_reg_25 = 1'b0;
              wrenable_reg_27 = 1'b0;
              wrenable_reg_28 = 1'b0;
            end
        end
      S_6 :
        begin
          selector_MUX_118_reg_31_0_0_0 = 1'b1;
          selector_MUX_120_reg_33_0_0_0 = 1'b1;
          selector_MUX_131_reg_43_0_0_0 = 1'b1;
          selector_MUX_133_reg_45_0_0_0 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          wrenable_reg_45 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34912 == 1'b1)
            begin
              _next_state = S_3;
              selector_MUX_118_reg_31_0_0_0 = 1'b0;
              selector_MUX_120_reg_33_0_0_0 = 1'b0;
              wrenable_reg_30 = 1'b0;
              wrenable_reg_31 = 1'b0;
              wrenable_reg_32 = 1'b0;
              wrenable_reg_33 = 1'b0;
              wrenable_reg_34 = 1'b0;
            end
          else
            begin
              _next_state = S_7;
              selector_MUX_131_reg_43_0_0_0 = 1'b0;
              selector_MUX_133_reg_45_0_0_0 = 1'b0;
              wrenable_reg_43 = 1'b0;
              wrenable_reg_44 = 1'b0;
              wrenable_reg_45 = 1'b0;
            end
        end
      S_7 :
        begin
          wrenable_reg_31 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          wrenable_reg_39 = 1'b1;
          wrenable_reg_40 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34917 == 1'b1)
            begin
              _next_state = S_11;
              wrenable_reg_35 = 1'b0;
              wrenable_reg_36 = 1'b0;
              wrenable_reg_37 = 1'b0;
            end
          else
            begin
              _next_state = S_8;
              wrenable_reg_40 = 1'b0;
            end
        end
      S_8 :
        begin
          wrenable_reg_40 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34925 == 1'b1)
            begin
              _next_state = S_11;
            end
          else
            begin
              _next_state = S_9;
              wrenable_reg_40 = 1'b0;
            end
        end
      S_9 :
        begin
          fuselector_BMEMORY_CTRLN_65_i0_LOAD = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          selector_MUX_128_reg_40_0_0_0 = 1'b1;
          wrenable_reg_40 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          fuselector_BMEMORY_CTRLN_65_i0_LOAD = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0 = 1'b1;
          wrenable_reg_41 = 1'b1;
          wrenable_reg_42 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          selector_IN_UNBOUNDED_matrix_convolution_33984_34830 = 1'b1;
          selector_IN_UNBOUNDED_matrix_convolution_33984_34834 = 1'b1;
          selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_48 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34939 == 1'b1)
            begin
              _next_state = S_7;
              wrenable_reg_48 = 1'b0;
            end
          else
            begin
              _next_state = S_5;
              wrenable_reg_24 = 1'b0;
            end
        end
      S_3 :
        begin
          fuselector_BMEMORY_CTRLN_65_i0_LOAD = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_47 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          selector_IN_UNBOUNDED_matrix_convolution_33984_34794 = 1'b1;
          selector_IN_UNBOUNDED_matrix_convolution_33984_34799 = 1'b1;
          selector_MUX_136_reg_48_0_0_0 = 1'b1;
          selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0 = 1'b1;
          selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0 = 1'b1;
          selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0 = 1'b1;
          wrenable_reg_43 = 1'b1;
          wrenable_reg_48 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34891 == 1'b1)
            begin
              _next_state = S_3;
              selector_MUX_136_reg_48_0_0_0 = 1'b0;
              wrenable_reg_48 = 1'b0;
            end
          else
            begin
              _next_state = S_5;
              wrenable_reg_43 = 1'b0;
            end
        end
      S_5 :
        begin
          selector_MUX_110_reg_24_0_0_0 = 1'b1;
          wrenable_reg_24 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34895 == 1'b1)
            begin
              _next_state = S_6;
            end
          else
            begin
              _next_state = S_13;
              selector_MUX_110_reg_24_0_0_0 = 1'b0;
              wrenable_reg_24 = 1'b0;
            end
        end
      S_13 :
        begin
          fuselector_BMEMORY_CTRLN_65_i0_STORE = 1'b1;
          selector_MUX_104_reg_19_0_0_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1 = 1'b1;
          wrenable_reg_19 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34941 == 1'b1)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_14;
              selector_MUX_104_reg_19_0_0_0 = 1'b0;
              wrenable_reg_19 = 1'b0;
            end
        end
      S_14 :
        begin
          selector_MUX_100_reg_15_0_0_0 = 1'b1;
          wrenable_reg_15 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34943 == 1'b1)
            begin
              _next_state = S_15;
            end
          else
            begin
              _next_state = S_17;
              done_port = 1'b1;
              selector_MUX_100_reg_15_0_0_0 = 1'b0;
              wrenable_reg_15 = 1'b0;
            end
        end
      S_17 :
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

// Top component for matrix_convolution
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _matrix_convolution(clock,
  reset,
  start_port,
  done_port,
  A,
  kernel,
  B,
  size,
  kernel_size,
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
  input [31:0] kernel;
  input [31:0] B;
  input signed [31:0] size;
  input signed [31:0] kernel_size;
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
  wire OUT_CONDITION_matrix_convolution_33984_34675;
  wire OUT_CONDITION_matrix_convolution_33984_34757;
  wire OUT_CONDITION_matrix_convolution_33984_34891;
  wire OUT_CONDITION_matrix_convolution_33984_34895;
  wire OUT_CONDITION_matrix_convolution_33984_34912;
  wire OUT_CONDITION_matrix_convolution_33984_34917;
  wire OUT_CONDITION_matrix_convolution_33984_34925;
  wire OUT_CONDITION_matrix_convolution_33984_34939;
  wire OUT_CONDITION_matrix_convolution_33984_34941;
  wire OUT_CONDITION_matrix_convolution_33984_34943;
  wire OUT_UNBOUNDED_matrix_convolution_33984_34794;
  wire OUT_UNBOUNDED_matrix_convolution_33984_34799;
  wire OUT_UNBOUNDED_matrix_convolution_33984_34830;
  wire OUT_UNBOUNDED_matrix_convolution_33984_34834;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_65_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_65_i0_STORE;
  wire selector_IN_UNBOUNDED_matrix_convolution_33984_34794;
  wire selector_IN_UNBOUNDED_matrix_convolution_33984_34799;
  wire selector_IN_UNBOUNDED_matrix_convolution_33984_34830;
  wire selector_IN_UNBOUNDED_matrix_convolution_33984_34834;
  wire selector_MUX_100_reg_15_0_0_0;
  wire selector_MUX_104_reg_19_0_0_0;
  wire selector_MUX_109_reg_23_0_0_0;
  wire selector_MUX_110_reg_24_0_0_0;
  wire selector_MUX_110_reg_24_0_0_1;
  wire selector_MUX_111_reg_25_0_0_0;
  wire selector_MUX_113_reg_27_0_0_0;
  wire selector_MUX_114_reg_28_0_0_0;
  wire selector_MUX_118_reg_31_0_0_0;
  wire selector_MUX_120_reg_33_0_0_0;
  wire selector_MUX_128_reg_40_0_0_0;
  wire selector_MUX_131_reg_43_0_0_0;
  wire selector_MUX_133_reg_45_0_0_0;
  wire selector_MUX_136_reg_48_0_0_0;
  wire selector_MUX_136_reg_48_0_0_1;
  wire selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0;
  wire selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1;
  wire selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0;
  wire selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0;
  wire selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0;
  wire selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0;
  wire selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0;
  wire selector_MUX_99_reg_14_0_0_0;
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
  wire wrenable_reg_25;
  wire wrenable_reg_26;
  wire wrenable_reg_27;
  wire wrenable_reg_28;
  wire wrenable_reg_29;
  wire wrenable_reg_3;
  wire wrenable_reg_30;
  wire wrenable_reg_31;
  wire wrenable_reg_32;
  wire wrenable_reg_33;
  wire wrenable_reg_34;
  wire wrenable_reg_35;
  wire wrenable_reg_36;
  wire wrenable_reg_37;
  wire wrenable_reg_38;
  wire wrenable_reg_39;
  wire wrenable_reg_4;
  wire wrenable_reg_40;
  wire wrenable_reg_41;
  wire wrenable_reg_42;
  wire wrenable_reg_43;
  wire wrenable_reg_44;
  wire wrenable_reg_45;
  wire wrenable_reg_46;
  wire wrenable_reg_47;
  wire wrenable_reg_48;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_matrix_convolution Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_65_i0_LOAD(fuselector_BMEMORY_CTRLN_65_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_65_i0_STORE(fuselector_BMEMORY_CTRLN_65_i0_STORE),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34794(selector_IN_UNBOUNDED_matrix_convolution_33984_34794),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34799(selector_IN_UNBOUNDED_matrix_convolution_33984_34799),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34830(selector_IN_UNBOUNDED_matrix_convolution_33984_34830),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34834(selector_IN_UNBOUNDED_matrix_convolution_33984_34834),
    .selector_MUX_100_reg_15_0_0_0(selector_MUX_100_reg_15_0_0_0),
    .selector_MUX_104_reg_19_0_0_0(selector_MUX_104_reg_19_0_0_0),
    .selector_MUX_109_reg_23_0_0_0(selector_MUX_109_reg_23_0_0_0),
    .selector_MUX_110_reg_24_0_0_0(selector_MUX_110_reg_24_0_0_0),
    .selector_MUX_110_reg_24_0_0_1(selector_MUX_110_reg_24_0_0_1),
    .selector_MUX_111_reg_25_0_0_0(selector_MUX_111_reg_25_0_0_0),
    .selector_MUX_113_reg_27_0_0_0(selector_MUX_113_reg_27_0_0_0),
    .selector_MUX_114_reg_28_0_0_0(selector_MUX_114_reg_28_0_0_0),
    .selector_MUX_118_reg_31_0_0_0(selector_MUX_118_reg_31_0_0_0),
    .selector_MUX_120_reg_33_0_0_0(selector_MUX_120_reg_33_0_0_0),
    .selector_MUX_128_reg_40_0_0_0(selector_MUX_128_reg_40_0_0_0),
    .selector_MUX_131_reg_43_0_0_0(selector_MUX_131_reg_43_0_0_0),
    .selector_MUX_133_reg_45_0_0_0(selector_MUX_133_reg_45_0_0_0),
    .selector_MUX_136_reg_48_0_0_0(selector_MUX_136_reg_48_0_0_0),
    .selector_MUX_136_reg_48_0_0_1(selector_MUX_136_reg_48_0_0_1),
    .selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0(selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0),
    .selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1(selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1),
    .selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0(selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0),
    .selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0(selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0),
    .selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0(selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0),
    .selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0(selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0),
    .selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0(selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0),
    .selector_MUX_99_reg_14_0_0_0(selector_MUX_99_reg_14_0_0_0),
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
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_39(wrenable_reg_39),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_40(wrenable_reg_40),
    .wrenable_reg_41(wrenable_reg_41),
    .wrenable_reg_42(wrenable_reg_42),
    .wrenable_reg_43(wrenable_reg_43),
    .wrenable_reg_44(wrenable_reg_44),
    .wrenable_reg_45(wrenable_reg_45),
    .wrenable_reg_46(wrenable_reg_46),
    .wrenable_reg_47(wrenable_reg_47),
    .wrenable_reg_48(wrenable_reg_48),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_matrix_convolution_33984_34675(OUT_CONDITION_matrix_convolution_33984_34675),
    .OUT_CONDITION_matrix_convolution_33984_34757(OUT_CONDITION_matrix_convolution_33984_34757),
    .OUT_CONDITION_matrix_convolution_33984_34891(OUT_CONDITION_matrix_convolution_33984_34891),
    .OUT_CONDITION_matrix_convolution_33984_34895(OUT_CONDITION_matrix_convolution_33984_34895),
    .OUT_CONDITION_matrix_convolution_33984_34912(OUT_CONDITION_matrix_convolution_33984_34912),
    .OUT_CONDITION_matrix_convolution_33984_34917(OUT_CONDITION_matrix_convolution_33984_34917),
    .OUT_CONDITION_matrix_convolution_33984_34925(OUT_CONDITION_matrix_convolution_33984_34925),
    .OUT_CONDITION_matrix_convolution_33984_34939(OUT_CONDITION_matrix_convolution_33984_34939),
    .OUT_CONDITION_matrix_convolution_33984_34941(OUT_CONDITION_matrix_convolution_33984_34941),
    .OUT_CONDITION_matrix_convolution_33984_34943(OUT_CONDITION_matrix_convolution_33984_34943),
    .OUT_UNBOUNDED_matrix_convolution_33984_34794(OUT_UNBOUNDED_matrix_convolution_33984_34794),
    .OUT_UNBOUNDED_matrix_convolution_33984_34799(OUT_UNBOUNDED_matrix_convolution_33984_34799),
    .OUT_UNBOUNDED_matrix_convolution_33984_34830(OUT_UNBOUNDED_matrix_convolution_33984_34830),
    .OUT_UNBOUNDED_matrix_convolution_33984_34834(OUT_UNBOUNDED_matrix_convolution_33984_34834),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_matrix_convolution Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_matrix_convolution_33984_34675(OUT_CONDITION_matrix_convolution_33984_34675),
    .OUT_CONDITION_matrix_convolution_33984_34757(OUT_CONDITION_matrix_convolution_33984_34757),
    .OUT_CONDITION_matrix_convolution_33984_34891(OUT_CONDITION_matrix_convolution_33984_34891),
    .OUT_CONDITION_matrix_convolution_33984_34895(OUT_CONDITION_matrix_convolution_33984_34895),
    .OUT_CONDITION_matrix_convolution_33984_34912(OUT_CONDITION_matrix_convolution_33984_34912),
    .OUT_CONDITION_matrix_convolution_33984_34917(OUT_CONDITION_matrix_convolution_33984_34917),
    .OUT_CONDITION_matrix_convolution_33984_34925(OUT_CONDITION_matrix_convolution_33984_34925),
    .OUT_CONDITION_matrix_convolution_33984_34939(OUT_CONDITION_matrix_convolution_33984_34939),
    .OUT_CONDITION_matrix_convolution_33984_34941(OUT_CONDITION_matrix_convolution_33984_34941),
    .OUT_CONDITION_matrix_convolution_33984_34943(OUT_CONDITION_matrix_convolution_33984_34943),
    .OUT_UNBOUNDED_matrix_convolution_33984_34794(OUT_UNBOUNDED_matrix_convolution_33984_34794),
    .OUT_UNBOUNDED_matrix_convolution_33984_34799(OUT_UNBOUNDED_matrix_convolution_33984_34799),
    .OUT_UNBOUNDED_matrix_convolution_33984_34830(OUT_UNBOUNDED_matrix_convolution_33984_34830),
    .OUT_UNBOUNDED_matrix_convolution_33984_34834(OUT_UNBOUNDED_matrix_convolution_33984_34834),
    .clock(clock),
    .reset(reset),
    .in_port_A(A),
    .in_port_kernel(kernel),
    .in_port_B(B),
    .in_port_size(size),
    .in_port_kernel_size(kernel_size),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_65_i0_LOAD(fuselector_BMEMORY_CTRLN_65_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_65_i0_STORE(fuselector_BMEMORY_CTRLN_65_i0_STORE),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34794(selector_IN_UNBOUNDED_matrix_convolution_33984_34794),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34799(selector_IN_UNBOUNDED_matrix_convolution_33984_34799),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34830(selector_IN_UNBOUNDED_matrix_convolution_33984_34830),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34834(selector_IN_UNBOUNDED_matrix_convolution_33984_34834),
    .selector_MUX_100_reg_15_0_0_0(selector_MUX_100_reg_15_0_0_0),
    .selector_MUX_104_reg_19_0_0_0(selector_MUX_104_reg_19_0_0_0),
    .selector_MUX_109_reg_23_0_0_0(selector_MUX_109_reg_23_0_0_0),
    .selector_MUX_110_reg_24_0_0_0(selector_MUX_110_reg_24_0_0_0),
    .selector_MUX_110_reg_24_0_0_1(selector_MUX_110_reg_24_0_0_1),
    .selector_MUX_111_reg_25_0_0_0(selector_MUX_111_reg_25_0_0_0),
    .selector_MUX_113_reg_27_0_0_0(selector_MUX_113_reg_27_0_0_0),
    .selector_MUX_114_reg_28_0_0_0(selector_MUX_114_reg_28_0_0_0),
    .selector_MUX_118_reg_31_0_0_0(selector_MUX_118_reg_31_0_0_0),
    .selector_MUX_120_reg_33_0_0_0(selector_MUX_120_reg_33_0_0_0),
    .selector_MUX_128_reg_40_0_0_0(selector_MUX_128_reg_40_0_0_0),
    .selector_MUX_131_reg_43_0_0_0(selector_MUX_131_reg_43_0_0_0),
    .selector_MUX_133_reg_45_0_0_0(selector_MUX_133_reg_45_0_0_0),
    .selector_MUX_136_reg_48_0_0_0(selector_MUX_136_reg_48_0_0_0),
    .selector_MUX_136_reg_48_0_0_1(selector_MUX_136_reg_48_0_0_1),
    .selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0(selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_0),
    .selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1(selector_MUX_2_BMEMORY_CTRLN_65_i0_1_0_1),
    .selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0(selector_MUX_2_BMEMORY_CTRLN_65_i0_1_1_0),
    .selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0(selector_MUX_44___float_adde8m23b_127nih_91_i0_0_0_0),
    .selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0(selector_MUX_45___float_adde8m23b_127nih_91_i0_1_0_0),
    .selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0(selector_MUX_46___float_mule8m23b_127nih_92_i0_0_0_0),
    .selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0(selector_MUX_47___float_mule8m23b_127nih_92_i0_1_0_0),
    .selector_MUX_99_reg_14_0_0_0(selector_MUX_99_reg_14_0_0_0),
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
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_39(wrenable_reg_39),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_40(wrenable_reg_40),
    .wrenable_reg_41(wrenable_reg_41),
    .wrenable_reg_42(wrenable_reg_42),
    .wrenable_reg_43(wrenable_reg_43),
    .wrenable_reg_44(wrenable_reg_44),
    .wrenable_reg_45(wrenable_reg_45),
    .wrenable_reg_46(wrenable_reg_46),
    .wrenable_reg_47(wrenable_reg_47),
    .wrenable_reg_48(wrenable_reg_48),
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

// Minimal interface for function: matrix_convolution
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module matrix_convolution(clock,
  reset,
  start_port,
  A,
  kernel,
  B,
  size,
  kernel_size,
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
  input [31:0] kernel;
  input [31:0] B;
  input [31:0] size;
  input [31:0] kernel_size;
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
  
  _matrix_convolution _matrix_convolution_i0 (.done_port(done_port),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .A(A),
    .kernel(kernel),
    .B(B),
    .size(size),
    .kernel_size(kernel_size),
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


