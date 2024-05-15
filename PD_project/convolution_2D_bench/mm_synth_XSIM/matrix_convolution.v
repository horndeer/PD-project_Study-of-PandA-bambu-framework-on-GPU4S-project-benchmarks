// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2023.1 - Revision 04336c437a53bc96ae90b74052c455629946ec8b-main - Date 2024-05-15T19:00:05
// /tmp/.mount_bambu-tRsSRK/usr/bin/bambu executed with: /tmp/.mount_bambu-tRsSRK/usr/bin/bambu --top-fname=matrix_convolution --generate-tb=/home/paulevers/PD_project/PD_project/convolution_2D_bench/test.xml --simulate --evaluation --device-name=asap7-BC --simulator=XSIM --experimental-setup=BAMBU-PERFORMANCE-MP /home/paulevers/PD_project/PD_project/convolution_2D_bench/cpu_functions/cpu_functions.cpp 
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

// Datapath RTL description for __float_adde11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___float_adde11m52b_1023nih(clock,
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
  wire [5:0] out_ASSIGN_UNSIGNED_FU_24_i0_fu___float_adde11m52b_1023nih_38396_40790;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_38396_40788;
  wire [5:0] out_IUdata_converter_FU_10_i0_fu___float_adde11m52b_1023nih_38396_38873;
  wire [0:0] out_IUdata_converter_FU_21_i0_fu___float_adde11m52b_1023nih_38396_39331;
  wire [0:0] out_IUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_38396_39340;
  wire [0:0] out_IUdata_converter_FU_23_i0_fu___float_adde11m52b_1023nih_38396_39346;
  wire [63:0] out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_38396_38486;
  wire [55:0] out_IUdata_converter_FU_6_i0_fu___float_adde11m52b_1023nih_38396_38565;
  wire signed [6:0] out_UIconvert_expr_FU_12_i0_fu___float_adde11m52b_1023nih_38396_38885;
  wire signed [1:0] out_UIconvert_expr_FU_2_i0_fu___float_adde11m52b_1023nih_38396_38477;
  wire signed [1:0] out_UIconvert_expr_FU_5_i0_fu___float_adde11m52b_1023nih_38396_38556;
  wire signed [1:0] out_UIconvert_expr_FU_9_i0_fu___float_adde11m52b_1023nih_38396_38864;
  wire signed [1:0] out_UIdata_converter_FU_16_i0_fu___float_adde11m52b_1023nih_38396_40720;
  wire signed [1:0] out_UIdata_converter_FU_17_i0_fu___float_adde11m52b_1023nih_38396_40730;
  wire signed [1:0] out_UIdata_converter_FU_18_i0_fu___float_adde11m52b_1023nih_38396_40739;
  wire [5:0] out_UUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_38396_38876;
  wire out_UUdata_converter_FU_13_i0_fu___float_adde11m52b_1023nih_38396_38985;
  wire out_UUdata_converter_FU_14_i0_fu___float_adde11m52b_1023nih_38396_39600;
  wire out_UUdata_converter_FU_15_i0_fu___float_adde11m52b_1023nih_38396_39715;
  wire out_UUdata_converter_FU_19_i0_fu___float_adde11m52b_1023nih_38396_40771;
  wire out_UUdata_converter_FU_20_i0_fu___float_adde11m52b_1023nih_38396_40780;
  wire out_UUdata_converter_FU_25_i0_fu___float_adde11m52b_1023nih_38396_39688;
  wire out_UUdata_converter_FU_7_i0_fu___float_adde11m52b_1023nih_38396_38698;
  wire out_UUdata_converter_FU_8_i0_fu___float_adde11m52b_1023nih_38396_38712;
  wire signed [6:0] out_bit_and_expr_FU_0_8_8_27_i0_fu___float_adde11m52b_1023nih_38396_39166;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [3:0] out_const_10;
  wire [5:0] out_const_11;
  wire [6:0] out_const_12;
  wire [6:0] out_const_13;
  wire [6:0] out_const_14;
  wire [6:0] out_const_15;
  wire [6:0] out_const_16;
  wire [5:0] out_const_17;
  wire [5:0] out_const_18;
  wire [6:0] out_const_19;
  wire [2:0] out_const_2;
  wire out_const_20;
  wire [1:0] out_const_21;
  wire [1:0] out_const_22;
  wire [5:0] out_const_23;
  wire [3:0] out_const_24;
  wire [5:0] out_const_25;
  wire [7:0] out_const_26;
  wire [10:0] out_const_27;
  wire [10:0] out_const_28;
  wire [15:0] out_const_29;
  wire [3:0] out_const_3;
  wire [31:0] out_const_30;
  wire [51:0] out_const_31;
  wire [54:0] out_const_32;
  wire [55:0] out_const_33;
  wire [62:0] out_const_34;
  wire [63:0] out_const_35;
  wire [4:0] out_const_4;
  wire [5:0] out_const_5;
  wire [6:0] out_const_6;
  wire [3:0] out_const_7;
  wire [6:0] out_const_8;
  wire [2:0] out_const_9;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_28_i0_fu___float_adde11m52b_1023nih_38396_38867;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_29_i0_fu___float_adde11m52b_1023nih_38396_40724;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_29_i1_fu___float_adde11m52b_1023nih_38396_40733;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_29_i2_fu___float_adde11m52b_1023nih_38396_40742;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_30_i0_fu___float_adde11m52b_1023nih_38396_38480;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_30_i1_fu___float_adde11m52b_1023nih_38396_38559;
  wire signed [0:0] out_rshift_expr_FU_32_0_32_31_i0_fu___float_adde11m52b_1023nih_38396_38870;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_32_i0_fu___float_adde11m52b_1023nih_38396_40727;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_32_i1_fu___float_adde11m52b_1023nih_38396_40736;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_32_i2_fu___float_adde11m52b_1023nih_38396_40745;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_33_i0_fu___float_adde11m52b_1023nih_38396_38483;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_33_i1_fu___float_adde11m52b_1023nih_38396_38562;
  wire out_truth_and_expr_FU_1_1_1_34_i0_fu___float_adde11m52b_1023nih_38396_40624;
  wire out_truth_not_expr_FU_1_1_35_i0_fu___float_adde11m52b_1023nih_38396_38652;
  wire out_truth_not_expr_FU_1_1_35_i1_fu___float_adde11m52b_1023nih_38396_38660;
  wire out_truth_not_expr_FU_1_1_35_i2_fu___float_adde11m52b_1023nih_38396_38938;
  wire out_truth_not_expr_FU_1_1_35_i3_fu___float_adde11m52b_1023nih_38396_39635;
  wire out_truth_not_expr_FU_1_1_35_i4_fu___float_adde11m52b_1023nih_38396_39640;
  wire out_truth_not_expr_FU_1_1_35_i5_fu___float_adde11m52b_1023nih_38396_39694;
  wire [10:0] out_ui_bit_and_expr_FU_0_16_16_36_i0_fu___float_adde11m52b_1023nih_38396_38614;
  wire [62:0] out_ui_bit_and_expr_FU_0_64_64_37_i0_fu___float_adde11m52b_1023nih_38396_38458;
  wire [62:0] out_ui_bit_and_expr_FU_0_64_64_37_i1_fu___float_adde11m52b_1023nih_38396_38465;
  wire [51:0] out_ui_bit_and_expr_FU_0_64_64_38_i0_fu___float_adde11m52b_1023nih_38396_38608;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_39_i0_fu___float_adde11m52b_1023nih_38396_38544;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_39_i1_fu___float_adde11m52b_1023nih_38396_38695;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_39_i2_fu___float_adde11m52b_1023nih_38396_39562;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_39_i3_fu___float_adde11m52b_1023nih_38396_39630;
  wire [15:0] out_ui_bit_and_expr_FU_16_0_16_40_i0_fu___float_adde11m52b_1023nih_38396_39034;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_41_i0_fu___float_adde11m52b_1023nih_38396_38655;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_41_i1_fu___float_adde11m52b_1023nih_38396_38663;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_42_i0_fu___float_adde11m52b_1023nih_38396_39250;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_42_i1_fu___float_adde11m52b_1023nih_38396_39609;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_43_i0_fu___float_adde11m52b_1023nih_38396_39467;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_43_i1_fu___float_adde11m52b_1023nih_38396_39597;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_44_i0_fu___float_adde11m52b_1023nih_38396_38982;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_44_i1_fu___float_adde11m52b_1023nih_38396_39612;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_44_i2_fu___float_adde11m52b_1023nih_38396_39696;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_44_i3_fu___float_adde11m52b_1023nih_38396_39699;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_44_i4_fu___float_adde11m52b_1023nih_38396_39709;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_44_i5_fu___float_adde11m52b_1023nih_38396_39712;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_45_i0_fu___float_adde11m52b_1023nih_38396_39006;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_46_i0_fu___float_adde11m52b_1023nih_38396_38530;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_46_i1_fu___float_adde11m52b_1023nih_38396_39573;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_46_i2_fu___float_adde11m52b_1023nih_38396_39645;
  wire [54:0] out_ui_bit_and_expr_FU_64_0_64_47_i0_fu___float_adde11m52b_1023nih_38396_38959;
  wire [55:0] out_ui_bit_and_expr_FU_64_0_64_48_i0_fu___float_adde11m52b_1023nih_38396_38976;
  wire [55:0] out_ui_bit_and_expr_FU_64_0_64_48_i1_fu___float_adde11m52b_1023nih_38396_38993;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_49_i0_fu___float_adde11m52b_1023nih_38396_38489;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_49_i1_fu___float_adde11m52b_1023nih_38396_38495;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_49_i2_fu___float_adde11m52b_1023nih_38396_38503;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_49_i3_fu___float_adde11m52b_1023nih_38396_38506;
  wire [52:0] out_ui_bit_and_expr_FU_64_64_64_49_i4_fu___float_adde11m52b_1023nih_38396_38928;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_50_i0_fu___float_adde11m52b_1023nih_38396_38882;
  wire [7:0] out_ui_bit_and_expr_FU_8_0_8_51_i0_fu___float_adde11m52b_1023nih_38396_39064;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_52_i0_fu___float_adde11m52b_1023nih_38396_39096;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_53_i0_fu___float_adde11m52b_1023nih_38396_39172;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_54_i0_fu___float_adde11m52b_1023nih_38396_40531;
  wire [55:0] out_ui_bit_ior_concat_expr_FU_55_i0_fu___float_adde11m52b_1023nih_38396_38979;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_56_i0_fu___float_adde11m52b_1023nih_38396_38704;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_57_i0_fu___float_adde11m52b_1023nih_38396_38718;
  wire [62:0] out_ui_bit_ior_expr_FU_0_64_64_58_i0_fu___float_adde11m52b_1023nih_38396_39578;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_59_i0_fu___float_adde11m52b_1023nih_38396_39752;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_60_i0_fu___float_adde11m52b_1023nih_38396_39755;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_61_i0_fu___float_adde11m52b_1023nih_38396_39337;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_62_i0_fu___float_adde11m52b_1023nih_38396_39352;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_63_i0_fu___float_adde11m52b_1023nih_38396_39355;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_64_i0_fu___float_adde11m52b_1023nih_38396_39358;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_65_i0_fu___float_adde11m52b_1023nih_38396_39547;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_65_i1_fu___float_adde11m52b_1023nih_38396_39594;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_65_i2_fu___float_adde11m52b_1023nih_38396_39603;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_65_i3_fu___float_adde11m52b_1023nih_38396_39606;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_65_i4_fu___float_adde11m52b_1023nih_38396_39622;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_65_i5_fu___float_adde11m52b_1023nih_38396_39702;
  wire [63:0] out_ui_bit_ior_expr_FU_64_64_64_66_i0_fu___float_adde11m52b_1023nih_38396_38498;
  wire [63:0] out_ui_bit_ior_expr_FU_64_64_64_66_i1_fu___float_adde11m52b_1023nih_38396_38509;
  wire [51:0] out_ui_bit_ior_expr_FU_64_64_64_66_i2_fu___float_adde11m52b_1023nih_38396_39726;
  wire [5:0] out_ui_bit_ior_expr_FU_8_8_8_67_i0_fu___float_adde11m52b_1023nih_38396_38879;
  wire [63:0] out_ui_bit_not_expr_FU_64_64_68_i0_fu___float_adde11m52b_1023nih_38396_38492;
  wire [54:0] out_ui_bit_not_expr_FU_64_64_68_i1_fu___float_adde11m52b_1023nih_38396_38925;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_69_i0_fu___float_adde11m52b_1023nih_38396_38553;
  wire [55:0] out_ui_bit_xor_expr_FU_64_64_64_70_i0_fu___float_adde11m52b_1023nih_38396_38962;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_71_i0_fu___float_adde11m52b_1023nih_38396_40659;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_71_i1_fu___float_adde11m52b_1023nih_38396_40715;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_72_i0_fu___float_adde11m52b_1023nih_38396_40657;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_72_i1_fu___float_adde11m52b_1023nih_38396_40663;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_72_i2_fu___float_adde11m52b_1023nih_38396_40717;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_73_i0_fu___float_adde11m52b_1023nih_38396_40661;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_73_i1_fu___float_adde11m52b_1023nih_38396_40665;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_73_i2_fu___float_adde11m52b_1023nih_38396_40669;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_73_i3_fu___float_adde11m52b_1023nih_38396_40675;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_73_i4_fu___float_adde11m52b_1023nih_38396_40683;
  wire [55:0] out_ui_cond_expr_FU_64_64_64_64_73_i5_fu___float_adde11m52b_1023nih_38396_40693;
  wire [54:0] out_ui_cond_expr_FU_64_64_64_64_73_i6_fu___float_adde11m52b_1023nih_38396_40707;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_74_i0_fu___float_adde11m52b_1023nih_38396_40705;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_74_i1_fu___float_adde11m52b_1023nih_38396_40709;
  wire out_ui_eq_expr_FU_0_16_16_75_i0_fu___float_adde11m52b_1023nih_38396_38637;
  wire out_ui_eq_expr_FU_0_16_16_75_i1_fu___float_adde11m52b_1023nih_38396_38642;
  wire out_ui_eq_expr_FU_0_8_8_76_i0_fu___float_adde11m52b_1023nih_38396_39450;
  wire out_ui_eq_expr_FU_16_0_16_77_i0_fu___float_adde11m52b_1023nih_38396_38617;
  wire out_ui_eq_expr_FU_16_0_16_77_i1_fu___float_adde11m52b_1023nih_38396_38622;
  wire out_ui_eq_expr_FU_16_0_16_78_i0_fu___float_adde11m52b_1023nih_38396_39881;
  wire out_ui_eq_expr_FU_16_0_16_79_i0_fu___float_adde11m52b_1023nih_38396_39923;
  wire out_ui_eq_expr_FU_1_0_1_80_i0_fu___float_adde11m52b_1023nih_38396_39897;
  wire out_ui_eq_expr_FU_32_0_32_81_i0_fu___float_adde11m52b_1023nih_38396_39877;
  wire out_ui_eq_expr_FU_8_0_8_82_i0_fu___float_adde11m52b_1023nih_38396_39885;
  wire out_ui_eq_expr_FU_8_0_8_82_i1_fu___float_adde11m52b_1023nih_38396_39889;
  wire out_ui_eq_expr_FU_8_0_8_82_i2_fu___float_adde11m52b_1023nih_38396_39893;
  wire out_ui_gt_expr_FU_1_1_1_83_i0_fu___float_adde11m52b_1023nih_38396_39943;
  wire out_ui_le_expr_FU_1_1_1_84_i0_fu___float_adde11m52b_1023nih_38396_39691;
  wire [54:0] out_ui_lshift_expr_FU_0_64_64_85_i0_fu___float_adde11m52b_1023nih_38396_38922;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_86_i0_fu___float_adde11m52b_1023nih_38396_38701;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_86_i1_fu___float_adde11m52b_1023nih_38396_38715;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_86_i2_fu___float_adde11m52b_1023nih_38396_39559;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_86_i3_fu___float_adde11m52b_1023nih_38396_39749;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_87_i0_fu___float_adde11m52b_1023nih_38396_38707;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_87_i1_fu___float_adde11m52b_1023nih_38396_38721;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_88_i0_fu___float_adde11m52b_1023nih_38396_39022;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_89_i0_fu___float_adde11m52b_1023nih_38396_39050;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_90_i0_fu___float_adde11m52b_1023nih_38396_39080;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_91_i0_fu___float_adde11m52b_1023nih_38396_39126;
  wire [55:0] out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_adde11m52b_1023nih_38396_39202;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_adde11m52b_1023nih_38396_39258;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_94_i0_fu___float_adde11m52b_1023nih_38396_39685;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_95_i0_fu___float_adde11m52b_1023nih_38396_39723;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_96_i0_fu___float_adde11m52b_1023nih_38396_40508;
  wire [55:0] out_ui_lshift_expr_FU_64_0_64_97_i0_fu___float_adde11m52b_1023nih_38396_40527;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_adde11m52b_1023nih_38396_40761;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_99_i0_fu___float_adde11m52b_1023nih_38396_40768;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_99_i1_fu___float_adde11m52b_1023nih_38396_40774;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_99_i2_fu___float_adde11m52b_1023nih_38396_40783;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_100_i0_fu___float_adde11m52b_1023nih_38396_39334;
  wire [4:0] out_ui_lshift_expr_FU_8_0_8_101_i0_fu___float_adde11m52b_1023nih_38396_39343;
  wire [5:0] out_ui_lshift_expr_FU_8_0_8_102_i0_fu___float_adde11m52b_1023nih_38396_39349;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_103_i0_fu___float_adde11m52b_1023nih_38396_40749;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_104_i0_fu___float_adde11m52b_1023nih_38396_40753;
  wire out_ui_lt_expr_FU_16_16_16_105_i0_fu___float_adde11m52b_1023nih_38396_39366;
  wire out_ui_lt_expr_FU_1_1_1_106_i0_fu___float_adde11m52b_1023nih_38396_39945;
  wire out_ui_lt_expr_FU_64_64_64_107_i0_fu___float_adde11m52b_1023nih_38396_38472;
  wire [10:0] out_ui_minus_expr_FU_16_16_16_108_i0_fu___float_adde11m52b_1023nih_38396_38690;
  wire out_ui_ne_expr_FU_1_0_1_109_i0_fu___float_adde11m52b_1023nih_38396_38521;
  wire out_ui_ne_expr_FU_1_0_1_109_i1_fu___float_adde11m52b_1023nih_38396_38550;
  wire out_ui_ne_expr_FU_1_0_1_109_i2_fu___float_adde11m52b_1023nih_38396_39925;
  wire out_ui_ne_expr_FU_64_0_64_110_i0_fu___float_adde11m52b_1023nih_38396_38627;
  wire out_ui_ne_expr_FU_64_0_64_110_i1_fu___float_adde11m52b_1023nih_38396_38632;
  wire out_ui_ne_expr_FU_64_0_64_111_i0_fu___float_adde11m52b_1023nih_38396_38933;
  wire out_ui_ne_expr_FU_8_0_8_112_i0_fu___float_adde11m52b_1023nih_38396_38861;
  wire [55:0] out_ui_plus_expr_FU_64_64_64_113_i0_fu___float_adde11m52b_1023nih_38396_38988;
  wire [62:0] out_ui_plus_expr_FU_64_64_64_113_i1_fu___float_adde11m52b_1023nih_38396_39615;
  wire [53:0] out_ui_plus_expr_FU_64_64_64_113_i2_fu___float_adde11m52b_1023nih_38396_40524;
  wire [4:0] out_ui_rshift_expr_FU_16_0_16_114_i0_fu___float_adde11m52b_1023nih_38396_38858;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_115_i0_fu___float_adde11m52b_1023nih_38396_38518;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_115_i1_fu___float_adde11m52b_1023nih_38396_38547;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_116_i0_fu___float_adde11m52b_1023nih_38396_38533;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_116_i1_fu___float_adde11m52b_1023nih_38396_38611;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_116_i2_fu___float_adde11m52b_1023nih_38396_39093;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_116_i3_fu___float_adde11m52b_1023nih_38396_39627;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_117_i0_fu___float_adde11m52b_1023nih_38396_39003;
  wire [15:0] out_ui_rshift_expr_FU_64_0_64_118_i0_fu___float_adde11m52b_1023nih_38396_39031;
  wire [7:0] out_ui_rshift_expr_FU_64_0_64_119_i0_fu___float_adde11m52b_1023nih_38396_39061;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_120_i0_fu___float_adde11m52b_1023nih_38396_39247;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_120_i1_fu___float_adde11m52b_1023nih_38396_39464;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_121_i0_fu___float_adde11m52b_1023nih_38396_39570;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_122_i0_fu___float_adde11m52b_1023nih_38396_39585;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_123_i0_fu___float_adde11m52b_1023nih_38396_39588;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_124_i0_fu___float_adde11m52b_1023nih_38396_39591;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_adde11m52b_1023nih_38396_40500;
  wire [53:0] out_ui_rshift_expr_FU_64_0_64_125_i1_fu___float_adde11m52b_1023nih_38396_40518;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_125_i2_fu___float_adde11m52b_1023nih_38396_40522;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_adde11m52b_1023nih_38396_40504;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_126_i1_fu___float_adde11m52b_1023nih_38396_40511;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_127_i0_fu___float_adde11m52b_1023nih_38396_40757;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_128_i0_fu___float_adde11m52b_1023nih_38396_40764;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_128_i1_fu___float_adde11m52b_1023nih_38396_40777;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_128_i2_fu___float_adde11m52b_1023nih_38396_40786;
  wire [54:0] out_ui_rshift_expr_FU_64_64_64_129_i0_fu___float_adde11m52b_1023nih_38396_38945;
  wire [1:0] out_ui_rshift_expr_FU_64_64_64_129_i1_fu___float_adde11m52b_1023nih_38396_39169;
  wire [10:0] out_ui_ternary_pm_expr_FU_16_0_16_16_130_i0_fu___float_adde11m52b_1023nih_38396_39565;
  
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0110)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110000)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110011)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110100)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110110)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110111)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011110)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011111)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110100)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11111111)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111110)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111111)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111111111111111)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111111111111111111111111111111111111111111111111111)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(55),
    .value(55'b1111111111111111111111111111111111111111111111111111111)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(56),
    .value(56'b11111111111111111111111111111111111111111111111111111111)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111111111111111111111111111111111111111111111111111111111)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0101)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0101000)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b011)) const_9 (.out1(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_38396_38458 (.out1(out_ui_bit_and_expr_FU_0_64_64_37_i0_fu___float_adde11m52b_1023nih_38396_38458),
    .in1(out_const_34),
    .in2(in_port_a));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_38396_38465 (.out1(out_ui_bit_and_expr_FU_0_64_64_37_i1_fu___float_adde11m52b_1023nih_38396_38465),
    .in1(out_const_34),
    .in2(in_port_b));
  ui_lt_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(63),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38472 (.out1(out_ui_lt_expr_FU_64_64_64_107_i0_fu___float_adde11m52b_1023nih_38396_38472),
    .in1(out_ui_bit_and_expr_FU_0_64_64_37_i0_fu___float_adde11m52b_1023nih_38396_38458),
    .in2(out_ui_bit_and_expr_FU_0_64_64_37_i1_fu___float_adde11m52b_1023nih_38396_38465));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_38396_38477 (.out1(out_UIconvert_expr_FU_2_i0_fu___float_adde11m52b_1023nih_38396_38477),
    .in1(out_ui_lt_expr_FU_64_64_64_107_i0_fu___float_adde11m52b_1023nih_38396_38472));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38480 (.out1(out_lshift_expr_FU_64_0_64_30_i0_fu___float_adde11m52b_1023nih_38396_38480),
    .in1(out_UIconvert_expr_FU_2_i0_fu___float_adde11m52b_1023nih_38396_38477),
    .in2(out_const_19));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38483 (.out1(out_rshift_expr_FU_64_0_64_33_i0_fu___float_adde11m52b_1023nih_38396_38483),
    .in1(out_lshift_expr_FU_64_0_64_30_i0_fu___float_adde11m52b_1023nih_38396_38480),
    .in2(out_const_19));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_38486 (.out1(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_38396_38486),
    .in1(out_rshift_expr_FU_64_0_64_33_i0_fu___float_adde11m52b_1023nih_38396_38483));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_38489 (.out1(out_ui_bit_and_expr_FU_64_64_64_49_i0_fu___float_adde11m52b_1023nih_38396_38489),
    .in1(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_38396_38486),
    .in2(in_port_b));
  ui_bit_not_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_38492 (.out1(out_ui_bit_not_expr_FU_64_64_68_i0_fu___float_adde11m52b_1023nih_38396_38492),
    .in1(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_38396_38486));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_38495 (.out1(out_ui_bit_and_expr_FU_64_64_64_49_i1_fu___float_adde11m52b_1023nih_38396_38495),
    .in1(out_ui_bit_not_expr_FU_64_64_68_i0_fu___float_adde11m52b_1023nih_38396_38492),
    .in2(in_port_a));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_38498 (.out1(out_ui_bit_ior_expr_FU_64_64_64_66_i0_fu___float_adde11m52b_1023nih_38396_38498),
    .in1(out_ui_bit_and_expr_FU_64_64_64_49_i1_fu___float_adde11m52b_1023nih_38396_38495),
    .in2(out_ui_bit_and_expr_FU_64_64_64_49_i0_fu___float_adde11m52b_1023nih_38396_38489));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_38503 (.out1(out_ui_bit_and_expr_FU_64_64_64_49_i2_fu___float_adde11m52b_1023nih_38396_38503),
    .in1(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_38396_38486),
    .in2(in_port_a));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_38506 (.out1(out_ui_bit_and_expr_FU_64_64_64_49_i3_fu___float_adde11m52b_1023nih_38396_38506),
    .in1(out_ui_bit_not_expr_FU_64_64_68_i0_fu___float_adde11m52b_1023nih_38396_38492),
    .in2(in_port_b));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_38509 (.out1(out_ui_bit_ior_expr_FU_64_64_64_66_i1_fu___float_adde11m52b_1023nih_38396_38509),
    .in1(out_ui_bit_and_expr_FU_64_64_64_49_i3_fu___float_adde11m52b_1023nih_38396_38506),
    .in2(out_ui_bit_and_expr_FU_64_64_64_49_i2_fu___float_adde11m52b_1023nih_38396_38503));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38518 (.out1(out_ui_rshift_expr_FU_64_0_64_115_i0_fu___float_adde11m52b_1023nih_38396_38518),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_66_i0_fu___float_adde11m52b_1023nih_38396_38498),
    .in2(out_const_19));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38521 (.out1(out_ui_ne_expr_FU_1_0_1_109_i0_fu___float_adde11m52b_1023nih_38396_38521),
    .in1(out_ui_rshift_expr_FU_64_0_64_115_i0_fu___float_adde11m52b_1023nih_38396_38518),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_38396_38530 (.out1(out_ui_bit_and_expr_FU_64_0_64_46_i0_fu___float_adde11m52b_1023nih_38396_38530),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_66_i0_fu___float_adde11m52b_1023nih_38396_38498),
    .in2(out_const_31));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38533 (.out1(out_ui_rshift_expr_FU_64_0_64_116_i0_fu___float_adde11m52b_1023nih_38396_38533),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_66_i0_fu___float_adde11m52b_1023nih_38396_38498),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_38396_38544 (.out1(out_ui_bit_and_expr_FU_16_0_16_39_i0_fu___float_adde11m52b_1023nih_38396_38544),
    .in1(out_ui_rshift_expr_FU_64_0_64_116_i0_fu___float_adde11m52b_1023nih_38396_38533),
    .in2(out_const_28));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38547 (.out1(out_ui_rshift_expr_FU_64_0_64_115_i1_fu___float_adde11m52b_1023nih_38396_38547),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_66_i1_fu___float_adde11m52b_1023nih_38396_38509),
    .in2(out_const_19));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38550 (.out1(out_ui_ne_expr_FU_1_0_1_109_i1_fu___float_adde11m52b_1023nih_38396_38550),
    .in1(out_ui_rshift_expr_FU_64_0_64_115_i1_fu___float_adde11m52b_1023nih_38396_38547),
    .in2(out_const_0));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38553 (.out1(out_ui_bit_xor_expr_FU_1_1_1_69_i0_fu___float_adde11m52b_1023nih_38396_38553),
    .in1(out_ui_ne_expr_FU_1_0_1_109_i1_fu___float_adde11m52b_1023nih_38396_38550),
    .in2(out_ui_ne_expr_FU_1_0_1_109_i0_fu___float_adde11m52b_1023nih_38396_38521));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_38396_38556 (.out1(out_UIconvert_expr_FU_5_i0_fu___float_adde11m52b_1023nih_38396_38556),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_69_i0_fu___float_adde11m52b_1023nih_38396_38553));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38559 (.out1(out_lshift_expr_FU_64_0_64_30_i1_fu___float_adde11m52b_1023nih_38396_38559),
    .in1(out_UIconvert_expr_FU_5_i0_fu___float_adde11m52b_1023nih_38396_38556),
    .in2(out_const_19));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38562 (.out1(out_rshift_expr_FU_64_0_64_33_i1_fu___float_adde11m52b_1023nih_38396_38562),
    .in1(out_lshift_expr_FU_64_0_64_30_i1_fu___float_adde11m52b_1023nih_38396_38559),
    .in2(out_const_19));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_38396_38565 (.out1(out_IUdata_converter_FU_6_i0_fu___float_adde11m52b_1023nih_38396_38565),
    .in1(out_rshift_expr_FU_64_0_64_33_i1_fu___float_adde11m52b_1023nih_38396_38562));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_38396_38608 (.out1(out_ui_bit_and_expr_FU_0_64_64_38_i0_fu___float_adde11m52b_1023nih_38396_38608),
    .in1(out_const_31),
    .in2(out_ui_bit_ior_expr_FU_64_64_64_66_i1_fu___float_adde11m52b_1023nih_38396_38509));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38611 (.out1(out_ui_rshift_expr_FU_64_0_64_116_i1_fu___float_adde11m52b_1023nih_38396_38611),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_66_i1_fu___float_adde11m52b_1023nih_38396_38509),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_38396_38614 (.out1(out_ui_bit_and_expr_FU_0_16_16_36_i0_fu___float_adde11m52b_1023nih_38396_38614),
    .in1(out_const_28),
    .in2(out_ui_rshift_expr_FU_64_0_64_116_i1_fu___float_adde11m52b_1023nih_38396_38611));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38617 (.out1(out_ui_eq_expr_FU_16_0_16_77_i0_fu___float_adde11m52b_1023nih_38396_38617),
    .in1(out_ui_bit_and_expr_FU_16_0_16_39_i0_fu___float_adde11m52b_1023nih_38396_38544),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38622 (.out1(out_ui_eq_expr_FU_16_0_16_77_i1_fu___float_adde11m52b_1023nih_38396_38622),
    .in1(out_ui_bit_and_expr_FU_0_16_16_36_i0_fu___float_adde11m52b_1023nih_38396_38614),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38627 (.out1(out_ui_ne_expr_FU_64_0_64_110_i0_fu___float_adde11m52b_1023nih_38396_38627),
    .in1(out_ui_bit_and_expr_FU_64_0_64_46_i0_fu___float_adde11m52b_1023nih_38396_38530),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38632 (.out1(out_ui_ne_expr_FU_64_0_64_110_i1_fu___float_adde11m52b_1023nih_38396_38632),
    .in1(out_ui_bit_and_expr_FU_0_64_64_38_i0_fu___float_adde11m52b_1023nih_38396_38608),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38637 (.out1(out_ui_eq_expr_FU_0_16_16_75_i0_fu___float_adde11m52b_1023nih_38396_38637),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_16_0_16_39_i0_fu___float_adde11m52b_1023nih_38396_38544));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38642 (.out1(out_ui_eq_expr_FU_0_16_16_75_i1_fu___float_adde11m52b_1023nih_38396_38642),
    .in1(out_const_28),
    .in2(out_ui_bit_and_expr_FU_0_16_16_36_i0_fu___float_adde11m52b_1023nih_38396_38614));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38652 (.out1(out_truth_not_expr_FU_1_1_35_i0_fu___float_adde11m52b_1023nih_38396_38652),
    .in1(out_ui_eq_expr_FU_16_0_16_77_i0_fu___float_adde11m52b_1023nih_38396_38617));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38655 (.out1(out_ui_bit_and_expr_FU_1_0_1_41_i0_fu___float_adde11m52b_1023nih_38396_38655),
    .in1(out_truth_not_expr_FU_1_1_35_i0_fu___float_adde11m52b_1023nih_38396_38652),
    .in2(out_const_20));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38660 (.out1(out_truth_not_expr_FU_1_1_35_i1_fu___float_adde11m52b_1023nih_38396_38660),
    .in1(out_ui_eq_expr_FU_16_0_16_77_i1_fu___float_adde11m52b_1023nih_38396_38622));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38663 (.out1(out_ui_bit_and_expr_FU_1_0_1_41_i1_fu___float_adde11m52b_1023nih_38396_38663),
    .in1(out_truth_not_expr_FU_1_1_35_i1_fu___float_adde11m52b_1023nih_38396_38660),
    .in2(out_const_20));
  ui_minus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_38396_38690 (.out1(out_ui_minus_expr_FU_16_16_16_108_i0_fu___float_adde11m52b_1023nih_38396_38690),
    .in1(out_ui_bit_and_expr_FU_16_0_16_39_i0_fu___float_adde11m52b_1023nih_38396_38544),
    .in2(out_ui_bit_and_expr_FU_0_16_16_36_i0_fu___float_adde11m52b_1023nih_38396_38614));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_38396_38695 (.out1(out_ui_bit_and_expr_FU_16_0_16_39_i1_fu___float_adde11m52b_1023nih_38396_38695),
    .in1(out_ui_minus_expr_FU_16_16_16_108_i0_fu___float_adde11m52b_1023nih_38396_38690),
    .in2(out_const_28));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38698 (.out1(out_UUdata_converter_FU_7_i0_fu___float_adde11m52b_1023nih_38396_38698),
    .in1(out_ui_bit_and_expr_FU_1_0_1_41_i0_fu___float_adde11m52b_1023nih_38396_38655));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38701 (.out1(out_ui_lshift_expr_FU_64_0_64_86_i0_fu___float_adde11m52b_1023nih_38396_38701),
    .in1(out_UUdata_converter_FU_7_i0_fu___float_adde11m52b_1023nih_38396_38698),
    .in2(out_const_14));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_38396_38704 (.out1(out_ui_bit_ior_expr_FU_0_64_64_56_i0_fu___float_adde11m52b_1023nih_38396_38704),
    .in1(out_ui_lshift_expr_FU_64_0_64_86_i0_fu___float_adde11m52b_1023nih_38396_38701),
    .in2(out_ui_bit_and_expr_FU_64_0_64_46_i0_fu___float_adde11m52b_1023nih_38396_38530));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38707 (.out1(out_ui_lshift_expr_FU_64_0_64_87_i0_fu___float_adde11m52b_1023nih_38396_38707),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_56_i0_fu___float_adde11m52b_1023nih_38396_38704),
    .in2(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38712 (.out1(out_UUdata_converter_FU_8_i0_fu___float_adde11m52b_1023nih_38396_38712),
    .in1(out_ui_bit_and_expr_FU_1_0_1_41_i1_fu___float_adde11m52b_1023nih_38396_38663));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38715 (.out1(out_ui_lshift_expr_FU_64_0_64_86_i1_fu___float_adde11m52b_1023nih_38396_38715),
    .in1(out_UUdata_converter_FU_8_i0_fu___float_adde11m52b_1023nih_38396_38712),
    .in2(out_const_14));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_38396_38718 (.out1(out_ui_bit_ior_expr_FU_0_64_64_57_i0_fu___float_adde11m52b_1023nih_38396_38718),
    .in1(out_ui_lshift_expr_FU_64_0_64_86_i1_fu___float_adde11m52b_1023nih_38396_38715),
    .in2(out_ui_bit_and_expr_FU_0_64_64_38_i0_fu___float_adde11m52b_1023nih_38396_38608));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38721 (.out1(out_ui_lshift_expr_FU_64_0_64_87_i1_fu___float_adde11m52b_1023nih_38396_38721),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_57_i0_fu___float_adde11m52b_1023nih_38396_38718),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38858 (.out1(out_ui_rshift_expr_FU_16_0_16_114_i0_fu___float_adde11m52b_1023nih_38396_38858),
    .in1(out_ui_bit_and_expr_FU_16_0_16_39_i1_fu___float_adde11m52b_1023nih_38396_38695),
    .in2(out_const_10));
  ui_ne_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38861 (.out1(out_ui_ne_expr_FU_8_0_8_112_i0_fu___float_adde11m52b_1023nih_38396_38861),
    .in1(out_ui_rshift_expr_FU_16_0_16_114_i0_fu___float_adde11m52b_1023nih_38396_38858),
    .in2(out_const_0));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_38396_38864 (.out1(out_UIconvert_expr_FU_9_i0_fu___float_adde11m52b_1023nih_38396_38864),
    .in1(out_ui_ne_expr_FU_8_0_8_112_i0_fu___float_adde11m52b_1023nih_38396_38861));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_38396_38867 (.out1(out_lshift_expr_FU_32_0_32_28_i0_fu___float_adde11m52b_1023nih_38396_38867),
    .in1(out_UIconvert_expr_FU_9_i0_fu___float_adde11m52b_1023nih_38396_38864),
    .in2(out_const_18));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_38396_38870 (.out1(out_rshift_expr_FU_32_0_32_31_i0_fu___float_adde11m52b_1023nih_38396_38870),
    .in1(out_lshift_expr_FU_32_0_32_28_i0_fu___float_adde11m52b_1023nih_38396_38867),
    .in2(out_const_18));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_38396_38873 (.out1(out_IUdata_converter_FU_10_i0_fu___float_adde11m52b_1023nih_38396_38873),
    .in1(out_rshift_expr_FU_32_0_32_31_i0_fu___float_adde11m52b_1023nih_38396_38870));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_38396_38876 (.out1(out_UUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_38396_38876),
    .in1(out_IUdata_converter_FU_10_i0_fu___float_adde11m52b_1023nih_38396_38873));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(11),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_38396_38879 (.out1(out_ui_bit_ior_expr_FU_8_8_8_67_i0_fu___float_adde11m52b_1023nih_38396_38879),
    .in1(out_UUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_38396_38876),
    .in2(out_ui_bit_and_expr_FU_16_0_16_39_i1_fu___float_adde11m52b_1023nih_38396_38695));
  ui_bit_and_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_38396_38882 (.out1(out_ui_bit_and_expr_FU_8_0_8_50_i0_fu___float_adde11m52b_1023nih_38396_38882),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_67_i0_fu___float_adde11m52b_1023nih_38396_38879),
    .in2(out_const_25));
  UIconvert_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(7)) fu___float_adde11m52b_1023nih_38396_38885 (.out1(out_UIconvert_expr_FU_12_i0_fu___float_adde11m52b_1023nih_38396_38885),
    .in1(out_ui_bit_and_expr_FU_8_0_8_50_i0_fu___float_adde11m52b_1023nih_38396_38882));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38922 (.out1(out_ui_lshift_expr_FU_0_64_64_85_i0_fu___float_adde11m52b_1023nih_38396_38922),
    .in1(out_const_35),
    .in2(out_UIconvert_expr_FU_12_i0_fu___float_adde11m52b_1023nih_38396_38885));
  ui_bit_not_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_38396_38925 (.out1(out_ui_bit_not_expr_FU_64_64_68_i1_fu___float_adde11m52b_1023nih_38396_38925),
    .in1(out_ui_lshift_expr_FU_0_64_64_85_i0_fu___float_adde11m52b_1023nih_38396_38922));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_38396_38928 (.out1(out_ui_bit_and_expr_FU_64_64_64_49_i4_fu___float_adde11m52b_1023nih_38396_38928),
    .in1(out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_adde11m52b_1023nih_38396_40500),
    .in2(out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_adde11m52b_1023nih_38396_40504));
  ui_ne_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38933 (.out1(out_ui_ne_expr_FU_64_0_64_111_i0_fu___float_adde11m52b_1023nih_38396_38933),
    .in1(out_ui_rshift_expr_FU_64_0_64_126_i1_fu___float_adde11m52b_1023nih_38396_40511),
    .in2(out_const_0));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38938 (.out1(out_truth_not_expr_FU_1_1_35_i2_fu___float_adde11m52b_1023nih_38396_38938),
    .in1(out_ui_ne_expr_FU_64_0_64_111_i0_fu___float_adde11m52b_1023nih_38396_38933));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(7),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_38945 (.out1(out_ui_rshift_expr_FU_64_64_64_129_i0_fu___float_adde11m52b_1023nih_38396_38945),
    .in1(out_ui_lshift_expr_FU_64_0_64_87_i1_fu___float_adde11m52b_1023nih_38396_38721),
    .in2(out_UIconvert_expr_FU_12_i0_fu___float_adde11m52b_1023nih_38396_38885));
  ui_bit_and_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(55),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_38396_38959 (.out1(out_ui_bit_and_expr_FU_64_0_64_47_i0_fu___float_adde11m52b_1023nih_38396_38959),
    .in1(out_ui_rshift_expr_FU_64_64_64_129_i0_fu___float_adde11m52b_1023nih_38396_38945),
    .in2(out_const_32));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_38396_38962 (.out1(out_ui_bit_xor_expr_FU_64_64_64_70_i0_fu___float_adde11m52b_1023nih_38396_38962),
    .in1(out_ui_bit_and_expr_FU_64_0_64_47_i0_fu___float_adde11m52b_1023nih_38396_38959),
    .in2(out_IUdata_converter_FU_6_i0_fu___float_adde11m52b_1023nih_38396_38565));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_38396_38976 (.out1(out_ui_bit_and_expr_FU_64_0_64_48_i0_fu___float_adde11m52b_1023nih_38396_38976),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_70_i0_fu___float_adde11m52b_1023nih_38396_38962),
    .in2(out_const_33));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(56),
    .OFFSET_PARAMETER(2)) fu___float_adde11m52b_1023nih_38396_38979 (.out1(out_ui_bit_ior_concat_expr_FU_55_i0_fu___float_adde11m52b_1023nih_38396_38979),
    .in1(out_ui_lshift_expr_FU_64_0_64_97_i0_fu___float_adde11m52b_1023nih_38396_40527),
    .in2(out_ui_bit_and_expr_FU_8_0_8_54_i0_fu___float_adde11m52b_1023nih_38396_40531),
    .in3(out_const_21));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38982 (.out1(out_ui_bit_and_expr_FU_1_1_1_44_i0_fu___float_adde11m52b_1023nih_38396_38982),
    .in1(out_truth_not_expr_FU_1_1_35_i2_fu___float_adde11m52b_1023nih_38396_38938),
    .in2(out_ui_bit_xor_expr_FU_1_1_1_69_i0_fu___float_adde11m52b_1023nih_38396_38553));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_38985 (.out1(out_UUdata_converter_FU_13_i0_fu___float_adde11m52b_1023nih_38396_38985),
    .in1(out_ui_bit_and_expr_FU_1_1_1_44_i0_fu___float_adde11m52b_1023nih_38396_38982));
  ui_plus_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_38396_38988 (.out1(out_ui_plus_expr_FU_64_64_64_113_i0_fu___float_adde11m52b_1023nih_38396_38988),
    .in1(out_ui_bit_ior_concat_expr_FU_55_i0_fu___float_adde11m52b_1023nih_38396_38979),
    .in2(out_UUdata_converter_FU_13_i0_fu___float_adde11m52b_1023nih_38396_38985));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_38396_38993 (.out1(out_ui_bit_and_expr_FU_64_0_64_48_i1_fu___float_adde11m52b_1023nih_38396_38993),
    .in1(out_ui_plus_expr_FU_64_64_64_113_i0_fu___float_adde11m52b_1023nih_38396_38988),
    .in2(out_const_33));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39003 (.out1(out_ui_rshift_expr_FU_64_0_64_117_i0_fu___float_adde11m52b_1023nih_38396_39003),
    .in1(out_ui_bit_and_expr_FU_64_0_64_48_i1_fu___float_adde11m52b_1023nih_38396_38993),
    .in2(out_const_11));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde11m52b_1023nih_38396_39006 (.out1(out_ui_bit_and_expr_FU_32_0_32_45_i0_fu___float_adde11m52b_1023nih_38396_39006),
    .in1(out_ui_rshift_expr_FU_64_0_64_117_i0_fu___float_adde11m52b_1023nih_38396_39003),
    .in2(out_const_30));
  ui_lshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39022 (.out1(out_ui_lshift_expr_FU_64_0_64_88_i0_fu___float_adde11m52b_1023nih_38396_39022),
    .in1(out_ui_bit_and_expr_FU_64_0_64_48_i1_fu___float_adde11m52b_1023nih_38396_38993),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(16),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39031 (.out1(out_ui_rshift_expr_FU_64_0_64_118_i0_fu___float_adde11m52b_1023nih_38396_39031),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i1_fu___float_adde11m52b_1023nih_38396_40665),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu___float_adde11m52b_1023nih_38396_39034 (.out1(out_ui_bit_and_expr_FU_16_0_16_40_i0_fu___float_adde11m52b_1023nih_38396_39034),
    .in1(out_ui_rshift_expr_FU_64_0_64_118_i0_fu___float_adde11m52b_1023nih_38396_39031),
    .in2(out_const_29));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39050 (.out1(out_ui_lshift_expr_FU_64_0_64_89_i0_fu___float_adde11m52b_1023nih_38396_39050),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i1_fu___float_adde11m52b_1023nih_38396_40665),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(8),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39061 (.out1(out_ui_rshift_expr_FU_64_0_64_119_i0_fu___float_adde11m52b_1023nih_38396_39061),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i2_fu___float_adde11m52b_1023nih_38396_40669),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu___float_adde11m52b_1023nih_38396_39064 (.out1(out_ui_bit_and_expr_FU_8_0_8_51_i0_fu___float_adde11m52b_1023nih_38396_39064),
    .in1(out_ui_rshift_expr_FU_64_0_64_119_i0_fu___float_adde11m52b_1023nih_38396_39061),
    .in2(out_const_26));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39080 (.out1(out_ui_lshift_expr_FU_64_0_64_90_i0_fu___float_adde11m52b_1023nih_38396_39080),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i2_fu___float_adde11m52b_1023nih_38396_40669),
    .in2(out_const_4));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39093 (.out1(out_ui_rshift_expr_FU_64_0_64_116_i2_fu___float_adde11m52b_1023nih_38396_39093),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i3_fu___float_adde11m52b_1023nih_38396_40675),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu___float_adde11m52b_1023nih_38396_39096 (.out1(out_ui_bit_and_expr_FU_8_0_8_52_i0_fu___float_adde11m52b_1023nih_38396_39096),
    .in1(out_ui_rshift_expr_FU_64_0_64_116_i2_fu___float_adde11m52b_1023nih_38396_39093),
    .in2(out_const_24));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(4),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39126 (.out1(out_ui_lshift_expr_FU_64_0_64_91_i0_fu___float_adde11m52b_1023nih_38396_39126),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i3_fu___float_adde11m52b_1023nih_38396_40675),
    .in2(out_const_3));
  bit_and_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_in2(7),
    .BITSIZE_out1(7)) fu___float_adde11m52b_1023nih_38396_39166 (.out1(out_bit_and_expr_FU_0_8_8_27_i0_fu___float_adde11m52b_1023nih_38396_39166),
    .in1(out_const_15),
    .in2(out_const_19));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39169 (.out1(out_ui_rshift_expr_FU_64_64_64_129_i1_fu___float_adde11m52b_1023nih_38396_39169),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i4_fu___float_adde11m52b_1023nih_38396_40683),
    .in2(out_bit_and_expr_FU_0_8_8_27_i0_fu___float_adde11m52b_1023nih_38396_39166));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_38396_39172 (.out1(out_ui_bit_and_expr_FU_8_0_8_53_i0_fu___float_adde11m52b_1023nih_38396_39172),
    .in1(out_ui_rshift_expr_FU_64_64_64_129_i1_fu___float_adde11m52b_1023nih_38396_39169),
    .in2(out_const_22));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(3),
    .BITSIZE_out1(56),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39202 (.out1(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_adde11m52b_1023nih_38396_39202),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i4_fu___float_adde11m52b_1023nih_38396_40683),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39247 (.out1(out_ui_rshift_expr_FU_64_0_64_120_i0_fu___float_adde11m52b_1023nih_38396_39247),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i5_fu___float_adde11m52b_1023nih_38396_40693),
    .in2(out_const_16));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39250 (.out1(out_ui_bit_and_expr_FU_1_0_1_42_i0_fu___float_adde11m52b_1023nih_38396_39250),
    .in1(out_ui_rshift_expr_FU_64_0_64_120_i0_fu___float_adde11m52b_1023nih_38396_39247),
    .in2(out_const_20));
  ui_lshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39258 (.out1(out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_adde11m52b_1023nih_38396_39258),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i5_fu___float_adde11m52b_1023nih_38396_40693),
    .in2(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39331 (.out1(out_IUdata_converter_FU_21_i0_fu___float_adde11m52b_1023nih_38396_39331),
    .in1(out_rshift_expr_FU_32_0_32_32_i2_fu___float_adde11m52b_1023nih_38396_40745));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39334 (.out1(out_ui_lshift_expr_FU_8_0_8_100_i0_fu___float_adde11m52b_1023nih_38396_39334),
    .in1(out_IUdata_converter_FU_21_i0_fu___float_adde11m52b_1023nih_38396_39331),
    .in2(out_const_9));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu___float_adde11m52b_1023nih_38396_39337 (.out1(out_ui_bit_ior_expr_FU_0_8_8_61_i0_fu___float_adde11m52b_1023nih_38396_39337),
    .in1(out_ui_lshift_expr_FU_8_0_8_103_i0_fu___float_adde11m52b_1023nih_38396_40749),
    .in2(out_ui_lshift_expr_FU_8_0_8_100_i0_fu___float_adde11m52b_1023nih_38396_39334));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39340 (.out1(out_IUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_38396_39340),
    .in1(out_rshift_expr_FU_32_0_32_32_i1_fu___float_adde11m52b_1023nih_38396_40736));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39343 (.out1(out_ui_lshift_expr_FU_8_0_8_101_i0_fu___float_adde11m52b_1023nih_38396_39343),
    .in1(out_IUdata_converter_FU_22_i0_fu___float_adde11m52b_1023nih_38396_39340),
    .in2(out_const_3));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39346 (.out1(out_IUdata_converter_FU_23_i0_fu___float_adde11m52b_1023nih_38396_39346),
    .in1(out_rshift_expr_FU_32_0_32_32_i0_fu___float_adde11m52b_1023nih_38396_40727));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(6),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39349 (.out1(out_ui_lshift_expr_FU_8_0_8_102_i0_fu___float_adde11m52b_1023nih_38396_39349),
    .in1(out_IUdata_converter_FU_23_i0_fu___float_adde11m52b_1023nih_38396_39346),
    .in2(out_const_7));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_38396_39352 (.out1(out_ui_bit_ior_expr_FU_0_8_8_62_i0_fu___float_adde11m52b_1023nih_38396_39352),
    .in1(out_ui_lshift_expr_FU_8_0_8_101_i0_fu___float_adde11m52b_1023nih_38396_39343),
    .in2(out_ui_lshift_expr_FU_8_0_8_102_i0_fu___float_adde11m52b_1023nih_38396_39349));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(4),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_38396_39355 (.out1(out_ui_bit_ior_expr_FU_0_8_8_63_i0_fu___float_adde11m52b_1023nih_38396_39355),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_62_i0_fu___float_adde11m52b_1023nih_38396_39352),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_61_i0_fu___float_adde11m52b_1023nih_38396_39337));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(2),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_38396_39358 (.out1(out_ui_bit_ior_expr_FU_0_8_8_64_i0_fu___float_adde11m52b_1023nih_38396_39358),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_63_i0_fu___float_adde11m52b_1023nih_38396_39355),
    .in2(out_ui_cond_expr_FU_8_8_8_8_74_i1_fu___float_adde11m52b_1023nih_38396_40709));
  ui_lt_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39366 (.out1(out_ui_lt_expr_FU_16_16_16_105_i0_fu___float_adde11m52b_1023nih_38396_39366),
    .in1(out_ui_bit_and_expr_FU_16_0_16_39_i0_fu___float_adde11m52b_1023nih_38396_38544),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_64_i0_fu___float_adde11m52b_1023nih_38396_39358));
  ui_eq_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39450 (.out1(out_ui_eq_expr_FU_0_8_8_76_i0_fu___float_adde11m52b_1023nih_38396_39450),
    .in1(out_const_25),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_64_i0_fu___float_adde11m52b_1023nih_38396_39358));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39464 (.out1(out_ui_rshift_expr_FU_64_0_64_120_i1_fu___float_adde11m52b_1023nih_38396_39464),
    .in1(out_ui_bit_and_expr_FU_64_0_64_48_i1_fu___float_adde11m52b_1023nih_38396_38993),
    .in2(out_const_16));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39467 (.out1(out_ui_bit_and_expr_FU_1_0_1_43_i0_fu___float_adde11m52b_1023nih_38396_39467),
    .in1(out_ui_rshift_expr_FU_64_0_64_120_i1_fu___float_adde11m52b_1023nih_38396_39464),
    .in2(out_const_20));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39547 (.out1(out_ui_bit_ior_expr_FU_1_1_1_65_i0_fu___float_adde11m52b_1023nih_38396_39547),
    .in1(out_ui_eq_expr_FU_0_8_8_76_i0_fu___float_adde11m52b_1023nih_38396_39450),
    .in2(out_ui_lt_expr_FU_16_16_16_105_i0_fu___float_adde11m52b_1023nih_38396_39366));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(7),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39559 (.out1(out_ui_lshift_expr_FU_64_0_64_86_i2_fu___float_adde11m52b_1023nih_38396_39559),
    .in1(out_ui_bit_and_expr_FU_16_0_16_39_i2_fu___float_adde11m52b_1023nih_38396_39562),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_38396_39562 (.out1(out_ui_bit_and_expr_FU_16_0_16_39_i2_fu___float_adde11m52b_1023nih_38396_39562),
    .in1(out_ui_ternary_pm_expr_FU_16_0_16_16_130_i0_fu___float_adde11m52b_1023nih_38396_39565),
    .in2(out_const_28));
  ui_ternary_pm_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_in3(6),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_38396_39565 (.out1(out_ui_ternary_pm_expr_FU_16_0_16_16_130_i0_fu___float_adde11m52b_1023nih_38396_39565),
    .in1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_38396_40788),
    .in2(out_const_20),
    .in3(out_ASSIGN_UNSIGNED_FU_24_i0_fu___float_adde11m52b_1023nih_38396_40790));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(3),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39570 (.out1(out_ui_rshift_expr_FU_64_0_64_121_i0_fu___float_adde11m52b_1023nih_38396_39570),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i6_fu___float_adde11m52b_1023nih_38396_40707),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_38396_39573 (.out1(out_ui_bit_and_expr_FU_64_0_64_46_i1_fu___float_adde11m52b_1023nih_38396_39573),
    .in1(out_ui_rshift_expr_FU_64_0_64_121_i0_fu___float_adde11m52b_1023nih_38396_39570),
    .in2(out_const_31));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_38396_39578 (.out1(out_ui_bit_ior_expr_FU_0_64_64_58_i0_fu___float_adde11m52b_1023nih_38396_39578),
    .in1(out_ui_bit_and_expr_FU_64_0_64_46_i1_fu___float_adde11m52b_1023nih_38396_39573),
    .in2(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_adde11m52b_1023nih_38396_40761));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39585 (.out1(out_ui_rshift_expr_FU_64_0_64_122_i0_fu___float_adde11m52b_1023nih_38396_39585),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i6_fu___float_adde11m52b_1023nih_38396_40707),
    .in2(out_const_9));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39588 (.out1(out_ui_rshift_expr_FU_64_0_64_123_i0_fu___float_adde11m52b_1023nih_38396_39588),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i6_fu___float_adde11m52b_1023nih_38396_40707),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39591 (.out1(out_ui_rshift_expr_FU_64_0_64_124_i0_fu___float_adde11m52b_1023nih_38396_39591),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i6_fu___float_adde11m52b_1023nih_38396_40707),
    .in2(out_const_1));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39594 (.out1(out_ui_bit_ior_expr_FU_1_1_1_65_i1_fu___float_adde11m52b_1023nih_38396_39594),
    .in1(out_ui_rshift_expr_FU_64_0_64_124_i0_fu___float_adde11m52b_1023nih_38396_39591),
    .in2(out_ui_rshift_expr_FU_64_0_64_122_i0_fu___float_adde11m52b_1023nih_38396_39585));
  ui_bit_and_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39597 (.out1(out_ui_bit_and_expr_FU_1_0_1_43_i1_fu___float_adde11m52b_1023nih_38396_39597),
    .in1(out_ui_cond_expr_FU_64_64_64_64_73_i6_fu___float_adde11m52b_1023nih_38396_40707),
    .in2(out_const_20));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39600 (.out1(out_UUdata_converter_FU_14_i0_fu___float_adde11m52b_1023nih_38396_39600),
    .in1(out_ui_ne_expr_FU_64_0_64_111_i0_fu___float_adde11m52b_1023nih_38396_38933));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39603 (.out1(out_ui_bit_ior_expr_FU_1_1_1_65_i2_fu___float_adde11m52b_1023nih_38396_39603),
    .in1(out_ui_bit_and_expr_FU_1_0_1_43_i1_fu___float_adde11m52b_1023nih_38396_39597),
    .in2(out_UUdata_converter_FU_14_i0_fu___float_adde11m52b_1023nih_38396_39600));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39606 (.out1(out_ui_bit_ior_expr_FU_1_1_1_65_i3_fu___float_adde11m52b_1023nih_38396_39606),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_65_i1_fu___float_adde11m52b_1023nih_38396_39594),
    .in2(out_ui_bit_ior_expr_FU_1_1_1_65_i2_fu___float_adde11m52b_1023nih_38396_39603));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39609 (.out1(out_ui_bit_and_expr_FU_1_0_1_42_i1_fu___float_adde11m52b_1023nih_38396_39609),
    .in1(out_ui_rshift_expr_FU_64_0_64_123_i0_fu___float_adde11m52b_1023nih_38396_39588),
    .in2(out_const_20));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39612 (.out1(out_ui_bit_and_expr_FU_1_1_1_44_i1_fu___float_adde11m52b_1023nih_38396_39612),
    .in1(out_ui_bit_and_expr_FU_1_0_1_42_i1_fu___float_adde11m52b_1023nih_38396_39609),
    .in2(out_ui_bit_ior_expr_FU_1_1_1_65_i3_fu___float_adde11m52b_1023nih_38396_39606));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_38396_39615 (.out1(out_ui_plus_expr_FU_64_64_64_113_i1_fu___float_adde11m52b_1023nih_38396_39615),
    .in1(out_ui_bit_and_expr_FU_1_1_1_44_i1_fu___float_adde11m52b_1023nih_38396_39612),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_58_i0_fu___float_adde11m52b_1023nih_38396_39578));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39622 (.out1(out_ui_bit_ior_expr_FU_1_1_1_65_i4_fu___float_adde11m52b_1023nih_38396_39622),
    .in1(out_ui_eq_expr_FU_0_16_16_75_i1_fu___float_adde11m52b_1023nih_38396_38642),
    .in2(out_ui_eq_expr_FU_0_16_16_75_i0_fu___float_adde11m52b_1023nih_38396_38637));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39627 (.out1(out_ui_rshift_expr_FU_64_0_64_116_i3_fu___float_adde11m52b_1023nih_38396_39627),
    .in1(out_ui_plus_expr_FU_64_64_64_113_i1_fu___float_adde11m52b_1023nih_38396_39615),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_38396_39630 (.out1(out_ui_bit_and_expr_FU_16_0_16_39_i3_fu___float_adde11m52b_1023nih_38396_39630),
    .in1(out_ui_rshift_expr_FU_64_0_64_116_i3_fu___float_adde11m52b_1023nih_38396_39627),
    .in2(out_const_28));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39635 (.out1(out_truth_not_expr_FU_1_1_35_i3_fu___float_adde11m52b_1023nih_38396_39635),
    .in1(out_ui_eq_expr_FU_0_16_16_75_i0_fu___float_adde11m52b_1023nih_38396_38637));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39640 (.out1(out_truth_not_expr_FU_1_1_35_i4_fu___float_adde11m52b_1023nih_38396_39640),
    .in1(out_ui_cond_expr_FU_1_1_1_1_72_i0_fu___float_adde11m52b_1023nih_38396_40657));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_38396_39645 (.out1(out_ui_bit_and_expr_FU_64_0_64_46_i2_fu___float_adde11m52b_1023nih_38396_39645),
    .in1(out_ui_plus_expr_FU_64_64_64_113_i1_fu___float_adde11m52b_1023nih_38396_39615),
    .in2(out_const_31));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39685 (.out1(out_ui_lshift_expr_FU_64_0_64_94_i0_fu___float_adde11m52b_1023nih_38396_39685),
    .in1(out_UUdata_converter_FU_25_i0_fu___float_adde11m52b_1023nih_38396_39688),
    .in2(out_const_19));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39688 (.out1(out_UUdata_converter_FU_25_i0_fu___float_adde11m52b_1023nih_38396_39688),
    .in1(out_ui_le_expr_FU_1_1_1_84_i0_fu___float_adde11m52b_1023nih_38396_39691));
  ui_le_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39691 (.out1(out_ui_le_expr_FU_1_1_1_84_i0_fu___float_adde11m52b_1023nih_38396_39691),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_65_i0_fu___float_adde11m52b_1023nih_38396_39547),
    .in2(out_truth_not_expr_FU_1_1_35_i5_fu___float_adde11m52b_1023nih_38396_39694));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39694 (.out1(out_truth_not_expr_FU_1_1_35_i5_fu___float_adde11m52b_1023nih_38396_39694),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_69_i0_fu___float_adde11m52b_1023nih_38396_38553));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39696 (.out1(out_ui_bit_and_expr_FU_1_1_1_44_i2_fu___float_adde11m52b_1023nih_38396_39696),
    .in1(out_ui_eq_expr_FU_0_16_16_75_i1_fu___float_adde11m52b_1023nih_38396_38642),
    .in2(out_ui_ne_expr_FU_64_0_64_110_i1_fu___float_adde11m52b_1023nih_38396_38632));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39699 (.out1(out_ui_bit_and_expr_FU_1_1_1_44_i3_fu___float_adde11m52b_1023nih_38396_39699),
    .in1(out_ui_eq_expr_FU_0_16_16_75_i0_fu___float_adde11m52b_1023nih_38396_38637),
    .in2(out_ui_ne_expr_FU_64_0_64_110_i0_fu___float_adde11m52b_1023nih_38396_38627));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39702 (.out1(out_ui_bit_ior_expr_FU_1_1_1_65_i5_fu___float_adde11m52b_1023nih_38396_39702),
    .in1(out_ui_bit_and_expr_FU_1_1_1_44_i2_fu___float_adde11m52b_1023nih_38396_39696),
    .in2(out_ui_bit_and_expr_FU_1_1_1_44_i3_fu___float_adde11m52b_1023nih_38396_39699));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39709 (.out1(out_ui_bit_and_expr_FU_1_1_1_44_i4_fu___float_adde11m52b_1023nih_38396_39709),
    .in1(out_ui_eq_expr_FU_0_16_16_75_i0_fu___float_adde11m52b_1023nih_38396_38637),
    .in2(out_ui_bit_xor_expr_FU_1_1_1_69_i0_fu___float_adde11m52b_1023nih_38396_38553));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39712 (.out1(out_ui_bit_and_expr_FU_1_1_1_44_i5_fu___float_adde11m52b_1023nih_38396_39712),
    .in1(out_ui_bit_and_expr_FU_1_1_1_44_i4_fu___float_adde11m52b_1023nih_38396_39709),
    .in2(out_ui_eq_expr_FU_0_16_16_75_i1_fu___float_adde11m52b_1023nih_38396_38642));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39715 (.out1(out_UUdata_converter_FU_15_i0_fu___float_adde11m52b_1023nih_38396_39715),
    .in1(out_ui_bit_and_expr_FU_1_1_1_44_i5_fu___float_adde11m52b_1023nih_38396_39712));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39723 (.out1(out_ui_lshift_expr_FU_64_0_64_95_i0_fu___float_adde11m52b_1023nih_38396_39723),
    .in1(out_ui_cond_expr_FU_1_1_1_1_72_i1_fu___float_adde11m52b_1023nih_38396_40663),
    .in2(out_const_13));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_38396_39726 (.out1(out_ui_bit_ior_expr_FU_64_64_64_66_i2_fu___float_adde11m52b_1023nih_38396_39726),
    .in1(out_ui_lshift_expr_FU_64_0_64_95_i0_fu___float_adde11m52b_1023nih_38396_39723),
    .in2(out_ui_cond_expr_FU_64_64_64_64_73_i0_fu___float_adde11m52b_1023nih_38396_40661));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(7),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_39749 (.out1(out_ui_lshift_expr_FU_64_0_64_86_i3_fu___float_adde11m52b_1023nih_38396_39749),
    .in1(out_ui_cond_expr_FU_16_16_16_16_71_i0_fu___float_adde11m52b_1023nih_38396_40659),
    .in2(out_const_14));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_39752 (.out1(out_ui_bit_ior_expr_FU_0_64_64_59_i0_fu___float_adde11m52b_1023nih_38396_39752),
    .in1(out_ui_lshift_expr_FU_64_0_64_99_i0_fu___float_adde11m52b_1023nih_38396_40768),
    .in2(out_ui_bit_ior_expr_FU_64_64_64_66_i2_fu___float_adde11m52b_1023nih_38396_39726));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_39755 (.out1(out_ui_bit_ior_expr_FU_0_64_64_60_i0_fu___float_adde11m52b_1023nih_38396_39755),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_59_i0_fu___float_adde11m52b_1023nih_38396_39752),
    .in2(out_ui_lshift_expr_FU_64_0_64_86_i3_fu___float_adde11m52b_1023nih_38396_39749));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39877 (.out1(out_ui_eq_expr_FU_32_0_32_81_i0_fu___float_adde11m52b_1023nih_38396_39877),
    .in1(out_ui_bit_and_expr_FU_32_0_32_45_i0_fu___float_adde11m52b_1023nih_38396_39006),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39881 (.out1(out_ui_eq_expr_FU_16_0_16_78_i0_fu___float_adde11m52b_1023nih_38396_39881),
    .in1(out_ui_bit_and_expr_FU_16_0_16_40_i0_fu___float_adde11m52b_1023nih_38396_39034),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39885 (.out1(out_ui_eq_expr_FU_8_0_8_82_i0_fu___float_adde11m52b_1023nih_38396_39885),
    .in1(out_ui_bit_and_expr_FU_8_0_8_51_i0_fu___float_adde11m52b_1023nih_38396_39064),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39889 (.out1(out_ui_eq_expr_FU_8_0_8_82_i1_fu___float_adde11m52b_1023nih_38396_39889),
    .in1(out_ui_bit_and_expr_FU_8_0_8_52_i0_fu___float_adde11m52b_1023nih_38396_39096),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39893 (.out1(out_ui_eq_expr_FU_8_0_8_82_i2_fu___float_adde11m52b_1023nih_38396_39893),
    .in1(out_ui_bit_and_expr_FU_8_0_8_53_i0_fu___float_adde11m52b_1023nih_38396_39172),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39897 (.out1(out_ui_eq_expr_FU_1_0_1_80_i0_fu___float_adde11m52b_1023nih_38396_39897),
    .in1(out_ui_bit_and_expr_FU_1_0_1_42_i0_fu___float_adde11m52b_1023nih_38396_39250),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39923 (.out1(out_ui_eq_expr_FU_16_0_16_79_i0_fu___float_adde11m52b_1023nih_38396_39923),
    .in1(out_ui_bit_and_expr_FU_16_0_16_39_i0_fu___float_adde11m52b_1023nih_38396_38544),
    .in2(out_const_27));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39925 (.out1(out_ui_ne_expr_FU_1_0_1_109_i2_fu___float_adde11m52b_1023nih_38396_39925),
    .in1(out_ui_bit_and_expr_FU_1_0_1_43_i0_fu___float_adde11m52b_1023nih_38396_39467),
    .in2(out_const_0));
  ui_gt_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39943 (.out1(out_ui_gt_expr_FU_1_1_1_83_i0_fu___float_adde11m52b_1023nih_38396_39943),
    .in1(out_truth_not_expr_FU_1_1_35_i3_fu___float_adde11m52b_1023nih_38396_39635),
    .in2(out_ui_bit_ior_expr_FU_1_1_1_65_i0_fu___float_adde11m52b_1023nih_38396_39547));
  ui_lt_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_39945 (.out1(out_ui_lt_expr_FU_1_1_1_106_i0_fu___float_adde11m52b_1023nih_38396_39945),
    .in1(out_ui_eq_expr_FU_0_16_16_75_i1_fu___float_adde11m52b_1023nih_38396_38642),
    .in2(out_truth_not_expr_FU_1_1_35_i4_fu___float_adde11m52b_1023nih_38396_39640));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40500 (.out1(out_ui_rshift_expr_FU_64_0_64_125_i0_fu___float_adde11m52b_1023nih_38396_40500),
    .in1(out_ui_bit_not_expr_FU_64_64_68_i1_fu___float_adde11m52b_1023nih_38396_38925),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40504 (.out1(out_ui_rshift_expr_FU_64_0_64_126_i0_fu___float_adde11m52b_1023nih_38396_40504),
    .in1(out_ui_lshift_expr_FU_64_0_64_87_i1_fu___float_adde11m52b_1023nih_38396_38721),
    .in2(out_const_21));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40508 (.out1(out_ui_lshift_expr_FU_64_0_64_96_i0_fu___float_adde11m52b_1023nih_38396_40508),
    .in1(out_ui_bit_and_expr_FU_64_64_64_49_i4_fu___float_adde11m52b_1023nih_38396_38928),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40511 (.out1(out_ui_rshift_expr_FU_64_0_64_126_i1_fu___float_adde11m52b_1023nih_38396_40511),
    .in1(out_ui_lshift_expr_FU_64_0_64_96_i0_fu___float_adde11m52b_1023nih_38396_40508),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(54),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40518 (.out1(out_ui_rshift_expr_FU_64_0_64_125_i1_fu___float_adde11m52b_1023nih_38396_40518),
    .in1(out_ui_bit_and_expr_FU_64_0_64_48_i0_fu___float_adde11m52b_1023nih_38396_38976),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40522 (.out1(out_ui_rshift_expr_FU_64_0_64_125_i2_fu___float_adde11m52b_1023nih_38396_40522),
    .in1(out_ui_lshift_expr_FU_64_0_64_87_i0_fu___float_adde11m52b_1023nih_38396_38707),
    .in2(out_const_21));
  ui_plus_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(53),
    .BITSIZE_out1(54)) fu___float_adde11m52b_1023nih_38396_40524 (.out1(out_ui_plus_expr_FU_64_64_64_113_i2_fu___float_adde11m52b_1023nih_38396_40524),
    .in1(out_ui_rshift_expr_FU_64_0_64_125_i1_fu___float_adde11m52b_1023nih_38396_40518),
    .in2(out_ui_rshift_expr_FU_64_0_64_125_i2_fu___float_adde11m52b_1023nih_38396_40522));
  ui_lshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(2),
    .BITSIZE_out1(56),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40527 (.out1(out_ui_lshift_expr_FU_64_0_64_97_i0_fu___float_adde11m52b_1023nih_38396_40527),
    .in1(out_ui_plus_expr_FU_64_64_64_113_i2_fu___float_adde11m52b_1023nih_38396_40524),
    .in2(out_const_21));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_38396_40531 (.out1(out_ui_bit_and_expr_FU_8_0_8_54_i0_fu___float_adde11m52b_1023nih_38396_40531),
    .in1(out_ui_bit_and_expr_FU_64_0_64_48_i0_fu___float_adde11m52b_1023nih_38396_38976),
    .in2(out_const_22));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_40624 (.out1(out_truth_and_expr_FU_1_1_1_34_i0_fu___float_adde11m52b_1023nih_38396_40624),
    .in1(out_ui_gt_expr_FU_1_1_1_83_i0_fu___float_adde11m52b_1023nih_38396_39943),
    .in2(out_ui_lt_expr_FU_1_1_1_106_i0_fu___float_adde11m52b_1023nih_38396_39945));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_40657 (.out1(out_ui_cond_expr_FU_1_1_1_1_72_i0_fu___float_adde11m52b_1023nih_38396_40657),
    .in1(out_ui_eq_expr_FU_16_0_16_79_i0_fu___float_adde11m52b_1023nih_38396_39923),
    .in2(out_ui_ne_expr_FU_1_0_1_109_i2_fu___float_adde11m52b_1023nih_38396_39925),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_38396_40659 (.out1(out_ui_cond_expr_FU_16_16_16_16_71_i0_fu___float_adde11m52b_1023nih_38396_40659),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_65_i4_fu___float_adde11m52b_1023nih_38396_39622),
    .in2(out_const_28),
    .in3(out_ui_bit_and_expr_FU_16_0_16_39_i3_fu___float_adde11m52b_1023nih_38396_39630));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(1),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_38396_40661 (.out1(out_ui_cond_expr_FU_64_64_64_64_73_i0_fu___float_adde11m52b_1023nih_38396_40661),
    .in1(out_truth_and_expr_FU_1_1_1_34_i0_fu___float_adde11m52b_1023nih_38396_40624),
    .in2(out_ui_bit_and_expr_FU_64_0_64_46_i2_fu___float_adde11m52b_1023nih_38396_39645),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_40663 (.out1(out_ui_cond_expr_FU_1_1_1_1_72_i1_fu___float_adde11m52b_1023nih_38396_40663),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_65_i5_fu___float_adde11m52b_1023nih_38396_39702),
    .in2(out_const_20),
    .in3(out_UUdata_converter_FU_15_i0_fu___float_adde11m52b_1023nih_38396_39715));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(56),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_40665 (.out1(out_ui_cond_expr_FU_64_64_64_64_73_i1_fu___float_adde11m52b_1023nih_38396_40665),
    .in1(out_ui_eq_expr_FU_32_0_32_81_i0_fu___float_adde11m52b_1023nih_38396_39877),
    .in2(out_ui_lshift_expr_FU_64_0_64_88_i0_fu___float_adde11m52b_1023nih_38396_39022),
    .in3(out_ui_bit_and_expr_FU_64_0_64_48_i1_fu___float_adde11m52b_1023nih_38396_38993));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_40669 (.out1(out_ui_cond_expr_FU_64_64_64_64_73_i2_fu___float_adde11m52b_1023nih_38396_40669),
    .in1(out_ui_eq_expr_FU_16_0_16_78_i0_fu___float_adde11m52b_1023nih_38396_39881),
    .in2(out_ui_lshift_expr_FU_64_0_64_89_i0_fu___float_adde11m52b_1023nih_38396_39050),
    .in3(out_ui_cond_expr_FU_64_64_64_64_73_i1_fu___float_adde11m52b_1023nih_38396_40665));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_40675 (.out1(out_ui_cond_expr_FU_64_64_64_64_73_i3_fu___float_adde11m52b_1023nih_38396_40675),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i0_fu___float_adde11m52b_1023nih_38396_39885),
    .in2(out_ui_lshift_expr_FU_64_0_64_90_i0_fu___float_adde11m52b_1023nih_38396_39080),
    .in3(out_ui_cond_expr_FU_64_64_64_64_73_i2_fu___float_adde11m52b_1023nih_38396_40669));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_38396_40683 (.out1(out_ui_cond_expr_FU_64_64_64_64_73_i4_fu___float_adde11m52b_1023nih_38396_40683),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i1_fu___float_adde11m52b_1023nih_38396_39889),
    .in2(out_ui_lshift_expr_FU_64_0_64_91_i0_fu___float_adde11m52b_1023nih_38396_39126),
    .in3(out_ui_cond_expr_FU_64_64_64_64_73_i3_fu___float_adde11m52b_1023nih_38396_40675));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(56),
    .BITSIZE_in3(64),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_38396_40693 (.out1(out_ui_cond_expr_FU_64_64_64_64_73_i5_fu___float_adde11m52b_1023nih_38396_40693),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i2_fu___float_adde11m52b_1023nih_38396_39893),
    .in2(out_ui_lshift_expr_FU_64_0_64_92_i0_fu___float_adde11m52b_1023nih_38396_39202),
    .in3(out_ui_cond_expr_FU_64_64_64_64_73_i4_fu___float_adde11m52b_1023nih_38396_40683));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_38396_40705 (.out1(out_ui_cond_expr_FU_8_8_8_8_74_i0_fu___float_adde11m52b_1023nih_38396_40705),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i2_fu___float_adde11m52b_1023nih_38396_39893),
    .in2(out_const_22),
    .in3(out_const_20));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(55),
    .BITSIZE_in3(56),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_38396_40707 (.out1(out_ui_cond_expr_FU_64_64_64_64_73_i6_fu___float_adde11m52b_1023nih_38396_40707),
    .in1(out_ui_eq_expr_FU_1_0_1_80_i0_fu___float_adde11m52b_1023nih_38396_39897),
    .in2(out_ui_lshift_expr_FU_64_0_64_93_i0_fu___float_adde11m52b_1023nih_38396_39258),
    .in3(out_ui_cond_expr_FU_64_64_64_64_73_i5_fu___float_adde11m52b_1023nih_38396_40693));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_38396_40709 (.out1(out_ui_cond_expr_FU_8_8_8_8_74_i1_fu___float_adde11m52b_1023nih_38396_40709),
    .in1(out_ui_eq_expr_FU_1_0_1_80_i0_fu___float_adde11m52b_1023nih_38396_39897),
    .in2(out_ui_cond_expr_FU_8_8_8_8_74_i0_fu___float_adde11m52b_1023nih_38396_40705),
    .in3(out_ui_lshift_expr_FU_8_0_8_104_i0_fu___float_adde11m52b_1023nih_38396_40753));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_38396_40715 (.out1(out_ui_cond_expr_FU_16_16_16_16_71_i1_fu___float_adde11m52b_1023nih_38396_40715),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_65_i0_fu___float_adde11m52b_1023nih_38396_39547),
    .in2(out_const_0),
    .in3(out_ui_rshift_expr_FU_64_0_64_127_i0_fu___float_adde11m52b_1023nih_38396_40757));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_40717 (.out1(out_ui_cond_expr_FU_1_1_1_1_72_i2_fu___float_adde11m52b_1023nih_38396_40717),
    .in1(out_ui_ne_expr_FU_1_0_1_109_i0_fu___float_adde11m52b_1023nih_38396_38521),
    .in2(out_ui_rshift_expr_FU_64_0_64_128_i0_fu___float_adde11m52b_1023nih_38396_40764),
    .in3(out_const_0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_38396_40720 (.out1(out_UIdata_converter_FU_16_i0_fu___float_adde11m52b_1023nih_38396_40720),
    .in1(out_ui_eq_expr_FU_32_0_32_81_i0_fu___float_adde11m52b_1023nih_38396_39877));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_38396_40724 (.out1(out_lshift_expr_FU_32_0_32_29_i0_fu___float_adde11m52b_1023nih_38396_40724),
    .in1(out_UIdata_converter_FU_16_i0_fu___float_adde11m52b_1023nih_38396_40720),
    .in2(out_const_17));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_38396_40727 (.out1(out_rshift_expr_FU_32_0_32_32_i0_fu___float_adde11m52b_1023nih_38396_40727),
    .in1(out_lshift_expr_FU_32_0_32_29_i0_fu___float_adde11m52b_1023nih_38396_40724),
    .in2(out_const_17));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_38396_40730 (.out1(out_UIdata_converter_FU_17_i0_fu___float_adde11m52b_1023nih_38396_40730),
    .in1(out_ui_eq_expr_FU_16_0_16_78_i0_fu___float_adde11m52b_1023nih_38396_39881));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_38396_40733 (.out1(out_lshift_expr_FU_32_0_32_29_i1_fu___float_adde11m52b_1023nih_38396_40733),
    .in1(out_UIdata_converter_FU_17_i0_fu___float_adde11m52b_1023nih_38396_40730),
    .in2(out_const_17));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_38396_40736 (.out1(out_rshift_expr_FU_32_0_32_32_i1_fu___float_adde11m52b_1023nih_38396_40736),
    .in1(out_lshift_expr_FU_32_0_32_29_i1_fu___float_adde11m52b_1023nih_38396_40733),
    .in2(out_const_17));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_38396_40739 (.out1(out_UIdata_converter_FU_18_i0_fu___float_adde11m52b_1023nih_38396_40739),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i0_fu___float_adde11m52b_1023nih_38396_39885));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_38396_40742 (.out1(out_lshift_expr_FU_32_0_32_29_i2_fu___float_adde11m52b_1023nih_38396_40742),
    .in1(out_UIdata_converter_FU_18_i0_fu___float_adde11m52b_1023nih_38396_40739),
    .in2(out_const_17));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_38396_40745 (.out1(out_rshift_expr_FU_32_0_32_32_i2_fu___float_adde11m52b_1023nih_38396_40745),
    .in1(out_lshift_expr_FU_32_0_32_29_i2_fu___float_adde11m52b_1023nih_38396_40742),
    .in2(out_const_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40749 (.out1(out_ui_lshift_expr_FU_8_0_8_103_i0_fu___float_adde11m52b_1023nih_38396_40749),
    .in1(out_ui_rshift_expr_FU_64_0_64_128_i1_fu___float_adde11m52b_1023nih_38396_40777),
    .in2(out_const_21));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40753 (.out1(out_ui_lshift_expr_FU_8_0_8_104_i0_fu___float_adde11m52b_1023nih_38396_40753),
    .in1(out_ui_rshift_expr_FU_64_0_64_128_i2_fu___float_adde11m52b_1023nih_38396_40786),
    .in2(out_const_20));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(6),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40757 (.out1(out_ui_rshift_expr_FU_64_0_64_127_i0_fu___float_adde11m52b_1023nih_38396_40757),
    .in1(out_ui_lshift_expr_FU_64_0_64_86_i2_fu___float_adde11m52b_1023nih_38396_39559),
    .in2(out_const_23));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(6),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40761 (.out1(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_adde11m52b_1023nih_38396_40761),
    .in1(out_ui_cond_expr_FU_16_16_16_16_71_i1_fu___float_adde11m52b_1023nih_38396_40715),
    .in2(out_const_23));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40764 (.out1(out_ui_rshift_expr_FU_64_0_64_128_i0_fu___float_adde11m52b_1023nih_38396_40764),
    .in1(out_ui_lshift_expr_FU_64_0_64_94_i0_fu___float_adde11m52b_1023nih_38396_39685),
    .in2(out_const_25));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40768 (.out1(out_ui_lshift_expr_FU_64_0_64_99_i0_fu___float_adde11m52b_1023nih_38396_40768),
    .in1(out_ui_cond_expr_FU_1_1_1_1_72_i2_fu___float_adde11m52b_1023nih_38396_40717),
    .in2(out_const_25));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_40771 (.out1(out_UUdata_converter_FU_19_i0_fu___float_adde11m52b_1023nih_38396_40771),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i1_fu___float_adde11m52b_1023nih_38396_39889));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40774 (.out1(out_ui_lshift_expr_FU_64_0_64_99_i1_fu___float_adde11m52b_1023nih_38396_40774),
    .in1(out_UUdata_converter_FU_19_i0_fu___float_adde11m52b_1023nih_38396_40771),
    .in2(out_const_25));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40777 (.out1(out_ui_rshift_expr_FU_64_0_64_128_i1_fu___float_adde11m52b_1023nih_38396_40777),
    .in1(out_ui_lshift_expr_FU_64_0_64_99_i1_fu___float_adde11m52b_1023nih_38396_40774),
    .in2(out_const_25));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_38396_40780 (.out1(out_UUdata_converter_FU_20_i0_fu___float_adde11m52b_1023nih_38396_40780),
    .in1(out_ui_eq_expr_FU_8_0_8_82_i2_fu___float_adde11m52b_1023nih_38396_39893));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40783 (.out1(out_ui_lshift_expr_FU_64_0_64_99_i2_fu___float_adde11m52b_1023nih_38396_40783),
    .in1(out_UUdata_converter_FU_20_i0_fu___float_adde11m52b_1023nih_38396_40780),
    .in2(out_const_25));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_38396_40786 (.out1(out_ui_rshift_expr_FU_64_0_64_128_i2_fu___float_adde11m52b_1023nih_38396_40786),
    .in1(out_ui_lshift_expr_FU_64_0_64_99_i2_fu___float_adde11m52b_1023nih_38396_40783),
    .in2(out_const_25));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_38396_40788 (.out1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_38396_40788),
    .in1(out_ui_bit_and_expr_FU_16_0_16_39_i0_fu___float_adde11m52b_1023nih_38396_38544));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_38396_40790 (.out1(out_ASSIGN_UNSIGNED_FU_24_i0_fu___float_adde11m52b_1023nih_38396_40790),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_64_i0_fu___float_adde11m52b_1023nih_38396_39358));
  // io-signal post fix
  assign return_port = out_ui_bit_ior_expr_FU_0_64_64_60_i0_fu___float_adde11m52b_1023nih_38396_39755;

endmodule

// FSM based controller description for __float_adde11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___float_adde11m52b_1023nih(done_port,
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

// Top component for __float_adde11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __float_adde11m52b_1023nih(clock,
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
  
  controller___float_adde11m52b_1023nih Controller_i (.done_port(done_port),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___float_adde11m52b_1023nih Datapath_i (.return_port(return_port),
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

// Datapath RTL description for __float_mule11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___float_mule11m52b_1023nih(clock,
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
  wire [31:0] out_ASSIGN_UNSIGNED_FU_10_i0_fu___float_mule11m52b_1023nih_37253_40933;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule11m52b_1023nih_37253_40923;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule11m52b_1023nih_37253_40925;
  wire [20:0] out_ASSIGN_UNSIGNED_FU_7_i0_fu___float_mule11m52b_1023nih_37253_40927;
  wire [31:0] out_ASSIGN_UNSIGNED_FU_8_i0_fu___float_mule11m52b_1023nih_37253_40929;
  wire [20:0] out_ASSIGN_UNSIGNED_FU_9_i0_fu___float_mule11m52b_1023nih_37253_40931;
  wire signed [2:0] out_IIconvert_expr_FU_13_i0_fu___float_mule11m52b_1023nih_37253_37494;
  wire signed [2:0] out_IIconvert_expr_FU_20_i0_fu___float_mule11m52b_1023nih_37253_37592;
  wire signed [2:0] out_IIconvert_expr_FU_24_i0_fu___float_mule11m52b_1023nih_37253_37633;
  wire [0:0] out_IUdata_converter_FU_15_i0_fu___float_mule11m52b_1023nih_37253_37503;
  wire [0:0] out_IUdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_37253_37601;
  wire [1:0] out_IUdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_37253_37708;
  wire [1:0] out_IUdata_converter_FU_41_i0_fu___float_mule11m52b_1023nih_37253_38251;
  wire signed [1:0] out_UIconvert_expr_FU_12_i0_fu___float_mule11m52b_1023nih_37253_37488;
  wire signed [1:0] out_UIconvert_expr_FU_14_i0_fu___float_mule11m52b_1023nih_37253_37497;
  wire signed [1:0] out_UIconvert_expr_FU_19_i0_fu___float_mule11m52b_1023nih_37253_37586;
  wire signed [1:0] out_UIconvert_expr_FU_21_i0_fu___float_mule11m52b_1023nih_37253_37595;
  wire signed [1:0] out_UIconvert_expr_FU_33_i0_fu___float_mule11m52b_1023nih_37253_37960;
  wire signed [1:0] out_UIconvert_expr_FU_40_i0_fu___float_mule11m52b_1023nih_37253_38245;
  wire signed [1:0] out_UIdata_converter_FU_16_i0_fu___float_mule11m52b_1023nih_37253_37639;
  wire signed [1:0] out_UIdata_converter_FU_23_i0_fu___float_mule11m52b_1023nih_37253_37627;
  wire signed [1:0] out_UIdata_converter_FU_25_i0_fu___float_mule11m52b_1023nih_37253_37645;
  wire signed [2:0] out_UIdata_converter_FU_26_i0_fu___float_mule11m52b_1023nih_37253_37651;
  wire signed [1:0] out_UIdata_converter_FU_27_i0_fu___float_mule11m52b_1023nih_37253_37681;
  wire signed [1:0] out_UIdata_converter_FU_28_i0_fu___float_mule11m52b_1023nih_37253_37699;
  wire signed [1:0] out_UIdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_37253_37935;
  wire [10:0] out_UUconvert_expr_FU_2_i0_fu___float_mule11m52b_1023nih_37253_37336;
  wire [10:0] out_UUconvert_expr_FU_4_i0_fu___float_mule11m52b_1023nih_37253_37362;
  wire out_UUdata_converter_FU_11_i0_fu___float_mule11m52b_1023nih_37253_40983;
  wire out_UUdata_converter_FU_17_i0_fu___float_mule11m52b_1023nih_37253_40993;
  wire out_UUdata_converter_FU_18_i0_fu___float_mule11m52b_1023nih_37253_41005;
  wire out_UUdata_converter_FU_31_i0_fu___float_mule11m52b_1023nih_37253_37922;
  wire [11:0] out_UUdata_converter_FU_34_i0_fu___float_mule11m52b_1023nih_37253_37979;
  wire out_UUdata_converter_FU_36_i0_fu___float_mule11m52b_1023nih_37253_38123;
  wire out_UUdata_converter_FU_38_i0_fu___float_mule11m52b_1023nih_37253_38177;
  wire out_UUdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_37253_38236;
  wire out_UUdata_converter_FU_6_i0_fu___float_mule11m52b_1023nih_37253_37375;
  wire signed [1:0] out_bit_and_expr_FU_8_0_8_43_i0_fu___float_mule11m52b_1023nih_37253_37660;
  wire signed [2:0] out_bit_ior_expr_FU_0_8_8_44_i0_fu___float_mule11m52b_1023nih_37253_37500;
  wire signed [2:0] out_bit_ior_expr_FU_0_8_8_45_i0_fu___float_mule11m52b_1023nih_37253_37598;
  wire signed [2:0] out_bit_ior_expr_FU_0_8_8_46_i0_fu___float_mule11m52b_1023nih_37253_37663;
  wire signed [2:0] out_bit_ior_expr_FU_8_8_8_47_i0_fu___float_mule11m52b_1023nih_37253_37654;
  wire signed [1:0] out_bit_ior_expr_FU_8_8_8_47_i1_fu___float_mule11m52b_1023nih_37253_37657;
  wire signed [1:0] out_bit_ior_expr_FU_8_8_8_47_i2_fu___float_mule11m52b_1023nih_37253_37702;
  wire signed [2:0] out_bit_ior_expr_FU_8_8_8_47_i3_fu___float_mule11m52b_1023nih_37253_37705;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [1:0] out_const_10;
  wire [5:0] out_const_11;
  wire [52:0] out_const_12;
  wire [5:0] out_const_13;
  wire [1:0] out_const_14;
  wire [3:0] out_const_15;
  wire [5:0] out_const_16;
  wire [2:0] out_const_17;
  wire [9:0] out_const_18;
  wire [10:0] out_const_19;
  wire [6:0] out_const_2;
  wire [62:0] out_const_20;
  wire [12:0] out_const_21;
  wire [31:0] out_const_22;
  wire [31:0] out_const_23;
  wire [51:0] out_const_24;
  wire [52:0] out_const_25;
  wire [53:0] out_const_26;
  wire [62:0] out_const_27;
  wire [63:0] out_const_28;
  wire [4:0] out_const_3;
  wire [6:0] out_const_4;
  wire [6:0] out_const_5;
  wire [6:0] out_const_6;
  wire [6:0] out_const_7;
  wire [6:0] out_const_8;
  wire out_const_9;
  wire signed [2:0] out_lshift_expr_FU_8_0_8_48_i0_fu___float_mule11m52b_1023nih_37253_37491;
  wire signed [2:0] out_lshift_expr_FU_8_0_8_48_i1_fu___float_mule11m52b_1023nih_37253_37589;
  wire signed [2:0] out_lshift_expr_FU_8_0_8_48_i2_fu___float_mule11m52b_1023nih_37253_37630;
  wire signed [2:0] out_lshift_expr_FU_8_0_8_48_i3_fu___float_mule11m52b_1023nih_37253_38248;
  wire out_truth_and_expr_FU_1_0_1_49_i0_fu___float_mule11m52b_1023nih_37253_37918;
  wire out_truth_and_expr_FU_1_0_1_49_i1_fu___float_mule11m52b_1023nih_37253_38091;
  wire out_truth_and_expr_FU_1_0_1_49_i2_fu___float_mule11m52b_1023nih_37253_38135;
  wire out_truth_and_expr_FU_1_0_1_50_i0_fu___float_mule11m52b_1023nih_37253_40281;
  wire out_truth_and_expr_FU_1_0_1_50_i1_fu___float_mule11m52b_1023nih_37253_40291;
  wire out_truth_and_expr_FU_1_0_1_50_i2_fu___float_mule11m52b_1023nih_37253_40337;
  wire out_truth_and_expr_FU_1_0_1_50_i3_fu___float_mule11m52b_1023nih_37253_40358;
  wire out_truth_and_expr_FU_1_0_1_50_i4_fu___float_mule11m52b_1023nih_37253_40374;
  wire out_truth_and_expr_FU_1_1_1_51_i0_fu___float_mule11m52b_1023nih_37253_40799;
  wire out_truth_and_expr_FU_1_1_1_51_i10_fu___float_mule11m52b_1023nih_37253_40853;
  wire out_truth_and_expr_FU_1_1_1_51_i1_fu___float_mule11m52b_1023nih_37253_40803;
  wire out_truth_and_expr_FU_1_1_1_51_i2_fu___float_mule11m52b_1023nih_37253_40809;
  wire out_truth_and_expr_FU_1_1_1_51_i3_fu___float_mule11m52b_1023nih_37253_40816;
  wire out_truth_and_expr_FU_1_1_1_51_i4_fu___float_mule11m52b_1023nih_37253_40820;
  wire out_truth_and_expr_FU_1_1_1_51_i5_fu___float_mule11m52b_1023nih_37253_40826;
  wire out_truth_and_expr_FU_1_1_1_51_i6_fu___float_mule11m52b_1023nih_37253_40833;
  wire out_truth_and_expr_FU_1_1_1_51_i7_fu___float_mule11m52b_1023nih_37253_40837;
  wire out_truth_and_expr_FU_1_1_1_51_i8_fu___float_mule11m52b_1023nih_37253_40843;
  wire out_truth_and_expr_FU_1_1_1_51_i9_fu___float_mule11m52b_1023nih_37253_40847;
  wire out_truth_not_expr_FU_1_1_52_i0_fu___float_mule11m52b_1023nih_37253_37443;
  wire out_truth_not_expr_FU_1_1_52_i10_fu___float_mule11m52b_1023nih_37253_37932;
  wire out_truth_not_expr_FU_1_1_52_i11_fu___float_mule11m52b_1023nih_37253_40796;
  wire out_truth_not_expr_FU_1_1_52_i12_fu___float_mule11m52b_1023nih_37253_40806;
  wire out_truth_not_expr_FU_1_1_52_i13_fu___float_mule11m52b_1023nih_37253_40813;
  wire out_truth_not_expr_FU_1_1_52_i14_fu___float_mule11m52b_1023nih_37253_40823;
  wire out_truth_not_expr_FU_1_1_52_i15_fu___float_mule11m52b_1023nih_37253_40830;
  wire out_truth_not_expr_FU_1_1_52_i16_fu___float_mule11m52b_1023nih_37253_40840;
  wire out_truth_not_expr_FU_1_1_52_i17_fu___float_mule11m52b_1023nih_37253_40850;
  wire out_truth_not_expr_FU_1_1_52_i18_fu___float_mule11m52b_1023nih_37253_41002;
  wire out_truth_not_expr_FU_1_1_52_i1_fu___float_mule11m52b_1023nih_37253_37447;
  wire out_truth_not_expr_FU_1_1_52_i2_fu___float_mule11m52b_1023nih_37253_37459;
  wire out_truth_not_expr_FU_1_1_52_i3_fu___float_mule11m52b_1023nih_37253_37462;
  wire out_truth_not_expr_FU_1_1_52_i4_fu___float_mule11m52b_1023nih_37253_37468;
  wire out_truth_not_expr_FU_1_1_52_i5_fu___float_mule11m52b_1023nih_37253_37471;
  wire out_truth_not_expr_FU_1_1_52_i6_fu___float_mule11m52b_1023nih_37253_37557;
  wire out_truth_not_expr_FU_1_1_52_i7_fu___float_mule11m52b_1023nih_37253_37560;
  wire out_truth_not_expr_FU_1_1_52_i8_fu___float_mule11m52b_1023nih_37253_37566;
  wire out_truth_not_expr_FU_1_1_52_i9_fu___float_mule11m52b_1023nih_37253_37569;
  wire out_truth_or_expr_FU_0_1_1_53_i0_fu___float_mule11m52b_1023nih_37253_40367;
  wire out_truth_or_expr_FU_1_1_1_54_i0_fu___float_mule11m52b_1023nih_37253_40856;
  wire out_truth_or_expr_FU_1_1_1_54_i1_fu___float_mule11m52b_1023nih_37253_40869;
  wire out_truth_or_expr_FU_1_1_1_54_i2_fu___float_mule11m52b_1023nih_37253_40903;
  wire out_truth_or_expr_FU_1_1_1_54_i3_fu___float_mule11m52b_1023nih_37253_40910;
  wire [0:0] out_ui_bit_and_expr_FU_0_1_1_55_i0_fu___float_mule11m52b_1023nih_37253_37427;
  wire [0:0] out_ui_bit_and_expr_FU_0_1_1_55_i1_fu___float_mule11m52b_1023nih_37253_37532;
  wire [51:0] out_ui_bit_and_expr_FU_0_64_64_56_i0_fu___float_mule11m52b_1023nih_37253_37316;
  wire [51:0] out_ui_bit_and_expr_FU_0_64_64_56_i1_fu___float_mule11m52b_1023nih_37253_37351;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_57_i0_fu___float_mule11m52b_1023nih_37253_37333;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_57_i1_fu___float_mule11m52b_1023nih_37253_37359;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_57_i2_fu___float_mule11m52b_1023nih_37253_38230;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_58_i0_fu___float_mule11m52b_1023nih_37253_37406;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_58_i1_fu___float_mule11m52b_1023nih_37253_37516;
  wire [9:0] out_ui_bit_and_expr_FU_16_0_16_59_i0_fu___float_mule11m52b_1023nih_37253_37899;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_60_i0_fu___float_mule11m52b_1023nih_37253_37436;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_60_i1_fu___float_mule11m52b_1023nih_37253_37535;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_60_i2_fu___float_mule11m52b_1023nih_37253_38289;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_61_i0_fu___float_mule11m52b_1023nih_37253_37506;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_61_i1_fu___float_mule11m52b_1023nih_37253_37604;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_61_i2_fu___float_mule11m52b_1023nih_37253_37669;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_61_i3_fu___float_mule11m52b_1023nih_37253_37687;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_62_i0_fu___float_mule11m52b_1023nih_37253_37915;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_62_i1_fu___float_mule11m52b_1023nih_37253_38107;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_62_i2_fu___float_mule11m52b_1023nih_37253_38126;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_62_i3_fu___float_mule11m52b_1023nih_37253_38242;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i0_fu___float_mule11m52b_1023nih_37253_37430;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i10_fu___float_mule11m52b_1023nih_37253_37678;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i11_fu___float_mule11m52b_1023nih_37253_37693;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i12_fu___float_mule11m52b_1023nih_37253_37696;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i13_fu___float_mule11m52b_1023nih_37253_38132;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i14_fu___float_mule11m52b_1023nih_37253_38188;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i15_fu___float_mule11m52b_1023nih_37253_38352;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i16_fu___float_mule11m52b_1023nih_37253_38362;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i17_fu___float_mule11m52b_1023nih_37253_38370;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i1_fu___float_mule11m52b_1023nih_37253_37450;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i2_fu___float_mule11m52b_1023nih_37253_37456;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i3_fu___float_mule11m52b_1023nih_37253_37465;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i4_fu___float_mule11m52b_1023nih_37253_37538;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i5_fu___float_mule11m52b_1023nih_37253_37554;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i6_fu___float_mule11m52b_1023nih_37253_37563;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i7_fu___float_mule11m52b_1023nih_37253_37636;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i8_fu___float_mule11m52b_1023nih_37253_37642;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_63_i9_fu___float_mule11m52b_1023nih_37253_37675;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_64_i0_fu___float_mule11m52b_1023nih_37253_37805;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_64_i1_fu___float_mule11m52b_1023nih_37253_37813;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_64_i2_fu___float_mule11m52b_1023nih_37253_37821;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_64_i3_fu___float_mule11m52b_1023nih_37253_37835;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_65_i0_fu___float_mule11m52b_1023nih_37253_40268;
  wire [53:0] out_ui_bit_and_expr_FU_64_0_64_66_i0_fu___float_mule11m52b_1023nih_37253_37883;
  wire [53:0] out_ui_bit_and_expr_FU_64_0_64_66_i1_fu___float_mule11m52b_1023nih_37253_37950;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_67_i0_fu___float_mule11m52b_1023nih_37253_37905;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_67_i1_fu___float_mule11m52b_1023nih_37253_37975;
  wire [52:0] out_ui_bit_and_expr_FU_64_0_64_68_i0_fu___float_mule11m52b_1023nih_37253_38116;
  wire [62:0] out_ui_bit_and_expr_FU_64_0_64_69_i0_fu___float_mule11m52b_1023nih_37253_38271;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_70_i0_fu___float_mule11m52b_1023nih_37253_37957;
  wire [1:0] out_ui_bit_and_expr_FU_8_8_8_71_i0_fu___float_mule11m52b_1023nih_37253_37648;
  wire [63:0] out_ui_bit_ior_concat_expr_FU_72_i0_fu___float_mule11m52b_1023nih_37253_37867;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_73_i0_fu___float_mule11m52b_1023nih_37253_37766;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_73_i1_fu___float_mule11m52b_1023nih_37253_37782;
  wire [51:0] out_ui_bit_ior_expr_FU_0_64_64_74_i0_fu___float_mule11m52b_1023nih_37253_37902;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_75_i0_fu___float_mule11m52b_1023nih_37253_37985;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_76_i0_fu___float_mule11m52b_1023nih_37253_38274;
  wire [1:0] out_ui_bit_ior_expr_FU_0_8_8_77_i0_fu___float_mule11m52b_1023nih_37253_38254;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_78_i0_fu___float_mule11m52b_1023nih_37253_37624;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_78_i1_fu___float_mule11m52b_1023nih_37253_38129;
  wire [63:0] out_ui_bit_ior_expr_FU_64_0_64_79_i0_fu___float_mule11m52b_1023nih_37253_38333;
  wire [51:0] out_ui_bit_ior_expr_FU_64_64_64_80_i0_fu___float_mule11m52b_1023nih_37253_37972;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_81_i0_fu___float_mule11m52b_1023nih_37253_37509;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_81_i1_fu___float_mule11m52b_1023nih_37253_37512;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_81_i2_fu___float_mule11m52b_1023nih_37253_37607;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_81_i3_fu___float_mule11m52b_1023nih_37253_37610;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_81_i4_fu___float_mule11m52b_1023nih_37253_38257;
  wire [0:0] out_ui_bit_xor_expr_FU_1_0_1_82_i0_fu___float_mule11m52b_1023nih_37253_37666;
  wire [0:0] out_ui_bit_xor_expr_FU_1_0_1_82_i1_fu___float_mule11m52b_1023nih_37253_37684;
  wire [0:0] out_ui_bit_xor_expr_FU_1_0_1_83_i0_fu___float_mule11m52b_1023nih_37253_37672;
  wire [0:0] out_ui_bit_xor_expr_FU_1_0_1_83_i1_fu___float_mule11m52b_1023nih_37253_37690;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_84_i0_fu___float_mule11m52b_1023nih_37253_37372;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_84_i1_fu___float_mule11m52b_1023nih_37253_38218;
  wire [12:0] out_ui_cond_expr_FU_16_16_16_16_85_i0_fu___float_mule11m52b_1023nih_37253_40875;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_86_i0_fu___float_mule11m52b_1023nih_37253_40860;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_86_i1_fu___float_mule11m52b_1023nih_37253_40879;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_86_i2_fu___float_mule11m52b_1023nih_37253_40882;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_86_i3_fu___float_mule11m52b_1023nih_37253_40888;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_86_i4_fu___float_mule11m52b_1023nih_37253_40896;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_86_i5_fu___float_mule11m52b_1023nih_37253_40898;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_86_i6_fu___float_mule11m52b_1023nih_37253_40917;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_86_i7_fu___float_mule11m52b_1023nih_37253_40919;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_87_i0_fu___float_mule11m52b_1023nih_37253_40872;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_87_i1_fu___float_mule11m52b_1023nih_37253_40913;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_87_i2_fu___float_mule11m52b_1023nih_37253_40915;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_88_i0_fu___float_mule11m52b_1023nih_37253_40866;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_88_i1_fu___float_mule11m52b_1023nih_37253_40885;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_88_i2_fu___float_mule11m52b_1023nih_37253_40900;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_88_i3_fu___float_mule11m52b_1023nih_37253_40907;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_88_i4_fu___float_mule11m52b_1023nih_37253_40921;
  wire out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_37253_37409;
  wire out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_37253_37519;
  wire out_ui_eq_expr_FU_16_0_16_89_i2_fu___float_mule11m52b_1023nih_37253_38233;
  wire out_ui_eq_expr_FU_16_0_16_90_i0_fu___float_mule11m52b_1023nih_37253_37413;
  wire out_ui_eq_expr_FU_16_0_16_90_i1_fu___float_mule11m52b_1023nih_37253_37523;
  wire out_ui_eq_expr_FU_64_0_64_91_i0_fu___float_mule11m52b_1023nih_37253_37416;
  wire out_ui_eq_expr_FU_64_0_64_91_i1_fu___float_mule11m52b_1023nih_37253_37526;
  wire out_ui_eq_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_37253_38185;
  wire out_ui_eq_expr_FU_8_0_8_93_i0_fu___float_mule11m52b_1023nih_37253_38286;
  wire out_ui_eq_expr_FU_8_0_8_94_i0_fu___float_mule11m52b_1023nih_37253_39985;
  wire out_ui_eq_expr_FU_8_0_8_95_i0_fu___float_mule11m52b_1023nih_37253_39987;
  wire out_ui_eq_expr_FU_8_0_8_96_i0_fu___float_mule11m52b_1023nih_37253_39989;
  wire out_ui_eq_expr_FU_8_0_8_97_i0_fu___float_mule11m52b_1023nih_37253_39991;
  wire out_ui_extract_bit_expr_FU_30_i0_fu___float_mule11m52b_1023nih_37253_40378;
  wire out_ui_extract_bit_expr_FU_35_i0_fu___float_mule11m52b_1023nih_37253_40348;
  wire out_ui_extract_bit_expr_FU_37_i0_fu___float_mule11m52b_1023nih_37253_40296;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_100_i0_fu___float_mule11m52b_1023nih_37253_37887;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_101_i0_fu___float_mule11m52b_1023nih_37253_37929;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_101_i1_fu___float_mule11m52b_1023nih_37253_37969;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_102_i0_fu___float_mule11m52b_1023nih_37253_37982;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_103_i0_fu___float_mule11m52b_1023nih_37253_40265;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_104_i0_fu___float_mule11m52b_1023nih_37253_40980;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_37253_37378;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_99_i0_fu___float_mule11m52b_1023nih_37253_37864;
  wire [53:0] out_ui_lshift_expr_FU_64_64_64_105_i0_fu___float_mule11m52b_1023nih_37253_37938;
  wire [50:0] out_ui_lshift_expr_FU_64_64_64_105_i1_fu___float_mule11m52b_1023nih_37253_37966;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_106_i0_fu___float_mule11m52b_1023nih_37253_40937;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_106_i1_fu___float_mule11m52b_1023nih_37253_40944;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_106_i2_fu___float_mule11m52b_1023nih_37253_40951;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_106_i3_fu___float_mule11m52b_1023nih_37253_40955;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_106_i4_fu___float_mule11m52b_1023nih_37253_40959;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_106_i5_fu___float_mule11m52b_1023nih_37253_40969;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_107_i0_fu___float_mule11m52b_1023nih_37253_40987;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_107_i1_fu___float_mule11m52b_1023nih_37253_40996;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_107_i2_fu___float_mule11m52b_1023nih_37253_41008;
  wire [63:0] out_ui_mult_expr_FU_32_32_32_0_108_i0_fu___float_mule11m52b_1023nih_37253_37817;
  wire [52:0] out_ui_mult_expr_FU_32_32_32_0_108_i1_fu___float_mule11m52b_1023nih_37253_37829;
  wire [52:0] out_ui_mult_expr_FU_32_32_32_0_108_i2_fu___float_mule11m52b_1023nih_37253_37843;
  wire [41:0] out_ui_mult_expr_FU_32_32_32_0_108_i3_fu___float_mule11m52b_1023nih_37253_37854;
  wire out_ui_ne_expr_FU_1_0_1_109_i0_fu___float_mule11m52b_1023nih_37253_37348;
  wire out_ui_ne_expr_FU_1_0_1_109_i1_fu___float_mule11m52b_1023nih_37253_37369;
  wire out_ui_ne_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_37253_38119;
  wire out_ui_ne_expr_FU_64_0_64_111_i0_fu___float_mule11m52b_1023nih_37253_38349;
  wire out_ui_ne_expr_FU_64_0_64_111_i1_fu___float_mule11m52b_1023nih_37253_38359;
  wire out_ui_ne_expr_FU_64_0_64_111_i2_fu___float_mule11m52b_1023nih_37253_38367;
  wire out_ui_ne_expr_FU_64_0_64_111_i3_fu___float_mule11m52b_1023nih_37253_39999;
  wire [12:0] out_ui_plus_expr_FU_16_16_16_112_i0_fu___float_mule11m52b_1023nih_37253_37925;
  wire [53:0] out_ui_plus_expr_FU_64_64_64_113_i0_fu___float_mule11m52b_1023nih_37253_37832;
  wire [52:0] out_ui_plus_expr_FU_64_64_64_113_i1_fu___float_mule11m52b_1023nih_37253_37846;
  wire [63:0] out_ui_plus_expr_FU_64_64_64_113_i2_fu___float_mule11m52b_1023nih_37253_38180;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_114_i0_fu___float_mule11m52b_1023nih_37253_37321;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_114_i1_fu___float_mule11m52b_1023nih_37253_37356;
  wire [1:0] out_ui_rshift_expr_FU_64_0_64_114_i2_fu___float_mule11m52b_1023nih_37253_37954;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_114_i3_fu___float_mule11m52b_1023nih_37253_38227;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_115_i0_fu___float_mule11m52b_1023nih_37253_37345;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_115_i1_fu___float_mule11m52b_1023nih_37253_37366;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_115_i2_fu___float_mule11m52b_1023nih_37253_38239;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_116_i0_fu___float_mule11m52b_1023nih_37253_37801;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_116_i1_fu___float_mule11m52b_1023nih_37253_37809;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_116_i2_fu___float_mule11m52b_1023nih_37253_37825;
  wire [21:0] out_ui_rshift_expr_FU_64_0_64_116_i3_fu___float_mule11m52b_1023nih_37253_37839;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_116_i4_fu___float_mule11m52b_1023nih_37253_37850;
  wire [9:0] out_ui_rshift_expr_FU_64_0_64_117_i0_fu___float_mule11m52b_1023nih_37253_37890;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_118_i0_fu___float_mule11m52b_1023nih_37253_37912;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_119_i0_fu___float_mule11m52b_1023nih_37253_38104;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_120_i0_fu___float_mule11m52b_1023nih_37253_40258;
  wire [12:0] out_ui_rshift_expr_FU_64_0_64_121_i0_fu___float_mule11m52b_1023nih_37253_40974;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_122_i0_fu___float_mule11m52b_1023nih_37253_37614;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_122_i1_fu___float_mule11m52b_1023nih_37253_37619;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_123_i0_fu___float_mule11m52b_1023nih_37253_40940;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_123_i1_fu___float_mule11m52b_1023nih_37253_40947;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_123_i2_fu___float_mule11m52b_1023nih_37253_40962;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_123_i3_fu___float_mule11m52b_1023nih_37253_40965;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_124_i0_fu___float_mule11m52b_1023nih_37253_40990;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_124_i1_fu___float_mule11m52b_1023nih_37253_40999;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_124_i2_fu___float_mule11m52b_1023nih_37253_41011;
  wire [1:0] out_ui_rshift_expr_FU_8_8_8_125_i0_fu___float_mule11m52b_1023nih_37253_37963;
  wire [12:0] out_ui_ternary_plus_expr_FU_16_0_16_16_126_i0_fu___float_mule11m52b_1023nih_37253_37748;
  wire [41:0] out_ui_ternary_plus_expr_FU_64_64_64_64_127_i0_fu___float_mule11m52b_1023nih_37253_37860;
  
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(53),
    .value(53'b10000000000000000000000000000000000000000000000000000)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101001)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1100)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110011)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1111111111)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111111)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111110000000000000000000000000000000000000000000000000000)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(13),
    .value(13'b1111111111111)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111110000000001)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111111111111111111111111111111111111111111111111111)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(53),
    .value(53'b11111111111111111111111111111111111111111111111111111)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(54),
    .value(54'b111111111111111111111111111111111111111111111111111111)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111111111111111111111111111111111111111111111111111111111)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01010)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110011)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110100)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110101)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110110)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_9 (.out1(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_37253_37316 (.out1(out_ui_bit_and_expr_FU_0_64_64_56_i0_fu___float_mule11m52b_1023nih_37253_37316),
    .in1(out_const_24),
    .in2(in_port_a));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37321 (.out1(out_ui_rshift_expr_FU_64_0_64_114_i0_fu___float_mule11m52b_1023nih_37253_37321),
    .in1(in_port_a),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_37253_37333 (.out1(out_ui_bit_and_expr_FU_16_0_16_57_i0_fu___float_mule11m52b_1023nih_37253_37333),
    .in1(out_ui_rshift_expr_FU_64_0_64_114_i0_fu___float_mule11m52b_1023nih_37253_37321),
    .in2(out_const_19));
  UUconvert_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_37253_37336 (.out1(out_UUconvert_expr_FU_2_i0_fu___float_mule11m52b_1023nih_37253_37336),
    .in1(out_ui_bit_and_expr_FU_16_0_16_57_i0_fu___float_mule11m52b_1023nih_37253_37333));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37345 (.out1(out_ui_rshift_expr_FU_64_0_64_115_i0_fu___float_mule11m52b_1023nih_37253_37345),
    .in1(in_port_a),
    .in2(out_const_8));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37348 (.out1(out_ui_ne_expr_FU_1_0_1_109_i0_fu___float_mule11m52b_1023nih_37253_37348),
    .in1(out_ui_rshift_expr_FU_64_0_64_115_i0_fu___float_mule11m52b_1023nih_37253_37345),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_37253_37351 (.out1(out_ui_bit_and_expr_FU_0_64_64_56_i1_fu___float_mule11m52b_1023nih_37253_37351),
    .in1(out_const_24),
    .in2(in_port_b));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37356 (.out1(out_ui_rshift_expr_FU_64_0_64_114_i1_fu___float_mule11m52b_1023nih_37253_37356),
    .in1(in_port_b),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_37253_37359 (.out1(out_ui_bit_and_expr_FU_16_0_16_57_i1_fu___float_mule11m52b_1023nih_37253_37359),
    .in1(out_ui_rshift_expr_FU_64_0_64_114_i1_fu___float_mule11m52b_1023nih_37253_37356),
    .in2(out_const_19));
  UUconvert_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_37253_37362 (.out1(out_UUconvert_expr_FU_4_i0_fu___float_mule11m52b_1023nih_37253_37362),
    .in1(out_ui_bit_and_expr_FU_16_0_16_57_i1_fu___float_mule11m52b_1023nih_37253_37359));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37366 (.out1(out_ui_rshift_expr_FU_64_0_64_115_i1_fu___float_mule11m52b_1023nih_37253_37366),
    .in1(in_port_b),
    .in2(out_const_8));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37369 (.out1(out_ui_ne_expr_FU_1_0_1_109_i1_fu___float_mule11m52b_1023nih_37253_37369),
    .in1(out_ui_rshift_expr_FU_64_0_64_115_i1_fu___float_mule11m52b_1023nih_37253_37366),
    .in2(out_const_0));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37372 (.out1(out_ui_bit_xor_expr_FU_1_1_1_84_i0_fu___float_mule11m52b_1023nih_37253_37372),
    .in1(out_ui_ne_expr_FU_1_0_1_109_i1_fu___float_mule11m52b_1023nih_37253_37369),
    .in2(out_ui_ne_expr_FU_1_0_1_109_i0_fu___float_mule11m52b_1023nih_37253_37348));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37375 (.out1(out_UUdata_converter_FU_6_i0_fu___float_mule11m52b_1023nih_37253_37375),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_84_i0_fu___float_mule11m52b_1023nih_37253_37372));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37378 (.out1(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_37253_37378),
    .in1(out_UUdata_converter_FU_6_i0_fu___float_mule11m52b_1023nih_37253_37375),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_37253_37406 (.out1(out_ui_bit_and_expr_FU_16_0_16_58_i0_fu___float_mule11m52b_1023nih_37253_37406),
    .in1(out_ui_bit_and_expr_FU_16_0_16_57_i0_fu___float_mule11m52b_1023nih_37253_37333),
    .in2(out_const_23));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37409 (.out1(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_37253_37409),
    .in1(out_ui_bit_and_expr_FU_16_0_16_58_i0_fu___float_mule11m52b_1023nih_37253_37406),
    .in2(out_const_19));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37413 (.out1(out_ui_eq_expr_FU_16_0_16_90_i0_fu___float_mule11m52b_1023nih_37253_37413),
    .in1(out_UUconvert_expr_FU_2_i0_fu___float_mule11m52b_1023nih_37253_37336),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37416 (.out1(out_ui_eq_expr_FU_64_0_64_91_i0_fu___float_mule11m52b_1023nih_37253_37416),
    .in1(out_ui_bit_and_expr_FU_0_64_64_56_i0_fu___float_mule11m52b_1023nih_37253_37316),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37427 (.out1(out_ui_bit_and_expr_FU_0_1_1_55_i0_fu___float_mule11m52b_1023nih_37253_37427),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_16_0_16_90_i0_fu___float_mule11m52b_1023nih_37253_37413));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37430 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i0_fu___float_mule11m52b_1023nih_37253_37430),
    .in1(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_37253_37409),
    .in2(out_ui_eq_expr_FU_64_0_64_91_i0_fu___float_mule11m52b_1023nih_37253_37416));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37436 (.out1(out_ui_bit_and_expr_FU_1_0_1_60_i0_fu___float_mule11m52b_1023nih_37253_37436),
    .in1(out_ui_bit_and_expr_FU_1_1_1_63_i0_fu___float_mule11m52b_1023nih_37253_37430),
    .in2(out_const_9));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37443 (.out1(out_truth_not_expr_FU_1_1_52_i0_fu___float_mule11m52b_1023nih_37253_37443),
    .in1(out_ui_bit_and_expr_FU_0_1_1_55_i0_fu___float_mule11m52b_1023nih_37253_37427));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37447 (.out1(out_truth_not_expr_FU_1_1_52_i1_fu___float_mule11m52b_1023nih_37253_37447),
    .in1(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_37253_37409));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37450 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i1_fu___float_mule11m52b_1023nih_37253_37450),
    .in1(out_truth_not_expr_FU_1_1_52_i0_fu___float_mule11m52b_1023nih_37253_37443),
    .in2(out_truth_not_expr_FU_1_1_52_i1_fu___float_mule11m52b_1023nih_37253_37447));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37456 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i2_fu___float_mule11m52b_1023nih_37253_37456),
    .in1(out_truth_not_expr_FU_1_1_52_i2_fu___float_mule11m52b_1023nih_37253_37459),
    .in2(out_truth_not_expr_FU_1_1_52_i3_fu___float_mule11m52b_1023nih_37253_37462));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37459 (.out1(out_truth_not_expr_FU_1_1_52_i2_fu___float_mule11m52b_1023nih_37253_37459),
    .in1(out_ui_bit_and_expr_FU_0_1_1_55_i0_fu___float_mule11m52b_1023nih_37253_37427));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37462 (.out1(out_truth_not_expr_FU_1_1_52_i3_fu___float_mule11m52b_1023nih_37253_37462),
    .in1(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_37253_37409));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37465 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i3_fu___float_mule11m52b_1023nih_37253_37465),
    .in1(out_truth_not_expr_FU_1_1_52_i4_fu___float_mule11m52b_1023nih_37253_37468),
    .in2(out_truth_not_expr_FU_1_1_52_i5_fu___float_mule11m52b_1023nih_37253_37471));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37468 (.out1(out_truth_not_expr_FU_1_1_52_i4_fu___float_mule11m52b_1023nih_37253_37468),
    .in1(out_ui_bit_and_expr_FU_0_1_1_55_i0_fu___float_mule11m52b_1023nih_37253_37427));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37471 (.out1(out_truth_not_expr_FU_1_1_52_i5_fu___float_mule11m52b_1023nih_37253_37471),
    .in1(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_37253_37409));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37488 (.out1(out_UIconvert_expr_FU_12_i0_fu___float_mule11m52b_1023nih_37253_37488),
    .in1(out_ui_cond_expr_FU_1_1_1_1_86_i4_fu___float_mule11m52b_1023nih_37253_40896));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(32)) fu___float_mule11m52b_1023nih_37253_37491 (.out1(out_lshift_expr_FU_8_0_8_48_i0_fu___float_mule11m52b_1023nih_37253_37491),
    .in1(out_UIconvert_expr_FU_12_i0_fu___float_mule11m52b_1023nih_37253_37488),
    .in2(out_const_1));
  IIconvert_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_37253_37494 (.out1(out_IIconvert_expr_FU_13_i0_fu___float_mule11m52b_1023nih_37253_37494),
    .in1(out_lshift_expr_FU_8_0_8_48_i0_fu___float_mule11m52b_1023nih_37253_37491));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37497 (.out1(out_UIconvert_expr_FU_14_i0_fu___float_mule11m52b_1023nih_37253_37497),
    .in1(out_ui_cond_expr_FU_1_1_1_1_86_i4_fu___float_mule11m52b_1023nih_37253_40896));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_37253_37500 (.out1(out_bit_ior_expr_FU_0_8_8_44_i0_fu___float_mule11m52b_1023nih_37253_37500),
    .in1(out_IIconvert_expr_FU_13_i0_fu___float_mule11m52b_1023nih_37253_37494),
    .in2(out_UIconvert_expr_FU_14_i0_fu___float_mule11m52b_1023nih_37253_37497));
  IUdata_converter_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37503 (.out1(out_IUdata_converter_FU_15_i0_fu___float_mule11m52b_1023nih_37253_37503),
    .in1(out_bit_ior_expr_FU_0_8_8_44_i0_fu___float_mule11m52b_1023nih_37253_37500));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37506 (.out1(out_ui_bit_and_expr_FU_1_0_1_61_i0_fu___float_mule11m52b_1023nih_37253_37506),
    .in1(out_IUdata_converter_FU_15_i0_fu___float_mule11m52b_1023nih_37253_37503),
    .in2(out_const_9));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37509 (.out1(out_ui_bit_ior_expr_FU_8_8_8_81_i0_fu___float_mule11m52b_1023nih_37253_37509),
    .in1(out_ui_cond_expr_FU_8_8_8_8_88_i2_fu___float_mule11m52b_1023nih_37253_40900),
    .in2(out_ui_lshift_expr_FU_8_0_8_106_i2_fu___float_mule11m52b_1023nih_37253_40951));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37512 (.out1(out_ui_bit_ior_expr_FU_8_8_8_81_i1_fu___float_mule11m52b_1023nih_37253_37512),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_81_i0_fu___float_mule11m52b_1023nih_37253_37509),
    .in2(out_ui_bit_and_expr_FU_1_0_1_61_i0_fu___float_mule11m52b_1023nih_37253_37506));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_37253_37516 (.out1(out_ui_bit_and_expr_FU_16_0_16_58_i1_fu___float_mule11m52b_1023nih_37253_37516),
    .in1(out_ui_bit_and_expr_FU_16_0_16_57_i1_fu___float_mule11m52b_1023nih_37253_37359),
    .in2(out_const_23));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37519 (.out1(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_37253_37519),
    .in1(out_ui_bit_and_expr_FU_16_0_16_58_i1_fu___float_mule11m52b_1023nih_37253_37516),
    .in2(out_const_19));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37523 (.out1(out_ui_eq_expr_FU_16_0_16_90_i1_fu___float_mule11m52b_1023nih_37253_37523),
    .in1(out_UUconvert_expr_FU_4_i0_fu___float_mule11m52b_1023nih_37253_37362),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37526 (.out1(out_ui_eq_expr_FU_64_0_64_91_i1_fu___float_mule11m52b_1023nih_37253_37526),
    .in1(out_ui_bit_and_expr_FU_0_64_64_56_i1_fu___float_mule11m52b_1023nih_37253_37351),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37532 (.out1(out_ui_bit_and_expr_FU_0_1_1_55_i1_fu___float_mule11m52b_1023nih_37253_37532),
    .in1(out_const_9),
    .in2(out_ui_eq_expr_FU_16_0_16_90_i1_fu___float_mule11m52b_1023nih_37253_37523));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37535 (.out1(out_ui_bit_and_expr_FU_1_0_1_60_i1_fu___float_mule11m52b_1023nih_37253_37535),
    .in1(out_ui_eq_expr_FU_64_0_64_91_i1_fu___float_mule11m52b_1023nih_37253_37526),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37538 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i4_fu___float_mule11m52b_1023nih_37253_37538),
    .in1(out_ui_bit_and_expr_FU_1_0_1_60_i1_fu___float_mule11m52b_1023nih_37253_37535),
    .in2(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_37253_37519));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37554 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i5_fu___float_mule11m52b_1023nih_37253_37554),
    .in1(out_truth_not_expr_FU_1_1_52_i6_fu___float_mule11m52b_1023nih_37253_37557),
    .in2(out_truth_not_expr_FU_1_1_52_i7_fu___float_mule11m52b_1023nih_37253_37560));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37557 (.out1(out_truth_not_expr_FU_1_1_52_i6_fu___float_mule11m52b_1023nih_37253_37557),
    .in1(out_ui_bit_and_expr_FU_0_1_1_55_i1_fu___float_mule11m52b_1023nih_37253_37532));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37560 (.out1(out_truth_not_expr_FU_1_1_52_i7_fu___float_mule11m52b_1023nih_37253_37560),
    .in1(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_37253_37519));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37563 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i6_fu___float_mule11m52b_1023nih_37253_37563),
    .in1(out_truth_not_expr_FU_1_1_52_i8_fu___float_mule11m52b_1023nih_37253_37566),
    .in2(out_truth_not_expr_FU_1_1_52_i9_fu___float_mule11m52b_1023nih_37253_37569));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37566 (.out1(out_truth_not_expr_FU_1_1_52_i8_fu___float_mule11m52b_1023nih_37253_37566),
    .in1(out_ui_bit_and_expr_FU_0_1_1_55_i1_fu___float_mule11m52b_1023nih_37253_37532));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37569 (.out1(out_truth_not_expr_FU_1_1_52_i9_fu___float_mule11m52b_1023nih_37253_37569),
    .in1(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_37253_37519));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37586 (.out1(out_UIconvert_expr_FU_19_i0_fu___float_mule11m52b_1023nih_37253_37586),
    .in1(out_ui_cond_expr_FU_1_1_1_1_86_i6_fu___float_mule11m52b_1023nih_37253_40917));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(32)) fu___float_mule11m52b_1023nih_37253_37589 (.out1(out_lshift_expr_FU_8_0_8_48_i1_fu___float_mule11m52b_1023nih_37253_37589),
    .in1(out_UIconvert_expr_FU_19_i0_fu___float_mule11m52b_1023nih_37253_37586),
    .in2(out_const_1));
  IIconvert_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_37253_37592 (.out1(out_IIconvert_expr_FU_20_i0_fu___float_mule11m52b_1023nih_37253_37592),
    .in1(out_lshift_expr_FU_8_0_8_48_i1_fu___float_mule11m52b_1023nih_37253_37589));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37595 (.out1(out_UIconvert_expr_FU_21_i0_fu___float_mule11m52b_1023nih_37253_37595),
    .in1(out_ui_cond_expr_FU_1_1_1_1_86_i6_fu___float_mule11m52b_1023nih_37253_40917));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_37253_37598 (.out1(out_bit_ior_expr_FU_0_8_8_45_i0_fu___float_mule11m52b_1023nih_37253_37598),
    .in1(out_IIconvert_expr_FU_20_i0_fu___float_mule11m52b_1023nih_37253_37592),
    .in2(out_UIconvert_expr_FU_21_i0_fu___float_mule11m52b_1023nih_37253_37595));
  IUdata_converter_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37601 (.out1(out_IUdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_37253_37601),
    .in1(out_bit_ior_expr_FU_0_8_8_45_i0_fu___float_mule11m52b_1023nih_37253_37598));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37604 (.out1(out_ui_bit_and_expr_FU_1_0_1_61_i1_fu___float_mule11m52b_1023nih_37253_37604),
    .in1(out_IUdata_converter_FU_22_i0_fu___float_mule11m52b_1023nih_37253_37601),
    .in2(out_const_9));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37607 (.out1(out_ui_bit_ior_expr_FU_8_8_8_81_i2_fu___float_mule11m52b_1023nih_37253_37607),
    .in1(out_ui_cond_expr_FU_8_8_8_8_88_i4_fu___float_mule11m52b_1023nih_37253_40921),
    .in2(out_ui_lshift_expr_FU_8_0_8_106_i5_fu___float_mule11m52b_1023nih_37253_40969));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37610 (.out1(out_ui_bit_ior_expr_FU_8_8_8_81_i3_fu___float_mule11m52b_1023nih_37253_37610),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_81_i2_fu___float_mule11m52b_1023nih_37253_37607),
    .in2(out_ui_bit_and_expr_FU_1_0_1_61_i1_fu___float_mule11m52b_1023nih_37253_37604));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_37614 (.out1(out_ui_rshift_expr_FU_8_0_8_122_i0_fu___float_mule11m52b_1023nih_37253_37614),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_81_i1_fu___float_mule11m52b_1023nih_37253_37512),
    .in2(out_const_1));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_37619 (.out1(out_ui_rshift_expr_FU_8_0_8_122_i1_fu___float_mule11m52b_1023nih_37253_37619),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_81_i3_fu___float_mule11m52b_1023nih_37253_37610),
    .in2(out_const_1));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37624 (.out1(out_ui_bit_ior_expr_FU_1_1_1_78_i0_fu___float_mule11m52b_1023nih_37253_37624),
    .in1(out_ui_rshift_expr_FU_8_0_8_122_i1_fu___float_mule11m52b_1023nih_37253_37619),
    .in2(out_ui_rshift_expr_FU_8_0_8_122_i0_fu___float_mule11m52b_1023nih_37253_37614));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37627 (.out1(out_UIdata_converter_FU_23_i0_fu___float_mule11m52b_1023nih_37253_37627),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_78_i0_fu___float_mule11m52b_1023nih_37253_37624));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(32)) fu___float_mule11m52b_1023nih_37253_37630 (.out1(out_lshift_expr_FU_8_0_8_48_i2_fu___float_mule11m52b_1023nih_37253_37630),
    .in1(out_UIdata_converter_FU_23_i0_fu___float_mule11m52b_1023nih_37253_37627),
    .in2(out_const_1));
  IIconvert_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_37253_37633 (.out1(out_IIconvert_expr_FU_24_i0_fu___float_mule11m52b_1023nih_37253_37633),
    .in1(out_lshift_expr_FU_8_0_8_48_i2_fu___float_mule11m52b_1023nih_37253_37630));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37636 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i7_fu___float_mule11m52b_1023nih_37253_37636),
    .in1(out_ui_rshift_expr_FU_8_0_8_122_i0_fu___float_mule11m52b_1023nih_37253_37614),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_81_i1_fu___float_mule11m52b_1023nih_37253_37512));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37639 (.out1(out_UIdata_converter_FU_16_i0_fu___float_mule11m52b_1023nih_37253_37639),
    .in1(out_ui_bit_and_expr_FU_1_1_1_63_i7_fu___float_mule11m52b_1023nih_37253_37636));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37642 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i8_fu___float_mule11m52b_1023nih_37253_37642),
    .in1(out_ui_rshift_expr_FU_8_0_8_122_i1_fu___float_mule11m52b_1023nih_37253_37619),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_81_i3_fu___float_mule11m52b_1023nih_37253_37610));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37645 (.out1(out_UIdata_converter_FU_25_i0_fu___float_mule11m52b_1023nih_37253_37645),
    .in1(out_ui_bit_and_expr_FU_1_1_1_63_i8_fu___float_mule11m52b_1023nih_37253_37642));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37648 (.out1(out_ui_bit_and_expr_FU_8_8_8_71_i0_fu___float_mule11m52b_1023nih_37253_37648),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_81_i3_fu___float_mule11m52b_1023nih_37253_37610),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_81_i1_fu___float_mule11m52b_1023nih_37253_37512));
  UIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_37253_37651 (.out1(out_UIdata_converter_FU_26_i0_fu___float_mule11m52b_1023nih_37253_37651),
    .in1(out_ui_bit_and_expr_FU_8_8_8_71_i0_fu___float_mule11m52b_1023nih_37253_37648));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_37253_37654 (.out1(out_bit_ior_expr_FU_8_8_8_47_i0_fu___float_mule11m52b_1023nih_37253_37654),
    .in1(out_UIdata_converter_FU_26_i0_fu___float_mule11m52b_1023nih_37253_37651),
    .in2(out_UIdata_converter_FU_16_i0_fu___float_mule11m52b_1023nih_37253_37639));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37657 (.out1(out_bit_ior_expr_FU_8_8_8_47_i1_fu___float_mule11m52b_1023nih_37253_37657),
    .in1(out_bit_ior_expr_FU_8_8_8_47_i0_fu___float_mule11m52b_1023nih_37253_37654),
    .in2(out_UIdata_converter_FU_25_i0_fu___float_mule11m52b_1023nih_37253_37645));
  bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37660 (.out1(out_bit_and_expr_FU_8_0_8_43_i0_fu___float_mule11m52b_1023nih_37253_37660),
    .in1(out_bit_ior_expr_FU_8_8_8_47_i1_fu___float_mule11m52b_1023nih_37253_37657),
    .in2(out_const_1));
  bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_37253_37663 (.out1(out_bit_ior_expr_FU_0_8_8_46_i0_fu___float_mule11m52b_1023nih_37253_37663),
    .in1(out_bit_and_expr_FU_8_0_8_43_i0_fu___float_mule11m52b_1023nih_37253_37660),
    .in2(out_IIconvert_expr_FU_24_i0_fu___float_mule11m52b_1023nih_37253_37633));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37666 (.out1(out_ui_bit_xor_expr_FU_1_0_1_82_i0_fu___float_mule11m52b_1023nih_37253_37666),
    .in1(out_ui_rshift_expr_FU_8_0_8_122_i0_fu___float_mule11m52b_1023nih_37253_37614),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37669 (.out1(out_ui_bit_and_expr_FU_1_0_1_61_i2_fu___float_mule11m52b_1023nih_37253_37669),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_81_i1_fu___float_mule11m52b_1023nih_37253_37512),
    .in2(out_const_9));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37672 (.out1(out_ui_bit_xor_expr_FU_1_0_1_83_i0_fu___float_mule11m52b_1023nih_37253_37672),
    .in1(out_ui_bit_and_expr_FU_1_0_1_61_i2_fu___float_mule11m52b_1023nih_37253_37669),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37675 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i9_fu___float_mule11m52b_1023nih_37253_37675),
    .in1(out_ui_bit_xor_expr_FU_1_0_1_83_i0_fu___float_mule11m52b_1023nih_37253_37672),
    .in2(out_ui_bit_xor_expr_FU_1_0_1_82_i0_fu___float_mule11m52b_1023nih_37253_37666));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37678 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i10_fu___float_mule11m52b_1023nih_37253_37678),
    .in1(out_ui_bit_and_expr_FU_1_1_1_63_i9_fu___float_mule11m52b_1023nih_37253_37675),
    .in2(out_ui_rshift_expr_FU_8_0_8_122_i1_fu___float_mule11m52b_1023nih_37253_37619));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37681 (.out1(out_UIdata_converter_FU_27_i0_fu___float_mule11m52b_1023nih_37253_37681),
    .in1(out_ui_bit_and_expr_FU_1_1_1_63_i10_fu___float_mule11m52b_1023nih_37253_37678));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37684 (.out1(out_ui_bit_xor_expr_FU_1_0_1_82_i1_fu___float_mule11m52b_1023nih_37253_37684),
    .in1(out_ui_rshift_expr_FU_8_0_8_122_i1_fu___float_mule11m52b_1023nih_37253_37619),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37687 (.out1(out_ui_bit_and_expr_FU_1_0_1_61_i3_fu___float_mule11m52b_1023nih_37253_37687),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_81_i3_fu___float_mule11m52b_1023nih_37253_37610),
    .in2(out_const_9));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37690 (.out1(out_ui_bit_xor_expr_FU_1_0_1_83_i1_fu___float_mule11m52b_1023nih_37253_37690),
    .in1(out_ui_bit_and_expr_FU_1_0_1_61_i3_fu___float_mule11m52b_1023nih_37253_37687),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37693 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i11_fu___float_mule11m52b_1023nih_37253_37693),
    .in1(out_ui_bit_xor_expr_FU_1_0_1_83_i1_fu___float_mule11m52b_1023nih_37253_37690),
    .in2(out_ui_bit_xor_expr_FU_1_0_1_82_i1_fu___float_mule11m52b_1023nih_37253_37684));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37696 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i12_fu___float_mule11m52b_1023nih_37253_37696),
    .in1(out_ui_rshift_expr_FU_8_0_8_122_i0_fu___float_mule11m52b_1023nih_37253_37614),
    .in2(out_ui_bit_and_expr_FU_1_1_1_63_i11_fu___float_mule11m52b_1023nih_37253_37693));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37699 (.out1(out_UIdata_converter_FU_28_i0_fu___float_mule11m52b_1023nih_37253_37699),
    .in1(out_ui_bit_and_expr_FU_1_1_1_63_i12_fu___float_mule11m52b_1023nih_37253_37696));
  bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37702 (.out1(out_bit_ior_expr_FU_8_8_8_47_i2_fu___float_mule11m52b_1023nih_37253_37702),
    .in1(out_UIdata_converter_FU_28_i0_fu___float_mule11m52b_1023nih_37253_37699),
    .in2(out_UIdata_converter_FU_27_i0_fu___float_mule11m52b_1023nih_37253_37681));
  bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu___float_mule11m52b_1023nih_37253_37705 (.out1(out_bit_ior_expr_FU_8_8_8_47_i3_fu___float_mule11m52b_1023nih_37253_37705),
    .in1(out_bit_ior_expr_FU_0_8_8_46_i0_fu___float_mule11m52b_1023nih_37253_37663),
    .in2(out_bit_ior_expr_FU_8_8_8_47_i2_fu___float_mule11m52b_1023nih_37253_37702));
  IUdata_converter_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37708 (.out1(out_IUdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_37253_37708),
    .in1(out_bit_ior_expr_FU_8_8_8_47_i3_fu___float_mule11m52b_1023nih_37253_37705));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_in3(11),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_37253_37748 (.out1(out_ui_ternary_plus_expr_FU_16_0_16_16_126_i0_fu___float_mule11m52b_1023nih_37253_37748),
    .in1(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule11m52b_1023nih_37253_40923),
    .in2(out_const_22),
    .in3(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule11m52b_1023nih_37253_40925));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_37253_37766 (.out1(out_ui_bit_ior_expr_FU_0_64_64_73_i0_fu___float_mule11m52b_1023nih_37253_37766),
    .in1(out_const_12),
    .in2(out_ui_bit_and_expr_FU_0_64_64_56_i0_fu___float_mule11m52b_1023nih_37253_37316));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_37253_37782 (.out1(out_ui_bit_ior_expr_FU_0_64_64_73_i1_fu___float_mule11m52b_1023nih_37253_37782),
    .in1(out_const_12),
    .in2(out_ui_bit_and_expr_FU_0_64_64_56_i1_fu___float_mule11m52b_1023nih_37253_37351));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37801 (.out1(out_ui_rshift_expr_FU_64_0_64_116_i0_fu___float_mule11m52b_1023nih_37253_37801),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_73_i0_fu___float_mule11m52b_1023nih_37253_37766),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_37253_37805 (.out1(out_ui_bit_and_expr_FU_32_0_32_64_i0_fu___float_mule11m52b_1023nih_37253_37805),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_73_i0_fu___float_mule11m52b_1023nih_37253_37766),
    .in2(out_const_23));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37809 (.out1(out_ui_rshift_expr_FU_64_0_64_116_i1_fu___float_mule11m52b_1023nih_37253_37809),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_73_i1_fu___float_mule11m52b_1023nih_37253_37782),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_37253_37813 (.out1(out_ui_bit_and_expr_FU_32_0_32_64_i1_fu___float_mule11m52b_1023nih_37253_37813),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_73_i1_fu___float_mule11m52b_1023nih_37253_37782),
    .in2(out_const_23));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(64),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_37253_37817 (.out1(out_ui_mult_expr_FU_32_32_32_0_108_i0_fu___float_mule11m52b_1023nih_37253_37817),
    .clock(clock),
    .in1(out_ui_bit_and_expr_FU_32_0_32_64_i1_fu___float_mule11m52b_1023nih_37253_37813),
    .in2(out_ui_bit_and_expr_FU_32_0_32_64_i0_fu___float_mule11m52b_1023nih_37253_37805));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_37253_37821 (.out1(out_ui_bit_and_expr_FU_32_0_32_64_i2_fu___float_mule11m52b_1023nih_37253_37821),
    .in1(out_ui_mult_expr_FU_32_32_32_0_108_i0_fu___float_mule11m52b_1023nih_37253_37817),
    .in2(out_const_23));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37825 (.out1(out_ui_rshift_expr_FU_64_0_64_116_i2_fu___float_mule11m52b_1023nih_37253_37825),
    .in1(out_ui_mult_expr_FU_32_32_32_0_108_i0_fu___float_mule11m52b_1023nih_37253_37817),
    .in2(out_const_2));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(21),
    .BITSIZE_out1(53),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_37253_37829 (.out1(out_ui_mult_expr_FU_32_32_32_0_108_i1_fu___float_mule11m52b_1023nih_37253_37829),
    .clock(clock),
    .in1(out_ASSIGN_UNSIGNED_FU_10_i0_fu___float_mule11m52b_1023nih_37253_40933),
    .in2(out_ui_rshift_expr_FU_64_0_64_116_i0_fu___float_mule11m52b_1023nih_37253_37801));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(53),
    .BITSIZE_out1(54)) fu___float_mule11m52b_1023nih_37253_37832 (.out1(out_ui_plus_expr_FU_64_64_64_113_i0_fu___float_mule11m52b_1023nih_37253_37832),
    .in1(out_ui_rshift_expr_FU_64_0_64_116_i2_fu___float_mule11m52b_1023nih_37253_37825),
    .in2(out_ui_mult_expr_FU_32_32_32_0_108_i1_fu___float_mule11m52b_1023nih_37253_37829));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_37253_37835 (.out1(out_ui_bit_and_expr_FU_32_0_32_64_i3_fu___float_mule11m52b_1023nih_37253_37835),
    .in1(out_ui_plus_expr_FU_64_64_64_113_i0_fu___float_mule11m52b_1023nih_37253_37832),
    .in2(out_const_23));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(22),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37839 (.out1(out_ui_rshift_expr_FU_64_0_64_116_i3_fu___float_mule11m52b_1023nih_37253_37839),
    .in1(out_ui_plus_expr_FU_64_64_64_113_i0_fu___float_mule11m52b_1023nih_37253_37832),
    .in2(out_const_2));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(53),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_37253_37843 (.out1(out_ui_mult_expr_FU_32_32_32_0_108_i2_fu___float_mule11m52b_1023nih_37253_37843),
    .clock(clock),
    .in1(out_ui_rshift_expr_FU_64_0_64_116_i1_fu___float_mule11m52b_1023nih_37253_37809),
    .in2(out_ASSIGN_UNSIGNED_FU_8_i0_fu___float_mule11m52b_1023nih_37253_40929));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_37253_37846 (.out1(out_ui_plus_expr_FU_64_64_64_113_i1_fu___float_mule11m52b_1023nih_37253_37846),
    .in1(out_ui_bit_and_expr_FU_32_0_32_64_i3_fu___float_mule11m52b_1023nih_37253_37835),
    .in2(out_ui_mult_expr_FU_32_32_32_0_108_i2_fu___float_mule11m52b_1023nih_37253_37843));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37850 (.out1(out_ui_rshift_expr_FU_64_0_64_116_i4_fu___float_mule11m52b_1023nih_37253_37850),
    .in1(out_ui_plus_expr_FU_64_64_64_113_i1_fu___float_mule11m52b_1023nih_37253_37846),
    .in2(out_const_2));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(42),
    .PIPE_PARAMETER(0)) fu___float_mule11m52b_1023nih_37253_37854 (.out1(out_ui_mult_expr_FU_32_32_32_0_108_i3_fu___float_mule11m52b_1023nih_37253_37854),
    .clock(clock),
    .in1(out_ASSIGN_UNSIGNED_FU_9_i0_fu___float_mule11m52b_1023nih_37253_40931),
    .in2(out_ASSIGN_UNSIGNED_FU_7_i0_fu___float_mule11m52b_1023nih_37253_40927));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(22),
    .BITSIZE_in2(42),
    .BITSIZE_in3(21),
    .BITSIZE_out1(42)) fu___float_mule11m52b_1023nih_37253_37860 (.out1(out_ui_ternary_plus_expr_FU_64_64_64_64_127_i0_fu___float_mule11m52b_1023nih_37253_37860),
    .in1(out_ui_rshift_expr_FU_64_0_64_116_i3_fu___float_mule11m52b_1023nih_37253_37839),
    .in2(out_ui_mult_expr_FU_32_32_32_0_108_i3_fu___float_mule11m52b_1023nih_37253_37854),
    .in3(out_ui_rshift_expr_FU_64_0_64_116_i4_fu___float_mule11m52b_1023nih_37253_37850));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37864 (.out1(out_ui_lshift_expr_FU_64_0_64_99_i0_fu___float_mule11m52b_1023nih_37253_37864),
    .in1(out_ui_plus_expr_FU_64_64_64_113_i1_fu___float_mule11m52b_1023nih_37253_37846),
    .in2(out_const_2));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(32),
    .BITSIZE_in3(6),
    .BITSIZE_out1(64),
    .OFFSET_PARAMETER(32)) fu___float_mule11m52b_1023nih_37253_37867 (.out1(out_ui_bit_ior_concat_expr_FU_72_i0_fu___float_mule11m52b_1023nih_37253_37867),
    .in1(out_ui_lshift_expr_FU_64_0_64_103_i0_fu___float_mule11m52b_1023nih_37253_40265),
    .in2(out_ui_bit_and_expr_FU_32_0_32_65_i0_fu___float_mule11m52b_1023nih_37253_40268),
    .in3(out_const_11));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(54),
    .BITSIZE_out1(54)) fu___float_mule11m52b_1023nih_37253_37883 (.out1(out_ui_bit_and_expr_FU_64_0_64_66_i0_fu___float_mule11m52b_1023nih_37253_37883),
    .in1(out_ui_bit_ior_concat_expr_FU_72_i0_fu___float_mule11m52b_1023nih_37253_37867),
    .in2(out_const_26));
  ui_lshift_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(5),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37887 (.out1(out_ui_lshift_expr_FU_64_0_64_100_i0_fu___float_mule11m52b_1023nih_37253_37887),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_127_i0_fu___float_mule11m52b_1023nih_37253_37860),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37890 (.out1(out_ui_rshift_expr_FU_64_0_64_117_i0_fu___float_mule11m52b_1023nih_37253_37890),
    .in1(out_ui_bit_ior_concat_expr_FU_72_i0_fu___float_mule11m52b_1023nih_37253_37867),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10)) fu___float_mule11m52b_1023nih_37253_37899 (.out1(out_ui_bit_and_expr_FU_16_0_16_59_i0_fu___float_mule11m52b_1023nih_37253_37899),
    .in1(out_ui_rshift_expr_FU_64_0_64_117_i0_fu___float_mule11m52b_1023nih_37253_37890),
    .in2(out_const_18));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_37253_37902 (.out1(out_ui_bit_ior_expr_FU_0_64_64_74_i0_fu___float_mule11m52b_1023nih_37253_37902),
    .in1(out_ui_bit_and_expr_FU_16_0_16_59_i0_fu___float_mule11m52b_1023nih_37253_37899),
    .in2(out_ui_lshift_expr_FU_64_0_64_100_i0_fu___float_mule11m52b_1023nih_37253_37887));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_37253_37905 (.out1(out_ui_bit_and_expr_FU_64_0_64_67_i0_fu___float_mule11m52b_1023nih_37253_37905),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_74_i0_fu___float_mule11m52b_1023nih_37253_37902),
    .in2(out_const_24));
  ui_rshift_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37912 (.out1(out_ui_rshift_expr_FU_64_0_64_118_i0_fu___float_mule11m52b_1023nih_37253_37912),
    .in1(out_ui_bit_and_expr_FU_64_0_64_67_i0_fu___float_mule11m52b_1023nih_37253_37905),
    .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37915 (.out1(out_ui_bit_and_expr_FU_1_0_1_62_i0_fu___float_mule11m52b_1023nih_37253_37915),
    .in1(out_ui_rshift_expr_FU_64_0_64_118_i0_fu___float_mule11m52b_1023nih_37253_37912),
    .in2(out_const_9));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37918 (.out1(out_truth_and_expr_FU_1_0_1_49_i0_fu___float_mule11m52b_1023nih_37253_37918),
    .in1(out_truth_and_expr_FU_1_0_1_50_i0_fu___float_mule11m52b_1023nih_37253_40281),
    .in2(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37922 (.out1(out_UUdata_converter_FU_31_i0_fu___float_mule11m52b_1023nih_37253_37922),
    .in1(out_ui_bit_and_expr_FU_1_0_1_62_i0_fu___float_mule11m52b_1023nih_37253_37915));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_37253_37925 (.out1(out_ui_plus_expr_FU_16_16_16_112_i0_fu___float_mule11m52b_1023nih_37253_37925),
    .in1(out_UUdata_converter_FU_31_i0_fu___float_mule11m52b_1023nih_37253_37922),
    .in2(out_ui_ternary_plus_expr_FU_16_0_16_16_126_i0_fu___float_mule11m52b_1023nih_37253_37748));
  ui_lshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37929 (.out1(out_ui_lshift_expr_FU_64_0_64_101_i0_fu___float_mule11m52b_1023nih_37253_37929),
    .in1(out_ui_bit_and_expr_FU_64_0_64_66_i0_fu___float_mule11m52b_1023nih_37253_37883),
    .in2(out_const_1));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_37932 (.out1(out_truth_not_expr_FU_1_1_52_i10_fu___float_mule11m52b_1023nih_37253_37932),
    .in1(out_truth_and_expr_FU_1_0_1_49_i0_fu___float_mule11m52b_1023nih_37253_37918));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37935 (.out1(out_UIdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_37253_37935),
    .in1(out_truth_not_expr_FU_1_1_52_i10_fu___float_mule11m52b_1023nih_37253_37932));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(54),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37938 (.out1(out_ui_lshift_expr_FU_64_64_64_105_i0_fu___float_mule11m52b_1023nih_37253_37938),
    .in1(out_ui_lshift_expr_FU_64_0_64_101_i0_fu___float_mule11m52b_1023nih_37253_37929),
    .in2(out_UIdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_37253_37935));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(54),
    .BITSIZE_out1(54)) fu___float_mule11m52b_1023nih_37253_37950 (.out1(out_ui_bit_and_expr_FU_64_0_64_66_i1_fu___float_mule11m52b_1023nih_37253_37950),
    .in1(out_ui_lshift_expr_FU_64_64_64_105_i0_fu___float_mule11m52b_1023nih_37253_37938),
    .in2(out_const_26));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37954 (.out1(out_ui_rshift_expr_FU_64_0_64_114_i2_fu___float_mule11m52b_1023nih_37253_37954),
    .in1(out_ui_bit_and_expr_FU_64_0_64_66_i0_fu___float_mule11m52b_1023nih_37253_37883),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37957 (.out1(out_ui_bit_and_expr_FU_8_0_8_70_i0_fu___float_mule11m52b_1023nih_37253_37957),
    .in1(out_ui_rshift_expr_FU_64_0_64_114_i2_fu___float_mule11m52b_1023nih_37253_37954),
    .in2(out_const_14));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_37960 (.out1(out_UIconvert_expr_FU_33_i0_fu___float_mule11m52b_1023nih_37253_37960),
    .in1(out_ui_bit_and_expr_FU_1_0_1_62_i0_fu___float_mule11m52b_1023nih_37253_37915));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37963 (.out1(out_ui_rshift_expr_FU_8_8_8_125_i0_fu___float_mule11m52b_1023nih_37253_37963),
    .in1(out_ui_bit_and_expr_FU_8_0_8_70_i0_fu___float_mule11m52b_1023nih_37253_37957),
    .in2(out_UIconvert_expr_FU_33_i0_fu___float_mule11m52b_1023nih_37253_37960));
  ui_lshift_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(2),
    .BITSIZE_out1(51),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37966 (.out1(out_ui_lshift_expr_FU_64_64_64_105_i1_fu___float_mule11m52b_1023nih_37253_37966),
    .in1(out_ui_bit_and_expr_FU_64_0_64_67_i0_fu___float_mule11m52b_1023nih_37253_37905),
    .in2(out_UIdata_converter_FU_32_i0_fu___float_mule11m52b_1023nih_37253_37935));
  ui_lshift_expr_FU #(.BITSIZE_in1(51),
    .BITSIZE_in2(2),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37969 (.out1(out_ui_lshift_expr_FU_64_0_64_101_i1_fu___float_mule11m52b_1023nih_37253_37969),
    .in1(out_ui_lshift_expr_FU_64_64_64_105_i1_fu___float_mule11m52b_1023nih_37253_37966),
    .in2(out_const_1));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(2),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_37253_37972 (.out1(out_ui_bit_ior_expr_FU_64_64_64_80_i0_fu___float_mule11m52b_1023nih_37253_37972),
    .in1(out_ui_lshift_expr_FU_64_0_64_101_i1_fu___float_mule11m52b_1023nih_37253_37969),
    .in2(out_ui_rshift_expr_FU_8_8_8_125_i0_fu___float_mule11m52b_1023nih_37253_37963));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_mule11m52b_1023nih_37253_37975 (.out1(out_ui_bit_and_expr_FU_64_0_64_67_i1_fu___float_mule11m52b_1023nih_37253_37975),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_80_i0_fu___float_mule11m52b_1023nih_37253_37972),
    .in2(out_const_24));
  UUdata_converter_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(12)) fu___float_mule11m52b_1023nih_37253_37979 (.out1(out_UUdata_converter_FU_34_i0_fu___float_mule11m52b_1023nih_37253_37979),
    .in1(out_ui_plus_expr_FU_16_16_16_112_i0_fu___float_mule11m52b_1023nih_37253_37925));
  ui_lshift_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_37982 (.out1(out_ui_lshift_expr_FU_64_0_64_102_i0_fu___float_mule11m52b_1023nih_37253_37982),
    .in1(out_UUdata_converter_FU_34_i0_fu___float_mule11m52b_1023nih_37253_37979),
    .in2(out_const_5));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_37253_37985 (.out1(out_ui_bit_ior_expr_FU_0_64_64_75_i0_fu___float_mule11m52b_1023nih_37253_37985),
    .in1(out_ui_bit_and_expr_FU_64_0_64_67_i1_fu___float_mule11m52b_1023nih_37253_37975),
    .in2(out_ui_lshift_expr_FU_64_0_64_102_i0_fu___float_mule11m52b_1023nih_37253_37982));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38091 (.out1(out_truth_and_expr_FU_1_0_1_49_i1_fu___float_mule11m52b_1023nih_37253_38091),
    .in1(out_truth_and_expr_FU_1_0_1_50_i1_fu___float_mule11m52b_1023nih_37253_40291),
    .in2(out_const_9));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_38104 (.out1(out_ui_rshift_expr_FU_64_0_64_119_i0_fu___float_mule11m52b_1023nih_37253_38104),
    .in1(out_ui_bit_and_expr_FU_64_0_64_66_i1_fu___float_mule11m52b_1023nih_37253_37950),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38107 (.out1(out_ui_bit_and_expr_FU_1_0_1_62_i1_fu___float_mule11m52b_1023nih_37253_38107),
    .in1(out_ui_rshift_expr_FU_64_0_64_119_i0_fu___float_mule11m52b_1023nih_37253_38104),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_mule11m52b_1023nih_37253_38116 (.out1(out_ui_bit_and_expr_FU_64_0_64_68_i0_fu___float_mule11m52b_1023nih_37253_38116),
    .in1(out_ui_bit_and_expr_FU_64_0_64_66_i1_fu___float_mule11m52b_1023nih_37253_37950),
    .in2(out_const_25));
  ui_ne_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38119 (.out1(out_ui_ne_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_37253_38119),
    .in1(out_ui_bit_and_expr_FU_64_0_64_68_i0_fu___float_mule11m52b_1023nih_37253_38116),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38123 (.out1(out_UUdata_converter_FU_36_i0_fu___float_mule11m52b_1023nih_37253_38123),
    .in1(out_ui_ne_expr_FU_64_0_64_110_i0_fu___float_mule11m52b_1023nih_37253_38119));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38126 (.out1(out_ui_bit_and_expr_FU_1_0_1_62_i2_fu___float_mule11m52b_1023nih_37253_38126),
    .in1(out_ui_bit_and_expr_FU_64_0_64_67_i1_fu___float_mule11m52b_1023nih_37253_37975),
    .in2(out_const_9));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38129 (.out1(out_ui_bit_ior_expr_FU_1_1_1_78_i1_fu___float_mule11m52b_1023nih_37253_38129),
    .in1(out_UUdata_converter_FU_36_i0_fu___float_mule11m52b_1023nih_37253_38123),
    .in2(out_ui_bit_and_expr_FU_1_0_1_62_i2_fu___float_mule11m52b_1023nih_37253_38126));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38132 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i13_fu___float_mule11m52b_1023nih_37253_38132),
    .in1(out_ui_bit_and_expr_FU_1_0_1_62_i1_fu___float_mule11m52b_1023nih_37253_38107),
    .in2(out_ui_bit_ior_expr_FU_1_1_1_78_i1_fu___float_mule11m52b_1023nih_37253_38129));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38135 (.out1(out_truth_and_expr_FU_1_0_1_49_i2_fu___float_mule11m52b_1023nih_37253_38135),
    .in1(out_ui_extract_bit_expr_FU_37_i0_fu___float_mule11m52b_1023nih_37253_40296),
    .in2(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38177 (.out1(out_UUdata_converter_FU_38_i0_fu___float_mule11m52b_1023nih_37253_38177),
    .in1(out_truth_and_expr_FU_1_0_1_49_i2_fu___float_mule11m52b_1023nih_37253_38135));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_37253_38180 (.out1(out_ui_plus_expr_FU_64_64_64_113_i2_fu___float_mule11m52b_1023nih_37253_38180),
    .in1(out_UUdata_converter_FU_38_i0_fu___float_mule11m52b_1023nih_37253_38177),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_75_i0_fu___float_mule11m52b_1023nih_37253_37985));
  ui_eq_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38185 (.out1(out_ui_eq_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_37253_38185),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_75_i0_fu___float_mule11m52b_1023nih_37253_37985),
    .in2(out_const_28));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38188 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i14_fu___float_mule11m52b_1023nih_37253_38188),
    .in1(out_truth_and_expr_FU_1_0_1_49_i2_fu___float_mule11m52b_1023nih_37253_38135),
    .in2(out_ui_eq_expr_FU_64_0_64_92_i0_fu___float_mule11m52b_1023nih_37253_38185));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38218 (.out1(out_ui_bit_xor_expr_FU_1_1_1_84_i1_fu___float_mule11m52b_1023nih_37253_38218),
    .in1(out_ui_bit_and_expr_FU_1_1_1_63_i14_fu___float_mule11m52b_1023nih_37253_38188),
    .in2(out_truth_and_expr_FU_1_0_1_49_i1_fu___float_mule11m52b_1023nih_37253_38091));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_38227 (.out1(out_ui_rshift_expr_FU_64_0_64_114_i3_fu___float_mule11m52b_1023nih_37253_38227),
    .in1(out_ui_plus_expr_FU_64_64_64_113_i2_fu___float_mule11m52b_1023nih_37253_38180),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_37253_38230 (.out1(out_ui_bit_and_expr_FU_16_0_16_57_i2_fu___float_mule11m52b_1023nih_37253_38230),
    .in1(out_ui_rshift_expr_FU_64_0_64_114_i3_fu___float_mule11m52b_1023nih_37253_38227),
    .in2(out_const_19));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38233 (.out1(out_ui_eq_expr_FU_16_0_16_89_i2_fu___float_mule11m52b_1023nih_37253_38233),
    .in1(out_ui_bit_and_expr_FU_16_0_16_57_i2_fu___float_mule11m52b_1023nih_37253_38230),
    .in2(out_const_19));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38236 (.out1(out_UUdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_37253_38236),
    .in1(out_ui_eq_expr_FU_16_0_16_89_i2_fu___float_mule11m52b_1023nih_37253_38233));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_38239 (.out1(out_ui_rshift_expr_FU_64_0_64_115_i2_fu___float_mule11m52b_1023nih_37253_38239),
    .in1(out_ui_plus_expr_FU_64_64_64_113_i2_fu___float_mule11m52b_1023nih_37253_38180),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38242 (.out1(out_ui_bit_and_expr_FU_1_0_1_62_i3_fu___float_mule11m52b_1023nih_37253_38242),
    .in1(out_ui_rshift_expr_FU_64_0_64_115_i2_fu___float_mule11m52b_1023nih_37253_38239),
    .in2(out_const_9));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_38245 (.out1(out_UIconvert_expr_FU_40_i0_fu___float_mule11m52b_1023nih_37253_38245),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_84_i1_fu___float_mule11m52b_1023nih_37253_38218));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(32)) fu___float_mule11m52b_1023nih_37253_38248 (.out1(out_lshift_expr_FU_8_0_8_48_i3_fu___float_mule11m52b_1023nih_37253_38248),
    .in1(out_UIconvert_expr_FU_40_i0_fu___float_mule11m52b_1023nih_37253_38245),
    .in2(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_38251 (.out1(out_IUdata_converter_FU_41_i0_fu___float_mule11m52b_1023nih_37253_38251),
    .in1(out_lshift_expr_FU_8_0_8_48_i3_fu___float_mule11m52b_1023nih_37253_38248));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_38254 (.out1(out_ui_bit_ior_expr_FU_0_8_8_77_i0_fu___float_mule11m52b_1023nih_37253_38254),
    .in1(out_IUdata_converter_FU_41_i0_fu___float_mule11m52b_1023nih_37253_38251),
    .in2(out_ui_bit_and_expr_FU_1_0_1_62_i3_fu___float_mule11m52b_1023nih_37253_38242));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_38257 (.out1(out_ui_bit_ior_expr_FU_8_8_8_81_i4_fu___float_mule11m52b_1023nih_37253_38257),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_77_i0_fu___float_mule11m52b_1023nih_37253_38254),
    .in2(out_UUdata_converter_FU_39_i0_fu___float_mule11m52b_1023nih_37253_38236));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_mule11m52b_1023nih_37253_38271 (.out1(out_ui_bit_and_expr_FU_64_0_64_69_i0_fu___float_mule11m52b_1023nih_37253_38271),
    .in1(out_ui_plus_expr_FU_64_64_64_113_i2_fu___float_mule11m52b_1023nih_37253_38180),
    .in2(out_const_27));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_37253_38274 (.out1(out_ui_bit_ior_expr_FU_0_64_64_76_i0_fu___float_mule11m52b_1023nih_37253_38274),
    .in1(out_ui_bit_and_expr_FU_64_0_64_69_i0_fu___float_mule11m52b_1023nih_37253_38271),
    .in2(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_37253_37378));
  ui_eq_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38286 (.out1(out_ui_eq_expr_FU_8_0_8_93_i0_fu___float_mule11m52b_1023nih_37253_38286),
    .in1(out_ui_cond_expr_FU_8_8_8_8_88_i3_fu___float_mule11m52b_1023nih_37253_40907),
    .in2(out_const_14));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38289 (.out1(out_ui_bit_and_expr_FU_1_0_1_60_i2_fu___float_mule11m52b_1023nih_37253_38289),
    .in1(out_ui_eq_expr_FU_8_0_8_93_i0_fu___float_mule11m52b_1023nih_37253_38286),
    .in2(out_const_9));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_37253_38333 (.out1(out_ui_bit_ior_expr_FU_64_0_64_79_i0_fu___float_mule11m52b_1023nih_37253_38333),
    .in1(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_37253_37378),
    .in2(out_const_20));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38349 (.out1(out_ui_ne_expr_FU_64_0_64_111_i0_fu___float_mule11m52b_1023nih_37253_38349),
    .in1(out_ui_bit_and_expr_FU_0_64_64_56_i0_fu___float_mule11m52b_1023nih_37253_37316),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38352 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i15_fu___float_mule11m52b_1023nih_37253_38352),
    .in1(out_ui_ne_expr_FU_64_0_64_111_i0_fu___float_mule11m52b_1023nih_37253_38349),
    .in2(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_37253_37409));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38359 (.out1(out_ui_ne_expr_FU_64_0_64_111_i1_fu___float_mule11m52b_1023nih_37253_38359),
    .in1(out_ui_bit_and_expr_FU_0_64_64_56_i0_fu___float_mule11m52b_1023nih_37253_37316),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38362 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i16_fu___float_mule11m52b_1023nih_37253_38362),
    .in1(out_ui_ne_expr_FU_64_0_64_111_i1_fu___float_mule11m52b_1023nih_37253_38359),
    .in2(out_ui_eq_expr_FU_16_0_16_89_i0_fu___float_mule11m52b_1023nih_37253_37409));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38367 (.out1(out_ui_ne_expr_FU_64_0_64_111_i2_fu___float_mule11m52b_1023nih_37253_38367),
    .in1(out_ui_bit_and_expr_FU_0_64_64_56_i1_fu___float_mule11m52b_1023nih_37253_37351),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_38370 (.out1(out_ui_bit_and_expr_FU_1_1_1_63_i17_fu___float_mule11m52b_1023nih_37253_38370),
    .in1(out_ui_eq_expr_FU_16_0_16_89_i1_fu___float_mule11m52b_1023nih_37253_37519),
    .in2(out_ui_ne_expr_FU_64_0_64_111_i2_fu___float_mule11m52b_1023nih_37253_38367));
  ui_eq_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_39985 (.out1(out_ui_eq_expr_FU_8_0_8_94_i0_fu___float_mule11m52b_1023nih_37253_39985),
    .in1(out_IUdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_37253_37708),
    .in2(out_const_9));
  ui_eq_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_39987 (.out1(out_ui_eq_expr_FU_8_0_8_95_i0_fu___float_mule11m52b_1023nih_37253_39987),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_81_i4_fu___float_mule11m52b_1023nih_37253_38257),
    .in2(out_const_9));
  ui_eq_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_39989 (.out1(out_ui_eq_expr_FU_8_0_8_96_i0_fu___float_mule11m52b_1023nih_37253_39989),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_81_i4_fu___float_mule11m52b_1023nih_37253_38257),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_39991 (.out1(out_ui_eq_expr_FU_8_0_8_97_i0_fu___float_mule11m52b_1023nih_37253_39991),
    .in1(out_IUdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_37253_37708),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_39999 (.out1(out_ui_ne_expr_FU_64_0_64_111_i3_fu___float_mule11m52b_1023nih_37253_39999),
    .in1(out_ui_bit_and_expr_FU_0_64_64_56_i1_fu___float_mule11m52b_1023nih_37253_37351),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_40258 (.out1(out_ui_rshift_expr_FU_64_0_64_120_i0_fu___float_mule11m52b_1023nih_37253_40258),
    .in1(out_ui_lshift_expr_FU_64_0_64_99_i0_fu___float_mule11m52b_1023nih_37253_37864),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_40265 (.out1(out_ui_lshift_expr_FU_64_0_64_103_i0_fu___float_mule11m52b_1023nih_37253_40265),
    .in1(out_ui_rshift_expr_FU_64_0_64_120_i0_fu___float_mule11m52b_1023nih_37253_40258),
    .in2(out_const_11));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_37253_40268 (.out1(out_ui_bit_and_expr_FU_32_0_32_65_i0_fu___float_mule11m52b_1023nih_37253_40268),
    .in1(out_ui_bit_and_expr_FU_32_0_32_64_i2_fu___float_mule11m52b_1023nih_37253_37821),
    .in2(out_const_23));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40281 (.out1(out_truth_and_expr_FU_1_0_1_50_i0_fu___float_mule11m52b_1023nih_37253_40281),
    .in1(out_truth_and_expr_FU_1_0_1_50_i2_fu___float_mule11m52b_1023nih_37253_40337),
    .in2(out_const_9));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40291 (.out1(out_truth_and_expr_FU_1_0_1_50_i1_fu___float_mule11m52b_1023nih_37253_40291),
    .in1(out_ui_extract_bit_expr_FU_35_i0_fu___float_mule11m52b_1023nih_37253_40348),
    .in2(out_const_9));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___float_mule11m52b_1023nih_37253_40296 (.out1(out_ui_extract_bit_expr_FU_37_i0_fu___float_mule11m52b_1023nih_37253_40296),
    .in1(out_ui_bit_and_expr_FU_1_1_1_63_i13_fu___float_mule11m52b_1023nih_37253_38132),
    .in2(out_const_0));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40337 (.out1(out_truth_and_expr_FU_1_0_1_50_i2_fu___float_mule11m52b_1023nih_37253_40337),
    .in1(out_truth_and_expr_FU_1_0_1_50_i3_fu___float_mule11m52b_1023nih_37253_40358),
    .in2(out_const_9));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(4)) fu___float_mule11m52b_1023nih_37253_40348 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu___float_mule11m52b_1023nih_37253_40348),
    .in1(out_ui_plus_expr_FU_16_16_16_112_i0_fu___float_mule11m52b_1023nih_37253_37925),
    .in2(out_const_15));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40358 (.out1(out_truth_and_expr_FU_1_0_1_50_i3_fu___float_mule11m52b_1023nih_37253_40358),
    .in1(out_truth_or_expr_FU_0_1_1_53_i0_fu___float_mule11m52b_1023nih_37253_40367),
    .in2(out_const_9));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40367 (.out1(out_truth_or_expr_FU_0_1_1_53_i0_fu___float_mule11m52b_1023nih_37253_40367),
    .in1(out_const_0),
    .in2(out_truth_and_expr_FU_1_0_1_50_i4_fu___float_mule11m52b_1023nih_37253_40374));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40374 (.out1(out_truth_and_expr_FU_1_0_1_50_i4_fu___float_mule11m52b_1023nih_37253_40374),
    .in1(out_ui_extract_bit_expr_FU_30_i0_fu___float_mule11m52b_1023nih_37253_40378),
    .in2(out_const_9));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(6)) fu___float_mule11m52b_1023nih_37253_40378 (.out1(out_ui_extract_bit_expr_FU_30_i0_fu___float_mule11m52b_1023nih_37253_40378),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_127_i0_fu___float_mule11m52b_1023nih_37253_37860),
    .in2(out_const_13));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40796 (.out1(out_truth_not_expr_FU_1_1_52_i11_fu___float_mule11m52b_1023nih_37253_40796),
    .in1(out_ui_bit_and_expr_FU_1_0_1_60_i0_fu___float_mule11m52b_1023nih_37253_37436));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40799 (.out1(out_truth_and_expr_FU_1_1_1_51_i0_fu___float_mule11m52b_1023nih_37253_40799),
    .in1(out_truth_not_expr_FU_1_1_52_i11_fu___float_mule11m52b_1023nih_37253_40796),
    .in2(out_ui_bit_and_expr_FU_1_1_1_63_i16_fu___float_mule11m52b_1023nih_37253_38362));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40803 (.out1(out_truth_and_expr_FU_1_1_1_51_i1_fu___float_mule11m52b_1023nih_37253_40803),
    .in1(out_ui_bit_and_expr_FU_1_0_1_60_i0_fu___float_mule11m52b_1023nih_37253_37436),
    .in2(out_ui_bit_and_expr_FU_1_1_1_63_i15_fu___float_mule11m52b_1023nih_37253_38352));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40806 (.out1(out_truth_not_expr_FU_1_1_52_i12_fu___float_mule11m52b_1023nih_37253_40806),
    .in1(out_ui_bit_and_expr_FU_1_1_1_63_i15_fu___float_mule11m52b_1023nih_37253_38352));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40809 (.out1(out_truth_and_expr_FU_1_1_1_51_i2_fu___float_mule11m52b_1023nih_37253_40809),
    .in1(out_ui_bit_and_expr_FU_1_0_1_60_i0_fu___float_mule11m52b_1023nih_37253_37436),
    .in2(out_truth_not_expr_FU_1_1_52_i12_fu___float_mule11m52b_1023nih_37253_40806));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40813 (.out1(out_truth_not_expr_FU_1_1_52_i13_fu___float_mule11m52b_1023nih_37253_40813),
    .in1(out_ui_bit_and_expr_FU_1_1_1_63_i4_fu___float_mule11m52b_1023nih_37253_37538));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40816 (.out1(out_truth_and_expr_FU_1_1_1_51_i3_fu___float_mule11m52b_1023nih_37253_40816),
    .in1(out_truth_not_expr_FU_1_1_52_i13_fu___float_mule11m52b_1023nih_37253_40813),
    .in2(out_ui_bit_and_expr_FU_1_1_1_63_i17_fu___float_mule11m52b_1023nih_37253_38370));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40820 (.out1(out_truth_and_expr_FU_1_1_1_51_i4_fu___float_mule11m52b_1023nih_37253_40820),
    .in1(out_ui_bit_and_expr_FU_1_1_1_63_i4_fu___float_mule11m52b_1023nih_37253_37538),
    .in2(out_ui_ne_expr_FU_64_0_64_111_i3_fu___float_mule11m52b_1023nih_37253_39999));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40823 (.out1(out_truth_not_expr_FU_1_1_52_i14_fu___float_mule11m52b_1023nih_37253_40823),
    .in1(out_ui_ne_expr_FU_64_0_64_111_i3_fu___float_mule11m52b_1023nih_37253_39999));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40826 (.out1(out_truth_and_expr_FU_1_1_1_51_i5_fu___float_mule11m52b_1023nih_37253_40826),
    .in1(out_truth_not_expr_FU_1_1_52_i14_fu___float_mule11m52b_1023nih_37253_40823),
    .in2(out_ui_bit_and_expr_FU_1_1_1_63_i4_fu___float_mule11m52b_1023nih_37253_37538));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40830 (.out1(out_truth_not_expr_FU_1_1_52_i15_fu___float_mule11m52b_1023nih_37253_40830),
    .in1(out_ui_eq_expr_FU_8_0_8_94_i0_fu___float_mule11m52b_1023nih_37253_39985));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40833 (.out1(out_truth_and_expr_FU_1_1_1_51_i6_fu___float_mule11m52b_1023nih_37253_40833),
    .in1(out_ui_eq_expr_FU_8_0_8_97_i0_fu___float_mule11m52b_1023nih_37253_39991),
    .in2(out_truth_not_expr_FU_1_1_52_i15_fu___float_mule11m52b_1023nih_37253_40830));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40837 (.out1(out_truth_and_expr_FU_1_1_1_51_i7_fu___float_mule11m52b_1023nih_37253_40837),
    .in1(out_ui_eq_expr_FU_8_0_8_94_i0_fu___float_mule11m52b_1023nih_37253_39985),
    .in2(out_ui_eq_expr_FU_8_0_8_95_i0_fu___float_mule11m52b_1023nih_37253_39987));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40840 (.out1(out_truth_not_expr_FU_1_1_52_i16_fu___float_mule11m52b_1023nih_37253_40840),
    .in1(out_ui_eq_expr_FU_8_0_8_95_i0_fu___float_mule11m52b_1023nih_37253_39987));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40843 (.out1(out_truth_and_expr_FU_1_1_1_51_i8_fu___float_mule11m52b_1023nih_37253_40843),
    .in1(out_ui_eq_expr_FU_8_0_8_94_i0_fu___float_mule11m52b_1023nih_37253_39985),
    .in2(out_truth_not_expr_FU_1_1_52_i16_fu___float_mule11m52b_1023nih_37253_40840));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40847 (.out1(out_truth_and_expr_FU_1_1_1_51_i9_fu___float_mule11m52b_1023nih_37253_40847),
    .in1(out_truth_and_expr_FU_1_1_1_51_i8_fu___float_mule11m52b_1023nih_37253_40843),
    .in2(out_ui_eq_expr_FU_8_0_8_96_i0_fu___float_mule11m52b_1023nih_37253_39989));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40850 (.out1(out_truth_not_expr_FU_1_1_52_i17_fu___float_mule11m52b_1023nih_37253_40850),
    .in1(out_ui_eq_expr_FU_8_0_8_96_i0_fu___float_mule11m52b_1023nih_37253_39989));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40853 (.out1(out_truth_and_expr_FU_1_1_1_51_i10_fu___float_mule11m52b_1023nih_37253_40853),
    .in1(out_truth_and_expr_FU_1_1_1_51_i8_fu___float_mule11m52b_1023nih_37253_40843),
    .in2(out_truth_not_expr_FU_1_1_52_i17_fu___float_mule11m52b_1023nih_37253_40850));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40856 (.out1(out_truth_or_expr_FU_1_1_1_54_i0_fu___float_mule11m52b_1023nih_37253_40856),
    .in1(out_truth_and_expr_FU_1_1_1_51_i2_fu___float_mule11m52b_1023nih_37253_40809),
    .in2(out_truth_and_expr_FU_1_1_1_51_i0_fu___float_mule11m52b_1023nih_37253_40799));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40860 (.out1(out_ui_cond_expr_FU_1_1_1_1_86_i0_fu___float_mule11m52b_1023nih_37253_40860),
    .in1(out_truth_and_expr_FU_1_1_1_51_i2_fu___float_mule11m52b_1023nih_37253_40809),
    .in2(out_ui_bit_and_expr_FU_1_1_1_63_i1_fu___float_mule11m52b_1023nih_37253_37450),
    .in3(out_ui_bit_and_expr_FU_1_1_1_63_i2_fu___float_mule11m52b_1023nih_37253_37456));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_40866 (.out1(out_ui_cond_expr_FU_8_8_8_8_88_i0_fu___float_mule11m52b_1023nih_37253_40866),
    .in1(out_truth_and_expr_FU_1_1_1_51_i2_fu___float_mule11m52b_1023nih_37253_40809),
    .in2(out_const_0),
    .in3(out_const_14));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40869 (.out1(out_truth_or_expr_FU_1_1_1_54_i1_fu___float_mule11m52b_1023nih_37253_40869),
    .in1(out_truth_and_expr_FU_1_1_1_51_i9_fu___float_mule11m52b_1023nih_37253_40847),
    .in2(out_truth_and_expr_FU_1_1_1_51_i6_fu___float_mule11m52b_1023nih_37253_40833));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_37253_40872 (.out1(out_ui_cond_expr_FU_64_64_64_64_87_i0_fu___float_mule11m52b_1023nih_37253_40872),
    .in1(out_truth_and_expr_FU_1_1_1_51_i9_fu___float_mule11m52b_1023nih_37253_40847),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_76_i0_fu___float_mule11m52b_1023nih_37253_38274),
    .in3(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_37253_37378));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_in3(13),
    .BITSIZE_out1(13)) fu___float_mule11m52b_1023nih_37253_40875 (.out1(out_ui_cond_expr_FU_16_16_16_16_85_i0_fu___float_mule11m52b_1023nih_37253_40875),
    .in1(out_ui_bit_and_expr_FU_1_0_1_60_i2_fu___float_mule11m52b_1023nih_37253_38289),
    .in2(out_const_21),
    .in3(out_ui_rshift_expr_FU_64_0_64_121_i0_fu___float_mule11m52b_1023nih_37253_40974));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40879 (.out1(out_ui_cond_expr_FU_1_1_1_1_86_i1_fu___float_mule11m52b_1023nih_37253_40879),
    .in1(out_truth_or_expr_FU_1_1_1_54_i0_fu___float_mule11m52b_1023nih_37253_40856),
    .in2(out_ui_cond_expr_FU_1_1_1_1_86_i0_fu___float_mule11m52b_1023nih_37253_40860),
    .in3(out_ui_bit_and_expr_FU_1_1_1_63_i3_fu___float_mule11m52b_1023nih_37253_37465));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40882 (.out1(out_ui_cond_expr_FU_1_1_1_1_86_i2_fu___float_mule11m52b_1023nih_37253_40882),
    .in1(out_truth_or_expr_FU_1_1_1_54_i0_fu___float_mule11m52b_1023nih_37253_40856),
    .in2(out_ui_rshift_expr_FU_8_0_8_123_i0_fu___float_mule11m52b_1023nih_37253_40940),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_40885 (.out1(out_ui_cond_expr_FU_8_8_8_8_88_i1_fu___float_mule11m52b_1023nih_37253_40885),
    .in1(out_truth_or_expr_FU_1_1_1_54_i0_fu___float_mule11m52b_1023nih_37253_40856),
    .in2(out_ui_cond_expr_FU_8_8_8_8_88_i0_fu___float_mule11m52b_1023nih_37253_40866),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40888 (.out1(out_ui_cond_expr_FU_1_1_1_1_86_i3_fu___float_mule11m52b_1023nih_37253_40888),
    .in1(out_truth_and_expr_FU_1_1_1_51_i5_fu___float_mule11m52b_1023nih_37253_40826),
    .in2(out_const_0),
    .in3(out_ui_bit_and_expr_FU_1_1_1_63_i6_fu___float_mule11m52b_1023nih_37253_37563));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40896 (.out1(out_ui_cond_expr_FU_1_1_1_1_86_i4_fu___float_mule11m52b_1023nih_37253_40896),
    .in1(out_truth_and_expr_FU_1_1_1_51_i1_fu___float_mule11m52b_1023nih_37253_40803),
    .in2(out_ui_bit_and_expr_FU_1_1_1_63_i2_fu___float_mule11m52b_1023nih_37253_37456),
    .in3(out_ui_cond_expr_FU_1_1_1_1_86_i1_fu___float_mule11m52b_1023nih_37253_40879));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40898 (.out1(out_ui_cond_expr_FU_1_1_1_1_86_i5_fu___float_mule11m52b_1023nih_37253_40898),
    .in1(out_truth_and_expr_FU_1_1_1_51_i1_fu___float_mule11m52b_1023nih_37253_40803),
    .in2(out_const_9),
    .in3(out_ui_rshift_expr_FU_8_0_8_123_i1_fu___float_mule11m52b_1023nih_37253_40947));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_40900 (.out1(out_ui_cond_expr_FU_8_8_8_8_88_i2_fu___float_mule11m52b_1023nih_37253_40900),
    .in1(out_truth_and_expr_FU_1_1_1_51_i1_fu___float_mule11m52b_1023nih_37253_40803),
    .in2(out_const_14),
    .in3(out_ui_cond_expr_FU_8_8_8_8_88_i1_fu___float_mule11m52b_1023nih_37253_40885));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40903 (.out1(out_truth_or_expr_FU_1_1_1_54_i2_fu___float_mule11m52b_1023nih_37253_40903),
    .in1(out_truth_and_expr_FU_1_1_1_51_i3_fu___float_mule11m52b_1023nih_37253_40816),
    .in2(out_truth_and_expr_FU_1_1_1_51_i4_fu___float_mule11m52b_1023nih_37253_40820));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_40907 (.out1(out_ui_cond_expr_FU_8_8_8_8_88_i3_fu___float_mule11m52b_1023nih_37253_40907),
    .in1(out_truth_and_expr_FU_1_1_1_51_i7_fu___float_mule11m52b_1023nih_37253_40837),
    .in2(out_const_10),
    .in3(out_IUdata_converter_FU_29_i0_fu___float_mule11m52b_1023nih_37253_37708));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40910 (.out1(out_truth_or_expr_FU_1_1_1_54_i3_fu___float_mule11m52b_1023nih_37253_40910),
    .in1(out_truth_or_expr_FU_1_1_1_54_i1_fu___float_mule11m52b_1023nih_37253_40869),
    .in2(out_truth_and_expr_FU_1_1_1_51_i10_fu___float_mule11m52b_1023nih_37253_40853));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_37253_40913 (.out1(out_ui_cond_expr_FU_64_64_64_64_87_i1_fu___float_mule11m52b_1023nih_37253_40913),
    .in1(out_truth_or_expr_FU_1_1_1_54_i1_fu___float_mule11m52b_1023nih_37253_40869),
    .in2(out_ui_cond_expr_FU_64_64_64_64_87_i0_fu___float_mule11m52b_1023nih_37253_40872),
    .in3(out_ui_lshift_expr_FU_64_0_64_98_i0_fu___float_mule11m52b_1023nih_37253_37378));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_mule11m52b_1023nih_37253_40915 (.out1(out_ui_cond_expr_FU_64_64_64_64_87_i2_fu___float_mule11m52b_1023nih_37253_40915),
    .in1(out_truth_or_expr_FU_1_1_1_54_i3_fu___float_mule11m52b_1023nih_37253_40910),
    .in2(out_ui_cond_expr_FU_64_64_64_64_87_i1_fu___float_mule11m52b_1023nih_37253_40913),
    .in3(out_ui_lshift_expr_FU_64_0_64_104_i0_fu___float_mule11m52b_1023nih_37253_40980));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40917 (.out1(out_ui_cond_expr_FU_1_1_1_1_86_i6_fu___float_mule11m52b_1023nih_37253_40917),
    .in1(out_truth_or_expr_FU_1_1_1_54_i2_fu___float_mule11m52b_1023nih_37253_40903),
    .in2(out_ui_bit_and_expr_FU_1_1_1_63_i5_fu___float_mule11m52b_1023nih_37253_37554),
    .in3(out_ui_cond_expr_FU_1_1_1_1_86_i3_fu___float_mule11m52b_1023nih_37253_40888));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40919 (.out1(out_ui_cond_expr_FU_1_1_1_1_86_i7_fu___float_mule11m52b_1023nih_37253_40919),
    .in1(out_truth_or_expr_FU_1_1_1_54_i2_fu___float_mule11m52b_1023nih_37253_40903),
    .in2(out_ui_rshift_expr_FU_8_0_8_123_i2_fu___float_mule11m52b_1023nih_37253_40962),
    .in3(out_ui_rshift_expr_FU_8_0_8_123_i3_fu___float_mule11m52b_1023nih_37253_40965));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_mule11m52b_1023nih_37253_40921 (.out1(out_ui_cond_expr_FU_8_8_8_8_88_i4_fu___float_mule11m52b_1023nih_37253_40921),
    .in1(out_truth_or_expr_FU_1_1_1_54_i2_fu___float_mule11m52b_1023nih_37253_40903),
    .in2(out_const_14),
    .in3(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_37253_40923 (.out1(out_ASSIGN_UNSIGNED_FU_3_i0_fu___float_mule11m52b_1023nih_37253_40923),
    .in1(out_UUconvert_expr_FU_2_i0_fu___float_mule11m52b_1023nih_37253_37336));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_mule11m52b_1023nih_37253_40925 (.out1(out_ASSIGN_UNSIGNED_FU_5_i0_fu___float_mule11m52b_1023nih_37253_40925),
    .in1(out_UUconvert_expr_FU_4_i0_fu___float_mule11m52b_1023nih_37253_37362));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___float_mule11m52b_1023nih_37253_40927 (.out1(out_ASSIGN_UNSIGNED_FU_7_i0_fu___float_mule11m52b_1023nih_37253_40927),
    .in1(out_ui_rshift_expr_FU_64_0_64_116_i0_fu___float_mule11m52b_1023nih_37253_37801));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_37253_40929 (.out1(out_ASSIGN_UNSIGNED_FU_8_i0_fu___float_mule11m52b_1023nih_37253_40929),
    .in1(out_ui_bit_and_expr_FU_32_0_32_64_i0_fu___float_mule11m52b_1023nih_37253_37805));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___float_mule11m52b_1023nih_37253_40931 (.out1(out_ASSIGN_UNSIGNED_FU_9_i0_fu___float_mule11m52b_1023nih_37253_40931),
    .in1(out_ui_rshift_expr_FU_64_0_64_116_i1_fu___float_mule11m52b_1023nih_37253_37809));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___float_mule11m52b_1023nih_37253_40933 (.out1(out_ASSIGN_UNSIGNED_FU_10_i0_fu___float_mule11m52b_1023nih_37253_40933),
    .in1(out_ui_bit_and_expr_FU_32_0_32_64_i1_fu___float_mule11m52b_1023nih_37253_37813));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40937 (.out1(out_ui_lshift_expr_FU_8_0_8_106_i0_fu___float_mule11m52b_1023nih_37253_40937),
    .in1(out_ui_rshift_expr_FU_8_0_8_124_i0_fu___float_mule11m52b_1023nih_37253_40990),
    .in2(out_const_9));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40940 (.out1(out_ui_rshift_expr_FU_8_0_8_123_i0_fu___float_mule11m52b_1023nih_37253_40940),
    .in1(out_ui_lshift_expr_FU_8_0_8_106_i0_fu___float_mule11m52b_1023nih_37253_40937),
    .in2(out_const_9));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40944 (.out1(out_ui_lshift_expr_FU_8_0_8_106_i1_fu___float_mule11m52b_1023nih_37253_40944),
    .in1(out_ui_cond_expr_FU_1_1_1_1_86_i2_fu___float_mule11m52b_1023nih_37253_40882),
    .in2(out_const_9));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40947 (.out1(out_ui_rshift_expr_FU_8_0_8_123_i1_fu___float_mule11m52b_1023nih_37253_40947),
    .in1(out_ui_lshift_expr_FU_8_0_8_106_i1_fu___float_mule11m52b_1023nih_37253_40944),
    .in2(out_const_9));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40951 (.out1(out_ui_lshift_expr_FU_8_0_8_106_i2_fu___float_mule11m52b_1023nih_37253_40951),
    .in1(out_ui_cond_expr_FU_1_1_1_1_86_i5_fu___float_mule11m52b_1023nih_37253_40898),
    .in2(out_const_9));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40955 (.out1(out_ui_lshift_expr_FU_8_0_8_106_i3_fu___float_mule11m52b_1023nih_37253_40955),
    .in1(out_ui_rshift_expr_FU_8_0_8_124_i1_fu___float_mule11m52b_1023nih_37253_40999),
    .in2(out_const_9));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40959 (.out1(out_ui_lshift_expr_FU_8_0_8_106_i4_fu___float_mule11m52b_1023nih_37253_40959),
    .in1(out_ui_rshift_expr_FU_8_0_8_124_i2_fu___float_mule11m52b_1023nih_37253_41011),
    .in2(out_const_9));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40962 (.out1(out_ui_rshift_expr_FU_8_0_8_123_i2_fu___float_mule11m52b_1023nih_37253_40962),
    .in1(out_ui_lshift_expr_FU_8_0_8_106_i4_fu___float_mule11m52b_1023nih_37253_40959),
    .in2(out_const_9));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40965 (.out1(out_ui_rshift_expr_FU_8_0_8_123_i3_fu___float_mule11m52b_1023nih_37253_40965),
    .in1(out_ui_lshift_expr_FU_8_0_8_106_i3_fu___float_mule11m52b_1023nih_37253_40955),
    .in2(out_const_9));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40969 (.out1(out_ui_lshift_expr_FU_8_0_8_106_i5_fu___float_mule11m52b_1023nih_37253_40969),
    .in1(out_ui_cond_expr_FU_1_1_1_1_86_i7_fu___float_mule11m52b_1023nih_37253_40919),
    .in2(out_const_9));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(13),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_40974 (.out1(out_ui_rshift_expr_FU_64_0_64_121_i0_fu___float_mule11m52b_1023nih_37253_40974),
    .in1(out_ui_bit_ior_expr_FU_64_0_64_79_i0_fu___float_mule11m52b_1023nih_37253_38333),
    .in2(out_const_16));
  ui_lshift_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_mule11m52b_1023nih_37253_40980 (.out1(out_ui_lshift_expr_FU_64_0_64_104_i0_fu___float_mule11m52b_1023nih_37253_40980),
    .in1(out_ui_cond_expr_FU_16_16_16_16_85_i0_fu___float_mule11m52b_1023nih_37253_40875),
    .in2(out_const_16));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40983 (.out1(out_UUdata_converter_FU_11_i0_fu___float_mule11m52b_1023nih_37253_40983),
    .in1(out_truth_and_expr_FU_1_1_1_51_i2_fu___float_mule11m52b_1023nih_37253_40809));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40987 (.out1(out_ui_lshift_expr_FU_8_0_8_107_i0_fu___float_mule11m52b_1023nih_37253_40987),
    .in1(out_UUdata_converter_FU_11_i0_fu___float_mule11m52b_1023nih_37253_40983),
    .in2(out_const_17));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40990 (.out1(out_ui_rshift_expr_FU_8_0_8_124_i0_fu___float_mule11m52b_1023nih_37253_40990),
    .in1(out_ui_lshift_expr_FU_8_0_8_107_i0_fu___float_mule11m52b_1023nih_37253_40987),
    .in2(out_const_17));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_40993 (.out1(out_UUdata_converter_FU_17_i0_fu___float_mule11m52b_1023nih_37253_40993),
    .in1(out_truth_and_expr_FU_1_1_1_51_i5_fu___float_mule11m52b_1023nih_37253_40826));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40996 (.out1(out_ui_lshift_expr_FU_8_0_8_107_i1_fu___float_mule11m52b_1023nih_37253_40996),
    .in1(out_UUdata_converter_FU_17_i0_fu___float_mule11m52b_1023nih_37253_40993),
    .in2(out_const_17));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_40999 (.out1(out_ui_rshift_expr_FU_8_0_8_124_i1_fu___float_mule11m52b_1023nih_37253_40999),
    .in1(out_ui_lshift_expr_FU_8_0_8_107_i1_fu___float_mule11m52b_1023nih_37253_40996),
    .in2(out_const_17));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_41002 (.out1(out_truth_not_expr_FU_1_1_52_i18_fu___float_mule11m52b_1023nih_37253_41002),
    .in1(out_truth_and_expr_FU_1_1_1_51_i3_fu___float_mule11m52b_1023nih_37253_40816));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_mule11m52b_1023nih_37253_41005 (.out1(out_UUdata_converter_FU_18_i0_fu___float_mule11m52b_1023nih_37253_41005),
    .in1(out_truth_not_expr_FU_1_1_52_i18_fu___float_mule11m52b_1023nih_37253_41002));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_41008 (.out1(out_ui_lshift_expr_FU_8_0_8_107_i2_fu___float_mule11m52b_1023nih_37253_41008),
    .in1(out_UUdata_converter_FU_18_i0_fu___float_mule11m52b_1023nih_37253_41005),
    .in2(out_const_17));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu___float_mule11m52b_1023nih_37253_41011 (.out1(out_ui_rshift_expr_FU_8_0_8_124_i2_fu___float_mule11m52b_1023nih_37253_41011),
    .in1(out_ui_lshift_expr_FU_8_0_8_107_i2_fu___float_mule11m52b_1023nih_37253_41008),
    .in2(out_const_17));
  // io-signal post fix
  assign return_port = out_ui_cond_expr_FU_64_64_64_64_87_i2_fu___float_mule11m52b_1023nih_37253_40915;

endmodule

// FSM based controller description for __float_mule11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___float_mule11m52b_1023nih(done_port,
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

// Top component for __float_mule11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __float_mule11m52b_1023nih(clock,
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
  
  controller___float_mule11m52b_1023nih Controller_i (.done_port(done_port),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___float_mule11m52b_1023nih Datapath_i (.return_port(return_port),
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
  fuselector_BMEMORY_CTRLN_54_i0_LOAD,
  fuselector_BMEMORY_CTRLN_54_i0_STORE,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34793,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34798,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34829,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34833,
  selector_MUX_100_reg_25_0_0_0,
  selector_MUX_102_reg_27_0_0_0,
  selector_MUX_103_reg_28_0_0_0,
  selector_MUX_107_reg_31_0_0_0,
  selector_MUX_109_reg_33_0_0_0,
  selector_MUX_115_reg_39_0_0_0,
  selector_MUX_119_reg_42_0_0_0,
  selector_MUX_121_reg_44_0_0_0,
  selector_MUX_123_reg_46_0_0_0,
  selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0,
  selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1,
  selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0,
  selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0,
  selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0,
  selector_MUX_88_reg_14_0_0_0,
  selector_MUX_89_reg_15_0_0_0,
  selector_MUX_93_reg_19_0_0_0,
  selector_MUX_98_reg_23_0_0_0,
  selector_MUX_99_reg_24_0_0_0,
  selector_MUX_99_reg_24_0_0_1,
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
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_matrix_convolution_33984_34675,
  OUT_CONDITION_matrix_convolution_33984_34756,
  OUT_CONDITION_matrix_convolution_33984_34890,
  OUT_CONDITION_matrix_convolution_33984_34894,
  OUT_CONDITION_matrix_convolution_33984_34911,
  OUT_CONDITION_matrix_convolution_33984_34916,
  OUT_CONDITION_matrix_convolution_33984_34924,
  OUT_CONDITION_matrix_convolution_33984_34938,
  OUT_CONDITION_matrix_convolution_33984_34940,
  OUT_CONDITION_matrix_convolution_33984_34942,
  OUT_UNBOUNDED_matrix_convolution_33984_34793,
  OUT_UNBOUNDED_matrix_convolution_33984_34798,
  OUT_UNBOUNDED_matrix_convolution_33984_34829,
  OUT_UNBOUNDED_matrix_convolution_33984_34833);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_kernel;
  input [31:0] in_port_B;
  input signed [31:0] in_port_size;
  input signed [31:0] in_port_kernel_size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_54_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_54_i0_STORE;
  input selector_IN_UNBOUNDED_matrix_convolution_33984_34793;
  input selector_IN_UNBOUNDED_matrix_convolution_33984_34798;
  input selector_IN_UNBOUNDED_matrix_convolution_33984_34829;
  input selector_IN_UNBOUNDED_matrix_convolution_33984_34833;
  input selector_MUX_100_reg_25_0_0_0;
  input selector_MUX_102_reg_27_0_0_0;
  input selector_MUX_103_reg_28_0_0_0;
  input selector_MUX_107_reg_31_0_0_0;
  input selector_MUX_109_reg_33_0_0_0;
  input selector_MUX_115_reg_39_0_0_0;
  input selector_MUX_119_reg_42_0_0_0;
  input selector_MUX_121_reg_44_0_0_0;
  input selector_MUX_123_reg_46_0_0_0;
  input selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0;
  input selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1;
  input selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0;
  input selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0;
  input selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0;
  input selector_MUX_88_reg_14_0_0_0;
  input selector_MUX_89_reg_15_0_0_0;
  input selector_MUX_93_reg_19_0_0_0;
  input selector_MUX_98_reg_23_0_0_0;
  input selector_MUX_99_reg_24_0_0_0;
  input selector_MUX_99_reg_24_0_0_1;
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
  output OUT_CONDITION_matrix_convolution_33984_34675;
  output OUT_CONDITION_matrix_convolution_33984_34756;
  output OUT_CONDITION_matrix_convolution_33984_34890;
  output OUT_CONDITION_matrix_convolution_33984_34894;
  output OUT_CONDITION_matrix_convolution_33984_34911;
  output OUT_CONDITION_matrix_convolution_33984_34916;
  output OUT_CONDITION_matrix_convolution_33984_34924;
  output OUT_CONDITION_matrix_convolution_33984_34938;
  output OUT_CONDITION_matrix_convolution_33984_34940;
  output OUT_CONDITION_matrix_convolution_33984_34942;
  output OUT_UNBOUNDED_matrix_convolution_33984_34793;
  output OUT_UNBOUNDED_matrix_convolution_33984_34798;
  output OUT_UNBOUNDED_matrix_convolution_33984_34829;
  output OUT_UNBOUNDED_matrix_convolution_33984_34833;
  // Component and signal declarations
  wire [63:0] null_out_signal_BMEMORY_CTRLN_54_i0_out1_1;
  wire signed [31:0] out_ASSIGN_SIGNED_FU_11_i0_fu_matrix_convolution_33984_41013;
  wire [63:0] out_BMEMORY_CTRLN_54_i0_BMEMORY_CTRLN_54_i0;
  wire [31:0] out_IUdata_converter_FU_12_i0_fu_matrix_convolution_33984_34692;
  wire [28:0] out_IUdata_converter_FU_14_i0_fu_matrix_convolution_33984_34701;
  wire [28:0] out_IUdata_converter_FU_24_i0_fu_matrix_convolution_33984_34813;
  wire [28:0] out_IUdata_converter_FU_44_i0_fu_matrix_convolution_33984_34843;
  wire [31:0] out_IUdata_converter_FU_6_i0_fu_matrix_convolution_33984_34690;
  wire [28:0] out_IUdata_converter_FU_7_i0_fu_matrix_convolution_33984_34694;
  wire [28:0] out_IUdata_converter_FU_8_i0_fu_matrix_convolution_33984_34696;
  wire [31:0] out_MUX_100_reg_25_0_0_0;
  wire [31:0] out_MUX_102_reg_27_0_0_0;
  wire [31:0] out_MUX_103_reg_28_0_0_0;
  wire [31:0] out_MUX_107_reg_31_0_0_0;
  wire [31:0] out_MUX_109_reg_33_0_0_0;
  wire [63:0] out_MUX_115_reg_39_0_0_0;
  wire [63:0] out_MUX_119_reg_42_0_0_0;
  wire [31:0] out_MUX_121_reg_44_0_0_0;
  wire [63:0] out_MUX_123_reg_46_0_0_0;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0;
  wire [63:0] out_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0;
  wire [63:0] out_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0;
  wire [31:0] out_MUX_88_reg_14_0_0_0;
  wire [31:0] out_MUX_89_reg_15_0_0_0;
  wire [31:0] out_MUX_93_reg_19_0_0_0;
  wire [31:0] out_MUX_98_reg_23_0_0_0;
  wire [63:0] out_MUX_99_reg_24_0_0_0;
  wire [63:0] out_MUX_99_reg_24_0_0_1;
  wire signed [31:0] out_UIdata_converter_FU_34_i0_fu_matrix_convolution_33984_34910;
  wire signed [31:0] out_UIdata_converter_FU_43_i0_fu_matrix_convolution_33984_34915;
  wire signed [1:0] out_UIdata_converter_FU_5_i0_fu_matrix_convolution_33984_40382;
  wire [31:0] out_UUdata_converter_FU_13_i0_fu_matrix_convolution_33984_34699;
  wire [31:0] out_UUdata_converter_FU_2_i0_fu_matrix_convolution_33984_39791;
  wire [31:0] out_UUdata_converter_FU_35_i0_fu_matrix_convolution_33984_34859;
  wire [31:0] out_UUdata_converter_FU_36_i0_fu_matrix_convolution_33984_34841;
  wire [31:0] out_UUdata_converter_FU_37_i0_fu_matrix_convolution_33984_34806;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu_matrix_convolution_33984_39788;
  wire [31:0] out_UUdata_converter_FU_4_i0_fu_matrix_convolution_33984_39785;
  wire [31:0] out_UUdata_converter_FU_53_i0_fu_matrix_convolution_33984_34866;
  wire [63:0] out___float_adde11m52b_1023nih_80_i0___float_adde11m52b_1023nih_80_i0;
  wire [63:0] out___float_mule11m52b_1023nih_81_i0___float_mule11m52b_1023nih_81_i0;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [7:0] out_const_2;
  wire [5:0] out_const_3;
  wire out_const_4;
  wire [1:0] out_const_5;
  wire [2:0] out_const_6;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [63:0] out_conv_out_const_0_1_64;
  wire [6:0] out_conv_out_const_2_8_7;
  wire out_ge_expr_FU_32_32_32_55_i0_fu_matrix_convolution_33984_37238;
  wire out_ge_expr_FU_32_32_32_55_i1_fu_matrix_convolution_33984_37240;
  wire out_ge_expr_FU_32_32_32_55_i2_fu_matrix_convolution_33984_37242;
  wire out_ge_expr_FU_32_32_32_55_i3_fu_matrix_convolution_33984_37246;
  wire out_gt_expr_FU_32_0_32_56_i0_fu_matrix_convolution_33984_37236;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_57_i0_fu_matrix_convolution_33984_40386;
  wire out_lt_expr_FU_32_0_32_58_i0_fu_matrix_convolution_33984_37167;
  wire out_lt_expr_FU_32_0_32_59_i0_fu_matrix_convolution_33984_37197;
  wire out_lt_expr_FU_32_0_32_59_i1_fu_matrix_convolution_33984_37199;
  wire out_lt_expr_FU_32_32_32_60_i0_fu_matrix_convolution_33984_34921;
  wire out_lt_expr_FU_32_32_32_60_i1_fu_matrix_convolution_33984_34922;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_61_i0_fu_matrix_convolution_33984_34700;
  wire signed [31:0] out_negate_expr_FU_32_32_62_i0_fu_matrix_convolution_33984_34689;
  wire signed [31:0] out_plus_expr_FU_32_0_32_63_i0_fu_matrix_convolution_33984_34820;
  wire signed [31:0] out_plus_expr_FU_32_0_32_63_i1_fu_matrix_convolution_33984_34848;
  wire signed [31:0] out_plus_expr_FU_32_0_32_63_i2_fu_matrix_convolution_33984_34892;
  wire signed [31:0] out_plus_expr_FU_32_0_32_64_i0_fu_matrix_convolution_33984_34920;
  wire signed [31:0] out_plus_expr_FU_32_32_32_65_i0_fu_matrix_convolution_33984_37174;
  wire out_read_cond_FU_18_i0_fu_matrix_convolution_33984_34756;
  wire out_read_cond_FU_25_i0_fu_matrix_convolution_33984_34890;
  wire out_read_cond_FU_28_i0_fu_matrix_convolution_33984_34894;
  wire out_read_cond_FU_38_i0_fu_matrix_convolution_33984_34911;
  wire out_read_cond_FU_45_i0_fu_matrix_convolution_33984_34916;
  wire out_read_cond_FU_47_i0_fu_matrix_convolution_33984_34924;
  wire out_read_cond_FU_48_i0_fu_matrix_convolution_33984_34938;
  wire out_read_cond_FU_50_i0_fu_matrix_convolution_33984_34940;
  wire out_read_cond_FU_51_i0_fu_matrix_convolution_33984_34942;
  wire out_read_cond_FU_9_i0_fu_matrix_convolution_33984_34675;
  wire [30:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [31:0] out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire [28:0] out_reg_16_reg_16;
  wire [28:0] out_reg_17_reg_17;
  wire [31:0] out_reg_18_reg_18;
  wire [31:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire [63:0] out_reg_24_reg_24;
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
  wire [63:0] out_reg_39_reg_39;
  wire [31:0] out_reg_3_reg_3;
  wire out_reg_40_reg_40;
  wire [63:0] out_reg_41_reg_41;
  wire [63:0] out_reg_42_reg_42;
  wire [31:0] out_reg_43_reg_43;
  wire [31:0] out_reg_44_reg_44;
  wire out_reg_45_reg_45;
  wire [63:0] out_reg_46_reg_46;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [28:0] out_reg_7_reg_7;
  wire [28:0] out_reg_8_reg_8;
  wire [28:0] out_reg_9_reg_9;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_66_i0_fu_matrix_convolution_33984_34674;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_67_i0_fu_matrix_convolution_33984_40389;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_68_i0_fu_matrix_convolution_33984_40409;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_68_i1_fu_matrix_convolution_33984_40425;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_69_i0_fu_matrix_convolution_33984_34811;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_69_i1_fu_matrix_convolution_33984_34876;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_70_i0_fu_matrix_convolution_33984_34923;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i0_fu_matrix_convolution_33984_34691;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i1_fu_matrix_convolution_33984_34695;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i2_fu_matrix_convolution_33984_34697;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i3_fu_matrix_convolution_33984_37191;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i4_fu_matrix_convolution_33984_37208;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i5_fu_matrix_convolution_33984_37219;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i6_fu_matrix_convolution_33984_37230;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i7_fu_matrix_convolution_33984_40437;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i8_fu_matrix_convolution_33984_40448;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i9_fu_matrix_convolution_33984_40459;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_72_i0_fu_matrix_convolution_33984_34702;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_72_i1_fu_matrix_convolution_33984_34703;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_72_i2_fu_matrix_convolution_33984_40405;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_72_i3_fu_matrix_convolution_33984_40422;
  wire [28:0] out_ui_minus_expr_FU_32_32_32_73_i0_fu_matrix_convolution_33984_40456;
  wire out_ui_ne_expr_FU_32_32_32_74_i0_fu_matrix_convolution_33984_37248;
  wire out_ui_ne_expr_FU_32_32_32_74_i1_fu_matrix_convolution_33984_37250;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_75_i0_fu_matrix_convolution_33984_34882;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_75_i1_fu_matrix_convolution_33984_34887;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_75_i2_fu_matrix_convolution_33984_34893;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_75_i3_fu_matrix_convolution_33984_34907;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_76_i0_fu_matrix_convolution_33984_34693;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_76_i1_fu_matrix_convolution_33984_40402;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_76_i2_fu_matrix_convolution_33984_40419;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_76_i3_fu_matrix_convolution_33984_40434;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_76_i4_fu_matrix_convolution_33984_40445;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_77_i0_fu_matrix_convolution_33984_34698;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_77_i1_fu_matrix_convolution_33984_34769;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_77_i2_fu_matrix_convolution_33984_34869;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_77_i3_fu_matrix_convolution_33984_37194;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_77_i4_fu_matrix_convolution_33984_37211;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_77_i5_fu_matrix_convolution_33984_37222;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_77_i6_fu_matrix_convolution_33984_37233;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_78_i0_fu_matrix_convolution_33984_40393;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_78_i1_fu_matrix_convolution_33984_40398;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_78_i2_fu_matrix_convolution_33984_40414;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_78_i3_fu_matrix_convolution_33984_40417;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_79_i0_fu_matrix_convolution_33984_40429;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_79_i1_fu_matrix_convolution_33984_40432;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_79_i2_fu_matrix_convolution_33984_40440;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_79_i3_fu_matrix_convolution_33984_40443;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_79_i4_fu_matrix_convolution_33984_40451;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_79_i5_fu_matrix_convolution_33984_40454;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [63:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [63:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  wire s___float_adde11m52b_1023nih_80_i00;
  wire s___float_mule11m52b_1023nih_81_i01;
  wire s_done___float_adde11m52b_1023nih_80_i0;
  wire s_done___float_mule11m52b_1023nih_81_i0;
  
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_54_i0 (.out1({null_out_signal_BMEMORY_CTRLN_54_i0_out1_1,
      out_BMEMORY_CTRLN_54_i0_BMEMORY_CTRLN_54_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0}),
    .in3({7'b0000000,
      out_conv_out_const_2_8_7}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_54_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_54_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_100_reg_25_0_0_0 (.out1(out_MUX_100_reg_25_0_0_0),
    .sel(selector_MUX_100_reg_25_0_0_0),
    .in1(out_reg_20_reg_20),
    .in2(out_ui_bit_ior_concat_expr_FU_69_i1_fu_matrix_convolution_33984_34876));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_102_reg_27_0_0_0 (.out1(out_MUX_102_reg_27_0_0_0),
    .sel(selector_MUX_102_reg_27_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_plus_expr_FU_32_0_32_63_i2_fu_matrix_convolution_33984_34892));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_103_reg_28_0_0_0 (.out1(out_MUX_103_reg_28_0_0_0),
    .sel(selector_MUX_103_reg_28_0_0_0),
    .in1(out_reg_15_reg_15),
    .in2(out_ui_plus_expr_FU_32_0_32_75_i2_fu_matrix_convolution_33984_34893));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_107_reg_31_0_0_0 (.out1(out_MUX_107_reg_31_0_0_0),
    .sel(selector_MUX_107_reg_31_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_plus_expr_FU_32_0_32_63_i1_fu_matrix_convolution_33984_34848));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_109_reg_33_0_0_0 (.out1(out_MUX_109_reg_33_0_0_0),
    .sel(selector_MUX_109_reg_33_0_0_0),
    .in1(out_reg_19_reg_19),
    .in2(out_ui_plus_expr_FU_32_0_32_75_i0_fu_matrix_convolution_33984_34882));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_115_reg_39_0_0_0 (.out1(out_MUX_115_reg_39_0_0_0),
    .sel(selector_MUX_115_reg_39_0_0_0),
    .in1(out_BMEMORY_CTRLN_54_i0_BMEMORY_CTRLN_54_i0),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_119_reg_42_0_0_0 (.out1(out_MUX_119_reg_42_0_0_0),
    .sel(selector_MUX_119_reg_42_0_0_0),
    .in1(out_reg_24_reg_24),
    .in2(out___float_adde11m52b_1023nih_80_i0___float_adde11m52b_1023nih_80_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_121_reg_44_0_0_0 (.out1(out_MUX_121_reg_44_0_0_0),
    .sel(selector_MUX_121_reg_44_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_plus_expr_FU_32_0_32_63_i0_fu_matrix_convolution_33984_34820));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_123_reg_46_0_0_0 (.out1(out_MUX_123_reg_46_0_0_0),
    .sel(selector_MUX_123_reg_46_0_0_0),
    .in1(out___float_adde11m52b_1023nih_80_i0___float_adde11m52b_1023nih_80_i0),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_54_i0_1_0_0 (.out1(out_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0),
    .sel(selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0),
    .in1(out_reg_38_reg_38),
    .in2(out_reg_37_reg_37));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_54_i0_1_0_1 (.out1(out_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1),
    .sel(selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1),
    .in1(out_reg_29_reg_29),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_77_i3_fu_matrix_convolution_33984_37194));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_54_i0_1_1_0 (.out1(out_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0),
    .sel(selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0),
    .in1(out_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0),
    .in2(out_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0 (.out1(out_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0),
    .sel(selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0),
    .in1(out_reg_42_reg_42),
    .in2(out_reg_24_reg_24));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0 (.out1(out_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0),
    .sel(selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0),
    .in1(out_reg_39_reg_39),
    .in2(out_conv_out_const_0_1_64));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_88_reg_14_0_0_0 (.out1(out_MUX_88_reg_14_0_0_0),
    .sel(selector_MUX_88_reg_14_0_0_0),
    .in1(out_ui_lshift_expr_FU_32_0_32_71_i7_fu_matrix_convolution_33984_40437),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_89_reg_15_0_0_0 (.out1(out_MUX_89_reg_15_0_0_0),
    .sel(selector_MUX_89_reg_15_0_0_0),
    .in1(out_reg_21_reg_21),
    .in2(out_IUdata_converter_FU_12_i0_fu_matrix_convolution_33984_34692));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_93_reg_19_0_0_0 (.out1(out_MUX_93_reg_19_0_0_0),
    .sel(selector_MUX_93_reg_19_0_0_0),
    .in1(out_reg_26_reg_26),
    .in2(out_reg_11_reg_11));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_98_reg_23_0_0_0 (.out1(out_MUX_98_reg_23_0_0_0),
    .sel(selector_MUX_98_reg_23_0_0_0),
    .in1(out_reg_13_reg_13),
    .in2(out_ui_bit_ior_concat_expr_FU_69_i0_fu_matrix_convolution_33984_34811));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_99_reg_24_0_0_0 (.out1(out_MUX_99_reg_24_0_0_0),
    .sel(selector_MUX_99_reg_24_0_0_0),
    .in1(out_reg_46_reg_46),
    .in2(out___float_adde11m52b_1023nih_80_i0___float_adde11m52b_1023nih_80_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_99_reg_24_0_0_1 (.out1(out_MUX_99_reg_24_0_0_1),
    .sel(selector_MUX_99_reg_24_0_0_1),
    .in1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in2(out_MUX_99_reg_24_0_0_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_const_0_1_64));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2),
    .in1(out_reg_46_reg_46));
  __float_adde11m52b_1023nih __float_adde11m52b_1023nih_80_i0 (.done_port(s_done___float_adde11m52b_1023nih_80_i0),
    .return_port(out___float_adde11m52b_1023nih_80_i0___float_adde11m52b_1023nih_80_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___float_adde11m52b_1023nih_80_i00),
    .a(out_reg_41_reg_41),
    .b(out_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0));
  __float_mule11m52b_1023nih __float_mule11m52b_1023nih_81_i0 (.done_port(s_done___float_mule11m52b_1023nih_81_i0),
    .return_port(out___float_mule11m52b_1023nih_81_i0___float_mule11m52b_1023nih_81_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___float_mule11m52b_1023nih_81_i01),
    .a(out_BMEMORY_CTRLN_54_i0_BMEMORY_CTRLN_54_i0),
    .b(out_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b01000000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011110)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_6 (.out1(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(64)) conv_out_const_0_1_64 (.out1(out_conv_out_const_0_1_64),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(7)) conv_out_const_2_8_7 (.out1(out_conv_out_const_2_8_7),
    .in1(out_const_2));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_matrix_convolution_33984_34674 (.out1(out_rshift_expr_FU_32_0_32_66_i0_fu_matrix_convolution_33984_34674),
    .in1(out_plus_expr_FU_32_32_32_65_i0_fu_matrix_convolution_33984_37174),
    .in2(out_const_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34675 (.out1(out_read_cond_FU_9_i0_fu_matrix_convolution_33984_34675),
    .in1(out_gt_expr_FU_32_0_32_56_i0_fu_matrix_convolution_33984_37236));
  negate_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34689 (.out1(out_negate_expr_FU_32_32_62_i0_fu_matrix_convolution_33984_34689),
    .in1(out_reg_0_reg_0));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34690 (.out1(out_IUdata_converter_FU_6_i0_fu_matrix_convolution_33984_34690),
    .in1(in_port_size));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_34691 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i0_fu_matrix_convolution_33984_34691),
    .in1(out_IUdata_converter_FU_6_i0_fu_matrix_convolution_33984_34690),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34692 (.out1(out_IUdata_converter_FU_12_i0_fu_matrix_convolution_33984_34692),
    .in1(out_negate_expr_FU_32_32_62_i0_fu_matrix_convolution_33984_34689));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34693 (.out1(out_ui_plus_expr_FU_32_32_32_76_i0_fu_matrix_convolution_33984_34693),
    .in1(out_reg_1_reg_1),
    .in2(out_IUdata_converter_FU_12_i0_fu_matrix_convolution_33984_34692));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) fu_matrix_convolution_33984_34694 (.out1(out_IUdata_converter_FU_7_i0_fu_matrix_convolution_33984_34694),
    .in1(in_port_kernel_size));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_34695 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i1_fu_matrix_convolution_33984_34695),
    .in1(out_IUdata_converter_FU_7_i0_fu_matrix_convolution_33984_34694),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(29)) fu_matrix_convolution_33984_34696 (.out1(out_IUdata_converter_FU_8_i0_fu_matrix_convolution_33984_34696),
    .in1(out_rshift_expr_FU_32_0_32_66_i0_fu_matrix_convolution_33984_34674));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_34697 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i2_fu_matrix_convolution_33984_34697),
    .in1(out_IUdata_converter_FU_8_i0_fu_matrix_convolution_33984_34696),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_34698 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_77_i0_fu_matrix_convolution_33984_34698),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_2_reg_2));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34699 (.out1(out_UUdata_converter_FU_13_i0_fu_matrix_convolution_33984_34699),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_77_i0_fu_matrix_convolution_33984_34698));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_matrix_convolution_33984_34700 (.out1(out_mult_expr_FU_32_32_32_0_61_i0_fu_matrix_convolution_33984_34700),
    .clock(clock),
    .in1(out_ASSIGN_SIGNED_FU_11_i0_fu_matrix_convolution_33984_41013),
    .in2(in_port_size));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) fu_matrix_convolution_33984_34701 (.out1(out_IUdata_converter_FU_14_i0_fu_matrix_convolution_33984_34701),
    .in1(out_mult_expr_FU_32_32_32_0_61_i0_fu_matrix_convolution_33984_34700));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_34702 (.out1(out_ui_lshift_expr_FU_32_0_32_72_i0_fu_matrix_convolution_33984_34702),
    .in1(out_IUdata_converter_FU_14_i0_fu_matrix_convolution_33984_34701),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_34703 (.out1(out_ui_lshift_expr_FU_32_0_32_72_i1_fu_matrix_convolution_33984_34703),
    .in1(out_IUdata_converter_FU_12_i0_fu_matrix_convolution_33984_34692),
    .in2(out_const_5));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34756 (.out1(out_read_cond_FU_18_i0_fu_matrix_convolution_33984_34756),
    .in1(out_reg_22_reg_22));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_34769 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_77_i1_fu_matrix_convolution_33984_34769),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_lshift_expr_FU_32_0_32_71_i9_fu_matrix_convolution_33984_40459));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34806 (.out1(out_UUdata_converter_FU_37_i0_fu_matrix_convolution_33984_34806),
    .in1(out_reg_23_reg_23));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_matrix_convolution_33984_34811 (.out1(out_ui_bit_ior_concat_expr_FU_69_i0_fu_matrix_convolution_33984_34811),
    .in1(out_ui_lshift_expr_FU_32_0_32_72_i2_fu_matrix_convolution_33984_40405),
    .in2(out_ui_bit_and_expr_FU_8_0_8_68_i0_fu_matrix_convolution_33984_40409),
    .in3(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) fu_matrix_convolution_33984_34813 (.out1(out_IUdata_converter_FU_24_i0_fu_matrix_convolution_33984_34813),
    .in1(out_reg_44_reg_44));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34820 (.out1(out_plus_expr_FU_32_0_32_63_i0_fu_matrix_convolution_33984_34820),
    .in1(out_reg_44_reg_44),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34841 (.out1(out_UUdata_converter_FU_36_i0_fu_matrix_convolution_33984_34841),
    .in1(out_reg_23_reg_23));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) fu_matrix_convolution_33984_34843 (.out1(out_IUdata_converter_FU_44_i0_fu_matrix_convolution_33984_34843),
    .in1(out_reg_31_reg_31));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34848 (.out1(out_plus_expr_FU_32_0_32_63_i1_fu_matrix_convolution_33984_34848),
    .in1(out_reg_31_reg_31),
    .in2(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34859 (.out1(out_UUdata_converter_FU_35_i0_fu_matrix_convolution_33984_34859),
    .in1(out_reg_25_reg_25));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34866 (.out1(out_UUdata_converter_FU_53_i0_fu_matrix_convolution_33984_34866),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_77_i2_fu_matrix_convolution_33984_34869));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_34869 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_77_i2_fu_matrix_convolution_33984_34869),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_lshift_expr_FU_32_0_32_71_i8_fu_matrix_convolution_33984_40448));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_matrix_convolution_33984_34876 (.out1(out_ui_bit_ior_concat_expr_FU_69_i1_fu_matrix_convolution_33984_34876),
    .in1(out_ui_lshift_expr_FU_32_0_32_72_i3_fu_matrix_convolution_33984_40422),
    .in2(out_ui_bit_and_expr_FU_8_0_8_68_i1_fu_matrix_convolution_33984_40425),
    .in3(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34882 (.out1(out_ui_plus_expr_FU_32_0_32_75_i0_fu_matrix_convolution_33984_34882),
    .in1(out_reg_33_reg_33),
    .in2(out_const_4));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34887 (.out1(out_ui_plus_expr_FU_32_0_32_75_i1_fu_matrix_convolution_33984_34887),
    .in1(out_reg_19_reg_19),
    .in2(out_const_4));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34890 (.out1(out_read_cond_FU_25_i0_fu_matrix_convolution_33984_34890),
    .in1(out_reg_45_reg_45));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34892 (.out1(out_plus_expr_FU_32_0_32_63_i2_fu_matrix_convolution_33984_34892),
    .in1(out_reg_27_reg_27),
    .in2(out_const_1));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34893 (.out1(out_ui_plus_expr_FU_32_0_32_75_i2_fu_matrix_convolution_33984_34893),
    .in1(out_reg_28_reg_28),
    .in2(out_const_4));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34894 (.out1(out_read_cond_FU_28_i0_fu_matrix_convolution_33984_34894),
    .in1(out_ge_expr_FU_32_32_32_55_i2_fu_matrix_convolution_33984_37242));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34907 (.out1(out_ui_plus_expr_FU_32_0_32_75_i3_fu_matrix_convolution_33984_34907),
    .in1(out_reg_15_reg_15),
    .in2(out_const_4));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34910 (.out1(out_UIdata_converter_FU_34_i0_fu_matrix_convolution_33984_34910),
    .in1(out_reg_28_reg_28));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34911 (.out1(out_read_cond_FU_38_i0_fu_matrix_convolution_33984_34911),
    .in1(out_lt_expr_FU_32_0_32_59_i0_fu_matrix_convolution_33984_37197));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34915 (.out1(out_UIdata_converter_FU_43_i0_fu_matrix_convolution_33984_34915),
    .in1(out_reg_33_reg_33));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34916 (.out1(out_read_cond_FU_45_i0_fu_matrix_convolution_33984_34916),
    .in1(out_lt_expr_FU_32_0_32_59_i1_fu_matrix_convolution_33984_37199));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_34920 (.out1(out_plus_expr_FU_32_0_32_64_i0_fu_matrix_convolution_33984_34920),
    .in1(in_port_size),
    .in2(out_const_4));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_34921 (.out1(out_lt_expr_FU_32_32_32_60_i0_fu_matrix_convolution_33984_34921),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_35_reg_35));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_34922 (.out1(out_lt_expr_FU_32_32_32_60_i1_fu_matrix_convolution_33984_34922),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_34_reg_34));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_34923 (.out1(out_ui_bit_ior_expr_FU_1_1_1_70_i0_fu_matrix_convolution_33984_34923),
    .in1(out_reg_36_reg_36),
    .in2(out_lt_expr_FU_32_32_32_60_i0_fu_matrix_convolution_33984_34921));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34924 (.out1(out_read_cond_FU_47_i0_fu_matrix_convolution_33984_34924),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_70_i0_fu_matrix_convolution_33984_34923));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34938 (.out1(out_read_cond_FU_48_i0_fu_matrix_convolution_33984_34938),
    .in1(out_reg_40_reg_40));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34940 (.out1(out_read_cond_FU_50_i0_fu_matrix_convolution_33984_34940),
    .in1(out_ui_ne_expr_FU_32_32_32_74_i0_fu_matrix_convolution_33984_37248));
  read_cond_FU #(.BITSIZE_in1(1)) fu_matrix_convolution_33984_34942 (.out1(out_read_cond_FU_51_i0_fu_matrix_convolution_33984_34942),
    .in1(out_ui_ne_expr_FU_32_32_32_74_i1_fu_matrix_convolution_33984_37250));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37167 (.out1(out_lt_expr_FU_32_0_32_58_i0_fu_matrix_convolution_33984_37167),
    .in1(in_port_kernel_size),
    .in2(out_const_0));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_37174 (.out1(out_plus_expr_FU_32_32_32_65_i0_fu_matrix_convolution_33984_37174),
    .in1(in_port_kernel_size),
    .in2(out_rshift_expr_FU_32_0_32_67_i0_fu_matrix_convolution_33984_40389));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_37191 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i3_fu_matrix_convolution_33984_37191),
    .in1(out_IUdata_converter_FU_24_i0_fu_matrix_convolution_33984_34813),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_37194 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_77_i3_fu_matrix_convolution_33984_37194),
    .in1(out_reg_43_reg_43),
    .in2(out_ui_lshift_expr_FU_32_0_32_71_i3_fu_matrix_convolution_33984_37191));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37197 (.out1(out_lt_expr_FU_32_0_32_59_i0_fu_matrix_convolution_33984_37197),
    .in1(out_UIdata_converter_FU_34_i0_fu_matrix_convolution_33984_34910),
    .in2(out_const_0));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37199 (.out1(out_lt_expr_FU_32_0_32_59_i1_fu_matrix_convolution_33984_37199),
    .in1(out_UIdata_converter_FU_43_i0_fu_matrix_convolution_33984_34915),
    .in2(out_const_0));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_37208 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i4_fu_matrix_convolution_33984_37208),
    .in1(out_reg_33_reg_33),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_37211 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_77_i4_fu_matrix_convolution_33984_37211),
    .in1(out_reg_32_reg_32),
    .in2(out_ui_lshift_expr_FU_32_0_32_71_i4_fu_matrix_convolution_33984_37208));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_37219 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i5_fu_matrix_convolution_33984_37219),
    .in1(out_IUdata_converter_FU_44_i0_fu_matrix_convolution_33984_34843),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_37222 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_77_i5_fu_matrix_convolution_33984_37222),
    .in1(out_reg_30_reg_30),
    .in2(out_ui_lshift_expr_FU_32_0_32_71_i5_fu_matrix_convolution_33984_37219));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_37230 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i6_fu_matrix_convolution_33984_37230),
    .in1(out_reg_19_reg_19),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_matrix_convolution_33984_37233 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_77_i6_fu_matrix_convolution_33984_37233),
    .in1(out_reg_18_reg_18),
    .in2(out_ui_lshift_expr_FU_32_0_32_71_i6_fu_matrix_convolution_33984_37230));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37236 (.out1(out_gt_expr_FU_32_0_32_56_i0_fu_matrix_convolution_33984_37236),
    .in1(in_port_size),
    .in2(out_const_0));
  ge_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37238 (.out1(out_ge_expr_FU_32_32_32_55_i0_fu_matrix_convolution_33984_37238),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_10_reg_10));
  ge_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37240 (.out1(out_ge_expr_FU_32_32_32_55_i1_fu_matrix_convolution_33984_37240),
    .in1(out_reg_0_reg_0),
    .in2(out_plus_expr_FU_32_0_32_63_i0_fu_matrix_convolution_33984_34820));
  ge_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37242 (.out1(out_ge_expr_FU_32_32_32_55_i2_fu_matrix_convolution_33984_37242),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_27_reg_27));
  ge_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37246 (.out1(out_ge_expr_FU_32_32_32_55_i3_fu_matrix_convolution_33984_37246),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_31_reg_31));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37248 (.out1(out_ui_ne_expr_FU_32_32_32_74_i0_fu_matrix_convolution_33984_37248),
    .in1(out_reg_12_reg_12),
    .in2(out_reg_26_reg_26));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_matrix_convolution_33984_37250 (.out1(out_ui_ne_expr_FU_32_32_32_74_i1_fu_matrix_convolution_33984_37250),
    .in1(out_reg_21_reg_21),
    .in2(out_reg_12_reg_12));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39785 (.out1(out_UUdata_converter_FU_4_i0_fu_matrix_convolution_33984_39785),
    .in1(in_port_A));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39788 (.out1(out_UUdata_converter_FU_3_i0_fu_matrix_convolution_33984_39788),
    .in1(in_port_kernel));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_39791 (.out1(out_UUdata_converter_FU_2_i0_fu_matrix_convolution_33984_39791),
    .in1(in_port_B));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_matrix_convolution_33984_40382 (.out1(out_UIdata_converter_FU_5_i0_fu_matrix_convolution_33984_40382),
    .in1(out_lt_expr_FU_32_0_32_58_i0_fu_matrix_convolution_33984_37167));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_40386 (.out1(out_lshift_expr_FU_32_0_32_57_i0_fu_matrix_convolution_33984_40386),
    .in1(out_UIdata_converter_FU_5_i0_fu_matrix_convolution_33984_40382),
    .in2(out_const_3));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu_matrix_convolution_33984_40389 (.out1(out_rshift_expr_FU_32_0_32_67_i0_fu_matrix_convolution_33984_40389),
    .in1(out_lshift_expr_FU_32_0_32_57_i0_fu_matrix_convolution_33984_40386),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_matrix_convolution_33984_40393 (.out1(out_ui_rshift_expr_FU_32_0_32_78_i0_fu_matrix_convolution_33984_40393),
    .in1(out_reg_23_reg_23),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_matrix_convolution_33984_40398 (.out1(out_ui_rshift_expr_FU_32_0_32_78_i1_fu_matrix_convolution_33984_40398),
    .in1(out_ui_lshift_expr_FU_32_0_32_71_i1_fu_matrix_convolution_33984_34695),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_matrix_convolution_33984_40402 (.out1(out_ui_plus_expr_FU_32_32_32_76_i1_fu_matrix_convolution_33984_40402),
    .in1(out_ui_rshift_expr_FU_32_0_32_78_i0_fu_matrix_convolution_33984_40393),
    .in2(out_reg_7_reg_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_40405 (.out1(out_ui_lshift_expr_FU_32_0_32_72_i2_fu_matrix_convolution_33984_40405),
    .in1(out_ui_plus_expr_FU_32_32_32_76_i1_fu_matrix_convolution_33984_40402),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_matrix_convolution_33984_40409 (.out1(out_ui_bit_and_expr_FU_8_0_8_68_i0_fu_matrix_convolution_33984_40409),
    .in1(out_reg_23_reg_23),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_matrix_convolution_33984_40414 (.out1(out_ui_rshift_expr_FU_32_0_32_78_i2_fu_matrix_convolution_33984_40414),
    .in1(out_ui_lshift_expr_FU_32_0_32_71_i0_fu_matrix_convolution_33984_34691),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_matrix_convolution_33984_40417 (.out1(out_ui_rshift_expr_FU_32_0_32_78_i3_fu_matrix_convolution_33984_40417),
    .in1(out_reg_25_reg_25),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_matrix_convolution_33984_40419 (.out1(out_ui_plus_expr_FU_32_32_32_76_i2_fu_matrix_convolution_33984_40419),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_rshift_expr_FU_32_0_32_78_i3_fu_matrix_convolution_33984_40417));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_40422 (.out1(out_ui_lshift_expr_FU_32_0_32_72_i3_fu_matrix_convolution_33984_40422),
    .in1(out_ui_plus_expr_FU_32_32_32_76_i2_fu_matrix_convolution_33984_40419),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_matrix_convolution_33984_40425 (.out1(out_ui_bit_and_expr_FU_8_0_8_68_i1_fu_matrix_convolution_33984_40425),
    .in1(out_reg_25_reg_25),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_matrix_convolution_33984_40429 (.out1(out_ui_rshift_expr_FU_32_0_32_79_i0_fu_matrix_convolution_33984_40429),
    .in1(out_reg_14_reg_14),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_matrix_convolution_33984_40432 (.out1(out_ui_rshift_expr_FU_32_0_32_79_i1_fu_matrix_convolution_33984_40432),
    .in1(out_ui_lshift_expr_FU_32_0_32_71_i0_fu_matrix_convolution_33984_34691),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_matrix_convolution_33984_40434 (.out1(out_ui_plus_expr_FU_32_32_32_76_i3_fu_matrix_convolution_33984_40434),
    .in1(out_ui_rshift_expr_FU_32_0_32_79_i0_fu_matrix_convolution_33984_40429),
    .in2(out_reg_9_reg_9));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_40437 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i7_fu_matrix_convolution_33984_40437),
    .in1(out_ui_plus_expr_FU_32_32_32_76_i3_fu_matrix_convolution_33984_40434),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_matrix_convolution_33984_40440 (.out1(out_ui_rshift_expr_FU_32_0_32_79_i2_fu_matrix_convolution_33984_40440),
    .in1(out_reg_14_reg_14),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_matrix_convolution_33984_40443 (.out1(out_ui_rshift_expr_FU_32_0_32_79_i3_fu_matrix_convolution_33984_40443),
    .in1(out_ui_lshift_expr_FU_32_0_32_72_i0_fu_matrix_convolution_33984_34702),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_matrix_convolution_33984_40445 (.out1(out_ui_plus_expr_FU_32_32_32_76_i4_fu_matrix_convolution_33984_40445),
    .in1(out_ui_rshift_expr_FU_32_0_32_79_i2_fu_matrix_convolution_33984_40440),
    .in2(out_reg_16_reg_16));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_40448 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i8_fu_matrix_convolution_33984_40448),
    .in1(out_ui_plus_expr_FU_32_32_32_76_i4_fu_matrix_convolution_33984_40445),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_matrix_convolution_33984_40451 (.out1(out_ui_rshift_expr_FU_32_0_32_79_i4_fu_matrix_convolution_33984_40451),
    .in1(out_reg_14_reg_14),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_matrix_convolution_33984_40454 (.out1(out_ui_rshift_expr_FU_32_0_32_79_i5_fu_matrix_convolution_33984_40454),
    .in1(out_ui_lshift_expr_FU_32_0_32_72_i1_fu_matrix_convolution_33984_34703),
    .in2(out_const_5));
  ui_minus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_matrix_convolution_33984_40456 (.out1(out_ui_minus_expr_FU_32_32_32_73_i0_fu_matrix_convolution_33984_40456),
    .in1(out_ui_rshift_expr_FU_32_0_32_79_i4_fu_matrix_convolution_33984_40451),
    .in2(out_reg_17_reg_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_matrix_convolution_33984_40459 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i9_fu_matrix_convolution_33984_40459),
    .in1(out_ui_minus_expr_FU_32_32_32_73_i0_fu_matrix_convolution_33984_40456),
    .in2(out_const_5));
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_matrix_convolution_33984_41013 (.out1(out_ASSIGN_SIGNED_FU_11_i0_fu_matrix_convolution_33984_41013),
    .in1(out_negate_expr_FU_32_32_62_i0_fu_matrix_convolution_33984_34689));
  or or_or___float_adde11m52b_1023nih_80_i00( s___float_adde11m52b_1023nih_80_i00, selector_IN_UNBOUNDED_matrix_convolution_33984_34793, selector_IN_UNBOUNDED_matrix_convolution_33984_34829);
  or or_or___float_mule11m52b_1023nih_81_i01( s___float_mule11m52b_1023nih_81_i01, selector_IN_UNBOUNDED_matrix_convolution_33984_34798, selector_IN_UNBOUNDED_matrix_convolution_33984_34833);
  register_SE #(.BITSIZE_in1(31),
    .BITSIZE_out1(31)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_rshift_expr_FU_32_0_32_66_i0_fu_matrix_convolution_33984_34674),
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
    .in1(out_negate_expr_FU_32_32_62_i0_fu_matrix_convolution_33984_34689),
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
    .in1(out_ui_plus_expr_FU_32_32_32_76_i0_fu_matrix_convolution_33984_34693),
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
    .in1(out_MUX_88_reg_14_0_0_0),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_89_reg_15_0_0_0),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_79_i3_fu_matrix_convolution_33984_40443),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_79_i5_fu_matrix_convolution_33984_40454),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_77_i1_fu_matrix_convolution_33984_34769),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_93_reg_19_0_0_0),
    .wenable(wrenable_reg_19));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_71_i2_fu_matrix_convolution_33984_34697),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_53_i0_fu_matrix_convolution_33984_34866),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_75_i3_fu_matrix_convolution_33984_34907),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_32_32_55_i0_fu_matrix_convolution_33984_37238),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_98_reg_23_0_0_0),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_99_reg_24_0_0_1),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_100_reg_25_0_0_0),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_75_i1_fu_matrix_convolution_33984_34887),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_102_reg_27_0_0_0),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_103_reg_28_0_0_0),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_77_i6_fu_matrix_convolution_33984_37233),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_64_i0_fu_matrix_convolution_33984_34920),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_36_i0_fu_matrix_convolution_33984_34841),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_107_reg_31_0_0_0),
    .wenable(wrenable_reg_31));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_35_i0_fu_matrix_convolution_33984_34859),
    .wenable(wrenable_reg_32));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_109_reg_33_0_0_0),
    .wenable(wrenable_reg_33));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_34_i0_fu_matrix_convolution_33984_34910),
    .wenable(wrenable_reg_34));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_43_i0_fu_matrix_convolution_33984_34915),
    .wenable(wrenable_reg_35));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_lt_expr_FU_32_32_32_60_i1_fu_matrix_convolution_33984_34922),
    .wenable(wrenable_reg_36));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_77_i4_fu_matrix_convolution_33984_37211),
    .wenable(wrenable_reg_37));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_77_i5_fu_matrix_convolution_33984_37222),
    .wenable(wrenable_reg_38));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_115_reg_39_0_0_0),
    .wenable(wrenable_reg_39));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_4_i0_fu_matrix_convolution_33984_39785),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_32_32_55_i3_fu_matrix_convolution_33984_37246),
    .wenable(wrenable_reg_40));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_41 (.out1(out_reg_41_reg_41),
    .clock(clock),
    .reset(reset),
    .in1(out___float_mule11m52b_1023nih_81_i0___float_mule11m52b_1023nih_81_i0),
    .wenable(wrenable_reg_41));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_42 (.out1(out_reg_42_reg_42),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_119_reg_42_0_0_0),
    .wenable(wrenable_reg_42));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_43 (.out1(out_reg_43_reg_43),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_37_i0_fu_matrix_convolution_33984_34806),
    .wenable(wrenable_reg_43));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_44 (.out1(out_reg_44_reg_44),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_121_reg_44_0_0_0),
    .wenable(wrenable_reg_44));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_45 (.out1(out_reg_45_reg_45),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_32_32_55_i1_fu_matrix_convolution_33984_37240),
    .wenable(wrenable_reg_45));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_46 (.out1(out_reg_46_reg_46),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_123_reg_46_0_0_0),
    .wenable(wrenable_reg_46));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_3_i0_fu_matrix_convolution_33984_39788),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_2_i0_fu_matrix_convolution_33984_39791),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_78_i1_fu_matrix_convolution_33984_40398),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_78_i2_fu_matrix_convolution_33984_40414),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_79_i1_fu_matrix_convolution_33984_40432),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION_matrix_convolution_33984_34675 = out_read_cond_FU_9_i0_fu_matrix_convolution_33984_34675;
  assign OUT_CONDITION_matrix_convolution_33984_34756 = out_read_cond_FU_18_i0_fu_matrix_convolution_33984_34756;
  assign OUT_CONDITION_matrix_convolution_33984_34890 = out_read_cond_FU_25_i0_fu_matrix_convolution_33984_34890;
  assign OUT_CONDITION_matrix_convolution_33984_34894 = out_read_cond_FU_28_i0_fu_matrix_convolution_33984_34894;
  assign OUT_CONDITION_matrix_convolution_33984_34911 = out_read_cond_FU_38_i0_fu_matrix_convolution_33984_34911;
  assign OUT_CONDITION_matrix_convolution_33984_34916 = out_read_cond_FU_45_i0_fu_matrix_convolution_33984_34916;
  assign OUT_CONDITION_matrix_convolution_33984_34924 = out_read_cond_FU_47_i0_fu_matrix_convolution_33984_34924;
  assign OUT_CONDITION_matrix_convolution_33984_34938 = out_read_cond_FU_48_i0_fu_matrix_convolution_33984_34938;
  assign OUT_CONDITION_matrix_convolution_33984_34940 = out_read_cond_FU_50_i0_fu_matrix_convolution_33984_34940;
  assign OUT_CONDITION_matrix_convolution_33984_34942 = out_read_cond_FU_51_i0_fu_matrix_convolution_33984_34942;
  assign OUT_UNBOUNDED_matrix_convolution_33984_34793 = s_done___float_adde11m52b_1023nih_80_i0;
  assign OUT_UNBOUNDED_matrix_convolution_33984_34798 = s_done___float_mule11m52b_1023nih_81_i0;
  assign OUT_UNBOUNDED_matrix_convolution_33984_34829 = s_done___float_adde11m52b_1023nih_80_i0;
  assign OUT_UNBOUNDED_matrix_convolution_33984_34833 = s_done___float_mule11m52b_1023nih_81_i0;

endmodule

// FSM based controller description for matrix_convolution
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_matrix_convolution(done_port,
  fuselector_BMEMORY_CTRLN_54_i0_LOAD,
  fuselector_BMEMORY_CTRLN_54_i0_STORE,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34793,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34798,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34829,
  selector_IN_UNBOUNDED_matrix_convolution_33984_34833,
  selector_MUX_100_reg_25_0_0_0,
  selector_MUX_102_reg_27_0_0_0,
  selector_MUX_103_reg_28_0_0_0,
  selector_MUX_107_reg_31_0_0_0,
  selector_MUX_109_reg_33_0_0_0,
  selector_MUX_115_reg_39_0_0_0,
  selector_MUX_119_reg_42_0_0_0,
  selector_MUX_121_reg_44_0_0_0,
  selector_MUX_123_reg_46_0_0_0,
  selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0,
  selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1,
  selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0,
  selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0,
  selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0,
  selector_MUX_88_reg_14_0_0_0,
  selector_MUX_89_reg_15_0_0_0,
  selector_MUX_93_reg_19_0_0_0,
  selector_MUX_98_reg_23_0_0_0,
  selector_MUX_99_reg_24_0_0_0,
  selector_MUX_99_reg_24_0_0_1,
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
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_matrix_convolution_33984_34675,
  OUT_CONDITION_matrix_convolution_33984_34756,
  OUT_CONDITION_matrix_convolution_33984_34890,
  OUT_CONDITION_matrix_convolution_33984_34894,
  OUT_CONDITION_matrix_convolution_33984_34911,
  OUT_CONDITION_matrix_convolution_33984_34916,
  OUT_CONDITION_matrix_convolution_33984_34924,
  OUT_CONDITION_matrix_convolution_33984_34938,
  OUT_CONDITION_matrix_convolution_33984_34940,
  OUT_CONDITION_matrix_convolution_33984_34942,
  OUT_UNBOUNDED_matrix_convolution_33984_34793,
  OUT_UNBOUNDED_matrix_convolution_33984_34798,
  OUT_UNBOUNDED_matrix_convolution_33984_34829,
  OUT_UNBOUNDED_matrix_convolution_33984_34833,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_matrix_convolution_33984_34675;
  input OUT_CONDITION_matrix_convolution_33984_34756;
  input OUT_CONDITION_matrix_convolution_33984_34890;
  input OUT_CONDITION_matrix_convolution_33984_34894;
  input OUT_CONDITION_matrix_convolution_33984_34911;
  input OUT_CONDITION_matrix_convolution_33984_34916;
  input OUT_CONDITION_matrix_convolution_33984_34924;
  input OUT_CONDITION_matrix_convolution_33984_34938;
  input OUT_CONDITION_matrix_convolution_33984_34940;
  input OUT_CONDITION_matrix_convolution_33984_34942;
  input OUT_UNBOUNDED_matrix_convolution_33984_34793;
  input OUT_UNBOUNDED_matrix_convolution_33984_34798;
  input OUT_UNBOUNDED_matrix_convolution_33984_34829;
  input OUT_UNBOUNDED_matrix_convolution_33984_34833;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_54_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_54_i0_STORE;
  output selector_IN_UNBOUNDED_matrix_convolution_33984_34793;
  output selector_IN_UNBOUNDED_matrix_convolution_33984_34798;
  output selector_IN_UNBOUNDED_matrix_convolution_33984_34829;
  output selector_IN_UNBOUNDED_matrix_convolution_33984_34833;
  output selector_MUX_100_reg_25_0_0_0;
  output selector_MUX_102_reg_27_0_0_0;
  output selector_MUX_103_reg_28_0_0_0;
  output selector_MUX_107_reg_31_0_0_0;
  output selector_MUX_109_reg_33_0_0_0;
  output selector_MUX_115_reg_39_0_0_0;
  output selector_MUX_119_reg_42_0_0_0;
  output selector_MUX_121_reg_44_0_0_0;
  output selector_MUX_123_reg_46_0_0_0;
  output selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0;
  output selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1;
  output selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0;
  output selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0;
  output selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0;
  output selector_MUX_88_reg_14_0_0_0;
  output selector_MUX_89_reg_15_0_0_0;
  output selector_MUX_93_reg_19_0_0_0;
  output selector_MUX_98_reg_23_0_0_0;
  output selector_MUX_99_reg_24_0_0_0;
  output selector_MUX_99_reg_24_0_0_1;
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
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [4:0] S_0 = 5'd0,
    S_18 = 5'd18,
    S_1 = 5'd1,
    S_17 = 5'd17,
    S_2 = 5'd2,
    S_7 = 5'd7,
    S_8 = 5'd8,
    S_9 = 5'd9,
    S_10 = 5'd10,
    S_11 = 5'd11,
    S_12 = 5'd12,
    S_13 = 5'd13,
    S_14 = 5'd14,
    S_3 = 5'd3,
    S_4 = 5'd4,
    S_5 = 5'd5,
    S_6 = 5'd6,
    S_15 = 5'd15,
    S_16 = 5'd16,
    S_19 = 5'd19;
  reg [4:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_54_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_54_i0_STORE;
  reg selector_IN_UNBOUNDED_matrix_convolution_33984_34793;
  reg selector_IN_UNBOUNDED_matrix_convolution_33984_34798;
  reg selector_IN_UNBOUNDED_matrix_convolution_33984_34829;
  reg selector_IN_UNBOUNDED_matrix_convolution_33984_34833;
  reg selector_MUX_100_reg_25_0_0_0;
  reg selector_MUX_102_reg_27_0_0_0;
  reg selector_MUX_103_reg_28_0_0_0;
  reg selector_MUX_107_reg_31_0_0_0;
  reg selector_MUX_109_reg_33_0_0_0;
  reg selector_MUX_115_reg_39_0_0_0;
  reg selector_MUX_119_reg_42_0_0_0;
  reg selector_MUX_121_reg_44_0_0_0;
  reg selector_MUX_123_reg_46_0_0_0;
  reg selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0;
  reg selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1;
  reg selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0;
  reg selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0;
  reg selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0;
  reg selector_MUX_88_reg_14_0_0_0;
  reg selector_MUX_89_reg_15_0_0_0;
  reg selector_MUX_93_reg_19_0_0_0;
  reg selector_MUX_98_reg_23_0_0_0;
  reg selector_MUX_99_reg_24_0_0_0;
  reg selector_MUX_99_reg_24_0_0_1;
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
    fuselector_BMEMORY_CTRLN_54_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_54_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED_matrix_convolution_33984_34793 = 1'b0;
    selector_IN_UNBOUNDED_matrix_convolution_33984_34798 = 1'b0;
    selector_IN_UNBOUNDED_matrix_convolution_33984_34829 = 1'b0;
    selector_IN_UNBOUNDED_matrix_convolution_33984_34833 = 1'b0;
    selector_MUX_100_reg_25_0_0_0 = 1'b0;
    selector_MUX_102_reg_27_0_0_0 = 1'b0;
    selector_MUX_103_reg_28_0_0_0 = 1'b0;
    selector_MUX_107_reg_31_0_0_0 = 1'b0;
    selector_MUX_109_reg_33_0_0_0 = 1'b0;
    selector_MUX_115_reg_39_0_0_0 = 1'b0;
    selector_MUX_119_reg_42_0_0_0 = 1'b0;
    selector_MUX_121_reg_44_0_0_0 = 1'b0;
    selector_MUX_123_reg_46_0_0_0 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0 = 1'b0;
    selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0 = 1'b0;
    selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0 = 1'b0;
    selector_MUX_88_reg_14_0_0_0 = 1'b0;
    selector_MUX_89_reg_15_0_0_0 = 1'b0;
    selector_MUX_93_reg_19_0_0_0 = 1'b0;
    selector_MUX_98_reg_23_0_0_0 = 1'b0;
    selector_MUX_99_reg_24_0_0_0 = 1'b0;
    selector_MUX_99_reg_24_0_0_1 = 1'b0;
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
              _next_state = S_18;
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
      S_18 :
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
          _next_state = S_17;
        end
      S_17 :
        begin
          selector_MUX_88_reg_14_0_0_0 = 1'b1;
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
          selector_MUX_100_reg_25_0_0_0 = 1'b1;
          selector_MUX_102_reg_27_0_0_0 = 1'b1;
          selector_MUX_103_reg_28_0_0_0 = 1'b1;
          selector_MUX_98_reg_23_0_0_0 = 1'b1;
          selector_MUX_99_reg_24_0_0_1 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_46 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34756 == 1'b1)
            begin
              _next_state = S_7;
              wrenable_reg_46 = 1'b0;
            end
          else
            begin
              _next_state = S_15;
              selector_MUX_100_reg_25_0_0_0 = 1'b0;
              selector_MUX_102_reg_27_0_0_0 = 1'b0;
              selector_MUX_103_reg_28_0_0_0 = 1'b0;
              selector_MUX_98_reg_23_0_0_0 = 1'b0;
              selector_MUX_99_reg_24_0_0_1 = 1'b0;
              wrenable_reg_23 = 1'b0;
              wrenable_reg_24 = 1'b0;
              wrenable_reg_25 = 1'b0;
              wrenable_reg_27 = 1'b0;
              wrenable_reg_28 = 1'b0;
            end
        end
      S_7 :
        begin
          selector_MUX_107_reg_31_0_0_0 = 1'b1;
          selector_MUX_109_reg_33_0_0_0 = 1'b1;
          selector_MUX_119_reg_42_0_0_0 = 1'b1;
          selector_MUX_121_reg_44_0_0_0 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_42 = 1'b1;
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34911 == 1'b1)
            begin
              _next_state = S_3;
              selector_MUX_107_reg_31_0_0_0 = 1'b0;
              selector_MUX_109_reg_33_0_0_0 = 1'b0;
              wrenable_reg_30 = 1'b0;
              wrenable_reg_31 = 1'b0;
              wrenable_reg_32 = 1'b0;
              wrenable_reg_33 = 1'b0;
              wrenable_reg_34 = 1'b0;
            end
          else
            begin
              _next_state = S_8;
              selector_MUX_119_reg_42_0_0_0 = 1'b0;
              selector_MUX_121_reg_44_0_0_0 = 1'b0;
              wrenable_reg_42 = 1'b0;
              wrenable_reg_43 = 1'b0;
              wrenable_reg_44 = 1'b0;
            end
        end
      S_8 :
        begin
          wrenable_reg_31 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          wrenable_reg_39 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34916 == 1'b1)
            begin
              _next_state = S_12;
              wrenable_reg_35 = 1'b0;
              wrenable_reg_36 = 1'b0;
              wrenable_reg_37 = 1'b0;
            end
          else
            begin
              _next_state = S_9;
              wrenable_reg_39 = 1'b0;
            end
        end
      S_9 :
        begin
          wrenable_reg_39 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34924 == 1'b1)
            begin
              _next_state = S_12;
            end
          else
            begin
              _next_state = S_10;
              wrenable_reg_39 = 1'b0;
            end
        end
      S_10 :
        begin
          fuselector_BMEMORY_CTRLN_54_i0_LOAD = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          selector_MUX_115_reg_39_0_0_0 = 1'b1;
          wrenable_reg_39 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          fuselector_BMEMORY_CTRLN_54_i0_LOAD = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0 = 1'b1;
          wrenable_reg_40 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          selector_IN_UNBOUNDED_matrix_convolution_33984_34833 = 1'b1;
          selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0 = 1'b1;
          wrenable_reg_41 = 1'b1;
          _next_state = S_14;
        end
      S_14 :
        begin
          selector_IN_UNBOUNDED_matrix_convolution_33984_34829 = 1'b1;
          selector_MUX_123_reg_46_0_0_0 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_46 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34938 == 1'b1)
            begin
              _next_state = S_8;
              selector_MUX_123_reg_46_0_0_0 = 1'b0;
              wrenable_reg_46 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
              wrenable_reg_24 = 1'b0;
            end
        end
      S_3 :
        begin
          fuselector_BMEMORY_CTRLN_54_i0_LOAD = 1'b1;
          wrenable_reg_44 = 1'b1;
          wrenable_reg_45 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          selector_IN_UNBOUNDED_matrix_convolution_33984_34798 = 1'b1;
          wrenable_reg_41 = 1'b1;
          _next_state = S_5;
        end
      S_5 :
        begin
          selector_IN_UNBOUNDED_matrix_convolution_33984_34793 = 1'b1;
          selector_MUX_123_reg_46_0_0_0 = 1'b1;
          selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0 = 1'b1;
          wrenable_reg_42 = 1'b1;
          wrenable_reg_46 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34890 == 1'b1)
            begin
              _next_state = S_3;
              selector_MUX_123_reg_46_0_0_0 = 1'b0;
              wrenable_reg_46 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
              wrenable_reg_42 = 1'b0;
            end
        end
      S_6 :
        begin
          selector_MUX_99_reg_24_0_0_0 = 1'b1;
          wrenable_reg_24 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34894 == 1'b1)
            begin
              _next_state = S_7;
            end
          else
            begin
              _next_state = S_15;
              selector_MUX_99_reg_24_0_0_0 = 1'b0;
              wrenable_reg_24 = 1'b0;
            end
        end
      S_15 :
        begin
          fuselector_BMEMORY_CTRLN_54_i0_STORE = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1 = 1'b1;
          selector_MUX_93_reg_19_0_0_0 = 1'b1;
          wrenable_reg_19 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34940 == 1'b1)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_16;
              selector_MUX_93_reg_19_0_0_0 = 1'b0;
              wrenable_reg_19 = 1'b0;
            end
        end
      S_16 :
        begin
          selector_MUX_89_reg_15_0_0_0 = 1'b1;
          wrenable_reg_15 = 1'b1;
          if (OUT_CONDITION_matrix_convolution_33984_34942 == 1'b1)
            begin
              _next_state = S_17;
            end
          else
            begin
              _next_state = S_19;
              done_port = 1'b1;
              selector_MUX_89_reg_15_0_0_0 = 1'b0;
              wrenable_reg_15 = 1'b0;
            end
        end
      S_19 :
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
  wire OUT_CONDITION_matrix_convolution_33984_34675;
  wire OUT_CONDITION_matrix_convolution_33984_34756;
  wire OUT_CONDITION_matrix_convolution_33984_34890;
  wire OUT_CONDITION_matrix_convolution_33984_34894;
  wire OUT_CONDITION_matrix_convolution_33984_34911;
  wire OUT_CONDITION_matrix_convolution_33984_34916;
  wire OUT_CONDITION_matrix_convolution_33984_34924;
  wire OUT_CONDITION_matrix_convolution_33984_34938;
  wire OUT_CONDITION_matrix_convolution_33984_34940;
  wire OUT_CONDITION_matrix_convolution_33984_34942;
  wire OUT_UNBOUNDED_matrix_convolution_33984_34793;
  wire OUT_UNBOUNDED_matrix_convolution_33984_34798;
  wire OUT_UNBOUNDED_matrix_convolution_33984_34829;
  wire OUT_UNBOUNDED_matrix_convolution_33984_34833;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_54_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_54_i0_STORE;
  wire selector_IN_UNBOUNDED_matrix_convolution_33984_34793;
  wire selector_IN_UNBOUNDED_matrix_convolution_33984_34798;
  wire selector_IN_UNBOUNDED_matrix_convolution_33984_34829;
  wire selector_IN_UNBOUNDED_matrix_convolution_33984_34833;
  wire selector_MUX_100_reg_25_0_0_0;
  wire selector_MUX_102_reg_27_0_0_0;
  wire selector_MUX_103_reg_28_0_0_0;
  wire selector_MUX_107_reg_31_0_0_0;
  wire selector_MUX_109_reg_33_0_0_0;
  wire selector_MUX_115_reg_39_0_0_0;
  wire selector_MUX_119_reg_42_0_0_0;
  wire selector_MUX_121_reg_44_0_0_0;
  wire selector_MUX_123_reg_46_0_0_0;
  wire selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0;
  wire selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1;
  wire selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0;
  wire selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0;
  wire selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0;
  wire selector_MUX_88_reg_14_0_0_0;
  wire selector_MUX_89_reg_15_0_0_0;
  wire selector_MUX_93_reg_19_0_0_0;
  wire selector_MUX_98_reg_23_0_0_0;
  wire selector_MUX_99_reg_24_0_0_0;
  wire selector_MUX_99_reg_24_0_0_1;
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
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_matrix_convolution Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_54_i0_LOAD(fuselector_BMEMORY_CTRLN_54_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_54_i0_STORE(fuselector_BMEMORY_CTRLN_54_i0_STORE),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34793(selector_IN_UNBOUNDED_matrix_convolution_33984_34793),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34798(selector_IN_UNBOUNDED_matrix_convolution_33984_34798),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34829(selector_IN_UNBOUNDED_matrix_convolution_33984_34829),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34833(selector_IN_UNBOUNDED_matrix_convolution_33984_34833),
    .selector_MUX_100_reg_25_0_0_0(selector_MUX_100_reg_25_0_0_0),
    .selector_MUX_102_reg_27_0_0_0(selector_MUX_102_reg_27_0_0_0),
    .selector_MUX_103_reg_28_0_0_0(selector_MUX_103_reg_28_0_0_0),
    .selector_MUX_107_reg_31_0_0_0(selector_MUX_107_reg_31_0_0_0),
    .selector_MUX_109_reg_33_0_0_0(selector_MUX_109_reg_33_0_0_0),
    .selector_MUX_115_reg_39_0_0_0(selector_MUX_115_reg_39_0_0_0),
    .selector_MUX_119_reg_42_0_0_0(selector_MUX_119_reg_42_0_0_0),
    .selector_MUX_121_reg_44_0_0_0(selector_MUX_121_reg_44_0_0_0),
    .selector_MUX_123_reg_46_0_0_0(selector_MUX_123_reg_46_0_0_0),
    .selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0(selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0),
    .selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1(selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1),
    .selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0(selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0),
    .selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0(selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0),
    .selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0(selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0),
    .selector_MUX_88_reg_14_0_0_0(selector_MUX_88_reg_14_0_0_0),
    .selector_MUX_89_reg_15_0_0_0(selector_MUX_89_reg_15_0_0_0),
    .selector_MUX_93_reg_19_0_0_0(selector_MUX_93_reg_19_0_0_0),
    .selector_MUX_98_reg_23_0_0_0(selector_MUX_98_reg_23_0_0_0),
    .selector_MUX_99_reg_24_0_0_0(selector_MUX_99_reg_24_0_0_0),
    .selector_MUX_99_reg_24_0_0_1(selector_MUX_99_reg_24_0_0_1),
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
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_matrix_convolution_33984_34675(OUT_CONDITION_matrix_convolution_33984_34675),
    .OUT_CONDITION_matrix_convolution_33984_34756(OUT_CONDITION_matrix_convolution_33984_34756),
    .OUT_CONDITION_matrix_convolution_33984_34890(OUT_CONDITION_matrix_convolution_33984_34890),
    .OUT_CONDITION_matrix_convolution_33984_34894(OUT_CONDITION_matrix_convolution_33984_34894),
    .OUT_CONDITION_matrix_convolution_33984_34911(OUT_CONDITION_matrix_convolution_33984_34911),
    .OUT_CONDITION_matrix_convolution_33984_34916(OUT_CONDITION_matrix_convolution_33984_34916),
    .OUT_CONDITION_matrix_convolution_33984_34924(OUT_CONDITION_matrix_convolution_33984_34924),
    .OUT_CONDITION_matrix_convolution_33984_34938(OUT_CONDITION_matrix_convolution_33984_34938),
    .OUT_CONDITION_matrix_convolution_33984_34940(OUT_CONDITION_matrix_convolution_33984_34940),
    .OUT_CONDITION_matrix_convolution_33984_34942(OUT_CONDITION_matrix_convolution_33984_34942),
    .OUT_UNBOUNDED_matrix_convolution_33984_34793(OUT_UNBOUNDED_matrix_convolution_33984_34793),
    .OUT_UNBOUNDED_matrix_convolution_33984_34798(OUT_UNBOUNDED_matrix_convolution_33984_34798),
    .OUT_UNBOUNDED_matrix_convolution_33984_34829(OUT_UNBOUNDED_matrix_convolution_33984_34829),
    .OUT_UNBOUNDED_matrix_convolution_33984_34833(OUT_UNBOUNDED_matrix_convolution_33984_34833),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_matrix_convolution Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_matrix_convolution_33984_34675(OUT_CONDITION_matrix_convolution_33984_34675),
    .OUT_CONDITION_matrix_convolution_33984_34756(OUT_CONDITION_matrix_convolution_33984_34756),
    .OUT_CONDITION_matrix_convolution_33984_34890(OUT_CONDITION_matrix_convolution_33984_34890),
    .OUT_CONDITION_matrix_convolution_33984_34894(OUT_CONDITION_matrix_convolution_33984_34894),
    .OUT_CONDITION_matrix_convolution_33984_34911(OUT_CONDITION_matrix_convolution_33984_34911),
    .OUT_CONDITION_matrix_convolution_33984_34916(OUT_CONDITION_matrix_convolution_33984_34916),
    .OUT_CONDITION_matrix_convolution_33984_34924(OUT_CONDITION_matrix_convolution_33984_34924),
    .OUT_CONDITION_matrix_convolution_33984_34938(OUT_CONDITION_matrix_convolution_33984_34938),
    .OUT_CONDITION_matrix_convolution_33984_34940(OUT_CONDITION_matrix_convolution_33984_34940),
    .OUT_CONDITION_matrix_convolution_33984_34942(OUT_CONDITION_matrix_convolution_33984_34942),
    .OUT_UNBOUNDED_matrix_convolution_33984_34793(OUT_UNBOUNDED_matrix_convolution_33984_34793),
    .OUT_UNBOUNDED_matrix_convolution_33984_34798(OUT_UNBOUNDED_matrix_convolution_33984_34798),
    .OUT_UNBOUNDED_matrix_convolution_33984_34829(OUT_UNBOUNDED_matrix_convolution_33984_34829),
    .OUT_UNBOUNDED_matrix_convolution_33984_34833(OUT_UNBOUNDED_matrix_convolution_33984_34833),
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
    .fuselector_BMEMORY_CTRLN_54_i0_LOAD(fuselector_BMEMORY_CTRLN_54_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_54_i0_STORE(fuselector_BMEMORY_CTRLN_54_i0_STORE),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34793(selector_IN_UNBOUNDED_matrix_convolution_33984_34793),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34798(selector_IN_UNBOUNDED_matrix_convolution_33984_34798),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34829(selector_IN_UNBOUNDED_matrix_convolution_33984_34829),
    .selector_IN_UNBOUNDED_matrix_convolution_33984_34833(selector_IN_UNBOUNDED_matrix_convolution_33984_34833),
    .selector_MUX_100_reg_25_0_0_0(selector_MUX_100_reg_25_0_0_0),
    .selector_MUX_102_reg_27_0_0_0(selector_MUX_102_reg_27_0_0_0),
    .selector_MUX_103_reg_28_0_0_0(selector_MUX_103_reg_28_0_0_0),
    .selector_MUX_107_reg_31_0_0_0(selector_MUX_107_reg_31_0_0_0),
    .selector_MUX_109_reg_33_0_0_0(selector_MUX_109_reg_33_0_0_0),
    .selector_MUX_115_reg_39_0_0_0(selector_MUX_115_reg_39_0_0_0),
    .selector_MUX_119_reg_42_0_0_0(selector_MUX_119_reg_42_0_0_0),
    .selector_MUX_121_reg_44_0_0_0(selector_MUX_121_reg_44_0_0_0),
    .selector_MUX_123_reg_46_0_0_0(selector_MUX_123_reg_46_0_0_0),
    .selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0(selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_0),
    .selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1(selector_MUX_2_BMEMORY_CTRLN_54_i0_1_0_1),
    .selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0(selector_MUX_2_BMEMORY_CTRLN_54_i0_1_1_0),
    .selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0(selector_MUX_34___float_adde11m52b_1023nih_80_i0_1_0_0),
    .selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0(selector_MUX_36___float_mule11m52b_1023nih_81_i0_1_0_0),
    .selector_MUX_88_reg_14_0_0_0(selector_MUX_88_reg_14_0_0_0),
    .selector_MUX_89_reg_15_0_0_0(selector_MUX_89_reg_15_0_0_0),
    .selector_MUX_93_reg_19_0_0_0(selector_MUX_93_reg_19_0_0_0),
    .selector_MUX_98_reg_23_0_0_0(selector_MUX_98_reg_23_0_0_0),
    .selector_MUX_99_reg_24_0_0_0(selector_MUX_99_reg_24_0_0_0),
    .selector_MUX_99_reg_24_0_0_1(selector_MUX_99_reg_24_0_0_1),
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
    .Min_Wdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Min_data_ram_size({7'b0000000,
      7'b0000000}));

endmodule


