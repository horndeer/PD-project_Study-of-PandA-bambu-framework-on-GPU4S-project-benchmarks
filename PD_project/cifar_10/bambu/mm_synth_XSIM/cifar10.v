// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2023.1 - Revision 04336c437a53bc96ae90b74052c455629946ec8b-main - Date 2024-06-10T16:18:00
// /tmp/.mount_bambu-HxhofW/usr/bin/bambu executed with: /tmp/.mount_bambu-HxhofW/usr/bin/bambu --top-fname=cifar10 --soft-float --flopoco --simulate --evaluation --device-name=asap7-BC --simulator=XSIM --experimental-setup=BAMBU-PERFORMANCE-MP /home/gaetan/PD_project/PD_project/cifar_10/cpu_functions/cpu_functions.cpp 
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
module fp_cond_expr_FU(in1,
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
module le_expr_FU(in1,
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
  assign out1 = in1 <= in2;
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
module ternary_plus_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  input signed [BITSIZE_in3-1:0] in3;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2 + in3;
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
module bit_not_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = ~in1;
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

// Datapath RTL description for __udivsi3
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___udivsi3(clock,
  reset,
  in_port_u,
  in_port_v,
  return_port,
  selector_MUX_13_reg_2_0_0_0,
  selector_MUX_14_reg_3_0_0_0,
  selector_MUX_15_reg_4_0_0_0,
  selector_MUX_16_reg_5_0_0_0,
  selector_MUX_16_reg_5_0_0_1,
  selector_MUX_17_reg_6_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  OUT_CONDITION___udivsi3_6917_9374);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_u;
  input [31:0] in_port_v;
  input selector_MUX_13_reg_2_0_0_0;
  input selector_MUX_14_reg_3_0_0_0;
  input selector_MUX_15_reg_4_0_0_0;
  input selector_MUX_16_reg_5_0_0_0;
  input selector_MUX_16_reg_5_0_0_1;
  input selector_MUX_17_reg_6_0_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  // OUT
  output [31:0] return_port;
  output OUT_CONDITION___udivsi3_6917_9374;
  // Component and signal declarations
  wire [31:0] out_IUdata_converter_FU_5_i0_fu___udivsi3_6917_9307;
  wire out_MUX_13_reg_2_0_0_0;
  wire [31:0] out_MUX_14_reg_3_0_0_0;
  wire [31:0] out_MUX_15_reg_4_0_0_0;
  wire [31:0] out_MUX_16_reg_5_0_0_0;
  wire [31:0] out_MUX_16_reg_5_0_0_1;
  wire [31:0] out_MUX_17_reg_6_0_0_0;
  wire signed [32:0] out_UIdata_converter_FU_2_i0_fu___udivsi3_6917_9303;
  wire [31:0] out_UUconvert_expr_FU_17_i0_fu___udivsi3_6917_9464;
  wire out_UUdata_converter_FU_12_i0_fu___udivsi3_6917_9350;
  wire out_UUdata_converter_FU_15_i0_fu___udivsi3_6917_9370;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu___udivsi3_6917_9304;
  wire [31:0] out_UUdata_converter_FU_4_i0_fu___udivsi3_6917_9305;
  wire signed [32:0] out_bit_not_expr_FU_64_64_19_i0_fu___udivsi3_6917_9306;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [5:0] out_const_2;
  wire out_const_3;
  wire [5:0] out_const_4;
  wire [4:0] out_const_5;
  wire [30:0] out_const_6;
  wire [31:0] out_const_7;
  wire [30:0] out_conv_out_const_0_1_31;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [30:0] out_conv_out_reg_5_reg_5_32_31;
  wire [30:0] out_conv_out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___udivsi3_6917_9372_32_31;
  wire [31:0] out_conv_out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1_31_32;
  wire [31:0] out_conv_out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2_31_32;
  wire out_read_cond_FU_16_i0_fu___udivsi3_6917_9374;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_1_reg_1;
  wire out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire out_truth_and_expr_FU_1_0_1_20_i0_fu___udivsi3_6917_14533;
  wire out_truth_and_expr_FU_1_0_1_21_i0_fu___udivsi3_6917_9341;
  wire out_truth_and_expr_FU_1_0_1_21_i1_fu___udivsi3_6917_9362;
  wire out_truth_not_expr_FU_1_1_22_i0_fu___udivsi3_6917_14522;
  wire out_truth_not_expr_FU_1_1_22_i1_fu___udivsi3_6917_9337;
  wire out_truth_not_expr_FU_1_1_22_i2_fu___udivsi3_6917_9369;
  wire out_truth_or_expr_FU_1_1_1_23_i0_fu___udivsi3_6917_14555;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_24_i0_fu___udivsi3_6917_9359;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_24_i1_fu___udivsi3_6917_9360;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_25_i0_fu___udivsi3_6917_9308;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___udivsi3_6917_9372;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_26_i0_fu___udivsi3_6917_9343;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_26_i1_fu___udivsi3_6917_9347;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_27_i0_fu___udivsi3_6917_9348;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_27_i1_fu___udivsi3_6917_9349;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_27_i2_fu___udivsi3_6917_9366;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_28_i0_fu___udivsi3_6917_9345;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_29_i0_fu___udivsi3_6917_9367;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_30_i0_fu___udivsi3_6917_9371;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_31_i0_fu___udivsi3_6917_9358;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_32_i0_fu___udivsi3_6917_9356;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_32_i1_fu___udivsi3_6917_9357;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_32_i2_fu___udivsi3_6917_9363;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_32_i3_fu___udivsi3_6917_9364;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_33_i0_fu___udivsi3_6917_9339;
  wire out_ui_extract_bit_expr_FU_11_i0_fu___udivsi3_6917_14560;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___udivsi3_6917_14564;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___udivsi3_6917_14567;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_34_i0_fu___udivsi3_6917_14545;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_34_i1_fu___udivsi3_6917_14552;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_35_i0_fu___udivsi3_6917_9342;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_35_i1_fu___udivsi3_6917_9346;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_35_i2_fu___udivsi3_6917_9368;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_36_i0_fu___udivsi3_6917_9365;
  wire out_ui_ne_expr_FU_32_0_32_37_i0_fu___udivsi3_6917_14392;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_38_i0_fu___udivsi3_6917_9373;
  wire [30:0] out_ui_rshift_expr_FU_32_0_32_39_i0_fu___udivsi3_6917_14538;
  wire [30:0] out_ui_rshift_expr_FU_32_0_32_39_i1_fu___udivsi3_6917_14548;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_40_i0_fu___udivsi3_6917_9344;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_40_i1_fu___udivsi3_6917_9353;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_40_i2_fu___udivsi3_6917_9354;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_40_i3_fu___udivsi3_6917_9355;
  wire [31:0] out_ui_ternary_plus_expr_FU_32_32_32_32_41_i0_fu___udivsi3_6917_9352;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [30:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [30:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  wire [31:0] out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3;
  
  MUX_GATE #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) MUX_13_reg_2_0_0_0 (.out1(out_MUX_13_reg_2_0_0_0),
    .sel(selector_MUX_13_reg_2_0_0_0),
    .in1(out_const_0),
    .in2(out_ui_bit_xor_expr_FU_1_1_1_32_i3_fu___udivsi3_6917_9364));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_14_reg_3_0_0_0 (.out1(out_MUX_14_reg_3_0_0_0),
    .sel(selector_MUX_14_reg_3_0_0_0),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_29_i0_fu___udivsi3_6917_9367),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_15_reg_4_0_0_0 (.out1(out_MUX_15_reg_4_0_0_0),
    .sel(selector_MUX_15_reg_4_0_0_0),
    .in1(out_UUdata_converter_FU_3_i0_fu___udivsi3_6917_9304),
    .in2(out_ui_lshift_expr_FU_32_0_32_34_i1_fu___udivsi3_6917_14552));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_16_reg_5_0_0_0 (.out1(out_MUX_16_reg_5_0_0_0),
    .sel(selector_MUX_16_reg_5_0_0_0),
    .in1(out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___udivsi3_6917_9372),
    .in2(out_conv_out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1_31_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_16_reg_5_0_0_1 (.out1(out_MUX_16_reg_5_0_0_1),
    .sel(selector_MUX_16_reg_5_0_0_1),
    .in1(out_conv_out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2_31_32),
    .in2(out_MUX_16_reg_5_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_17_reg_6_0_0_0 (.out1(out_MUX_17_reg_6_0_0_0),
    .sel(selector_MUX_17_reg_6_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_38_i0_fu___udivsi3_6917_9373),
    .in2(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(31)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___udivsi3_6917_9372_32_31));
  UUdata_converter_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(31)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2),
    .in1(out_conv_out_const_0_1_31));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_3 (.out1(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3),
    .in1(out_conv_out_const_0_1_32));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011111)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1111111111111111111111111111111)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_7 (.out1(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(31)) conv_out_const_0_1_31 (.out1(out_conv_out_const_0_1_31),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(31)) conv_out_reg_5_reg_5_32_31 (.out1(out_conv_out_reg_5_reg_5_32_31),
    .in1(out_reg_5_reg_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(31)) conv_out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___udivsi3_6917_9372_32_31 (.out1(out_conv_out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___udivsi3_6917_9372_32_31),
    .in1(out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___udivsi3_6917_9372));
  UUdata_converter_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(32)) conv_out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1_31_32 (.out1(out_conv_out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1_31_32),
    .in1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1));
  UUdata_converter_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(32)) conv_out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2_31_32 (.out1(out_conv_out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2_31_32),
    .in1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu___udivsi3_6917_14392 (.out1(out_ui_ne_expr_FU_32_0_32_37_i0_fu___udivsi3_6917_14392),
    .in1(out_ui_plus_expr_FU_32_0_32_38_i0_fu___udivsi3_6917_9373),
    .in2(out_const_4));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_14522 (.out1(out_truth_not_expr_FU_1_1_22_i0_fu___udivsi3_6917_14522),
    .in1(out_reg_2_reg_2));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_14533 (.out1(out_truth_and_expr_FU_1_0_1_20_i0_fu___udivsi3_6917_14533),
    .in1(out_ui_extract_bit_expr_FU_11_i0_fu___udivsi3_6917_14560),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___udivsi3_6917_14538 (.out1(out_ui_rshift_expr_FU_32_0_32_39_i0_fu___udivsi3_6917_14538),
    .in1(out_ui_lshift_expr_FU_32_0_32_35_i0_fu___udivsi3_6917_9342),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___udivsi3_6917_14545 (.out1(out_ui_lshift_expr_FU_32_0_32_34_i0_fu___udivsi3_6917_14545),
    .in1(out_ui_bit_and_expr_FU_32_0_32_26_i0_fu___udivsi3_6917_9343),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___udivsi3_6917_14548 (.out1(out_ui_rshift_expr_FU_32_0_32_39_i1_fu___udivsi3_6917_14548),
    .in1(out_ui_lshift_expr_FU_32_0_32_35_i1_fu___udivsi3_6917_9346),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___udivsi3_6917_14552 (.out1(out_ui_lshift_expr_FU_32_0_32_34_i1_fu___udivsi3_6917_14552),
    .in1(out_ui_bit_and_expr_FU_32_0_32_26_i1_fu___udivsi3_6917_9347),
    .in2(out_const_3));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_14555 (.out1(out_truth_or_expr_FU_1_1_1_23_i0_fu___udivsi3_6917_14555),
    .in1(out_ui_extract_bit_expr_FU_13_i0_fu___udivsi3_6917_14564),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___udivsi3_6917_14567));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_6917_14560 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu___udivsi3_6917_14560),
    .in1(out_reg_3_reg_3),
    .in2(out_const_5));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___udivsi3_6917_14564 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___udivsi3_6917_14564),
    .in1(out_ui_bit_and_expr_FU_1_1_1_24_i0_fu___udivsi3_6917_9359),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___udivsi3_6917_14567 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___udivsi3_6917_14567),
    .in1(out_ui_bit_and_expr_FU_1_1_1_24_i1_fu___udivsi3_6917_9360),
    .in2(out_const_0));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(33)) fu___udivsi3_6917_9303 (.out1(out_UIdata_converter_FU_2_i0_fu___udivsi3_6917_9303),
    .in1(in_port_v));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9304 (.out1(out_UUdata_converter_FU_3_i0_fu___udivsi3_6917_9304),
    .in1(in_port_u));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9305 (.out1(out_UUdata_converter_FU_4_i0_fu___udivsi3_6917_9305),
    .in1(in_port_v));
  bit_not_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(33)) fu___udivsi3_6917_9306 (.out1(out_bit_not_expr_FU_64_64_19_i0_fu___udivsi3_6917_9306),
    .in1(out_UIdata_converter_FU_2_i0_fu___udivsi3_6917_9303));
  IUdata_converter_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9307 (.out1(out_IUdata_converter_FU_5_i0_fu___udivsi3_6917_9307),
    .in1(out_bit_not_expr_FU_64_64_19_i0_fu___udivsi3_6917_9306));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9308 (.out1(out_ui_bit_and_expr_FU_32_0_32_25_i0_fu___udivsi3_6917_9308),
    .in1(out_IUdata_converter_FU_5_i0_fu___udivsi3_6917_9307),
    .in2(out_const_7));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9337 (.out1(out_truth_not_expr_FU_1_1_22_i1_fu___udivsi3_6917_9337),
    .in1(out_reg_2_reg_2));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9339 (.out1(out_ui_cond_expr_FU_32_32_32_32_33_i0_fu___udivsi3_6917_9339),
    .in1(out_reg_2_reg_2),
    .in2(out_reg_0_reg_0),
    .in3(out_reg_1_reg_1));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9341 (.out1(out_truth_and_expr_FU_1_0_1_21_i0_fu___udivsi3_6917_9341),
    .in1(out_truth_and_expr_FU_1_0_1_20_i0_fu___udivsi3_6917_14533),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___udivsi3_6917_9342 (.out1(out_ui_lshift_expr_FU_32_0_32_35_i0_fu___udivsi3_6917_9342),
    .in1(out_reg_3_reg_3),
    .in2(out_const_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___udivsi3_6917_9343 (.out1(out_ui_bit_and_expr_FU_32_0_32_26_i0_fu___udivsi3_6917_9343),
    .in1(out_ui_rshift_expr_FU_32_0_32_39_i0_fu___udivsi3_6917_14538),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___udivsi3_6917_9344 (.out1(out_ui_rshift_expr_FU_32_0_32_40_i0_fu___udivsi3_6917_9344),
    .in1(out_reg_4_reg_4),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9345 (.out1(out_ui_bit_ior_expr_FU_0_32_32_28_i0_fu___udivsi3_6917_9345),
    .in1(out_ui_lshift_expr_FU_32_0_32_34_i0_fu___udivsi3_6917_14545),
    .in2(out_ui_rshift_expr_FU_32_0_32_40_i0_fu___udivsi3_6917_9344));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___udivsi3_6917_9346 (.out1(out_ui_lshift_expr_FU_32_0_32_35_i1_fu___udivsi3_6917_9346),
    .in1(out_reg_4_reg_4),
    .in2(out_const_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___udivsi3_6917_9347 (.out1(out_ui_bit_and_expr_FU_32_0_32_26_i1_fu___udivsi3_6917_9347),
    .in1(out_ui_rshift_expr_FU_32_0_32_39_i1_fu___udivsi3_6917_14548),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___udivsi3_6917_9348 (.out1(out_ui_bit_and_expr_FU_32_0_32_27_i0_fu___udivsi3_6917_9348),
    .in1(out_ui_cond_expr_FU_32_32_32_32_33_i0_fu___udivsi3_6917_9339),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___udivsi3_6917_9349 (.out1(out_ui_bit_and_expr_FU_32_0_32_27_i1_fu___udivsi3_6917_9349),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_28_i0_fu___udivsi3_6917_9345),
    .in2(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9350 (.out1(out_UUdata_converter_FU_12_i0_fu___udivsi3_6917_9350),
    .in1(out_truth_not_expr_FU_1_1_22_i1_fu___udivsi3_6917_9337));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(31),
    .BITSIZE_in3(31),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9352 (.out1(out_ui_ternary_plus_expr_FU_32_32_32_32_41_i0_fu___udivsi3_6917_9352),
    .in1(out_UUdata_converter_FU_12_i0_fu___udivsi3_6917_9350),
    .in2(out_ui_bit_and_expr_FU_32_0_32_27_i0_fu___udivsi3_6917_9348),
    .in3(out_ui_bit_and_expr_FU_32_0_32_27_i1_fu___udivsi3_6917_9349));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___udivsi3_6917_9353 (.out1(out_ui_rshift_expr_FU_32_0_32_40_i1_fu___udivsi3_6917_9353),
    .in1(out_ui_ternary_plus_expr_FU_32_32_32_32_41_i0_fu___udivsi3_6917_9352),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___udivsi3_6917_9354 (.out1(out_ui_rshift_expr_FU_32_0_32_40_i2_fu___udivsi3_6917_9354),
    .in1(out_ui_cond_expr_FU_32_32_32_32_33_i0_fu___udivsi3_6917_9339),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___udivsi3_6917_9355 (.out1(out_ui_rshift_expr_FU_32_0_32_40_i3_fu___udivsi3_6917_9355),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_28_i0_fu___udivsi3_6917_9345),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9356 (.out1(out_ui_bit_xor_expr_FU_1_1_1_32_i0_fu___udivsi3_6917_9356),
    .in1(out_ui_rshift_expr_FU_32_0_32_40_i3_fu___udivsi3_6917_9355),
    .in2(out_ui_rshift_expr_FU_32_0_32_40_i2_fu___udivsi3_6917_9354));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9357 (.out1(out_ui_bit_xor_expr_FU_1_1_1_32_i1_fu___udivsi3_6917_9357),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_32_i0_fu___udivsi3_6917_9356),
    .in2(out_ui_rshift_expr_FU_32_0_32_40_i1_fu___udivsi3_6917_9353));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9358 (.out1(out_ui_bit_ior_expr_FU_1_1_1_31_i0_fu___udivsi3_6917_9358),
    .in1(out_ui_rshift_expr_FU_32_0_32_40_i1_fu___udivsi3_6917_9353),
    .in2(out_ui_rshift_expr_FU_32_0_32_40_i3_fu___udivsi3_6917_9355));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9359 (.out1(out_ui_bit_and_expr_FU_1_1_1_24_i0_fu___udivsi3_6917_9359),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_31_i0_fu___udivsi3_6917_9358),
    .in2(out_ui_rshift_expr_FU_32_0_32_40_i2_fu___udivsi3_6917_9354));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9360 (.out1(out_ui_bit_and_expr_FU_1_1_1_24_i1_fu___udivsi3_6917_9360),
    .in1(out_ui_rshift_expr_FU_32_0_32_40_i1_fu___udivsi3_6917_9353),
    .in2(out_ui_rshift_expr_FU_32_0_32_40_i3_fu___udivsi3_6917_9355));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9362 (.out1(out_truth_and_expr_FU_1_0_1_21_i1_fu___udivsi3_6917_9362),
    .in1(out_truth_or_expr_FU_1_1_1_23_i0_fu___udivsi3_6917_14555),
    .in2(out_const_3));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9363 (.out1(out_ui_bit_xor_expr_FU_1_1_1_32_i2_fu___udivsi3_6917_9363),
    .in1(out_truth_and_expr_FU_1_0_1_21_i0_fu___udivsi3_6917_9341),
    .in2(out_truth_not_expr_FU_1_1_22_i0_fu___udivsi3_6917_14522));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9364 (.out1(out_ui_bit_xor_expr_FU_1_1_1_32_i3_fu___udivsi3_6917_9364),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_32_i2_fu___udivsi3_6917_9363),
    .in2(out_truth_and_expr_FU_1_0_1_21_i1_fu___udivsi3_6917_9362));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___udivsi3_6917_9365 (.out1(out_ui_lshift_expr_FU_32_0_32_36_i0_fu___udivsi3_6917_9365),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_32_i1_fu___udivsi3_6917_9357),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___udivsi3_6917_9366 (.out1(out_ui_bit_and_expr_FU_32_0_32_27_i2_fu___udivsi3_6917_9366),
    .in1(out_ui_ternary_plus_expr_FU_32_32_32_32_41_i0_fu___udivsi3_6917_9352),
    .in2(out_const_6));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9367 (.out1(out_ui_bit_ior_expr_FU_0_32_32_29_i0_fu___udivsi3_6917_9367),
    .in1(out_ui_lshift_expr_FU_32_0_32_36_i0_fu___udivsi3_6917_9365),
    .in2(out_ui_bit_and_expr_FU_32_0_32_27_i2_fu___udivsi3_6917_9366));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___udivsi3_6917_9368 (.out1(out_ui_lshift_expr_FU_32_0_32_35_i2_fu___udivsi3_6917_9368),
    .in1(out_conv_out_reg_5_reg_5_32_31),
    .in2(out_const_1));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9369 (.out1(out_truth_not_expr_FU_1_1_22_i2_fu___udivsi3_6917_9369),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_32_i3_fu___udivsi3_6917_9364));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9370 (.out1(out_UUdata_converter_FU_15_i0_fu___udivsi3_6917_9370),
    .in1(out_truth_not_expr_FU_1_1_22_i2_fu___udivsi3_6917_9369));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9371 (.out1(out_ui_bit_ior_expr_FU_0_32_32_30_i0_fu___udivsi3_6917_9371),
    .in1(out_UUdata_converter_FU_15_i0_fu___udivsi3_6917_9370),
    .in2(out_ui_lshift_expr_FU_32_0_32_35_i2_fu___udivsi3_6917_9368));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9372 (.out1(out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___udivsi3_6917_9372),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_30_i0_fu___udivsi3_6917_9371),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9373 (.out1(out_ui_plus_expr_FU_32_0_32_38_i0_fu___udivsi3_6917_9373),
    .in1(out_reg_6_reg_6),
    .in2(out_const_3));
  read_cond_FU #(.BITSIZE_in1(1)) fu___udivsi3_6917_9374 (.out1(out_read_cond_FU_16_i0_fu___udivsi3_6917_9374),
    .in1(out_ui_ne_expr_FU_32_0_32_37_i0_fu___udivsi3_6917_14392));
  UUconvert_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9464 (.out1(out_UUconvert_expr_FU_17_i0_fu___udivsi3_6917_9464),
    .in1(out_reg_5_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_4_i0_fu___udivsi3_6917_9305),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_25_i0_fu___udivsi3_6917_9308),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_13_reg_2_0_0_0),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_14_reg_3_0_0_0),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_15_reg_4_0_0_0),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_16_reg_5_0_0_1),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_17_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  // io-signal post fix
  assign return_port = out_UUconvert_expr_FU_17_i0_fu___udivsi3_6917_9464;
  assign OUT_CONDITION___udivsi3_6917_9374 = out_read_cond_FU_16_i0_fu___udivsi3_6917_9374;

endmodule

// FSM based controller description for __udivsi3
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___udivsi3(done_port,
  selector_MUX_13_reg_2_0_0_0,
  selector_MUX_14_reg_3_0_0_0,
  selector_MUX_15_reg_4_0_0_0,
  selector_MUX_16_reg_5_0_0_0,
  selector_MUX_16_reg_5_0_0_1,
  selector_MUX_17_reg_6_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  OUT_CONDITION___udivsi3_6917_9374,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION___udivsi3_6917_9374;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output selector_MUX_13_reg_2_0_0_0;
  output selector_MUX_14_reg_3_0_0_0;
  output selector_MUX_15_reg_4_0_0_0;
  output selector_MUX_16_reg_5_0_0_0;
  output selector_MUX_16_reg_5_0_0_1;
  output selector_MUX_17_reg_6_0_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  parameter [1:0] S_0 = 2'd0,
    S_1 = 2'd1,
    S_2 = 2'd2;
  reg [1:0] _present_state=S_0, _next_state;
  reg done_port;
  reg selector_MUX_13_reg_2_0_0_0;
  reg selector_MUX_14_reg_3_0_0_0;
  reg selector_MUX_15_reg_4_0_0_0;
  reg selector_MUX_16_reg_5_0_0_0;
  reg selector_MUX_16_reg_5_0_0_1;
  reg selector_MUX_17_reg_6_0_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_2;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    selector_MUX_13_reg_2_0_0_0 = 1'b0;
    selector_MUX_14_reg_3_0_0_0 = 1'b0;
    selector_MUX_15_reg_4_0_0_0 = 1'b0;
    selector_MUX_16_reg_5_0_0_0 = 1'b0;
    selector_MUX_16_reg_5_0_0_1 = 1'b0;
    selector_MUX_17_reg_6_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_MUX_13_reg_2_0_0_0 = 1'b1;
          selector_MUX_15_reg_4_0_0_0 = 1'b1;
          selector_MUX_16_reg_5_0_0_1 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          selector_MUX_14_reg_3_0_0_0 = 1'b1;
          selector_MUX_16_reg_5_0_0_0 = 1'b1;
          selector_MUX_17_reg_6_0_0_0 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION___udivsi3_6917_9374 == 1'b1)
            begin
              _next_state = S_1;
              selector_MUX_16_reg_5_0_0_0 = 1'b0;
            end
          else
            begin
              _next_state = S_2;
              done_port = 1'b1;
              selector_MUX_14_reg_3_0_0_0 = 1'b0;
              selector_MUX_17_reg_6_0_0_0 = 1'b0;
              wrenable_reg_2 = 1'b0;
              wrenable_reg_3 = 1'b0;
              wrenable_reg_4 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
        end
      S_2 :
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

// Top component for __udivsi3
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __udivsi3(clock,
  reset,
  start_port,
  done_port,
  u,
  v,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] u;
  input [31:0] v;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire OUT_CONDITION___udivsi3_6917_9374;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire selector_MUX_13_reg_2_0_0_0;
  wire selector_MUX_14_reg_3_0_0_0;
  wire selector_MUX_15_reg_4_0_0_0;
  wire selector_MUX_16_reg_5_0_0_0;
  wire selector_MUX_16_reg_5_0_0_1;
  wire selector_MUX_17_reg_6_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  
  controller___udivsi3 Controller_i (.done_port(done_delayed_REG_signal_in),
    .selector_MUX_13_reg_2_0_0_0(selector_MUX_13_reg_2_0_0_0),
    .selector_MUX_14_reg_3_0_0_0(selector_MUX_14_reg_3_0_0_0),
    .selector_MUX_15_reg_4_0_0_0(selector_MUX_15_reg_4_0_0_0),
    .selector_MUX_16_reg_5_0_0_0(selector_MUX_16_reg_5_0_0_0),
    .selector_MUX_16_reg_5_0_0_1(selector_MUX_16_reg_5_0_0_1),
    .selector_MUX_17_reg_6_0_0_0(selector_MUX_17_reg_6_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .OUT_CONDITION___udivsi3_6917_9374(OUT_CONDITION___udivsi3_6917_9374),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___udivsi3 Datapath_i (.return_port(return_port),
    .OUT_CONDITION___udivsi3_6917_9374(OUT_CONDITION___udivsi3_6917_9374),
    .clock(clock),
    .reset(reset),
    .in_port_u(u),
    .in_port_v(v),
    .selector_MUX_13_reg_2_0_0_0(selector_MUX_13_reg_2_0_0_0),
    .selector_MUX_14_reg_3_0_0_0(selector_MUX_14_reg_3_0_0_0),
    .selector_MUX_15_reg_4_0_0_0(selector_MUX_15_reg_4_0_0_0),
    .selector_MUX_16_reg_5_0_0_0(selector_MUX_16_reg_5_0_0_0),
    .selector_MUX_16_reg_5_0_0_1(selector_MUX_16_reg_5_0_0_1),
    .selector_MUX_17_reg_6_0_0_0(selector_MUX_17_reg_6_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

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

// Datapath RTL description for __umodsi3
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___umodsi3(clock,
  reset,
  in_port_u,
  in_port_v,
  return_port,
  selector_MUX_12_reg_2_0_0_0,
  selector_MUX_13_reg_3_0_0_0,
  selector_MUX_14_reg_4_0_0_0,
  selector_MUX_15_reg_5_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  OUT_CONDITION___umodsi3_6918_9538);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_u;
  input [31:0] in_port_v;
  input selector_MUX_12_reg_2_0_0_0;
  input selector_MUX_13_reg_3_0_0_0;
  input selector_MUX_14_reg_4_0_0_0;
  input selector_MUX_15_reg_5_0_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  // OUT
  output [31:0] return_port;
  output OUT_CONDITION___umodsi3_6918_9538;
  // Component and signal declarations
  wire [31:0] out_IUdata_converter_FU_5_i0_fu___umodsi3_6918_9482;
  wire out_MUX_12_reg_2_0_0_0;
  wire [31:0] out_MUX_13_reg_3_0_0_0;
  wire [31:0] out_MUX_14_reg_4_0_0_0;
  wire [31:0] out_MUX_15_reg_5_0_0_0;
  wire signed [32:0] out_UIdata_converter_FU_2_i0_fu___umodsi3_6918_9478;
  wire [31:0] out_UUconvert_expr_FU_15_i0_fu___umodsi3_6918_9634;
  wire out_UUdata_converter_FU_11_i0_fu___umodsi3_6918_9519;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu___umodsi3_6918_9479;
  wire [31:0] out_UUdata_converter_FU_4_i0_fu___umodsi3_6918_9480;
  wire signed [32:0] out_bit_not_expr_FU_64_64_17_i0_fu___umodsi3_6918_9481;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [5:0] out_const_2;
  wire out_const_3;
  wire [5:0] out_const_4;
  wire [4:0] out_const_5;
  wire [30:0] out_const_6;
  wire [31:0] out_const_7;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [31:0] out_conv_out_ui_bit_ior_expr_FU_0_64_64_27_i0_fu___umodsi3_6918_9536_33_32;
  wire out_read_cond_FU_14_i0_fu___umodsi3_6918_9538;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_1_reg_1;
  wire out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [32:0] out_reg_6_reg_6;
  wire out_truth_and_expr_FU_1_0_1_18_i0_fu___umodsi3_6918_14574;
  wire out_truth_and_expr_FU_1_0_1_19_i0_fu___umodsi3_6918_9510;
  wire out_truth_and_expr_FU_1_0_1_19_i1_fu___umodsi3_6918_9531;
  wire out_truth_not_expr_FU_1_1_20_i0_fu___umodsi3_6918_14571;
  wire out_truth_not_expr_FU_1_1_20_i1_fu___umodsi3_6918_9506;
  wire out_truth_or_expr_FU_1_1_1_21_i0_fu___umodsi3_6918_14592;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_22_i0_fu___umodsi3_6918_9528;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_22_i1_fu___umodsi3_6918_9529;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_23_i0_fu___umodsi3_6918_9483;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_23_i1_fu___umodsi3_6918_9628;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_24_i0_fu___umodsi3_6918_9512;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_24_i1_fu___umodsi3_6918_9516;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_25_i0_fu___umodsi3_6918_9517;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___umodsi3_6918_9518;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_25_i2_fu___umodsi3_6918_9535;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_26_i0_fu___umodsi3_6918_9514;
  wire [32:0] out_ui_bit_ior_expr_FU_0_64_64_27_i0_fu___umodsi3_6918_9536;
  wire [0:0] out_ui_bit_ior_expr_FU_1_1_1_28_i0_fu___umodsi3_6918_9527;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_29_i0_fu___umodsi3_6918_9525;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_29_i1_fu___umodsi3_6918_9532;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_29_i2_fu___umodsi3_6918_9533;
  wire [1:0] out_ui_bit_xor_expr_FU_8_8_8_30_i0_fu___umodsi3_6918_9526;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_31_i0_fu___umodsi3_6918_15045;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_31_i1_fu___umodsi3_6918_9508;
  wire out_ui_eq_expr_FU_64_0_64_32_i0_fu___umodsi3_6918_9618;
  wire out_ui_extract_bit_expr_FU_10_i0_fu___umodsi3_6918_14596;
  wire out_ui_extract_bit_expr_FU_12_i0_fu___umodsi3_6918_14600;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___umodsi3_6918_14603;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_33_i0_fu___umodsi3_6918_14582;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_33_i1_fu___umodsi3_6918_14589;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_34_i0_fu___umodsi3_6918_9511;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_34_i1_fu___umodsi3_6918_9515;
  wire [32:0] out_ui_lshift_expr_FU_64_0_64_35_i0_fu___umodsi3_6918_9534;
  wire out_ui_lt_expr_FU_1_1_1_36_i0_fu___umodsi3_6918_14396;
  wire out_ui_ne_expr_FU_32_0_32_37_i0_fu___umodsi3_6918_14394;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_38_i0_fu___umodsi3_6918_9537;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_39_i0_fu___umodsi3_6918_9627;
  wire [30:0] out_ui_rshift_expr_FU_32_0_32_40_i0_fu___umodsi3_6918_14578;
  wire [30:0] out_ui_rshift_expr_FU_32_0_32_40_i1_fu___umodsi3_6918_14585;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_41_i0_fu___umodsi3_6918_9513;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_41_i1_fu___umodsi3_6918_9523;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_41_i2_fu___umodsi3_6918_9524;
  wire [1:0] out_ui_rshift_expr_FU_64_0_64_42_i0_fu___umodsi3_6918_9522;
  wire [32:0] out_ui_ternary_plus_expr_FU_32_32_32_32_43_i0_fu___umodsi3_6918_9521;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [31:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [31:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  
  MUX_GATE #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) MUX_12_reg_2_0_0_0 (.out1(out_MUX_12_reg_2_0_0_0),
    .sel(selector_MUX_12_reg_2_0_0_0),
    .in1(out_const_0),
    .in2(out_ui_bit_xor_expr_FU_1_1_1_29_i2_fu___umodsi3_6918_9533));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_13_reg_3_0_0_0 (.out1(out_MUX_13_reg_3_0_0_0),
    .sel(selector_MUX_13_reg_3_0_0_0),
    .in1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_14_reg_4_0_0_0 (.out1(out_MUX_14_reg_4_0_0_0),
    .sel(selector_MUX_14_reg_4_0_0_0),
    .in1(out_UUdata_converter_FU_3_i0_fu___umodsi3_6918_9479),
    .in2(out_ui_lshift_expr_FU_32_0_32_33_i1_fu___umodsi3_6918_14589));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_15_reg_5_0_0_0 (.out1(out_MUX_15_reg_5_0_0_0),
    .sel(selector_MUX_15_reg_5_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_38_i0_fu___umodsi3_6918_9537),
    .in2(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_ui_bit_ior_expr_FU_0_64_64_27_i0_fu___umodsi3_6918_9536_33_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2),
    .in1(out_conv_out_const_0_1_32));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011111)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1111111111111111111111111111111)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_7 (.out1(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(32)) conv_out_ui_bit_ior_expr_FU_0_64_64_27_i0_fu___umodsi3_6918_9536_33_32 (.out1(out_conv_out_ui_bit_ior_expr_FU_0_64_64_27_i0_fu___umodsi3_6918_9536_33_32),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_27_i0_fu___umodsi3_6918_9536));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu___umodsi3_6918_14394 (.out1(out_ui_ne_expr_FU_32_0_32_37_i0_fu___umodsi3_6918_14394),
    .in1(out_ui_plus_expr_FU_32_0_32_38_i0_fu___umodsi3_6918_9537),
    .in2(out_const_4));
  ui_lt_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_14396 (.out1(out_ui_lt_expr_FU_1_1_1_36_i0_fu___umodsi3_6918_14396),
    .in1(out_ui_eq_expr_FU_64_0_64_32_i0_fu___umodsi3_6918_9618),
    .in2(out_reg_2_reg_2));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_14571 (.out1(out_truth_not_expr_FU_1_1_20_i0_fu___umodsi3_6918_14571),
    .in1(out_reg_2_reg_2));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_14574 (.out1(out_truth_and_expr_FU_1_0_1_18_i0_fu___umodsi3_6918_14574),
    .in1(out_ui_extract_bit_expr_FU_10_i0_fu___umodsi3_6918_14596),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___umodsi3_6918_14578 (.out1(out_ui_rshift_expr_FU_32_0_32_40_i0_fu___umodsi3_6918_14578),
    .in1(out_ui_lshift_expr_FU_32_0_32_34_i0_fu___umodsi3_6918_9511),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___umodsi3_6918_14582 (.out1(out_ui_lshift_expr_FU_32_0_32_33_i0_fu___umodsi3_6918_14582),
    .in1(out_ui_bit_and_expr_FU_32_0_32_24_i0_fu___umodsi3_6918_9512),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___umodsi3_6918_14585 (.out1(out_ui_rshift_expr_FU_32_0_32_40_i1_fu___umodsi3_6918_14585),
    .in1(out_ui_lshift_expr_FU_32_0_32_34_i1_fu___umodsi3_6918_9515),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___umodsi3_6918_14589 (.out1(out_ui_lshift_expr_FU_32_0_32_33_i1_fu___umodsi3_6918_14589),
    .in1(out_ui_bit_and_expr_FU_32_0_32_24_i1_fu___umodsi3_6918_9516),
    .in2(out_const_3));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_14592 (.out1(out_truth_or_expr_FU_1_1_1_21_i0_fu___umodsi3_6918_14592),
    .in1(out_ui_extract_bit_expr_FU_12_i0_fu___umodsi3_6918_14600),
    .in2(out_ui_extract_bit_expr_FU_13_i0_fu___umodsi3_6918_14603));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___umodsi3_6918_14596 (.out1(out_ui_extract_bit_expr_FU_10_i0_fu___umodsi3_6918_14596),
    .in1(out_reg_3_reg_3),
    .in2(out_const_5));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___umodsi3_6918_14600 (.out1(out_ui_extract_bit_expr_FU_12_i0_fu___umodsi3_6918_14600),
    .in1(out_ui_bit_and_expr_FU_1_1_1_22_i0_fu___umodsi3_6918_9528),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___umodsi3_6918_14603 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___umodsi3_6918_14603),
    .in1(out_ui_bit_and_expr_FU_1_1_1_22_i1_fu___umodsi3_6918_9529),
    .in2(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(33),
    .BITSIZE_out1(32)) fu___umodsi3_6918_15045 (.out1(out_ui_cond_expr_FU_32_32_32_32_31_i0_fu___umodsi3_6918_15045),
    .in1(out_ui_lt_expr_FU_1_1_1_36_i0_fu___umodsi3_6918_14396),
    .in2(out_ui_bit_and_expr_FU_32_0_32_23_i1_fu___umodsi3_6918_9628),
    .in3(out_reg_6_reg_6));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(33)) fu___umodsi3_6918_9478 (.out1(out_UIdata_converter_FU_2_i0_fu___umodsi3_6918_9478),
    .in1(in_port_v));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___umodsi3_6918_9479 (.out1(out_UUdata_converter_FU_3_i0_fu___umodsi3_6918_9479),
    .in1(in_port_u));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___umodsi3_6918_9480 (.out1(out_UUdata_converter_FU_4_i0_fu___umodsi3_6918_9480),
    .in1(in_port_v));
  bit_not_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(33)) fu___umodsi3_6918_9481 (.out1(out_bit_not_expr_FU_64_64_17_i0_fu___umodsi3_6918_9481),
    .in1(out_UIdata_converter_FU_2_i0_fu___umodsi3_6918_9478));
  IUdata_converter_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(32)) fu___umodsi3_6918_9482 (.out1(out_IUdata_converter_FU_5_i0_fu___umodsi3_6918_9482),
    .in1(out_bit_not_expr_FU_64_64_17_i0_fu___umodsi3_6918_9481));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___umodsi3_6918_9483 (.out1(out_ui_bit_and_expr_FU_32_0_32_23_i0_fu___umodsi3_6918_9483),
    .in1(out_IUdata_converter_FU_5_i0_fu___umodsi3_6918_9482),
    .in2(out_const_7));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_9506 (.out1(out_truth_not_expr_FU_1_1_20_i1_fu___umodsi3_6918_9506),
    .in1(out_reg_2_reg_2));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu___umodsi3_6918_9508 (.out1(out_ui_cond_expr_FU_32_32_32_32_31_i1_fu___umodsi3_6918_9508),
    .in1(out_reg_2_reg_2),
    .in2(out_reg_0_reg_0),
    .in3(out_reg_1_reg_1));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_9510 (.out1(out_truth_and_expr_FU_1_0_1_19_i0_fu___umodsi3_6918_9510),
    .in1(out_truth_and_expr_FU_1_0_1_18_i0_fu___umodsi3_6918_14574),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___umodsi3_6918_9511 (.out1(out_ui_lshift_expr_FU_32_0_32_34_i0_fu___umodsi3_6918_9511),
    .in1(out_reg_3_reg_3),
    .in2(out_const_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___umodsi3_6918_9512 (.out1(out_ui_bit_and_expr_FU_32_0_32_24_i0_fu___umodsi3_6918_9512),
    .in1(out_ui_rshift_expr_FU_32_0_32_40_i0_fu___umodsi3_6918_14578),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___umodsi3_6918_9513 (.out1(out_ui_rshift_expr_FU_32_0_32_41_i0_fu___umodsi3_6918_9513),
    .in1(out_reg_4_reg_4),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu___umodsi3_6918_9514 (.out1(out_ui_bit_ior_expr_FU_0_32_32_26_i0_fu___umodsi3_6918_9514),
    .in1(out_ui_lshift_expr_FU_32_0_32_33_i0_fu___umodsi3_6918_14582),
    .in2(out_ui_rshift_expr_FU_32_0_32_41_i0_fu___umodsi3_6918_9513));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___umodsi3_6918_9515 (.out1(out_ui_lshift_expr_FU_32_0_32_34_i1_fu___umodsi3_6918_9515),
    .in1(out_reg_4_reg_4),
    .in2(out_const_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___umodsi3_6918_9516 (.out1(out_ui_bit_and_expr_FU_32_0_32_24_i1_fu___umodsi3_6918_9516),
    .in1(out_ui_rshift_expr_FU_32_0_32_40_i1_fu___umodsi3_6918_14585),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___umodsi3_6918_9517 (.out1(out_ui_bit_and_expr_FU_32_0_32_25_i0_fu___umodsi3_6918_9517),
    .in1(out_ui_cond_expr_FU_32_32_32_32_31_i1_fu___umodsi3_6918_9508),
    .in2(out_const_6));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___umodsi3_6918_9518 (.out1(out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___umodsi3_6918_9518),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_26_i0_fu___umodsi3_6918_9514),
    .in2(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_9519 (.out1(out_UUdata_converter_FU_11_i0_fu___umodsi3_6918_9519),
    .in1(out_truth_not_expr_FU_1_1_20_i1_fu___umodsi3_6918_9506));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(31),
    .BITSIZE_in3(31),
    .BITSIZE_out1(33)) fu___umodsi3_6918_9521 (.out1(out_ui_ternary_plus_expr_FU_32_32_32_32_43_i0_fu___umodsi3_6918_9521),
    .in1(out_UUdata_converter_FU_11_i0_fu___umodsi3_6918_9519),
    .in2(out_ui_bit_and_expr_FU_32_0_32_25_i0_fu___umodsi3_6918_9517),
    .in3(out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___umodsi3_6918_9518));
  ui_rshift_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___umodsi3_6918_9522 (.out1(out_ui_rshift_expr_FU_64_0_64_42_i0_fu___umodsi3_6918_9522),
    .in1(out_ui_ternary_plus_expr_FU_32_32_32_32_43_i0_fu___umodsi3_6918_9521),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___umodsi3_6918_9523 (.out1(out_ui_rshift_expr_FU_32_0_32_41_i1_fu___umodsi3_6918_9523),
    .in1(out_ui_cond_expr_FU_32_32_32_32_31_i1_fu___umodsi3_6918_9508),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___umodsi3_6918_9524 (.out1(out_ui_rshift_expr_FU_32_0_32_41_i2_fu___umodsi3_6918_9524),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_26_i0_fu___umodsi3_6918_9514),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_9525 (.out1(out_ui_bit_xor_expr_FU_1_1_1_29_i0_fu___umodsi3_6918_9525),
    .in1(out_ui_rshift_expr_FU_32_0_32_41_i2_fu___umodsi3_6918_9524),
    .in2(out_ui_rshift_expr_FU_32_0_32_41_i1_fu___umodsi3_6918_9523));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___umodsi3_6918_9526 (.out1(out_ui_bit_xor_expr_FU_8_8_8_30_i0_fu___umodsi3_6918_9526),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_29_i0_fu___umodsi3_6918_9525),
    .in2(out_ui_rshift_expr_FU_64_0_64_42_i0_fu___umodsi3_6918_9522));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_9527 (.out1(out_ui_bit_ior_expr_FU_1_1_1_28_i0_fu___umodsi3_6918_9527),
    .in1(out_ui_rshift_expr_FU_64_0_64_42_i0_fu___umodsi3_6918_9522),
    .in2(out_ui_rshift_expr_FU_32_0_32_41_i2_fu___umodsi3_6918_9524));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_9528 (.out1(out_ui_bit_and_expr_FU_1_1_1_22_i0_fu___umodsi3_6918_9528),
    .in1(out_ui_bit_ior_expr_FU_1_1_1_28_i0_fu___umodsi3_6918_9527),
    .in2(out_ui_rshift_expr_FU_32_0_32_41_i1_fu___umodsi3_6918_9523));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_9529 (.out1(out_ui_bit_and_expr_FU_1_1_1_22_i1_fu___umodsi3_6918_9529),
    .in1(out_ui_rshift_expr_FU_64_0_64_42_i0_fu___umodsi3_6918_9522),
    .in2(out_ui_rshift_expr_FU_32_0_32_41_i2_fu___umodsi3_6918_9524));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_9531 (.out1(out_truth_and_expr_FU_1_0_1_19_i1_fu___umodsi3_6918_9531),
    .in1(out_truth_or_expr_FU_1_1_1_21_i0_fu___umodsi3_6918_14592),
    .in2(out_const_3));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_9532 (.out1(out_ui_bit_xor_expr_FU_1_1_1_29_i1_fu___umodsi3_6918_9532),
    .in1(out_truth_and_expr_FU_1_0_1_19_i0_fu___umodsi3_6918_9510),
    .in2(out_truth_not_expr_FU_1_1_20_i0_fu___umodsi3_6918_14571));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_9533 (.out1(out_ui_bit_xor_expr_FU_1_1_1_29_i2_fu___umodsi3_6918_9533),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_29_i1_fu___umodsi3_6918_9532),
    .in2(out_truth_and_expr_FU_1_0_1_19_i1_fu___umodsi3_6918_9531));
  ui_lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(33),
    .PRECISION(64)) fu___umodsi3_6918_9534 (.out1(out_ui_lshift_expr_FU_64_0_64_35_i0_fu___umodsi3_6918_9534),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_30_i0_fu___umodsi3_6918_9526),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) fu___umodsi3_6918_9535 (.out1(out_ui_bit_and_expr_FU_32_0_32_25_i2_fu___umodsi3_6918_9535),
    .in1(out_ui_ternary_plus_expr_FU_32_32_32_32_43_i0_fu___umodsi3_6918_9521),
    .in2(out_const_6));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(31),
    .BITSIZE_out1(33)) fu___umodsi3_6918_9536 (.out1(out_ui_bit_ior_expr_FU_0_64_64_27_i0_fu___umodsi3_6918_9536),
    .in1(out_ui_lshift_expr_FU_64_0_64_35_i0_fu___umodsi3_6918_9534),
    .in2(out_ui_bit_and_expr_FU_32_0_32_25_i2_fu___umodsi3_6918_9535));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu___umodsi3_6918_9537 (.out1(out_ui_plus_expr_FU_32_0_32_38_i0_fu___umodsi3_6918_9537),
    .in1(out_reg_5_reg_5),
    .in2(out_const_3));
  read_cond_FU #(.BITSIZE_in1(1)) fu___umodsi3_6918_9538 (.out1(out_read_cond_FU_14_i0_fu___umodsi3_6918_9538),
    .in1(out_ui_ne_expr_FU_32_0_32_37_i0_fu___umodsi3_6918_14394));
  ui_eq_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___umodsi3_6918_9618 (.out1(out_ui_eq_expr_FU_64_0_64_32_i0_fu___umodsi3_6918_9618),
    .in1(out_reg_6_reg_6),
    .in2(out_const_0));
  ui_plus_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___umodsi3_6918_9627 (.out1(out_ui_plus_expr_FU_32_32_32_39_i0_fu___umodsi3_6918_9627),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_0_reg_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___umodsi3_6918_9628 (.out1(out_ui_bit_and_expr_FU_32_0_32_23_i1_fu___umodsi3_6918_9628),
    .in1(out_ui_plus_expr_FU_32_32_32_39_i0_fu___umodsi3_6918_9627),
    .in2(out_const_7));
  UUconvert_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu___umodsi3_6918_9634 (.out1(out_UUconvert_expr_FU_15_i0_fu___umodsi3_6918_9634),
    .in1(out_ui_cond_expr_FU_32_32_32_32_31_i0_fu___umodsi3_6918_15045));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_4_i0_fu___umodsi3_6918_9480),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_23_i0_fu___umodsi3_6918_9483),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_12_reg_2_0_0_0),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_13_reg_3_0_0_0),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_14_reg_4_0_0_0),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_15_reg_5_0_0_0),
    .wenable(wrenable_reg_5));
  register_STD #(.BITSIZE_in1(33),
    .BITSIZE_out1(33)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_27_i0_fu___umodsi3_6918_9536),
    .wenable(wrenable_reg_6));
  // io-signal post fix
  assign return_port = out_UUconvert_expr_FU_15_i0_fu___umodsi3_6918_9634;
  assign OUT_CONDITION___umodsi3_6918_9538 = out_read_cond_FU_14_i0_fu___umodsi3_6918_9538;

endmodule

// FSM based controller description for __umodsi3
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___umodsi3(done_port,
  selector_MUX_12_reg_2_0_0_0,
  selector_MUX_13_reg_3_0_0_0,
  selector_MUX_14_reg_4_0_0_0,
  selector_MUX_15_reg_5_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  OUT_CONDITION___umodsi3_6918_9538,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION___umodsi3_6918_9538;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output selector_MUX_12_reg_2_0_0_0;
  output selector_MUX_13_reg_3_0_0_0;
  output selector_MUX_14_reg_4_0_0_0;
  output selector_MUX_15_reg_5_0_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  parameter [1:0] S_0 = 2'd0,
    S_1 = 2'd1,
    S_2 = 2'd2;
  reg [1:0] _present_state=S_0, _next_state;
  reg done_port;
  reg selector_MUX_12_reg_2_0_0_0;
  reg selector_MUX_13_reg_3_0_0_0;
  reg selector_MUX_14_reg_4_0_0_0;
  reg selector_MUX_15_reg_5_0_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_2;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    selector_MUX_12_reg_2_0_0_0 = 1'b0;
    selector_MUX_13_reg_3_0_0_0 = 1'b0;
    selector_MUX_14_reg_4_0_0_0 = 1'b0;
    selector_MUX_15_reg_5_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_MUX_12_reg_2_0_0_0 = 1'b1;
          selector_MUX_14_reg_4_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          selector_MUX_13_reg_3_0_0_0 = 1'b1;
          selector_MUX_15_reg_5_0_0_0 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION___umodsi3_6918_9538 == 1'b1)
            begin
              _next_state = S_1;
              wrenable_reg_6 = 1'b0;
            end
          else
            begin
              _next_state = S_2;
              done_port = 1'b1;
              selector_MUX_13_reg_3_0_0_0 = 1'b0;
              selector_MUX_15_reg_5_0_0_0 = 1'b0;
              wrenable_reg_3 = 1'b0;
              wrenable_reg_4 = 1'b0;
              wrenable_reg_5 = 1'b0;
            end
        end
      S_2 :
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

// Top component for __umodsi3
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __umodsi3(clock,
  reset,
  start_port,
  done_port,
  u,
  v,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] u;
  input [31:0] v;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire OUT_CONDITION___umodsi3_6918_9538;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire selector_MUX_12_reg_2_0_0_0;
  wire selector_MUX_13_reg_3_0_0_0;
  wire selector_MUX_14_reg_4_0_0_0;
  wire selector_MUX_15_reg_5_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  
  controller___umodsi3 Controller_i (.done_port(done_delayed_REG_signal_in),
    .selector_MUX_12_reg_2_0_0_0(selector_MUX_12_reg_2_0_0_0),
    .selector_MUX_13_reg_3_0_0_0(selector_MUX_13_reg_3_0_0_0),
    .selector_MUX_14_reg_4_0_0_0(selector_MUX_14_reg_4_0_0_0),
    .selector_MUX_15_reg_5_0_0_0(selector_MUX_15_reg_5_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .OUT_CONDITION___umodsi3_6918_9538(OUT_CONDITION___umodsi3_6918_9538),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___umodsi3 Datapath_i (.return_port(return_port),
    .OUT_CONDITION___umodsi3_6918_9538(OUT_CONDITION___umodsi3_6918_9538),
    .clock(clock),
    .reset(reset),
    .in_port_u(u),
    .in_port_v(v),
    .selector_MUX_12_reg_2_0_0_0(selector_MUX_12_reg_2_0_0_0),
    .selector_MUX_13_reg_3_0_0_0(selector_MUX_13_reg_3_0_0_0),
    .selector_MUX_14_reg_4_0_0_0(selector_MUX_14_reg_4_0_0_0),
    .selector_MUX_15_reg_5_0_0_0(selector_MUX_15_reg_5_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2012-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module SIMPLEJOIN_FU(clock,
  reset,
  enable,
  ops,
  sop);
  parameter BITSIZE_ops=1, PORTSIZE_ops=2;
  // IN
  input clock;
  input reset;
  input enable;
  input [PORTSIZE_ops-1:0] ops;
  // OUT
  output sop;
  
  // synthesis attribute use_sync_reset of current is no;
  reg [PORTSIZE_ops-1:0] current =0;
  reg started =0;
  wire started0;
  wire [PORTSIZE_ops-1:0] or_temp;
  wire sop_temp;
  function reduce_INs;
  input [PORTSIZE_ops-1 : 0] instring;
  integer i;
  begin
     reduce_INs = 1'b1;
     for(i = 0; i < PORTSIZE_ops; i = i + 1)
     begin
        reduce_INs = reduce_INs & instring[i];
     end
  end
  endfunction
  function [PORTSIZE_ops-1:0] NEXT_CURR ;
  input sop_temp1;
  input [PORTSIZE_ops-1 : 0] ops1;
  input [PORTSIZE_ops-1 : 0] current1;
  input st;
  integer i;
  begin
     for(i = 0; i < PORTSIZE_ops; i = i + 1)
     begin
        NEXT_CURR[i] = ~sop_temp1 & ((current1[i]) | (st & ops1[i]));
     end
  end
  endfunction
  always @(posedge clock )
    if (reset == 1'b0)
      started <= 0;
    else
      started <= started0;
  assign started0 = ~sop_temp & (started | enable);
  assign or_temp = current | ops;
  assign sop_temp = reduce_INs(or_temp);
  assign sop = sop_temp;
  always @ (posedge clock )
  begin
  if(reset == 1'b0)
    begin
      current <= {PORTSIZE_ops{1'b0}};
    end
  else
    begin
      current <= NEXT_CURR(sop_temp,ops,current,started0);
    end
  end

endmodule

// Datapath RTL description for _Z11convolutionPKdPdS0_iiii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath__Z11convolutionPKdPdS0_iiii(clock,
  reset,
  in_port_A,
  in_port_B,
  in_port_kernel,
  in_port_n,
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
  fuselector_BMEMORY_CTRLN_31_i0_LOAD,
  fuselector_BMEMORY_CTRLN_31_i0_STORE,
  selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606,
  selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622,
  selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669,
  selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696,
  selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1,
  selector_MUX_24___udivsi3_51_i0_0_0_0,
  selector_MUX_25___udivsi3_51_i0_1_0_0,
  selector_MUX_26___umodsi3_52_i0_0_0_0,
  selector_MUX_27___umodsi3_52_i0_1_0_0,
  selector_MUX_80_reg_1_0_0_0,
  selector_MUX_85_reg_14_0_0_0,
  selector_MUX_86_reg_15_0_0_0,
  selector_MUX_94_reg_22_0_0_0,
  selector_MUX_96_reg_24_0_0_0,
  muenable_mu_S_1,
  muenable_mu_S_4,
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
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10549,
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10732,
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10737,
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10739,
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10745,
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10758,
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10760,
  OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606,
  OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622,
  OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669,
  OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696,
  OUT_mu_S_1_MULTI_UNBOUNDED_0,
  OUT_mu_S_4_MULTI_UNBOUNDED_0);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_B;
  input [31:0] in_port_kernel;
  input signed [31:0] in_port_n;
  input signed [31:0] in_port_kernel_size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_31_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_31_i0_STORE;
  input selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606;
  input selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622;
  input selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669;
  input selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696;
  input selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1;
  input selector_MUX_24___udivsi3_51_i0_0_0_0;
  input selector_MUX_25___udivsi3_51_i0_1_0_0;
  input selector_MUX_26___umodsi3_52_i0_0_0_0;
  input selector_MUX_27___umodsi3_52_i0_1_0_0;
  input selector_MUX_80_reg_1_0_0_0;
  input selector_MUX_85_reg_14_0_0_0;
  input selector_MUX_86_reg_15_0_0_0;
  input selector_MUX_94_reg_22_0_0_0;
  input selector_MUX_96_reg_24_0_0_0;
  input muenable_mu_S_1;
  input muenable_mu_S_4;
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
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10549;
  output OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10732;
  output OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10737;
  output OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10739;
  output OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10745;
  output OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10758;
  output OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10760;
  output OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606;
  output OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622;
  output OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669;
  output OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696;
  output OUT_mu_S_1_MULTI_UNBOUNDED_0;
  output OUT_mu_S_4_MULTI_UNBOUNDED_0;
  // Component and signal declarations
  wire [63:0] null_out_signal_BMEMORY_CTRLN_31_i0_out1_1;
  wire [63:0] out_BMEMORY_CTRLN_31_i0_BMEMORY_CTRLN_31_i0;
  wire [28:0] out_IUdata_converter_FU_25_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10714;
  wire [28:0] out_IUdata_converter_FU_26_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10650;
  wire [28:0] out_IUdata_converter_FU_29_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10592;
  wire [31:0] out_IUdata_converter_FU_3_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10616;
  wire [31:0] out_IUdata_converter_FU_4_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10729;
  wire [31:0] out_IUdata_converter_FU_5_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10678;
  wire [31:0] out_IUdata_converter_FU_6_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10680;
  wire [31:0] out_IUdata_converter_FU_7_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10734;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1;
  wire [31:0] out_MUX_24___udivsi3_51_i0_0_0_0;
  wire [31:0] out_MUX_25___udivsi3_51_i0_1_0_0;
  wire [31:0] out_MUX_26___umodsi3_52_i0_0_0_0;
  wire [31:0] out_MUX_27___umodsi3_52_i0_1_0_0;
  wire [31:0] out_MUX_80_reg_1_0_0_0;
  wire [63:0] out_MUX_85_reg_14_0_0_0;
  wire [31:0] out_MUX_86_reg_15_0_0_0;
  wire [63:0] out_MUX_94_reg_22_0_0_0;
  wire [63:0] out_MUX_96_reg_24_0_0_0;
  wire signed [31:0] out_UIdata_converter_FU_12_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10603;
  wire signed [31:0] out_UIdata_converter_FU_13_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10619;
  wire signed [31:0] out_UIdata_converter_FU_19_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10689;
  wire signed [31:0] out_UIdata_converter_FU_20_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10661;
  wire signed [1:0] out_UIdata_converter_FU_2_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14607;
  wire [31:0] out___udivsi3_51_i0___udivsi3_51_i0;
  wire [31:0] out___umodsi3_52_i0___umodsi3_52_i0;
  wire out_const_0;
  wire [63:0] out_const_1;
  wire [1:0] out_const_2;
  wire [7:0] out_const_3;
  wire [5:0] out_const_4;
  wire out_const_5;
  wire [1:0] out_const_6;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [6:0] out_conv_out_const_3_8_7;
  wire [63:0] out_fp_mult_expr_FU_64_64_64_500_32_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10634;
  wire [63:0] out_fp_plus_expr_FU_64_64_64_500_33_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10629;
  wire out_ge_expr_FU_32_0_32_34_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14044;
  wire out_ge_expr_FU_32_0_32_34_i1_fu__Z11convolutionPKdPdS0_iiii_9849_14046;
  wire out_le_expr_FU_32_32_32_35_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10742;
  wire out_le_expr_FU_32_32_32_35_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10743;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_36_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14611;
  wire out_lt_expr_FU_32_0_32_37_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14034;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_38_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10547;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_38_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10548;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_38_i2_fu__Z11convolutionPKdPdS0_iiii_9849_10599;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_38_i3_fu__Z11convolutionPKdPdS0_iiii_9849_10682;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_38_i4_fu__Z11convolutionPKdPdS0_iiii_9849_10721;
  wire out_ne_expr_FU_32_0_32_39_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14271;
  wire out_ne_expr_FU_32_0_32_39_i1_fu__Z11convolutionPKdPdS0_iiii_9849_14273;
  wire signed [31:0] out_plus_expr_FU_32_0_32_40_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10741;
  wire signed [31:0] out_plus_expr_FU_32_32_32_41_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10595;
  wire signed [31:0] out_plus_expr_FU_32_32_32_41_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10685;
  wire signed [31:0] out_plus_expr_FU_32_32_32_41_i2_fu__Z11convolutionPKdPdS0_iiii_9849_10717;
  wire signed [31:0] out_plus_expr_FU_32_32_32_41_i3_fu__Z11convolutionPKdPdS0_iiii_9849_10724;
  wire signed [31:0] out_plus_expr_FU_32_32_32_41_i4_fu__Z11convolutionPKdPdS0_iiii_9849_10726;
  wire signed [31:0] out_plus_expr_FU_32_32_32_41_i5_fu__Z11convolutionPKdPdS0_iiii_9849_14041;
  wire out_read_cond_FU_14_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10732;
  wire out_read_cond_FU_21_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10737;
  wire out_read_cond_FU_23_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10739;
  wire out_read_cond_FU_24_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10745;
  wire out_read_cond_FU_27_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10758;
  wire out_read_cond_FU_30_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10760;
  wire out_read_cond_FU_8_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10549;
  wire [30:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [63:0] out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire [31:0] out_reg_16_reg_16;
  wire [31:0] out_reg_17_reg_17;
  wire [31:0] out_reg_18_reg_18;
  wire [31:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire out_reg_21_reg_21;
  wire [63:0] out_reg_22_reg_22;
  wire out_reg_23_reg_23;
  wire [63:0] out_reg_24_reg_24;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire out_reg_8_reg_8;
  wire [31:0] out_reg_9_reg_9;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_42_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10546;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_43_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14614;
  wire signed [31:0] out_ternary_plus_expr_FU_32_32_32_32_44_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10653;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_45_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10744;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_46_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10586;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_46_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10647;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_46_i2_fu__Z11convolutionPKdPdS0_iiii_9849_10711;
  wire [31:0] out_ui_minus_expr_FU_32_32_32_47_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10665;
  wire [31:0] out_ui_minus_expr_FU_32_32_32_47_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10693;
  wire out_ui_ne_expr_FU_32_32_32_48_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14277;
  wire out_ui_ne_expr_FU_32_32_32_48_i1_fu__Z11convolutionPKdPdS0_iiii_9849_14279;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_49_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10613;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_49_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10676;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_50_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10580;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_50_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10642;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_50_i2_fu__Z11convolutionPKdPdS0_iiii_9849_10706;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [63:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire s___udivsi3_51_i00;
  wire s___umodsi3_52_i01;
  wire s_done___udivsi3_51_i0;
  wire s_done___umodsi3_52_i0;
  
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_31_i0 (.out1({null_out_signal_BMEMORY_CTRLN_31_i0_out1_1,
      out_BMEMORY_CTRLN_31_i0_BMEMORY_CTRLN_31_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1}),
    .in3({7'b0000000,
      out_conv_out_const_3_8_7}),
    .in4({1'b0,
      out_const_5}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_31_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_31_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_31_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_50_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10580),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_50_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10642));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_31_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_50_i2_fu__Z11convolutionPKdPdS0_iiii_9849_10706),
    .in2(out_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_24___udivsi3_51_i0_0_0_0 (.out1(out_MUX_24___udivsi3_51_i0_0_0_0),
    .sel(selector_MUX_24___udivsi3_51_i0_0_0_0),
    .in1(out_reg_15_reg_15),
    .in2(out_reg_1_reg_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_25___udivsi3_51_i0_1_0_0 (.out1(out_MUX_25___udivsi3_51_i0_1_0_0),
    .sel(selector_MUX_25___udivsi3_51_i0_1_0_0),
    .in1(out_reg_4_reg_4),
    .in2(out_reg_2_reg_2));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_26___umodsi3_52_i0_0_0_0 (.out1(out_MUX_26___umodsi3_52_i0_0_0_0),
    .sel(selector_MUX_26___umodsi3_52_i0_0_0_0),
    .in1(out_reg_15_reg_15),
    .in2(out_reg_1_reg_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_27___umodsi3_52_i0_1_0_0 (.out1(out_MUX_27___umodsi3_52_i0_1_0_0),
    .sel(selector_MUX_27___umodsi3_52_i0_1_0_0),
    .in1(out_reg_4_reg_4),
    .in2(out_reg_2_reg_2));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_80_reg_1_0_0_0 (.out1(out_MUX_80_reg_1_0_0_0),
    .sel(selector_MUX_80_reg_1_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_85_reg_14_0_0_0 (.out1(out_MUX_85_reg_14_0_0_0),
    .sel(selector_MUX_85_reg_14_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_plus_expr_FU_64_64_64_500_33_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10629));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_86_reg_15_0_0_0 (.out1(out_MUX_86_reg_15_0_0_0),
    .sel(selector_MUX_86_reg_15_0_0_0),
    .in1(out_reg_16_reg_16),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_94_reg_22_0_0_0 (.out1(out_MUX_94_reg_22_0_0_0),
    .sel(selector_MUX_94_reg_22_0_0_0),
    .in1(out_BMEMORY_CTRLN_31_i0_BMEMORY_CTRLN_31_i0),
    .in2(out_const_1));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_96_reg_24_0_0_0 (.out1(out_MUX_96_reg_24_0_0_0),
    .sel(selector_MUX_96_reg_24_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_plus_expr_FU_64_64_64_500_33_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10629));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_reg_24_reg_24));
  __udivsi3 __udivsi3_51_i0 (.done_port(s_done___udivsi3_51_i0),
    .return_port(out___udivsi3_51_i0___udivsi3_51_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___udivsi3_51_i00),
    .u(out_MUX_24___udivsi3_51_i0_0_0_0),
    .v(out_MUX_25___udivsi3_51_i0_1_0_0));
  __umodsi3 __umodsi3_52_i0 (.done_port(s_done___umodsi3_52_i0),
    .return_port(out___umodsi3_52_i0___umodsi3_52_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___umodsi3_52_i01),
    .u(out_MUX_26___umodsi3_52_i0_0_0_0),
    .v(out_MUX_27___umodsi3_52_i0_1_0_0));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0000000000000000000000000000000000000000000000000000000000000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b01000000)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011110)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_6 (.out1(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(7)) conv_out_const_3_8_7 (.out1(out_conv_out_const_3_8_7),
    .in1(out_const_3));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10546 (.out1(out_rshift_expr_FU_32_0_32_42_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10546),
    .in1(out_plus_expr_FU_32_32_32_41_i5_fu__Z11convolutionPKdPdS0_iiii_9849_14041),
    .in2(out_const_2));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z11convolutionPKdPdS0_iiii_9849_10547 (.out1(out_mult_expr_FU_32_32_32_0_38_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10547),
    .clock(clock),
    .in1(in_port_kernel_size),
    .in2(in_port_kernel_size));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z11convolutionPKdPdS0_iiii_9849_10548 (.out1(out_mult_expr_FU_32_32_32_0_38_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10548),
    .clock(clock),
    .in1(in_port_n),
    .in2(in_port_n));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_10549 (.out1(out_read_cond_FU_8_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10549),
    .in1(out_ne_expr_FU_32_0_32_39_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14271));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z11convolutionPKdPdS0_iiii_9849_10580 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_50_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10580),
    .in1(in_port_B),
    .in2(out_ui_lshift_expr_FU_32_0_32_46_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10586));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10586 (.out1(out_ui_lshift_expr_FU_32_0_32_46_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10586),
    .in1(out_IUdata_converter_FU_29_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10592),
    .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) fu__Z11convolutionPKdPdS0_iiii_9849_10592 (.out1(out_IUdata_converter_FU_29_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10592),
    .in1(out_plus_expr_FU_32_32_32_41_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10595));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10595 (.out1(out_plus_expr_FU_32_32_32_41_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10595),
    .in1(out_mult_expr_FU_32_32_32_0_38_i2_fu__Z11convolutionPKdPdS0_iiii_9849_10599),
    .in2(out_reg_12_reg_12));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z11convolutionPKdPdS0_iiii_9849_10599 (.out1(out_mult_expr_FU_32_32_32_0_38_i2_fu__Z11convolutionPKdPdS0_iiii_9849_10599),
    .clock(clock),
    .in1(out_reg_13_reg_13),
    .in2(in_port_n));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10603 (.out1(out_UIdata_converter_FU_12_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10603),
    .in1(out_reg_9_reg_9));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10613 (.out1(out_ui_plus_expr_FU_32_0_32_49_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10613),
    .in1(out_reg_1_reg_1),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10616 (.out1(out_IUdata_converter_FU_3_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10616),
    .in1(in_port_n));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10619 (.out1(out_UIdata_converter_FU_13_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10619),
    .in1(out_reg_11_reg_11));
  fp_plus_expr_FU_64_64_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fu__Z11convolutionPKdPdS0_iiii_9849_10629 (.R(out_fp_plus_expr_FU_64_64_64_500_33_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10629),
    .clock(clock),
    .reset(reset),
    .X(out_fp_mult_expr_FU_64_64_64_500_32_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10634),
    .Y(out_reg_14_reg_14));
  fp_mult_expr_FU_64_64_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fu__Z11convolutionPKdPdS0_iiii_9849_10634 (.R(out_fp_mult_expr_FU_64_64_64_500_32_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10634),
    .clock(clock),
    .reset(reset),
    .X(out_BMEMORY_CTRLN_31_i0_BMEMORY_CTRLN_31_i0),
    .Y(out_reg_22_reg_22));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z11convolutionPKdPdS0_iiii_9849_10642 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_50_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10642),
    .in1(in_port_kernel),
    .in2(out_ui_lshift_expr_FU_32_0_32_46_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10647));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10647 (.out1(out_ui_lshift_expr_FU_32_0_32_46_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10647),
    .in1(out_IUdata_converter_FU_26_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10650),
    .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) fu__Z11convolutionPKdPdS0_iiii_9849_10650 (.out1(out_IUdata_converter_FU_26_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10650),
    .in1(out_ternary_plus_expr_FU_32_32_32_32_44_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10653));
  ternary_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10653 (.out1(out_ternary_plus_expr_FU_32_32_32_32_44_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10653),
    .in1(out_reg_17_reg_17),
    .in2(out_reg_0_reg_0),
    .in3(out_mult_expr_FU_32_32_32_0_38_i3_fu__Z11convolutionPKdPdS0_iiii_9849_10682));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10661 (.out1(out_UIdata_converter_FU_20_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10661),
    .in1(out_ui_minus_expr_FU_32_32_32_47_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10665));
  ui_minus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10665 (.out1(out_ui_minus_expr_FU_32_32_32_47_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10665),
    .in1(out_reg_11_reg_11),
    .in2(out_reg_3_reg_3));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10676 (.out1(out_ui_plus_expr_FU_32_0_32_49_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10676),
    .in1(out_reg_15_reg_15),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10678 (.out1(out_IUdata_converter_FU_5_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10678),
    .in1(in_port_kernel_size));
  IUdata_converter_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10680 (.out1(out_IUdata_converter_FU_6_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10680),
    .in1(out_rshift_expr_FU_32_0_32_42_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10546));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z11convolutionPKdPdS0_iiii_9849_10682 (.out1(out_mult_expr_FU_32_32_32_0_38_i3_fu__Z11convolutionPKdPdS0_iiii_9849_10682),
    .clock(clock),
    .in1(out_plus_expr_FU_32_32_32_41_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10685),
    .in2(in_port_kernel_size));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(31),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10685 (.out1(out_plus_expr_FU_32_32_32_41_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10685),
    .in1(out_reg_18_reg_18),
    .in2(out_reg_0_reg_0));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10689 (.out1(out_UIdata_converter_FU_19_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10689),
    .in1(out_ui_minus_expr_FU_32_32_32_47_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10693));
  ui_minus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10693 (.out1(out_ui_minus_expr_FU_32_32_32_47_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10693),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_3_reg_3));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z11convolutionPKdPdS0_iiii_9849_10706 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_50_i2_fu__Z11convolutionPKdPdS0_iiii_9849_10706),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_46_i2_fu__Z11convolutionPKdPdS0_iiii_9849_10711));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10711 (.out1(out_ui_lshift_expr_FU_32_0_32_46_i2_fu__Z11convolutionPKdPdS0_iiii_9849_10711),
    .in1(out_IUdata_converter_FU_25_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10714),
    .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) fu__Z11convolutionPKdPdS0_iiii_9849_10714 (.out1(out_IUdata_converter_FU_25_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10714),
    .in1(out_plus_expr_FU_32_32_32_41_i2_fu__Z11convolutionPKdPdS0_iiii_9849_10717));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10717 (.out1(out_plus_expr_FU_32_32_32_41_i2_fu__Z11convolutionPKdPdS0_iiii_9849_10717),
    .in1(out_mult_expr_FU_32_32_32_0_38_i4_fu__Z11convolutionPKdPdS0_iiii_9849_10721),
    .in2(out_reg_20_reg_20));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu__Z11convolutionPKdPdS0_iiii_9849_10721 (.out1(out_mult_expr_FU_32_32_32_0_38_i4_fu__Z11convolutionPKdPdS0_iiii_9849_10721),
    .clock(clock),
    .in1(out_reg_19_reg_19),
    .in2(in_port_n));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10724 (.out1(out_plus_expr_FU_32_32_32_41_i3_fu__Z11convolutionPKdPdS0_iiii_9849_10724),
    .in1(out_UIdata_converter_FU_19_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10689),
    .in2(out_reg_13_reg_13));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10726 (.out1(out_plus_expr_FU_32_32_32_41_i4_fu__Z11convolutionPKdPdS0_iiii_9849_10726),
    .in1(out_reg_17_reg_17),
    .in2(out_reg_12_reg_12));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10729 (.out1(out_IUdata_converter_FU_4_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10729),
    .in1(out_mult_expr_FU_32_32_32_0_38_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10548));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_10732 (.out1(out_read_cond_FU_14_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10732),
    .in1(out_reg_8_reg_8));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10734 (.out1(out_IUdata_converter_FU_7_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10734),
    .in1(out_mult_expr_FU_32_32_32_0_38_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10547));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_10737 (.out1(out_read_cond_FU_21_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10737),
    .in1(out_ge_expr_FU_32_0_32_34_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14044));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_10739 (.out1(out_read_cond_FU_23_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10739),
    .in1(out_ge_expr_FU_32_0_32_34_i1_fu__Z11convolutionPKdPdS0_iiii_9849_14046));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_10741 (.out1(out_plus_expr_FU_32_0_32_40_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10741),
    .in1(in_port_n),
    .in2(out_const_5));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_10742 (.out1(out_le_expr_FU_32_32_32_35_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10742),
    .in1(out_reg_20_reg_20),
    .in2(out_reg_7_reg_7));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_10743 (.out1(out_le_expr_FU_32_32_32_35_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10743),
    .in1(out_reg_19_reg_19),
    .in2(out_reg_7_reg_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_10744 (.out1(out_ui_bit_and_expr_FU_1_1_1_45_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10744),
    .in1(out_le_expr_FU_32_32_32_35_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10742),
    .in2(out_reg_21_reg_21));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_10745 (.out1(out_read_cond_FU_24_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10745),
    .in1(out_ui_bit_and_expr_FU_1_1_1_45_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10744));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_10758 (.out1(out_read_cond_FU_27_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10758),
    .in1(out_reg_23_reg_23));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_10760 (.out1(out_read_cond_FU_30_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10760),
    .in1(out_ui_ne_expr_FU_32_32_32_48_i1_fu__Z11convolutionPKdPdS0_iiii_9849_14279));
  lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_14034 (.out1(out_lt_expr_FU_32_0_32_37_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14034),
    .in1(in_port_kernel_size),
    .in2(out_const_0));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z11convolutionPKdPdS0_iiii_9849_14041 (.out1(out_plus_expr_FU_32_32_32_41_i5_fu__Z11convolutionPKdPdS0_iiii_9849_14041),
    .in1(in_port_kernel_size),
    .in2(out_rshift_expr_FU_32_0_32_43_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14614));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_14044 (.out1(out_ge_expr_FU_32_0_32_34_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14044),
    .in1(out_plus_expr_FU_32_32_32_41_i3_fu__Z11convolutionPKdPdS0_iiii_9849_10724),
    .in2(out_const_0));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_14046 (.out1(out_ge_expr_FU_32_0_32_34_i1_fu__Z11convolutionPKdPdS0_iiii_9849_14046),
    .in1(out_plus_expr_FU_32_32_32_41_i4_fu__Z11convolutionPKdPdS0_iiii_9849_10726),
    .in2(out_const_0));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_14271 (.out1(out_ne_expr_FU_32_0_32_39_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14271),
    .in1(out_mult_expr_FU_32_32_32_0_38_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10548),
    .in2(out_const_0));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_14273 (.out1(out_ne_expr_FU_32_0_32_39_i1_fu__Z11convolutionPKdPdS0_iiii_9849_14273),
    .in1(out_mult_expr_FU_32_32_32_0_38_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10547),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_14277 (.out1(out_ui_ne_expr_FU_32_32_32_48_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14277),
    .in1(out_reg_16_reg_16),
    .in2(out_reg_6_reg_6));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z11convolutionPKdPdS0_iiii_9849_14279 (.out1(out_ui_ne_expr_FU_32_32_32_48_i1_fu__Z11convolutionPKdPdS0_iiii_9849_14279),
    .in1(out_reg_10_reg_10),
    .in2(out_reg_5_reg_5));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu__Z11convolutionPKdPdS0_iiii_9849_14607 (.out1(out_UIdata_converter_FU_2_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14607),
    .in1(out_lt_expr_FU_32_0_32_37_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14034));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z11convolutionPKdPdS0_iiii_9849_14611 (.out1(out_lshift_expr_FU_32_0_32_36_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14611),
    .in1(out_UIdata_converter_FU_2_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14607),
    .in2(out_const_4));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu__Z11convolutionPKdPdS0_iiii_9849_14614 (.out1(out_rshift_expr_FU_32_0_32_43_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14614),
    .in1(out_lshift_expr_FU_32_0_32_36_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14611),
    .in2(out_const_4));
  SIMPLEJOIN_FU #(.BITSIZE_ops(1),
    .PORTSIZE_ops(2)) mu_S_1 (.sop(OUT_mu_S_1_MULTI_UNBOUNDED_0),
    .clock(clock),
    .reset(reset),
    .enable(muenable_mu_S_1),
    .ops({s_done___umodsi3_52_i0,
      s_done___udivsi3_51_i0}));
  SIMPLEJOIN_FU #(.BITSIZE_ops(1),
    .PORTSIZE_ops(2)) mu_S_4 (.sop(OUT_mu_S_4_MULTI_UNBOUNDED_0),
    .clock(clock),
    .reset(reset),
    .enable(muenable_mu_S_4),
    .ops({s_done___udivsi3_51_i0,
      s_done___umodsi3_52_i0}));
  or or_or___udivsi3_51_i00( s___udivsi3_51_i00, selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606, selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696);
  or or_or___umodsi3_52_i01( s___umodsi3_52_i01, selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622, selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669);
  register_SE #(.BITSIZE_in1(31),
    .BITSIZE_out1(31)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_rshift_expr_FU_32_0_32_42_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10546),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_80_reg_1_0_0_0),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_49_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10613),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out___umodsi3_52_i0___umodsi3_52_i0),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_13_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10619),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_12_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10603),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_85_reg_14_0_0_0),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_86_reg_15_0_0_0),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_49_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10676),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_20_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10661),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_19_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10689),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_41_i3_fu__Z11convolutionPKdPdS0_iiii_9849_10724),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_3_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10616),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_41_i4_fu__Z11convolutionPKdPdS0_iiii_9849_10726),
    .wenable(wrenable_reg_20));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_le_expr_FU_32_32_32_35_i1_fu__Z11convolutionPKdPdS0_iiii_9849_10743),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_94_reg_22_0_0_0),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_48_i0_fu__Z11convolutionPKdPdS0_iiii_9849_14277),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_96_reg_24_0_0_0),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_6_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10680),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_5_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10678),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_4_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10729),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_7_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10734),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_40_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10741),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_0_32_39_i1_fu__Z11convolutionPKdPdS0_iiii_9849_14273),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out___udivsi3_51_i0___udivsi3_51_i0),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10549 = out_read_cond_FU_8_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10549;
  assign OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10732 = out_read_cond_FU_14_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10732;
  assign OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10737 = out_read_cond_FU_21_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10737;
  assign OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10739 = out_read_cond_FU_23_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10739;
  assign OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10745 = out_read_cond_FU_24_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10745;
  assign OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10758 = out_read_cond_FU_27_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10758;
  assign OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10760 = out_read_cond_FU_30_i0_fu__Z11convolutionPKdPdS0_iiii_9849_10760;
  assign OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606 = s_done___udivsi3_51_i0;
  assign OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622 = s_done___umodsi3_52_i0;
  assign OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669 = s_done___umodsi3_52_i0;
  assign OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696 = s_done___udivsi3_51_i0;

endmodule

// FSM based controller description for _Z11convolutionPKdPdS0_iiii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller__Z11convolutionPKdPdS0_iiii(done_port,
  fuselector_BMEMORY_CTRLN_31_i0_LOAD,
  fuselector_BMEMORY_CTRLN_31_i0_STORE,
  selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606,
  selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622,
  selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669,
  selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696,
  selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1,
  selector_MUX_24___udivsi3_51_i0_0_0_0,
  selector_MUX_25___udivsi3_51_i0_1_0_0,
  selector_MUX_26___umodsi3_52_i0_0_0_0,
  selector_MUX_27___umodsi3_52_i0_1_0_0,
  selector_MUX_80_reg_1_0_0_0,
  selector_MUX_85_reg_14_0_0_0,
  selector_MUX_86_reg_15_0_0_0,
  selector_MUX_94_reg_22_0_0_0,
  selector_MUX_96_reg_24_0_0_0,
  muenable_mu_S_1,
  muenable_mu_S_4,
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
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10549,
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10732,
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10737,
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10739,
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10745,
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10758,
  OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10760,
  OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606,
  OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622,
  OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669,
  OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696,
  OUT_mu_S_1_MULTI_UNBOUNDED_0,
  OUT_mu_S_4_MULTI_UNBOUNDED_0,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10549;
  input OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10732;
  input OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10737;
  input OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10739;
  input OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10745;
  input OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10758;
  input OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10760;
  input OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606;
  input OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622;
  input OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669;
  input OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696;
  input OUT_mu_S_1_MULTI_UNBOUNDED_0;
  input OUT_mu_S_4_MULTI_UNBOUNDED_0;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_31_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_31_i0_STORE;
  output selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606;
  output selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622;
  output selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669;
  output selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696;
  output selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1;
  output selector_MUX_24___udivsi3_51_i0_0_0_0;
  output selector_MUX_25___udivsi3_51_i0_1_0_0;
  output selector_MUX_26___umodsi3_52_i0_0_0_0;
  output selector_MUX_27___umodsi3_52_i0_1_0_0;
  output selector_MUX_80_reg_1_0_0_0;
  output selector_MUX_85_reg_14_0_0_0;
  output selector_MUX_86_reg_15_0_0_0;
  output selector_MUX_94_reg_22_0_0_0;
  output selector_MUX_96_reg_24_0_0_0;
  output muenable_mu_S_1;
  output muenable_mu_S_4;
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
  parameter [5:0] S_0 = 6'd0,
    S_35 = 6'd35,
    S_1 = 6'd1,
    S_2 = 6'd2,
    S_3 = 6'd3,
    S_4 = 6'd4,
    S_5 = 6'd5,
    S_6 = 6'd6,
    S_7 = 6'd7,
    S_8 = 6'd8,
    S_9 = 6'd9,
    S_10 = 6'd10,
    S_11 = 6'd11,
    S_12 = 6'd12,
    S_13 = 6'd13,
    S_14 = 6'd14,
    S_15 = 6'd15,
    S_16 = 6'd16,
    S_17 = 6'd17,
    S_18 = 6'd18,
    S_19 = 6'd19,
    S_20 = 6'd20,
    S_21 = 6'd21,
    S_22 = 6'd22,
    S_23 = 6'd23,
    S_24 = 6'd24,
    S_25 = 6'd25,
    S_26 = 6'd26,
    S_27 = 6'd27,
    S_28 = 6'd28,
    S_29 = 6'd29,
    S_30 = 6'd30,
    S_31 = 6'd31,
    S_32 = 6'd32,
    S_33 = 6'd33,
    S_34 = 6'd34,
    S_36 = 6'd36;
  reg [5:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_31_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_31_i0_STORE;
  reg selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606;
  reg selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622;
  reg selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669;
  reg selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696;
  reg selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1;
  reg selector_MUX_24___udivsi3_51_i0_0_0_0;
  reg selector_MUX_25___udivsi3_51_i0_1_0_0;
  reg selector_MUX_26___umodsi3_52_i0_0_0_0;
  reg selector_MUX_27___umodsi3_52_i0_1_0_0;
  reg selector_MUX_80_reg_1_0_0_0;
  reg selector_MUX_85_reg_14_0_0_0;
  reg selector_MUX_86_reg_15_0_0_0;
  reg selector_MUX_94_reg_22_0_0_0;
  reg selector_MUX_96_reg_24_0_0_0;
  reg muenable_mu_S_1;
  reg muenable_mu_S_4;
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
    fuselector_BMEMORY_CTRLN_31_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_31_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606 = 1'b0;
    selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622 = 1'b0;
    selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669 = 1'b0;
    selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1 = 1'b0;
    selector_MUX_24___udivsi3_51_i0_0_0_0 = 1'b0;
    selector_MUX_25___udivsi3_51_i0_1_0_0 = 1'b0;
    selector_MUX_26___umodsi3_52_i0_0_0_0 = 1'b0;
    selector_MUX_27___umodsi3_52_i0_1_0_0 = 1'b0;
    selector_MUX_80_reg_1_0_0_0 = 1'b0;
    selector_MUX_85_reg_14_0_0_0 = 1'b0;
    selector_MUX_86_reg_15_0_0_0 = 1'b0;
    selector_MUX_94_reg_22_0_0_0 = 1'b0;
    selector_MUX_96_reg_24_0_0_0 = 1'b0;
    muenable_mu_S_1 = 1'b0;
    muenable_mu_S_4 = 1'b0;
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
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          if (OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10549 == 1'b1)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_35;
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
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_35 :
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606 = 1'b1;
          selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622;
          wrenable_reg_9 = OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606;
          if (OUT_mu_S_1_MULTI_UNBOUNDED_0 == 1'b0)
            begin
              _next_state = S_2;
              muenable_mu_S_1 = 1'b1;
            end
          else
            begin
              _next_state = S_3;
              muenable_mu_S_1 = 1'b1;
            end
        end
      S_2 :
        begin
          wrenable_reg_11 = OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622;
          wrenable_reg_9 = OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606;
          if (OUT_mu_S_1_MULTI_UNBOUNDED_0 == 1'b0)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_3;
            end
        end
      S_3 :
        begin
          selector_MUX_85_reg_14_0_0_0 = 1'b1;
          selector_MUX_96_reg_24_0_0_0 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_24 = 1'b1;
          if (OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10732 == 1'b1)
            begin
              _next_state = S_4;
              selector_MUX_96_reg_24_0_0_0 = 1'b0;
              wrenable_reg_24 = 1'b0;
            end
          else
            begin
              _next_state = S_34;
              selector_MUX_85_reg_14_0_0_0 = 1'b0;
              wrenable_reg_14 = 1'b0;
              wrenable_reg_15 = 1'b0;
            end
        end
      S_4 :
        begin
          selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669 = 1'b1;
          selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696 = 1'b1;
          selector_MUX_24___udivsi3_51_i0_0_0_0 = 1'b1;
          selector_MUX_25___udivsi3_51_i0_1_0_0 = 1'b1;
          selector_MUX_26___umodsi3_52_i0_0_0_0 = 1'b1;
          selector_MUX_27___umodsi3_52_i0_1_0_0 = 1'b1;
          wrenable_reg_11 = OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_9 = OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696;
          if (OUT_mu_S_4_MULTI_UNBOUNDED_0 == 1'b0)
            begin
              _next_state = S_5;
              muenable_mu_S_4 = 1'b1;
            end
          else
            begin
              _next_state = S_6;
              muenable_mu_S_4 = 1'b1;
            end
        end
      S_5 :
        begin
          selector_MUX_24___udivsi3_51_i0_0_0_0 = 1'b1;
          selector_MUX_25___udivsi3_51_i0_1_0_0 = 1'b1;
          selector_MUX_26___umodsi3_52_i0_0_0_0 = 1'b1;
          selector_MUX_27___umodsi3_52_i0_1_0_0 = 1'b1;
          wrenable_reg_11 = OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669;
          wrenable_reg_9 = OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696;
          if (OUT_mu_S_4_MULTI_UNBOUNDED_0 == 1'b0)
            begin
              _next_state = S_5;
            end
          else
            begin
              _next_state = S_6;
            end
        end
      S_6 :
        begin
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_22 = 1'b1;
          if (OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10737 == 1'b1)
            begin
              _next_state = S_7;
              wrenable_reg_22 = 1'b0;
            end
          else
            begin
              _next_state = S_11;
              wrenable_reg_19 = 1'b0;
            end
        end
      S_7 :
        begin
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          if (OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10739 == 1'b1)
            begin
              _next_state = S_8;
              wrenable_reg_22 = 1'b0;
            end
          else
            begin
              _next_state = S_11;
              wrenable_reg_20 = 1'b0;
              wrenable_reg_21 = 1'b0;
            end
        end
      S_8 :
        begin
          wrenable_reg_22 = 1'b1;
          if (OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10745 == 1'b1)
            begin
              _next_state = S_9;
              wrenable_reg_22 = 1'b0;
            end
          else
            begin
              _next_state = S_11;
            end
        end
      S_9 :
        begin
          fuselector_BMEMORY_CTRLN_31_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          selector_MUX_94_reg_22_0_0_0 = 1'b1;
          wrenable_reg_22 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          fuselector_BMEMORY_CTRLN_31_i0_LOAD = 1'b1;
          wrenable_reg_23 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          _next_state = S_13;
        end
      S_13 :
        begin
          _next_state = S_14;
        end
      S_14 :
        begin
          _next_state = S_15;
        end
      S_15 :
        begin
          _next_state = S_16;
        end
      S_16 :
        begin
          _next_state = S_17;
        end
      S_17 :
        begin
          _next_state = S_18;
        end
      S_18 :
        begin
          _next_state = S_19;
        end
      S_19 :
        begin
          _next_state = S_20;
        end
      S_20 :
        begin
          _next_state = S_21;
        end
      S_21 :
        begin
          _next_state = S_22;
        end
      S_22 :
        begin
          _next_state = S_23;
        end
      S_23 :
        begin
          _next_state = S_24;
        end
      S_24 :
        begin
          _next_state = S_25;
        end
      S_25 :
        begin
          _next_state = S_26;
        end
      S_26 :
        begin
          _next_state = S_27;
        end
      S_27 :
        begin
          _next_state = S_28;
        end
      S_28 :
        begin
          _next_state = S_29;
        end
      S_29 :
        begin
          _next_state = S_30;
        end
      S_30 :
        begin
          _next_state = S_31;
        end
      S_31 :
        begin
          _next_state = S_32;
        end
      S_32 :
        begin
          _next_state = S_33;
        end
      S_33 :
        begin
          selector_MUX_86_reg_15_0_0_0 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_24 = 1'b1;
          if (OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10758 == 1'b1)
            begin
              _next_state = S_4;
              wrenable_reg_24 = 1'b0;
            end
          else
            begin
              _next_state = S_34;
              selector_MUX_86_reg_15_0_0_0 = 1'b0;
              wrenable_reg_14 = 1'b0;
              wrenable_reg_15 = 1'b0;
            end
        end
      S_34 :
        begin
          fuselector_BMEMORY_CTRLN_31_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0 = 1'b1;
          selector_MUX_80_reg_1_0_0_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          if (OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10760 == 1'b1)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_36;
              done_port = 1'b1;
              selector_MUX_80_reg_1_0_0_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
            end
        end
      S_36 :
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

// Top component for _Z11convolutionPKdPdS0_iiii
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _Z11convolutionPKdPdS0_iiii(clock,
  reset,
  start_port,
  done_port,
  A,
  B,
  kernel,
  n,
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
  input [31:0] B;
  input [31:0] kernel;
  input signed [31:0] n;
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
  wire OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10549;
  wire OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10732;
  wire OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10737;
  wire OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10739;
  wire OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10745;
  wire OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10758;
  wire OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10760;
  wire OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606;
  wire OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622;
  wire OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669;
  wire OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696;
  wire OUT_mu_S_1_MULTI_UNBOUNDED_0;
  wire OUT_mu_S_4_MULTI_UNBOUNDED_0;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_31_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_31_i0_STORE;
  wire muenable_mu_S_1;
  wire muenable_mu_S_4;
  wire selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606;
  wire selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622;
  wire selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669;
  wire selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696;
  wire selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1;
  wire selector_MUX_24___udivsi3_51_i0_0_0_0;
  wire selector_MUX_25___udivsi3_51_i0_1_0_0;
  wire selector_MUX_26___umodsi3_52_i0_0_0_0;
  wire selector_MUX_27___umodsi3_52_i0_1_0_0;
  wire selector_MUX_80_reg_1_0_0_0;
  wire selector_MUX_85_reg_14_0_0_0;
  wire selector_MUX_86_reg_15_0_0_0;
  wire selector_MUX_94_reg_22_0_0_0;
  wire selector_MUX_96_reg_24_0_0_0;
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
  
  controller__Z11convolutionPKdPdS0_iiii Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_31_i0_LOAD(fuselector_BMEMORY_CTRLN_31_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_31_i0_STORE(fuselector_BMEMORY_CTRLN_31_i0_STORE),
    .selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606(selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606),
    .selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622(selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622),
    .selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669(selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669),
    .selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696(selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696),
    .selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1),
    .selector_MUX_24___udivsi3_51_i0_0_0_0(selector_MUX_24___udivsi3_51_i0_0_0_0),
    .selector_MUX_25___udivsi3_51_i0_1_0_0(selector_MUX_25___udivsi3_51_i0_1_0_0),
    .selector_MUX_26___umodsi3_52_i0_0_0_0(selector_MUX_26___umodsi3_52_i0_0_0_0),
    .selector_MUX_27___umodsi3_52_i0_1_0_0(selector_MUX_27___umodsi3_52_i0_1_0_0),
    .selector_MUX_80_reg_1_0_0_0(selector_MUX_80_reg_1_0_0_0),
    .selector_MUX_85_reg_14_0_0_0(selector_MUX_85_reg_14_0_0_0),
    .selector_MUX_86_reg_15_0_0_0(selector_MUX_86_reg_15_0_0_0),
    .selector_MUX_94_reg_22_0_0_0(selector_MUX_94_reg_22_0_0_0),
    .selector_MUX_96_reg_24_0_0_0(selector_MUX_96_reg_24_0_0_0),
    .muenable_mu_S_1(muenable_mu_S_1),
    .muenable_mu_S_4(muenable_mu_S_4),
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
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10549(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10549),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10732(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10732),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10737(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10737),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10739(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10739),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10745(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10745),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10758(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10758),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10760(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10760),
    .OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606(OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606),
    .OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622(OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622),
    .OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669(OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669),
    .OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696(OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696),
    .OUT_mu_S_1_MULTI_UNBOUNDED_0(OUT_mu_S_1_MULTI_UNBOUNDED_0),
    .OUT_mu_S_4_MULTI_UNBOUNDED_0(OUT_mu_S_4_MULTI_UNBOUNDED_0),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath__Z11convolutionPKdPdS0_iiii Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10549(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10549),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10732(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10732),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10737(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10737),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10739(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10739),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10745(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10745),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10758(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10758),
    .OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10760(OUT_CONDITION__Z11convolutionPKdPdS0_iiii_9849_10760),
    .OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606(OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606),
    .OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622(OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622),
    .OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669(OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669),
    .OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696(OUT_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696),
    .OUT_mu_S_1_MULTI_UNBOUNDED_0(OUT_mu_S_1_MULTI_UNBOUNDED_0),
    .OUT_mu_S_4_MULTI_UNBOUNDED_0(OUT_mu_S_4_MULTI_UNBOUNDED_0),
    .clock(clock),
    .reset(reset),
    .in_port_A(A),
    .in_port_B(B),
    .in_port_kernel(kernel),
    .in_port_n(n),
    .in_port_kernel_size(kernel_size),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_31_i0_LOAD(fuselector_BMEMORY_CTRLN_31_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_31_i0_STORE(fuselector_BMEMORY_CTRLN_31_i0_STORE),
    .selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606(selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10606),
    .selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622(selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10622),
    .selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669(selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10669),
    .selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696(selector_IN_UNBOUNDED__Z11convolutionPKdPdS0_iiii_9849_10696),
    .selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_31_i0_1_0_1),
    .selector_MUX_24___udivsi3_51_i0_0_0_0(selector_MUX_24___udivsi3_51_i0_0_0_0),
    .selector_MUX_25___udivsi3_51_i0_1_0_0(selector_MUX_25___udivsi3_51_i0_1_0_0),
    .selector_MUX_26___umodsi3_52_i0_0_0_0(selector_MUX_26___umodsi3_52_i0_0_0_0),
    .selector_MUX_27___umodsi3_52_i0_1_0_0(selector_MUX_27___umodsi3_52_i0_1_0_0),
    .selector_MUX_80_reg_1_0_0_0(selector_MUX_80_reg_1_0_0_0),
    .selector_MUX_85_reg_14_0_0_0(selector_MUX_85_reg_14_0_0_0),
    .selector_MUX_86_reg_15_0_0_0(selector_MUX_86_reg_15_0_0_0),
    .selector_MUX_94_reg_22_0_0_0(selector_MUX_94_reg_22_0_0_0),
    .selector_MUX_96_reg_24_0_0_0(selector_MUX_96_reg_24_0_0_0),
    .muenable_mu_S_1(muenable_mu_S_1),
    .muenable_mu_S_4(muenable_mu_S_4),
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

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_REAL_FU(in1,
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
module multi_read_cond_FU(in1,
  out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module fp_eq_expr_FU(in1,
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
  assign out1 = in1 == in2 || (in1[BITSIZE_in1-2:0] == in2[BITSIZE_in2-2:0] && in1[BITSIZE_in1-2:0] == {BITSIZE_in1-2{1'b0}});
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IIdata_converter_FU(in1,
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

// Datapath RTL description for _Z3lrnPKdPdi
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath__Z3lrnPKdPdi(clock,
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
  fuselector_BMEMORY_CTRLN_34_i0_LOAD,
  fuselector_BMEMORY_CTRLN_34_i0_STORE,
  selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0,
  selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0,
  selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0,
  selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1,
  selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0,
  selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0,
  selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0,
  selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1,
  selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0,
  selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1,
  selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0,
  selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1,
  selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0,
  selector_MUX_52_reg_1_0_0_0,
  selector_MUX_53_reg_10_0_0_0,
  selector_MUX_53_reg_10_0_0_1,
  selector_MUX_55_reg_12_0_0_0,
  selector_MUX_56_reg_13_0_0_0,
  selector_MUX_57_reg_14_0_0_0,
  selector_MUX_63_reg_2_0_0_0,
  selector_MUX_65_reg_21_0_0_0,
  selector_MUX_66_reg_22_0_0_0,
  selector_MUX_67_reg_23_0_0_0,
  selector_MUX_68_reg_24_0_0_0,
  selector_MUX_71_reg_27_0_0_0,
  selector_MUX_75_reg_5_0_0_0,
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
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10775,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10949,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10952,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10977,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10979,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10981,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10984,
  OUT_MULTIIF__Z3lrnPKdPdi_9852_15031);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_B;
  input signed [31:0] in_port_size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_34_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_34_i0_STORE;
  input selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0;
  input selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0;
  input selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0;
  input selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1;
  input selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0;
  input selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0;
  input selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1;
  input selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2;
  input selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0;
  input selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0;
  input selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0;
  input selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1;
  input selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0;
  input selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1;
  input selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0;
  input selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1;
  input selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0;
  input selector_MUX_52_reg_1_0_0_0;
  input selector_MUX_53_reg_10_0_0_0;
  input selector_MUX_53_reg_10_0_0_1;
  input selector_MUX_55_reg_12_0_0_0;
  input selector_MUX_56_reg_13_0_0_0;
  input selector_MUX_57_reg_14_0_0_0;
  input selector_MUX_63_reg_2_0_0_0;
  input selector_MUX_65_reg_21_0_0_0;
  input selector_MUX_66_reg_22_0_0_0;
  input selector_MUX_67_reg_23_0_0_0;
  input selector_MUX_68_reg_24_0_0_0;
  input selector_MUX_71_reg_27_0_0_0;
  input selector_MUX_75_reg_5_0_0_0;
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
  output OUT_CONDITION__Z3lrnPKdPdi_9852_10775;
  output OUT_CONDITION__Z3lrnPKdPdi_9852_10949;
  output OUT_CONDITION__Z3lrnPKdPdi_9852_10952;
  output OUT_CONDITION__Z3lrnPKdPdi_9852_10977;
  output OUT_CONDITION__Z3lrnPKdPdi_9852_10979;
  output OUT_CONDITION__Z3lrnPKdPdi_9852_10981;
  output OUT_CONDITION__Z3lrnPKdPdi_9852_10984;
  output [1:0] OUT_MULTIIF__Z3lrnPKdPdi_9852_15031;
  // Component and signal declarations
  wire [63:0] null_out_signal_BMEMORY_CTRLN_34_i0_out1_1;
  wire [63:0] out_ASSIGN_REAL_FU_8_i0_fu__Z3lrnPKdPdi_9852_15039;
  wire [63:0] out_BMEMORY_CTRLN_34_i0_BMEMORY_CTRLN_34_i0;
  wire [0:0] out_IUdata_converter_FU_22_i0_fu__Z3lrnPKdPdi_9852_10964;
  wire [31:0] out_IUdata_converter_FU_2_i0_fu__Z3lrnPKdPdi_9852_10774;
  wire [63:0] out_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0;
  wire [63:0] out_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0;
  wire [63:0] out_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0;
  wire [63:0] out_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1;
  wire [63:0] out_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0;
  wire [63:0] out_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0;
  wire [63:0] out_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1;
  wire [63:0] out_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2;
  wire [63:0] out_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0;
  wire [63:0] out_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0;
  wire [63:0] out_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0;
  wire [63:0] out_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1;
  wire [63:0] out_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0;
  wire [63:0] out_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1;
  wire [63:0] out_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0;
  wire [63:0] out_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0;
  wire [31:0] out_MUX_52_reg_1_0_0_0;
  wire [63:0] out_MUX_53_reg_10_0_0_0;
  wire [63:0] out_MUX_53_reg_10_0_0_1;
  wire [31:0] out_MUX_55_reg_12_0_0_0;
  wire [63:0] out_MUX_56_reg_13_0_0_0;
  wire [31:0] out_MUX_57_reg_14_0_0_0;
  wire [31:0] out_MUX_63_reg_2_0_0_0;
  wire [63:0] out_MUX_65_reg_21_0_0_0;
  wire [63:0] out_MUX_66_reg_22_0_0_0;
  wire [63:0] out_MUX_67_reg_23_0_0_0;
  wire [31:0] out_MUX_68_reg_24_0_0_0;
  wire [63:0] out_MUX_71_reg_27_0_0_0;
  wire [31:0] out_MUX_75_reg_5_0_0_0;
  wire out_const_0;
  wire [63:0] out_const_1;
  wire [1:0] out_const_10;
  wire [63:0] out_const_2;
  wire [63:0] out_const_3;
  wire [63:0] out_const_4;
  wire [1:0] out_const_5;
  wire [7:0] out_const_6;
  wire [63:0] out_const_7;
  wire [5:0] out_const_8;
  wire out_const_9;
  wire [31:0] out_conv_out_const_0_1_32;
  wire signed [31:0] out_conv_out_const_5_I_2_I_32;
  wire [6:0] out_conv_out_const_6_8_7;
  wire out_fp_eq_expr_FU_64_0_64_35_i0_fu__Z3lrnPKdPdi_9852_14296;
  wire [63:0] out_fp_float_expr_32_64_FU_32_64_500_36_i0_fu__Z3lrnPKdPdi_9852_10919;
  wire [63:0] out_fp_float_expr_32_64_FU_32_64_500_36_i1_fu__Z3lrnPKdPdi_9852_10936;
  wire out_fp_le_expr_FU_64_64_64_500_37_i0_fu__Z3lrnPKdPdi_9852_14298;
  wire [63:0] out_fp_minus_expr_FU_64_64_64_500_38_i0_fp_minus_expr_FU_64_64_64_500_38_i0;
  wire [63:0] out_fp_mult_expr_FU_64_64_64_500_39_i0_fp_mult_expr_FU_64_64_64_500_39_i0;
  wire [63:0] out_fp_plus_expr_FU_64_64_64_500_40_i0_fp_plus_expr_FU_64_64_64_500_40_i0;
  wire [63:0] out_fp_rdiv_expr_FU_64_64_64_400_41_i0_fp_rdiv_expr_FU_64_64_64_400_41_i0;
  wire out_ge_expr_FU_32_32_32_42_i0_fu__Z3lrnPKdPdi_9852_14300;
  wire signed [31:0] out_ii_conv_conn_obj_1_IIdata_converter_FU_ii_conv_0;
  wire [1:0] out_multi_read_cond_FU_17_i0_fu__Z3lrnPKdPdi_9852_15031;
  wire out_ne_expr_FU_32_0_32_43_i0_fu__Z3lrnPKdPdi_9852_14304;
  wire out_ne_expr_FU_32_0_32_43_i1_fu__Z3lrnPKdPdi_9852_14306;
  wire signed [31:0] out_plus_expr_FU_32_0_32_44_i0_fu__Z3lrnPKdPdi_9852_10929;
  wire signed [31:0] out_plus_expr_FU_32_0_32_44_i1_fu__Z3lrnPKdPdi_9852_10944;
  wire signed [31:0] out_plus_expr_FU_32_0_32_44_i2_fu__Z3lrnPKdPdi_9852_10962;
  wire out_read_cond_FU_11_i0_fu__Z3lrnPKdPdi_9852_10952;
  wire out_read_cond_FU_19_i0_fu__Z3lrnPKdPdi_9852_10977;
  wire out_read_cond_FU_29_i0_fu__Z3lrnPKdPdi_9852_10979;
  wire out_read_cond_FU_31_i0_fu__Z3lrnPKdPdi_9852_10981;
  wire out_read_cond_FU_32_i0_fu__Z3lrnPKdPdi_9852_10984;
  wire out_read_cond_FU_3_i0_fu__Z3lrnPKdPdi_9852_10775;
  wire out_read_cond_FU_9_i0_fu__Z3lrnPKdPdi_9852_10949;
  wire [31:0] out_reg_0_reg_0;
  wire [63:0] out_reg_10_reg_10;
  wire [63:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [63:0] out_reg_13_reg_13;
  wire [31:0] out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire out_reg_16_reg_16;
  wire out_reg_17_reg_17;
  wire out_reg_18_reg_18;
  wire out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [63:0] out_reg_20_reg_20;
  wire [63:0] out_reg_21_reg_21;
  wire [63:0] out_reg_22_reg_22;
  wire [63:0] out_reg_23_reg_23;
  wire [31:0] out_reg_24_reg_24;
  wire out_reg_25_reg_25;
  wire [63:0] out_reg_26_reg_26;
  wire [63:0] out_reg_27_reg_27;
  wire out_reg_28_reg_28;
  wire [31:0] out_reg_2_reg_2;
  wire [28:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire [63:0] out_reg_8_reg_8;
  wire [63:0] out_reg_9_reg_9;
  wire out_truth_and_expr_FU_1_1_1_45_i0_fu__Z3lrnPKdPdi_9852_15037;
  wire out_truth_not_expr_FU_1_1_46_i0_fu__Z3lrnPKdPdi_9852_15034;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_47_i0_fu__Z3lrnPKdPdi_9852_10965;
  wire out_ui_eq_expr_FU_1_0_1_48_i0_fu__Z3lrnPKdPdi_9852_14302;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_49_i0_fu__Z3lrnPKdPdi_9852_10812;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_49_i1_fu__Z3lrnPKdPdi_9852_14066;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_49_i2_fu__Z3lrnPKdPdi_9852_14079;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_49_i3_fu__Z3lrnPKdPdi_9852_14519;
  wire out_ui_ne_expr_FU_32_0_32_50_i0_fu__Z3lrnPKdPdi_9852_14294;
  wire out_ui_ne_expr_FU_32_32_32_51_i0_fu__Z3lrnPKdPdi_9852_14308;
  wire out_ui_ne_expr_FU_32_32_32_51_i1_fu__Z3lrnPKdPdi_9852_14310;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_52_i0_fu__Z3lrnPKdPdi_9852_10819;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_52_i1_fu__Z3lrnPKdPdi_9852_10983;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_53_i0_fu__Z3lrnPKdPdi_9852_14516;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_54_i0_fu__Z3lrnPKdPdi_9852_10797;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_54_i1_fu__Z3lrnPKdPdi_9852_10838;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_54_i2_fu__Z3lrnPKdPdi_9852_14069;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_54_i3_fu__Z3lrnPKdPdi_9852_14082;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_55_i0_fu__Z3lrnPKdPdi_9852_14509;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_55_i1_fu__Z3lrnPKdPdi_9852_14514;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1;
  wire [63:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  wire [31:0] out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3;
  
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_34_i0 (.out1({null_out_signal_BMEMORY_CTRLN_34_i0_out1_1,
      out_BMEMORY_CTRLN_34_i0_BMEMORY_CTRLN_34_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0}),
    .in3({7'b0000000,
      out_conv_out_const_6_8_7}),
    .in4({1'b0,
      out_const_9}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_34_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_34_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  IIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IIdata_converter_FU_ii_conv_0 (.out1(out_ii_conv_conn_obj_1_IIdata_converter_FU_ii_conv_0),
    .in1(out_conv_out_const_5_I_2_I_32));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0 (.out1(out_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0),
    .sel(selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_10_reg_10));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0 (.out1(out_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0),
    .sel(selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0),
    .in1(out_reg_13_reg_13),
    .in2(out_const_4));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0 (.out1(out_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0),
    .sel(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_ASSIGN_REAL_FU_8_i0_fu__Z3lrnPKdPdi_9852_15039));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1 (.out1(out_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1),
    .sel(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1),
    .in1(out_fp_mult_expr_FU_64_64_64_500_39_i0_fp_mult_expr_FU_64_64_64_500_39_i0),
    .in2(out_fp_rdiv_expr_FU_64_64_64_400_41_i0_fp_rdiv_expr_FU_64_64_64_400_41_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0 (.out1(out_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0),
    .sel(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0),
    .in1(out_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0),
    .in2(out_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0 (.out1(out_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0),
    .sel(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0),
    .in1(out_reg_23_reg_23),
    .in2(out_reg_13_reg_13));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1 (.out1(out_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1),
    .sel(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1),
    .in1(out_ASSIGN_REAL_FU_8_i0_fu__Z3lrnPKdPdi_9852_15039),
    .in2(out_const_2));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2 (.out1(out_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2),
    .sel(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2),
    .in1(out_const_3),
    .in2(out_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0 (.out1(out_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0),
    .sel(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0),
    .in1(out_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1),
    .in2(out_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0 (.out1(out_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0),
    .sel(selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_fp_mult_expr_FU_64_64_64_500_39_i0_fp_mult_expr_FU_64_64_64_500_39_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0 (.out1(out_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0),
    .sel(selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0),
    .in1(out_reg_22_reg_22),
    .in2(out_reg_13_reg_13));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1 (.out1(out_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1),
    .sel(selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1),
    .in1(out_const_7),
    .in2(out_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0 (.out1(out_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0),
    .sel(selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_21_reg_21));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1 (.out1(out_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1),
    .sel(selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1),
    .in1(out_reg_11_reg_11),
    .in2(out_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0 (.out1(out_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0),
    .sel(selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0),
    .in1(out_reg_27_reg_27),
    .in2(out_reg_26_reg_26));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1 (.out1(out_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1),
    .sel(selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1),
    .in1(out_reg_20_reg_20),
    .in2(out_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_34_i0_1_0_0 (.out1(out_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0),
    .sel(selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0),
    .in1(out_reg_7_reg_7),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_54_i2_fu__Z3lrnPKdPdi_9852_14069));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_52_reg_1_0_0_0 (.out1(out_MUX_52_reg_1_0_0_0),
    .sel(selector_MUX_52_reg_1_0_0_0),
    .in1(out_ui_lshift_expr_FU_32_0_32_49_i3_fu__Z3lrnPKdPdi_9852_14519),
    .in2(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_53_reg_10_0_0_0 (.out1(out_MUX_53_reg_10_0_0_0),
    .sel(selector_MUX_53_reg_10_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_minus_expr_FU_64_64_64_500_38_i0_fp_minus_expr_FU_64_64_64_500_38_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_53_reg_10_0_0_1 (.out1(out_MUX_53_reg_10_0_0_1),
    .sel(selector_MUX_53_reg_10_0_0_1),
    .in1(out_fp_plus_expr_FU_64_64_64_500_40_i0_fp_plus_expr_FU_64_64_64_500_40_i0),
    .in2(out_MUX_53_reg_10_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_55_reg_12_0_0_0 (.out1(out_MUX_55_reg_12_0_0_0),
    .sel(selector_MUX_55_reg_12_0_0_0),
    .in1(out_reg_15_reg_15),
    .in2(out_ii_conv_conn_obj_1_IIdata_converter_FU_ii_conv_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_56_reg_13_0_0_0 (.out1(out_MUX_56_reg_13_0_0_0),
    .sel(selector_MUX_56_reg_13_0_0_0),
    .in1(out_const_4),
    .in2(out_fp_mult_expr_FU_64_64_64_500_39_i0_fp_mult_expr_FU_64_64_64_500_39_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_57_reg_14_0_0_0 (.out1(out_MUX_57_reg_14_0_0_0),
    .sel(selector_MUX_57_reg_14_0_0_0),
    .in1(out_ii_conv_conn_obj_1_IIdata_converter_FU_ii_conv_0),
    .in2(out_plus_expr_FU_32_0_32_44_i0_fu__Z3lrnPKdPdi_9852_10929));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_63_reg_2_0_0_0 (.out1(out_MUX_63_reg_2_0_0_0),
    .sel(selector_MUX_63_reg_2_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_52_i1_fu__Z3lrnPKdPdi_9852_10983),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_65_reg_21_0_0_0 (.out1(out_MUX_65_reg_21_0_0_0),
    .sel(selector_MUX_65_reg_21_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_mult_expr_FU_64_64_64_500_39_i0_fp_mult_expr_FU_64_64_64_500_39_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_66_reg_22_0_0_0 (.out1(out_MUX_66_reg_22_0_0_0),
    .sel(selector_MUX_66_reg_22_0_0_0),
    .in1(out_const_4),
    .in2(out_fp_plus_expr_FU_64_64_64_500_40_i0_fp_plus_expr_FU_64_64_64_500_40_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_67_reg_23_0_0_0 (.out1(out_MUX_67_reg_23_0_0_0),
    .sel(selector_MUX_67_reg_23_0_0_0),
    .in1(out_const_4),
    .in2(out_fp_mult_expr_FU_64_64_64_500_39_i0_fp_mult_expr_FU_64_64_64_500_39_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_68_reg_24_0_0_0 (.out1(out_MUX_68_reg_24_0_0_0),
    .sel(selector_MUX_68_reg_24_0_0_0),
    .in1(out_ii_conv_conn_obj_1_IIdata_converter_FU_ii_conv_0),
    .in2(out_plus_expr_FU_32_0_32_44_i1_fu__Z3lrnPKdPdi_9852_10944));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_71_reg_27_0_0_0 (.out1(out_MUX_71_reg_27_0_0_0),
    .sel(selector_MUX_71_reg_27_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_plus_expr_FU_64_64_64_500_40_i0_fp_plus_expr_FU_64_64_64_500_40_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_75_reg_5_0_0_0 (.out1(out_MUX_75_reg_5_0_0_0),
    .sel(selector_MUX_75_reg_5_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_52_i0_fu__Z3lrnPKdPdi_9852_10819),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2),
    .in1(out_fp_rdiv_expr_FU_64_64_64_400_41_i0_fp_rdiv_expr_FU_64_64_64_400_41_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_3 (.out1(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3),
    .in1(out_conv_out_const_0_1_32));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0000000000000000000000000000000000000000000000000000000000000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0011111101010000011000100100110111010010111100011010100111111100)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0011111111101000000000000000000000000000000000000000000000000000)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0011111111110000000000000000000000000000000000000000000000000000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b01000000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0100000000000000000000000000000000000000000000000000000000000000)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010101)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  IIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(32)) conv_out_const_5_I_2_I_32 (.out1(out_conv_out_const_5_I_2_I_32),
    .in1(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(7)) conv_out_const_6_8_7 (.out1(out_conv_out_const_6_8_7),
    .in1(out_const_6));
  fp_minus_expr_FU_64_64_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fp_minus_expr_FU_64_64_64_500_38_i0 (.R(out_fp_minus_expr_FU_64_64_64_500_38_i0_fp_minus_expr_FU_64_64_64_500_38_i0),
    .clock(clock),
    .reset(reset),
    .X(out_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0),
    .Y(out_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0));
  fp_mult_expr_FU_64_64_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fp_mult_expr_FU_64_64_64_500_39_i0 (.R(out_fp_mult_expr_FU_64_64_64_500_39_i0_fp_mult_expr_FU_64_64_64_500_39_i0),
    .clock(clock),
    .reset(reset),
    .X(out_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0),
    .Y(out_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0));
  fp_plus_expr_FU_64_64_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fp_plus_expr_FU_64_64_64_500_40_i0 (.R(out_fp_plus_expr_FU_64_64_64_500_40_i0_fp_plus_expr_FU_64_64_64_500_40_i0),
    .clock(clock),
    .reset(reset),
    .X(out_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0),
    .Y(out_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1));
  fp_rdiv_expr_FU_64_64_400 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fp_rdiv_expr_FU_64_64_64_400_41_i0 (.R(out_fp_rdiv_expr_FU_64_64_64_400_41_i0_fp_rdiv_expr_FU_64_64_64_400_41_i0),
    .clock(clock),
    .reset(reset),
    .X(out_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1),
    .Y(out_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu__Z3lrnPKdPdi_9852_10774 (.out1(out_IUdata_converter_FU_2_i0_fu__Z3lrnPKdPdi_9852_10774),
    .in1(in_port_size));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z3lrnPKdPdi_9852_10775 (.out1(out_read_cond_FU_3_i0_fu__Z3lrnPKdPdi_9852_10775),
    .in1(out_ui_ne_expr_FU_32_0_32_50_i0_fu__Z3lrnPKdPdi_9852_14294));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z3lrnPKdPdi_9852_10797 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_54_i0_fu__Z3lrnPKdPdi_9852_10797),
    .in1(in_port_B),
    .in2(out_reg_1_reg_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z3lrnPKdPdi_9852_10812 (.out1(out_ui_lshift_expr_FU_32_0_32_49_i0_fu__Z3lrnPKdPdi_9852_10812),
    .in1(out_IUdata_converter_FU_2_i0_fu__Z3lrnPKdPdi_9852_10774),
    .in2(out_const_10));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z3lrnPKdPdi_9852_10819 (.out1(out_ui_plus_expr_FU_32_0_32_52_i0_fu__Z3lrnPKdPdi_9852_10819),
    .in1(out_reg_5_reg_5),
    .in2(out_const_9));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z3lrnPKdPdi_9852_10838 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_54_i1_fu__Z3lrnPKdPdi_9852_10838),
    .in1(in_port_A),
    .in2(out_reg_1_reg_1));
  fp_float_expr_32_64_FU_32_64_500 #(.BITSIZE_I(32),
    .BITSIZE_O(64)) fu__Z3lrnPKdPdi_9852_10919 (.O(out_fp_float_expr_32_64_FU_32_64_500_36_i0_fu__Z3lrnPKdPdi_9852_10919),
    .clock(clock),
    .reset(reset),
    .I(out_reg_14_reg_14));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z3lrnPKdPdi_9852_10929 (.out1(out_plus_expr_FU_32_0_32_44_i0_fu__Z3lrnPKdPdi_9852_10929),
    .in1(out_reg_14_reg_14),
    .in2(out_const_5));
  fp_float_expr_32_64_FU_32_64_500 #(.BITSIZE_I(32),
    .BITSIZE_O(64)) fu__Z3lrnPKdPdi_9852_10936 (.O(out_fp_float_expr_32_64_FU_32_64_500_36_i1_fu__Z3lrnPKdPdi_9852_10936),
    .clock(clock),
    .reset(reset),
    .I(out_reg_24_reg_24));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z3lrnPKdPdi_9852_10944 (.out1(out_plus_expr_FU_32_0_32_44_i1_fu__Z3lrnPKdPdi_9852_10944),
    .in1(out_reg_24_reg_24),
    .in2(out_const_5));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z3lrnPKdPdi_9852_10949 (.out1(out_read_cond_FU_9_i0_fu__Z3lrnPKdPdi_9852_10949),
    .in1(out_fp_eq_expr_FU_64_0_64_35_i0_fu__Z3lrnPKdPdi_9852_14296));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z3lrnPKdPdi_9852_10952 (.out1(out_read_cond_FU_11_i0_fu__Z3lrnPKdPdi_9852_10952),
    .in1(out_fp_le_expr_FU_64_64_64_500_37_i0_fu__Z3lrnPKdPdi_9852_14298));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu__Z3lrnPKdPdi_9852_10962 (.out1(out_plus_expr_FU_32_0_32_44_i2_fu__Z3lrnPKdPdi_9852_10962),
    .in1(out_reg_12_reg_12),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu__Z3lrnPKdPdi_9852_10964 (.out1(out_IUdata_converter_FU_22_i0_fu__Z3lrnPKdPdi_9852_10964),
    .in1(out_reg_12_reg_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z3lrnPKdPdi_9852_10965 (.out1(out_ui_bit_and_expr_FU_1_0_1_47_i0_fu__Z3lrnPKdPdi_9852_10965),
    .in1(out_IUdata_converter_FU_22_i0_fu__Z3lrnPKdPdi_9852_10964),
    .in2(out_const_9));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z3lrnPKdPdi_9852_10977 (.out1(out_read_cond_FU_19_i0_fu__Z3lrnPKdPdi_9852_10977),
    .in1(out_reg_17_reg_17));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z3lrnPKdPdi_9852_10979 (.out1(out_read_cond_FU_29_i0_fu__Z3lrnPKdPdi_9852_10979),
    .in1(out_reg_25_reg_25));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z3lrnPKdPdi_9852_10981 (.out1(out_read_cond_FU_31_i0_fu__Z3lrnPKdPdi_9852_10981),
    .in1(out_reg_28_reg_28));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu__Z3lrnPKdPdi_9852_10983 (.out1(out_ui_plus_expr_FU_32_0_32_52_i1_fu__Z3lrnPKdPdi_9852_10983),
    .in1(out_reg_2_reg_2),
    .in2(out_const_9));
  read_cond_FU #(.BITSIZE_in1(1)) fu__Z3lrnPKdPdi_9852_10984 (.out1(out_read_cond_FU_32_i0_fu__Z3lrnPKdPdi_9852_10984),
    .in1(out_ui_ne_expr_FU_32_32_32_51_i1_fu__Z3lrnPKdPdi_9852_14310));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z3lrnPKdPdi_9852_14066 (.out1(out_ui_lshift_expr_FU_32_0_32_49_i1_fu__Z3lrnPKdPdi_9852_14066),
    .in1(out_reg_5_reg_5),
    .in2(out_const_10));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z3lrnPKdPdi_9852_14069 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_54_i2_fu__Z3lrnPKdPdi_9852_14069),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_lshift_expr_FU_32_0_32_49_i1_fu__Z3lrnPKdPdi_9852_14066));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z3lrnPKdPdi_9852_14079 (.out1(out_ui_lshift_expr_FU_32_0_32_49_i2_fu__Z3lrnPKdPdi_9852_14079),
    .in1(out_reg_5_reg_5),
    .in2(out_const_10));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu__Z3lrnPKdPdi_9852_14082 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_54_i3_fu__Z3lrnPKdPdi_9852_14082),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_lshift_expr_FU_32_0_32_49_i2_fu__Z3lrnPKdPdi_9852_14079));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z3lrnPKdPdi_9852_14294 (.out1(out_ui_ne_expr_FU_32_0_32_50_i0_fu__Z3lrnPKdPdi_9852_14294),
    .in1(out_IUdata_converter_FU_2_i0_fu__Z3lrnPKdPdi_9852_10774),
    .in2(out_const_0));
  fp_eq_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(1)) fu__Z3lrnPKdPdi_9852_14296 (.out1(out_fp_eq_expr_FU_64_0_64_35_i0_fu__Z3lrnPKdPdi_9852_14296),
    .in1(out_fp_plus_expr_FU_64_64_64_500_40_i0_fp_plus_expr_FU_64_64_64_500_40_i0),
    .in2(out_const_1));
  fp_le_expr_FU_64_1_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(1)) fu__Z3lrnPKdPdi_9852_14298 (.R(out_fp_le_expr_FU_64_64_64_500_37_i0_fu__Z3lrnPKdPdi_9852_14298),
    .clock(clock),
    .reset(reset),
    .X(out_reg_9_reg_9),
    .Y(out_const_1));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z3lrnPKdPdi_9852_14300 (.out1(out_ge_expr_FU_32_32_32_42_i0_fu__Z3lrnPKdPdi_9852_14300),
    .in1(out_reg_12_reg_12),
    .in2(out_plus_expr_FU_32_0_32_44_i0_fu__Z3lrnPKdPdi_9852_10929));
  ui_eq_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z3lrnPKdPdi_9852_14302 (.out1(out_ui_eq_expr_FU_1_0_1_48_i0_fu__Z3lrnPKdPdi_9852_14302),
    .in1(out_ui_bit_and_expr_FU_1_0_1_47_i0_fu__Z3lrnPKdPdi_9852_10965),
    .in2(out_const_0));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu__Z3lrnPKdPdi_9852_14304 (.out1(out_ne_expr_FU_32_0_32_43_i0_fu__Z3lrnPKdPdi_9852_14304),
    .in1(out_plus_expr_FU_32_0_32_44_i2_fu__Z3lrnPKdPdi_9852_10962),
    .in2(out_const_8));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu__Z3lrnPKdPdi_9852_14306 (.out1(out_ne_expr_FU_32_0_32_43_i1_fu__Z3lrnPKdPdi_9852_14306),
    .in1(out_plus_expr_FU_32_0_32_44_i1_fu__Z3lrnPKdPdi_9852_10944),
    .in2(out_const_8));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z3lrnPKdPdi_9852_14308 (.out1(out_ui_ne_expr_FU_32_32_32_51_i0_fu__Z3lrnPKdPdi_9852_14308),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_0_reg_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu__Z3lrnPKdPdi_9852_14310 (.out1(out_ui_ne_expr_FU_32_32_32_51_i1_fu__Z3lrnPKdPdi_9852_14310),
    .in1(out_reg_2_reg_2),
    .in2(out_reg_0_reg_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu__Z3lrnPKdPdi_9852_14509 (.out1(out_ui_rshift_expr_FU_32_0_32_55_i0_fu__Z3lrnPKdPdi_9852_14509),
    .in1(out_reg_1_reg_1),
    .in2(out_const_10));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu__Z3lrnPKdPdi_9852_14514 (.out1(out_ui_rshift_expr_FU_32_0_32_55_i1_fu__Z3lrnPKdPdi_9852_14514),
    .in1(out_ui_lshift_expr_FU_32_0_32_49_i0_fu__Z3lrnPKdPdi_9852_10812),
    .in2(out_const_10));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu__Z3lrnPKdPdi_9852_14516 (.out1(out_ui_plus_expr_FU_32_32_32_53_i0_fu__Z3lrnPKdPdi_9852_14516),
    .in1(out_ui_rshift_expr_FU_32_0_32_55_i0_fu__Z3lrnPKdPdi_9852_14509),
    .in2(out_reg_3_reg_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu__Z3lrnPKdPdi_9852_14519 (.out1(out_ui_lshift_expr_FU_32_0_32_49_i3_fu__Z3lrnPKdPdi_9852_14519),
    .in1(out_ui_plus_expr_FU_32_32_32_53_i0_fu__Z3lrnPKdPdi_9852_14516),
    .in2(out_const_10));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu__Z3lrnPKdPdi_9852_15031 (.out1(out_multi_read_cond_FU_17_i0_fu__Z3lrnPKdPdi_9852_15031),
    .in1({out_reg_19_reg_19,
      out_reg_18_reg_18}));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu__Z3lrnPKdPdi_9852_15034 (.out1(out_truth_not_expr_FU_1_1_46_i0_fu__Z3lrnPKdPdi_9852_15034),
    .in1(out_ge_expr_FU_32_32_32_42_i0_fu__Z3lrnPKdPdi_9852_14300));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu__Z3lrnPKdPdi_9852_15037 (.out1(out_truth_and_expr_FU_1_1_1_45_i0_fu__Z3lrnPKdPdi_9852_15037),
    .in1(out_reg_16_reg_16),
    .in2(out_truth_not_expr_FU_1_1_46_i0_fu__Z3lrnPKdPdi_9852_15034));
  ASSIGN_REAL_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) fu__Z3lrnPKdPdi_9852_15039 (.out1(out_ASSIGN_REAL_FU_8_i0_fu__Z3lrnPKdPdi_9852_15039),
    .in1(out_BMEMORY_CTRLN_34_i0_BMEMORY_CTRLN_34_i0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_2_i0_fu__Z3lrnPKdPdi_9852_10774),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_52_reg_1_0_0_0),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_53_reg_10_0_0_1),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_fp_minus_expr_FU_64_64_64_500_38_i0_fp_minus_expr_FU_64_64_64_500_38_i0),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_55_reg_12_0_0_0),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_56_reg_13_0_0_0),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_57_reg_14_0_0_0),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_44_i2_fu__Z3lrnPKdPdi_9852_10962),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_1_0_1_48_i0_fu__Z3lrnPKdPdi_9852_14302),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_0_32_43_i0_fu__Z3lrnPKdPdi_9852_14304),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_32_32_42_i0_fu__Z3lrnPKdPdi_9852_14300),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_truth_and_expr_FU_1_1_1_45_i0_fu__Z3lrnPKdPdi_9852_15037),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_63_reg_2_0_0_0),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_fp_float_expr_32_64_FU_32_64_500_36_i0_fu__Z3lrnPKdPdi_9852_10919),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_65_reg_21_0_0_0),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_66_reg_22_0_0_0),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_67_reg_23_0_0_0),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_68_reg_24_0_0_0),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_0_32_43_i1_fu__Z3lrnPKdPdi_9852_14306),
    .wenable(wrenable_reg_25));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_fp_float_expr_32_64_FU_32_64_500_36_i1_fu__Z3lrnPKdPdi_9852_10936),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_71_reg_27_0_0_0),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_51_i0_fu__Z3lrnPKdPdi_9852_14308),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_55_i1_fu__Z3lrnPKdPdi_9852_14514),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_54_i0_fu__Z3lrnPKdPdi_9852_10797),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_75_reg_5_0_0_0),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_54_i1_fu__Z3lrnPKdPdi_9852_10838),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_54_i3_fu__Z3lrnPKdPdi_9852_14082),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_34_i0_BMEMORY_CTRLN_34_i0),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_fp_plus_expr_FU_64_64_64_500_40_i0_fp_plus_expr_FU_64_64_64_500_40_i0),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION__Z3lrnPKdPdi_9852_10775 = out_read_cond_FU_3_i0_fu__Z3lrnPKdPdi_9852_10775;
  assign OUT_CONDITION__Z3lrnPKdPdi_9852_10949 = out_read_cond_FU_9_i0_fu__Z3lrnPKdPdi_9852_10949;
  assign OUT_CONDITION__Z3lrnPKdPdi_9852_10952 = out_read_cond_FU_11_i0_fu__Z3lrnPKdPdi_9852_10952;
  assign OUT_CONDITION__Z3lrnPKdPdi_9852_10977 = out_read_cond_FU_19_i0_fu__Z3lrnPKdPdi_9852_10977;
  assign OUT_CONDITION__Z3lrnPKdPdi_9852_10979 = out_read_cond_FU_29_i0_fu__Z3lrnPKdPdi_9852_10979;
  assign OUT_CONDITION__Z3lrnPKdPdi_9852_10981 = out_read_cond_FU_31_i0_fu__Z3lrnPKdPdi_9852_10981;
  assign OUT_CONDITION__Z3lrnPKdPdi_9852_10984 = out_read_cond_FU_32_i0_fu__Z3lrnPKdPdi_9852_10984;
  assign OUT_MULTIIF__Z3lrnPKdPdi_9852_15031 = out_multi_read_cond_FU_17_i0_fu__Z3lrnPKdPdi_9852_15031;

endmodule

// FSM based controller description for _Z3lrnPKdPdi
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller__Z3lrnPKdPdi(done_port,
  fuselector_BMEMORY_CTRLN_34_i0_LOAD,
  fuselector_BMEMORY_CTRLN_34_i0_STORE,
  selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0,
  selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0,
  selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0,
  selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1,
  selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0,
  selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0,
  selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0,
  selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1,
  selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0,
  selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1,
  selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0,
  selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1,
  selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0,
  selector_MUX_52_reg_1_0_0_0,
  selector_MUX_53_reg_10_0_0_0,
  selector_MUX_53_reg_10_0_0_1,
  selector_MUX_55_reg_12_0_0_0,
  selector_MUX_56_reg_13_0_0_0,
  selector_MUX_57_reg_14_0_0_0,
  selector_MUX_63_reg_2_0_0_0,
  selector_MUX_65_reg_21_0_0_0,
  selector_MUX_66_reg_22_0_0_0,
  selector_MUX_67_reg_23_0_0_0,
  selector_MUX_68_reg_24_0_0_0,
  selector_MUX_71_reg_27_0_0_0,
  selector_MUX_75_reg_5_0_0_0,
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
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10775,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10949,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10952,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10977,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10979,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10981,
  OUT_CONDITION__Z3lrnPKdPdi_9852_10984,
  OUT_MULTIIF__Z3lrnPKdPdi_9852_15031,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION__Z3lrnPKdPdi_9852_10775;
  input OUT_CONDITION__Z3lrnPKdPdi_9852_10949;
  input OUT_CONDITION__Z3lrnPKdPdi_9852_10952;
  input OUT_CONDITION__Z3lrnPKdPdi_9852_10977;
  input OUT_CONDITION__Z3lrnPKdPdi_9852_10979;
  input OUT_CONDITION__Z3lrnPKdPdi_9852_10981;
  input OUT_CONDITION__Z3lrnPKdPdi_9852_10984;
  input [1:0] OUT_MULTIIF__Z3lrnPKdPdi_9852_15031;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_34_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_34_i0_STORE;
  output selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0;
  output selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0;
  output selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0;
  output selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1;
  output selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0;
  output selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0;
  output selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1;
  output selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2;
  output selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0;
  output selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0;
  output selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0;
  output selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1;
  output selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0;
  output selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1;
  output selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0;
  output selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1;
  output selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0;
  output selector_MUX_52_reg_1_0_0_0;
  output selector_MUX_53_reg_10_0_0_0;
  output selector_MUX_53_reg_10_0_0_1;
  output selector_MUX_55_reg_12_0_0_0;
  output selector_MUX_56_reg_13_0_0_0;
  output selector_MUX_57_reg_14_0_0_0;
  output selector_MUX_63_reg_2_0_0_0;
  output selector_MUX_65_reg_21_0_0_0;
  output selector_MUX_66_reg_22_0_0_0;
  output selector_MUX_67_reg_23_0_0_0;
  output selector_MUX_68_reg_24_0_0_0;
  output selector_MUX_71_reg_27_0_0_0;
  output selector_MUX_75_reg_5_0_0_0;
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
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [7:0] S_0 = 8'd0,
    S_237 = 8'd237,
    S_236 = 8'd236,
    S_1 = 8'd1,
    S_2 = 8'd2,
    S_3 = 8'd3,
    S_4 = 8'd4,
    S_5 = 8'd5,
    S_6 = 8'd6,
    S_7 = 8'd7,
    S_8 = 8'd8,
    S_9 = 8'd9,
    S_10 = 8'd10,
    S_11 = 8'd11,
    S_12 = 8'd12,
    S_13 = 8'd13,
    S_14 = 8'd14,
    S_15 = 8'd15,
    S_16 = 8'd16,
    S_17 = 8'd17,
    S_18 = 8'd18,
    S_19 = 8'd19,
    S_20 = 8'd20,
    S_21 = 8'd21,
    S_22 = 8'd22,
    S_23 = 8'd23,
    S_24 = 8'd24,
    S_25 = 8'd25,
    S_26 = 8'd26,
    S_27 = 8'd27,
    S_28 = 8'd28,
    S_29 = 8'd29,
    S_30 = 8'd30,
    S_31 = 8'd31,
    S_32 = 8'd32,
    S_33 = 8'd33,
    S_34 = 8'd34,
    S_35 = 8'd35,
    S_36 = 8'd36,
    S_37 = 8'd37,
    S_38 = 8'd38,
    S_39 = 8'd39,
    S_40 = 8'd40,
    S_41 = 8'd41,
    S_42 = 8'd42,
    S_43 = 8'd43,
    S_44 = 8'd44,
    S_45 = 8'd45,
    S_46 = 8'd46,
    S_47 = 8'd47,
    S_48 = 8'd48,
    S_49 = 8'd49,
    S_50 = 8'd50,
    S_51 = 8'd51,
    S_52 = 8'd52,
    S_53 = 8'd53,
    S_54 = 8'd54,
    S_55 = 8'd55,
    S_56 = 8'd56,
    S_57 = 8'd57,
    S_58 = 8'd58,
    S_59 = 8'd59,
    S_60 = 8'd60,
    S_61 = 8'd61,
    S_137 = 8'd137,
    S_62 = 8'd62,
    S_63 = 8'd63,
    S_64 = 8'd64,
    S_65 = 8'd65,
    S_66 = 8'd66,
    S_67 = 8'd67,
    S_68 = 8'd68,
    S_69 = 8'd69,
    S_70 = 8'd70,
    S_71 = 8'd71,
    S_72 = 8'd72,
    S_73 = 8'd73,
    S_74 = 8'd74,
    S_75 = 8'd75,
    S_76 = 8'd76,
    S_77 = 8'd77,
    S_78 = 8'd78,
    S_79 = 8'd79,
    S_80 = 8'd80,
    S_81 = 8'd81,
    S_82 = 8'd82,
    S_83 = 8'd83,
    S_84 = 8'd84,
    S_85 = 8'd85,
    S_86 = 8'd86,
    S_87 = 8'd87,
    S_88 = 8'd88,
    S_89 = 8'd89,
    S_90 = 8'd90,
    S_91 = 8'd91,
    S_92 = 8'd92,
    S_93 = 8'd93,
    S_94 = 8'd94,
    S_95 = 8'd95,
    S_96 = 8'd96,
    S_97 = 8'd97,
    S_98 = 8'd98,
    S_99 = 8'd99,
    S_100 = 8'd100,
    S_101 = 8'd101,
    S_102 = 8'd102,
    S_103 = 8'd103,
    S_120 = 8'd120,
    S_121 = 8'd121,
    S_122 = 8'd122,
    S_123 = 8'd123,
    S_124 = 8'd124,
    S_125 = 8'd125,
    S_126 = 8'd126,
    S_127 = 8'd127,
    S_128 = 8'd128,
    S_129 = 8'd129,
    S_130 = 8'd130,
    S_131 = 8'd131,
    S_132 = 8'd132,
    S_133 = 8'd133,
    S_134 = 8'd134,
    S_135 = 8'd135,
    S_104 = 8'd104,
    S_105 = 8'd105,
    S_106 = 8'd106,
    S_107 = 8'd107,
    S_108 = 8'd108,
    S_109 = 8'd109,
    S_110 = 8'd110,
    S_111 = 8'd111,
    S_112 = 8'd112,
    S_113 = 8'd113,
    S_114 = 8'd114,
    S_115 = 8'd115,
    S_116 = 8'd116,
    S_117 = 8'd117,
    S_118 = 8'd118,
    S_119 = 8'd119,
    S_136 = 8'd136,
    S_138 = 8'd138,
    S_139 = 8'd139,
    S_140 = 8'd140,
    S_141 = 8'd141,
    S_142 = 8'd142,
    S_143 = 8'd143,
    S_144 = 8'd144,
    S_145 = 8'd145,
    S_146 = 8'd146,
    S_147 = 8'd147,
    S_148 = 8'd148,
    S_149 = 8'd149,
    S_150 = 8'd150,
    S_151 = 8'd151,
    S_152 = 8'd152,
    S_153 = 8'd153,
    S_154 = 8'd154,
    S_155 = 8'd155,
    S_156 = 8'd156,
    S_157 = 8'd157,
    S_158 = 8'd158,
    S_159 = 8'd159,
    S_160 = 8'd160,
    S_161 = 8'd161,
    S_162 = 8'd162,
    S_163 = 8'd163,
    S_164 = 8'd164,
    S_165 = 8'd165,
    S_166 = 8'd166,
    S_167 = 8'd167,
    S_168 = 8'd168,
    S_169 = 8'd169,
    S_170 = 8'd170,
    S_171 = 8'd171,
    S_172 = 8'd172,
    S_173 = 8'd173,
    S_174 = 8'd174,
    S_175 = 8'd175,
    S_176 = 8'd176,
    S_177 = 8'd177,
    S_178 = 8'd178,
    S_179 = 8'd179,
    S_180 = 8'd180,
    S_181 = 8'd181,
    S_182 = 8'd182,
    S_183 = 8'd183,
    S_184 = 8'd184,
    S_185 = 8'd185,
    S_186 = 8'd186,
    S_187 = 8'd187,
    S_188 = 8'd188,
    S_189 = 8'd189,
    S_190 = 8'd190,
    S_191 = 8'd191,
    S_192 = 8'd192,
    S_193 = 8'd193,
    S_194 = 8'd194,
    S_195 = 8'd195,
    S_196 = 8'd196,
    S_197 = 8'd197,
    S_198 = 8'd198,
    S_199 = 8'd199,
    S_200 = 8'd200,
    S_201 = 8'd201,
    S_202 = 8'd202,
    S_203 = 8'd203,
    S_204 = 8'd204,
    S_205 = 8'd205,
    S_206 = 8'd206,
    S_207 = 8'd207,
    S_208 = 8'd208,
    S_209 = 8'd209,
    S_210 = 8'd210,
    S_211 = 8'd211,
    S_212 = 8'd212,
    S_213 = 8'd213,
    S_214 = 8'd214,
    S_215 = 8'd215,
    S_216 = 8'd216,
    S_217 = 8'd217,
    S_218 = 8'd218,
    S_219 = 8'd219,
    S_220 = 8'd220,
    S_221 = 8'd221,
    S_222 = 8'd222,
    S_223 = 8'd223,
    S_224 = 8'd224,
    S_225 = 8'd225,
    S_226 = 8'd226,
    S_227 = 8'd227,
    S_228 = 8'd228,
    S_229 = 8'd229,
    S_230 = 8'd230,
    S_231 = 8'd231,
    S_232 = 8'd232,
    S_233 = 8'd233,
    S_234 = 8'd234,
    S_235 = 8'd235,
    S_238 = 8'd238;
  reg [7:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_34_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_34_i0_STORE;
  reg selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0;
  reg selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0;
  reg selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0;
  reg selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1;
  reg selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0;
  reg selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0;
  reg selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1;
  reg selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2;
  reg selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0;
  reg selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0;
  reg selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0;
  reg selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1;
  reg selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0;
  reg selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1;
  reg selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0;
  reg selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1;
  reg selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0;
  reg selector_MUX_52_reg_1_0_0_0;
  reg selector_MUX_53_reg_10_0_0_0;
  reg selector_MUX_53_reg_10_0_0_1;
  reg selector_MUX_55_reg_12_0_0_0;
  reg selector_MUX_56_reg_13_0_0_0;
  reg selector_MUX_57_reg_14_0_0_0;
  reg selector_MUX_63_reg_2_0_0_0;
  reg selector_MUX_65_reg_21_0_0_0;
  reg selector_MUX_66_reg_22_0_0_0;
  reg selector_MUX_67_reg_23_0_0_0;
  reg selector_MUX_68_reg_24_0_0_0;
  reg selector_MUX_71_reg_27_0_0_0;
  reg selector_MUX_75_reg_5_0_0_0;
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
    fuselector_BMEMORY_CTRLN_34_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_34_i0_STORE = 1'b0;
    selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0 = 1'b0;
    selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0 = 1'b0;
    selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0 = 1'b0;
    selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1 = 1'b0;
    selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0 = 1'b0;
    selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0 = 1'b0;
    selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1 = 1'b0;
    selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2 = 1'b0;
    selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0 = 1'b0;
    selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0 = 1'b0;
    selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0 = 1'b0;
    selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1 = 1'b0;
    selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0 = 1'b0;
    selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1 = 1'b0;
    selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0 = 1'b0;
    selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0 = 1'b0;
    selector_MUX_52_reg_1_0_0_0 = 1'b0;
    selector_MUX_53_reg_10_0_0_0 = 1'b0;
    selector_MUX_53_reg_10_0_0_1 = 1'b0;
    selector_MUX_55_reg_12_0_0_0 = 1'b0;
    selector_MUX_56_reg_13_0_0_0 = 1'b0;
    selector_MUX_57_reg_14_0_0_0 = 1'b0;
    selector_MUX_63_reg_2_0_0_0 = 1'b0;
    selector_MUX_65_reg_21_0_0_0 = 1'b0;
    selector_MUX_66_reg_22_0_0_0 = 1'b0;
    selector_MUX_67_reg_23_0_0_0 = 1'b0;
    selector_MUX_68_reg_24_0_0_0 = 1'b0;
    selector_MUX_71_reg_27_0_0_0 = 1'b0;
    selector_MUX_75_reg_5_0_0_0 = 1'b0;
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
          if (OUT_CONDITION__Z3lrnPKdPdi_9852_10775 == 1'b1)
            begin
              _next_state = S_236;
            end
          else
            begin
              _next_state = S_237;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
              wrenable_reg_2 = 1'b0;
              wrenable_reg_3 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_237 :
        begin
          _next_state = S_0;
        end
      S_236 :
        begin
          selector_MUX_52_reg_1_0_0_0 = 1'b1;
          selector_MUX_63_reg_2_0_0_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          _next_state = S_1;
        end
      S_1 :
        begin
          fuselector_BMEMORY_CTRLN_34_i0_LOAD = 1'b1;
          selector_MUX_75_reg_5_0_0_0 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_7 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0 = 1'b1;
          selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1 = 1'b1;
          selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0 = 1'b1;
          wrenable_reg_8 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          _next_state = S_4;
        end
      S_4 :
        begin
          _next_state = S_5;
        end
      S_5 :
        begin
          _next_state = S_6;
        end
      S_6 :
        begin
          _next_state = S_7;
        end
      S_7 :
        begin
          _next_state = S_8;
        end
      S_8 :
        begin
          selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1 = 1'b1;
          selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          _next_state = S_10;
        end
      S_10 :
        begin
          _next_state = S_11;
        end
      S_11 :
        begin
          _next_state = S_12;
        end
      S_12 :
        begin
          _next_state = S_13;
        end
      S_13 :
        begin
          _next_state = S_14;
        end
      S_14 :
        begin
          selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1 = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          _next_state = S_16;
        end
      S_16 :
        begin
          _next_state = S_17;
        end
      S_17 :
        begin
          _next_state = S_18;
        end
      S_18 :
        begin
          _next_state = S_19;
        end
      S_19 :
        begin
          _next_state = S_20;
        end
      S_20 :
        begin
          _next_state = S_21;
        end
      S_21 :
        begin
          _next_state = S_22;
        end
      S_22 :
        begin
          _next_state = S_23;
        end
      S_23 :
        begin
          _next_state = S_24;
        end
      S_24 :
        begin
          _next_state = S_25;
        end
      S_25 :
        begin
          _next_state = S_26;
        end
      S_26 :
        begin
          _next_state = S_27;
        end
      S_27 :
        begin
          _next_state = S_28;
        end
      S_28 :
        begin
          _next_state = S_29;
        end
      S_29 :
        begin
          selector_MUX_71_reg_27_0_0_0 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION__Z3lrnPKdPdi_9852_10949 == 1'b1)
            begin
              _next_state = S_203;
              wrenable_reg_9 = 1'b0;
            end
          else
            begin
              _next_state = S_30;
              selector_MUX_71_reg_27_0_0_0 = 1'b0;
              wrenable_reg_27 = 1'b0;
            end
        end
      S_30 :
        begin
          _next_state = S_31;
        end
      S_31 :
        begin
          _next_state = S_32;
        end
      S_32 :
        begin
          _next_state = S_33;
        end
      S_33 :
        begin
          _next_state = S_34;
        end
      S_34 :
        begin
          _next_state = S_35;
        end
      S_35 :
        begin
          _next_state = S_36;
        end
      S_36 :
        begin
          _next_state = S_37;
        end
      S_37 :
        begin
          _next_state = S_38;
        end
      S_38 :
        begin
          _next_state = S_39;
        end
      S_39 :
        begin
          _next_state = S_40;
        end
      S_40 :
        begin
          _next_state = S_41;
        end
      S_41 :
        begin
          _next_state = S_42;
        end
      S_42 :
        begin
          _next_state = S_43;
        end
      S_43 :
        begin
          _next_state = S_44;
        end
      S_44 :
        begin
          _next_state = S_45;
        end
      S_45 :
        begin
          selector_MUX_65_reg_21_0_0_0 = 1'b1;
          wrenable_reg_21 = 1'b1;
          if (OUT_CONDITION__Z3lrnPKdPdi_9852_10952 == 1'b1)
            begin
              _next_state = S_145;
            end
          else
            begin
              _next_state = S_46;
              selector_MUX_65_reg_21_0_0_0 = 1'b0;
              wrenable_reg_21 = 1'b0;
            end
        end
      S_46 :
        begin
          selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0 = 1'b1;
          _next_state = S_47;
        end
      S_47 :
        begin
          _next_state = S_48;
        end
      S_48 :
        begin
          _next_state = S_49;
        end
      S_49 :
        begin
          _next_state = S_50;
        end
      S_50 :
        begin
          _next_state = S_51;
        end
      S_51 :
        begin
          _next_state = S_52;
        end
      S_52 :
        begin
          _next_state = S_53;
        end
      S_53 :
        begin
          _next_state = S_54;
        end
      S_54 :
        begin
          _next_state = S_55;
        end
      S_55 :
        begin
          _next_state = S_56;
        end
      S_56 :
        begin
          _next_state = S_57;
        end
      S_57 :
        begin
          _next_state = S_58;
        end
      S_58 :
        begin
          _next_state = S_59;
        end
      S_59 :
        begin
          _next_state = S_60;
        end
      S_60 :
        begin
          _next_state = S_61;
        end
      S_61 :
        begin
          selector_MUX_53_reg_10_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          _next_state = S_137;
        end
      S_137 :
        begin
          selector_MUX_56_reg_13_0_0_0 = 1'b1;
          selector_MUX_57_reg_14_0_0_0 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          _next_state = S_62;
        end
      S_62 :
        begin
          wrenable_reg_14 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          _next_state = S_63;
        end
      S_63 :
        begin
          _next_state = S_64;
        end
      S_64 :
        begin
          _next_state = S_65;
        end
      S_65 :
        begin
          wrenable_reg_20 = 1'b1;
          _next_state = S_66;
        end
      S_66 :
        begin
          selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1 = 1'b1;
          selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1 = 1'b1;
          _next_state = S_67;
        end
      S_67 :
        begin
          _next_state = S_68;
        end
      S_68 :
        begin
          _next_state = S_69;
        end
      S_69 :
        begin
          _next_state = S_70;
        end
      S_70 :
        begin
          _next_state = S_71;
        end
      S_71 :
        begin
          _next_state = S_72;
        end
      S_72 :
        begin
          _next_state = S_73;
        end
      S_73 :
        begin
          _next_state = S_74;
        end
      S_74 :
        begin
          _next_state = S_75;
        end
      S_75 :
        begin
          _next_state = S_76;
        end
      S_76 :
        begin
          _next_state = S_77;
        end
      S_77 :
        begin
          _next_state = S_78;
        end
      S_78 :
        begin
          _next_state = S_79;
        end
      S_79 :
        begin
          _next_state = S_80;
        end
      S_80 :
        begin
          _next_state = S_81;
        end
      S_81 :
        begin
          _next_state = S_82;
        end
      S_82 :
        begin
          _next_state = S_83;
        end
      S_83 :
        begin
          _next_state = S_84;
        end
      S_84 :
        begin
          _next_state = S_85;
        end
      S_85 :
        begin
          _next_state = S_86;
        end
      S_86 :
        begin
          _next_state = S_87;
        end
      S_87 :
        begin
          _next_state = S_88;
        end
      S_88 :
        begin
          _next_state = S_89;
        end
      S_89 :
        begin
          _next_state = S_90;
        end
      S_90 :
        begin
          _next_state = S_91;
        end
      S_91 :
        begin
          _next_state = S_92;
        end
      S_92 :
        begin
          _next_state = S_93;
        end
      S_93 :
        begin
          _next_state = S_94;
        end
      S_94 :
        begin
          _next_state = S_95;
        end
      S_95 :
        begin
          _next_state = S_96;
        end
      S_96 :
        begin
          _next_state = S_97;
        end
      S_97 :
        begin
          _next_state = S_98;
        end
      S_98 :
        begin
          _next_state = S_99;
        end
      S_99 :
        begin
          _next_state = S_100;
        end
      S_100 :
        begin
          _next_state = S_101;
        end
      S_101 :
        begin
          _next_state = S_102;
        end
      S_102 :
        begin
          _next_state = S_103;
        end
      S_103 :
        begin
          wrenable_reg_13 = 1'b1;
          casez (OUT_MULTIIF__Z3lrnPKdPdi_9852_15031)
            2'b01 :
              begin
                _next_state = S_62;
              end
            2'b10 :
              begin
                _next_state = S_104;
              end
            default:
              begin
                _next_state = S_120;
              end
          endcase
        end
      S_120 :
        begin
          selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0 = 1'b1;
          _next_state = S_121;
        end
      S_121 :
        begin
          _next_state = S_122;
        end
      S_122 :
        begin
          _next_state = S_123;
        end
      S_123 :
        begin
          _next_state = S_124;
        end
      S_124 :
        begin
          _next_state = S_125;
        end
      S_125 :
        begin
          _next_state = S_126;
        end
      S_126 :
        begin
          _next_state = S_127;
        end
      S_127 :
        begin
          _next_state = S_128;
        end
      S_128 :
        begin
          _next_state = S_129;
        end
      S_129 :
        begin
          _next_state = S_130;
        end
      S_130 :
        begin
          _next_state = S_131;
        end
      S_131 :
        begin
          _next_state = S_132;
        end
      S_132 :
        begin
          _next_state = S_133;
        end
      S_133 :
        begin
          _next_state = S_134;
        end
      S_134 :
        begin
          _next_state = S_135;
        end
      S_135 :
        begin
          selector_MUX_53_reg_10_0_0_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          _next_state = S_136;
        end
      S_104 :
        begin
          selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0 = 1'b1;
          _next_state = S_105;
        end
      S_105 :
        begin
          _next_state = S_106;
        end
      S_106 :
        begin
          _next_state = S_107;
        end
      S_107 :
        begin
          _next_state = S_108;
        end
      S_108 :
        begin
          _next_state = S_109;
        end
      S_109 :
        begin
          _next_state = S_110;
        end
      S_110 :
        begin
          _next_state = S_111;
        end
      S_111 :
        begin
          _next_state = S_112;
        end
      S_112 :
        begin
          _next_state = S_113;
        end
      S_113 :
        begin
          _next_state = S_114;
        end
      S_114 :
        begin
          _next_state = S_115;
        end
      S_115 :
        begin
          _next_state = S_116;
        end
      S_116 :
        begin
          _next_state = S_117;
        end
      S_117 :
        begin
          _next_state = S_118;
        end
      S_118 :
        begin
          _next_state = S_119;
        end
      S_119 :
        begin
          wrenable_reg_10 = 1'b1;
          _next_state = S_136;
        end
      S_136 :
        begin
          selector_MUX_55_reg_12_0_0_0 = 1'b1;
          wrenable_reg_12 = 1'b1;
          if (OUT_CONDITION__Z3lrnPKdPdi_9852_10977 == 1'b1)
            begin
              _next_state = S_137;
            end
          else
            begin
              _next_state = S_138;
              selector_MUX_55_reg_12_0_0_0 = 1'b0;
              wrenable_reg_12 = 1'b0;
            end
        end
      S_138 :
        begin
          selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0 = 1'b1;
          selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0 = 1'b1;
          selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2 = 1'b1;
          _next_state = S_139;
        end
      S_139 :
        begin
          _next_state = S_140;
        end
      S_140 :
        begin
          _next_state = S_141;
        end
      S_141 :
        begin
          _next_state = S_142;
        end
      S_142 :
        begin
          _next_state = S_143;
        end
      S_143 :
        begin
          _next_state = S_144;
        end
      S_144 :
        begin
          wrenable_reg_21 = 1'b1;
          _next_state = S_145;
        end
      S_145 :
        begin
          selector_MUX_66_reg_22_0_0_0 = 1'b1;
          selector_MUX_67_reg_23_0_0_0 = 1'b1;
          selector_MUX_68_reg_24_0_0_0 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          _next_state = S_146;
        end
      S_146 :
        begin
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          _next_state = S_147;
        end
      S_147 :
        begin
          _next_state = S_148;
        end
      S_148 :
        begin
          _next_state = S_149;
        end
      S_149 :
        begin
          wrenable_reg_26 = 1'b1;
          _next_state = S_150;
        end
      S_150 :
        begin
          _next_state = S_151;
        end
      S_151 :
        begin
          _next_state = S_152;
        end
      S_152 :
        begin
          _next_state = S_153;
        end
      S_153 :
        begin
          _next_state = S_154;
        end
      S_154 :
        begin
          _next_state = S_155;
        end
      S_155 :
        begin
          _next_state = S_156;
        end
      S_156 :
        begin
          _next_state = S_157;
        end
      S_157 :
        begin
          _next_state = S_158;
        end
      S_158 :
        begin
          _next_state = S_159;
        end
      S_159 :
        begin
          _next_state = S_160;
        end
      S_160 :
        begin
          _next_state = S_161;
        end
      S_161 :
        begin
          _next_state = S_162;
        end
      S_162 :
        begin
          _next_state = S_163;
        end
      S_163 :
        begin
          _next_state = S_164;
        end
      S_164 :
        begin
          _next_state = S_165;
        end
      S_165 :
        begin
          _next_state = S_166;
        end
      S_166 :
        begin
          _next_state = S_167;
        end
      S_167 :
        begin
          _next_state = S_168;
        end
      S_168 :
        begin
          _next_state = S_169;
        end
      S_169 :
        begin
          _next_state = S_170;
        end
      S_170 :
        begin
          _next_state = S_171;
        end
      S_171 :
        begin
          _next_state = S_172;
        end
      S_172 :
        begin
          _next_state = S_173;
        end
      S_173 :
        begin
          _next_state = S_174;
        end
      S_174 :
        begin
          _next_state = S_175;
        end
      S_175 :
        begin
          _next_state = S_176;
        end
      S_176 :
        begin
          _next_state = S_177;
        end
      S_177 :
        begin
          _next_state = S_178;
        end
      S_178 :
        begin
          _next_state = S_179;
        end
      S_179 :
        begin
          _next_state = S_180;
        end
      S_180 :
        begin
          _next_state = S_181;
        end
      S_181 :
        begin
          selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0 = 1'b1;
          _next_state = S_182;
        end
      S_182 :
        begin
          _next_state = S_183;
        end
      S_183 :
        begin
          _next_state = S_184;
        end
      S_184 :
        begin
          _next_state = S_185;
        end
      S_185 :
        begin
          _next_state = S_186;
        end
      S_186 :
        begin
          _next_state = S_187;
        end
      S_187 :
        begin
          selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0 = 1'b1;
          wrenable_reg_23 = 1'b1;
          _next_state = S_188;
        end
      S_188 :
        begin
          _next_state = S_189;
        end
      S_189 :
        begin
          _next_state = S_190;
        end
      S_190 :
        begin
          _next_state = S_191;
        end
      S_191 :
        begin
          _next_state = S_192;
        end
      S_192 :
        begin
          _next_state = S_193;
        end
      S_193 :
        begin
          _next_state = S_194;
        end
      S_194 :
        begin
          _next_state = S_195;
        end
      S_195 :
        begin
          _next_state = S_196;
        end
      S_196 :
        begin
          _next_state = S_197;
        end
      S_197 :
        begin
          _next_state = S_198;
        end
      S_198 :
        begin
          _next_state = S_199;
        end
      S_199 :
        begin
          _next_state = S_200;
        end
      S_200 :
        begin
          _next_state = S_201;
        end
      S_201 :
        begin
          _next_state = S_202;
        end
      S_202 :
        begin
          wrenable_reg_22 = 1'b1;
          wrenable_reg_27 = 1'b1;
          if (OUT_CONDITION__Z3lrnPKdPdi_9852_10979 == 1'b1)
            begin
              _next_state = S_146;
              wrenable_reg_27 = 1'b0;
            end
          else
            begin
              _next_state = S_203;
              wrenable_reg_22 = 1'b0;
            end
        end
      S_203 :
        begin
          selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0 = 1'b1;
          selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0 = 1'b1;
          wrenable_reg_28 = 1'b1;
          _next_state = S_204;
        end
      S_204 :
        begin
          _next_state = S_205;
        end
      S_205 :
        begin
          _next_state = S_206;
        end
      S_206 :
        begin
          _next_state = S_207;
        end
      S_207 :
        begin
          _next_state = S_208;
        end
      S_208 :
        begin
          _next_state = S_209;
        end
      S_209 :
        begin
          _next_state = S_210;
        end
      S_210 :
        begin
          _next_state = S_211;
        end
      S_211 :
        begin
          _next_state = S_212;
        end
      S_212 :
        begin
          _next_state = S_213;
        end
      S_213 :
        begin
          _next_state = S_214;
        end
      S_214 :
        begin
          _next_state = S_215;
        end
      S_215 :
        begin
          _next_state = S_216;
        end
      S_216 :
        begin
          _next_state = S_217;
        end
      S_217 :
        begin
          _next_state = S_218;
        end
      S_218 :
        begin
          _next_state = S_219;
        end
      S_219 :
        begin
          _next_state = S_220;
        end
      S_220 :
        begin
          _next_state = S_221;
        end
      S_221 :
        begin
          _next_state = S_222;
        end
      S_222 :
        begin
          _next_state = S_223;
        end
      S_223 :
        begin
          _next_state = S_224;
        end
      S_224 :
        begin
          _next_state = S_225;
        end
      S_225 :
        begin
          _next_state = S_226;
        end
      S_226 :
        begin
          _next_state = S_227;
        end
      S_227 :
        begin
          _next_state = S_228;
        end
      S_228 :
        begin
          _next_state = S_229;
        end
      S_229 :
        begin
          _next_state = S_230;
        end
      S_230 :
        begin
          _next_state = S_231;
        end
      S_231 :
        begin
          _next_state = S_232;
        end
      S_232 :
        begin
          _next_state = S_233;
        end
      S_233 :
        begin
          _next_state = S_234;
        end
      S_234 :
        begin
          fuselector_BMEMORY_CTRLN_34_i0_STORE = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0 = 1'b1;
          if (OUT_CONDITION__Z3lrnPKdPdi_9852_10981 == 1'b1)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_235;
            end
        end
      S_235 :
        begin
          if (OUT_CONDITION__Z3lrnPKdPdi_9852_10984 == 1'b1)
            begin
              _next_state = S_236;
            end
          else
            begin
              _next_state = S_238;
              done_port = 1'b1;
            end
        end
      S_238 :
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

// Top component for _Z3lrnPKdPdi
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _Z3lrnPKdPdi(clock,
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
  input signed [31:0] size;
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
  wire OUT_CONDITION__Z3lrnPKdPdi_9852_10775;
  wire OUT_CONDITION__Z3lrnPKdPdi_9852_10949;
  wire OUT_CONDITION__Z3lrnPKdPdi_9852_10952;
  wire OUT_CONDITION__Z3lrnPKdPdi_9852_10977;
  wire OUT_CONDITION__Z3lrnPKdPdi_9852_10979;
  wire OUT_CONDITION__Z3lrnPKdPdi_9852_10981;
  wire OUT_CONDITION__Z3lrnPKdPdi_9852_10984;
  wire [1:0] OUT_MULTIIF__Z3lrnPKdPdi_9852_15031;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_34_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_34_i0_STORE;
  wire selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0;
  wire selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0;
  wire selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0;
  wire selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1;
  wire selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0;
  wire selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0;
  wire selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1;
  wire selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2;
  wire selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0;
  wire selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0;
  wire selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0;
  wire selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1;
  wire selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0;
  wire selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1;
  wire selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0;
  wire selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1;
  wire selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0;
  wire selector_MUX_52_reg_1_0_0_0;
  wire selector_MUX_53_reg_10_0_0_0;
  wire selector_MUX_53_reg_10_0_0_1;
  wire selector_MUX_55_reg_12_0_0_0;
  wire selector_MUX_56_reg_13_0_0_0;
  wire selector_MUX_57_reg_14_0_0_0;
  wire selector_MUX_63_reg_2_0_0_0;
  wire selector_MUX_65_reg_21_0_0_0;
  wire selector_MUX_66_reg_22_0_0_0;
  wire selector_MUX_67_reg_23_0_0_0;
  wire selector_MUX_68_reg_24_0_0_0;
  wire selector_MUX_71_reg_27_0_0_0;
  wire selector_MUX_75_reg_5_0_0_0;
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
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller__Z3lrnPKdPdi Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_34_i0_LOAD(fuselector_BMEMORY_CTRLN_34_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_34_i0_STORE(fuselector_BMEMORY_CTRLN_34_i0_STORE),
    .selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0(selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0),
    .selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0(selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0),
    .selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0),
    .selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1),
    .selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0),
    .selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0(selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0),
    .selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0(selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0),
    .selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1(selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1),
    .selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0(selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0),
    .selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1(selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1),
    .selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0(selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0),
    .selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1(selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1),
    .selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0(selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0),
    .selector_MUX_52_reg_1_0_0_0(selector_MUX_52_reg_1_0_0_0),
    .selector_MUX_53_reg_10_0_0_0(selector_MUX_53_reg_10_0_0_0),
    .selector_MUX_53_reg_10_0_0_1(selector_MUX_53_reg_10_0_0_1),
    .selector_MUX_55_reg_12_0_0_0(selector_MUX_55_reg_12_0_0_0),
    .selector_MUX_56_reg_13_0_0_0(selector_MUX_56_reg_13_0_0_0),
    .selector_MUX_57_reg_14_0_0_0(selector_MUX_57_reg_14_0_0_0),
    .selector_MUX_63_reg_2_0_0_0(selector_MUX_63_reg_2_0_0_0),
    .selector_MUX_65_reg_21_0_0_0(selector_MUX_65_reg_21_0_0_0),
    .selector_MUX_66_reg_22_0_0_0(selector_MUX_66_reg_22_0_0_0),
    .selector_MUX_67_reg_23_0_0_0(selector_MUX_67_reg_23_0_0_0),
    .selector_MUX_68_reg_24_0_0_0(selector_MUX_68_reg_24_0_0_0),
    .selector_MUX_71_reg_27_0_0_0(selector_MUX_71_reg_27_0_0_0),
    .selector_MUX_75_reg_5_0_0_0(selector_MUX_75_reg_5_0_0_0),
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
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10775(OUT_CONDITION__Z3lrnPKdPdi_9852_10775),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10949(OUT_CONDITION__Z3lrnPKdPdi_9852_10949),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10952(OUT_CONDITION__Z3lrnPKdPdi_9852_10952),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10977(OUT_CONDITION__Z3lrnPKdPdi_9852_10977),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10979(OUT_CONDITION__Z3lrnPKdPdi_9852_10979),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10981(OUT_CONDITION__Z3lrnPKdPdi_9852_10981),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10984(OUT_CONDITION__Z3lrnPKdPdi_9852_10984),
    .OUT_MULTIIF__Z3lrnPKdPdi_9852_15031(OUT_MULTIIF__Z3lrnPKdPdi_9852_15031),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath__Z3lrnPKdPdi Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10775(OUT_CONDITION__Z3lrnPKdPdi_9852_10775),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10949(OUT_CONDITION__Z3lrnPKdPdi_9852_10949),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10952(OUT_CONDITION__Z3lrnPKdPdi_9852_10952),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10977(OUT_CONDITION__Z3lrnPKdPdi_9852_10977),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10979(OUT_CONDITION__Z3lrnPKdPdi_9852_10979),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10981(OUT_CONDITION__Z3lrnPKdPdi_9852_10981),
    .OUT_CONDITION__Z3lrnPKdPdi_9852_10984(OUT_CONDITION__Z3lrnPKdPdi_9852_10984),
    .OUT_MULTIIF__Z3lrnPKdPdi_9852_15031(OUT_MULTIIF__Z3lrnPKdPdi_9852_15031),
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
    .fuselector_BMEMORY_CTRLN_34_i0_LOAD(fuselector_BMEMORY_CTRLN_34_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_34_i0_STORE(fuselector_BMEMORY_CTRLN_34_i0_STORE),
    .selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0(selector_MUX_21_fp_minus_expr_FU_64_64_64_500_38_i0_0_0_0),
    .selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0(selector_MUX_22_fp_minus_expr_FU_64_64_64_500_38_i0_1_0_0),
    .selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_0),
    .selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_0_1),
    .selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_39_i0_0_1_0),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_0),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_1),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_0_2),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_39_i0_1_1_0),
    .selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0(selector_MUX_25_fp_plus_expr_FU_64_64_64_500_40_i0_0_0_0),
    .selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0(selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_0),
    .selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1(selector_MUX_26_fp_plus_expr_FU_64_64_64_500_40_i0_1_0_1),
    .selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0(selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_0),
    .selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1(selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_41_i0_0_0_1),
    .selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0(selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_0),
    .selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1(selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_41_i0_1_0_1),
    .selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0(selector_MUX_2_BMEMORY_CTRLN_34_i0_1_0_0),
    .selector_MUX_52_reg_1_0_0_0(selector_MUX_52_reg_1_0_0_0),
    .selector_MUX_53_reg_10_0_0_0(selector_MUX_53_reg_10_0_0_0),
    .selector_MUX_53_reg_10_0_0_1(selector_MUX_53_reg_10_0_0_1),
    .selector_MUX_55_reg_12_0_0_0(selector_MUX_55_reg_12_0_0_0),
    .selector_MUX_56_reg_13_0_0_0(selector_MUX_56_reg_13_0_0_0),
    .selector_MUX_57_reg_14_0_0_0(selector_MUX_57_reg_14_0_0_0),
    .selector_MUX_63_reg_2_0_0_0(selector_MUX_63_reg_2_0_0_0),
    .selector_MUX_65_reg_21_0_0_0(selector_MUX_65_reg_21_0_0_0),
    .selector_MUX_66_reg_22_0_0_0(selector_MUX_66_reg_22_0_0_0),
    .selector_MUX_67_reg_23_0_0_0(selector_MUX_67_reg_23_0_0_0),
    .selector_MUX_68_reg_24_0_0_0(selector_MUX_68_reg_24_0_0_0),
    .selector_MUX_71_reg_27_0_0_0(selector_MUX_71_reg_27_0_0_0),
    .selector_MUX_75_reg_5_0_0_0(selector_MUX_75_reg_5_0_0_0),
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

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2013-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bus_merger(in1,
  out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  function [BITSIZE_out1-1:0] merge;
    input [BITSIZE_in1*PORTSIZE_in1-1:0] m;
    reg [BITSIZE_out1-1:0] res;
    integer i1;
  begin
    res={BITSIZE_in1{1'b0}};
    for(i1 = 0; i1 < PORTSIZE_in1; i1 = i1 + 1)
    begin
      res = res | m[i1*BITSIZE_in1 +:BITSIZE_in1];
    end
    merge = res;
  end
  endfunction
  
  assign out1 = merge(in1);
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module join_signal(in1,
  out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  generate
  genvar i1;
  for (i1=0; i1<PORTSIZE_in1; i1=i1+1)
    begin : L1
      assign out1[(i1+1)*(BITSIZE_out1/PORTSIZE_in1)-1:i1*(BITSIZE_out1/PORTSIZE_in1)] = in1[(i1+1)*BITSIZE_in1-1:i1*BITSIZE_in1];
    end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module split_signal(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1, PORTSIZE_out1=2;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  assign out1 = in1;
endmodule

// Datapath RTL description for cifar10
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_cifar10(clock,
  reset,
  in_port_output_data,
  in_port_conv_1_output,
  in_port_pooling_1_output,
  in_port_conv_2_output,
  in_port_pooling_2_output,
  in_port_dense_layer_1_output,
  in_port_dense_layer_2_output,
  in_port_input_data,
  in_port_kernel_1_data,
  in_port_kernel_2_data,
  in_port_weights_1,
  in_port_weights_2,
  in_port_input_data_size,
  in_port_output_data_size,
  in_port_kernel_1_size,
  in_port_kernel_2_size,
  in_port_stride_1_size,
  in_port_stride_2_size,
  in_port_neurons_dense_1_size,
  in_port_neurons_dense_2_size,
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
  fuselector_BMEMORY_CTRLN_165_i0_LOAD,
  fuselector_BMEMORY_CTRLN_165_i0_STORE,
  fuselector_BMEMORY_CTRLN_165_i1_LOAD,
  fuselector_BMEMORY_CTRLN_165_i1_STORE,
  selector_IN_UNBOUNDED_cifar10_9853_11057,
  selector_IN_UNBOUNDED_cifar10_9853_11178,
  selector_IN_UNBOUNDED_cifar10_9853_11184,
  selector_IN_UNBOUNDED_cifar10_9853_11194,
  selector_IN_UNBOUNDED_cifar10_9853_11218,
  selector_IN_UNBOUNDED_cifar10_9853_11285,
  selector_IN_UNBOUNDED_cifar10_9853_11363,
  selector_IN_UNBOUNDED_cifar10_9853_11381,
  selector_IN_UNBOUNDED_cifar10_9853_11387,
  selector_IN_UNBOUNDED_cifar10_9853_11396,
  selector_IN_UNBOUNDED_cifar10_9853_11477,
  selector_IN_UNBOUNDED_cifar10_9853_11484,
  selector_IN_UNBOUNDED_cifar10_9853_11494,
  selector_MUX_135_reg_10_0_0_0,
  selector_MUX_136_reg_100_0_0_0,
  selector_MUX_139_reg_103_0_0_0,
  selector_MUX_140_reg_104_0_0_0,
  selector_MUX_142_reg_106_0_0_0,
  selector_MUX_143_reg_107_0_0_0,
  selector_MUX_145_reg_109_0_0_0,
  selector_MUX_150_reg_113_0_0_0,
  selector_MUX_161_reg_2_0_0_0,
  selector_MUX_169_reg_27_0_0_0,
  selector_MUX_170_reg_28_0_0_0,
  selector_MUX_171_reg_29_0_0_0,
  selector_MUX_176_reg_33_0_0_0,
  selector_MUX_177_reg_34_0_0_0,
  selector_MUX_183_reg_4_0_0_0,
  selector_MUX_187_reg_43_0_0_0,
  selector_MUX_189_reg_45_0_0_0,
  selector_MUX_189_reg_45_0_0_1,
  selector_MUX_192_reg_48_0_0_0,
  selector_MUX_193_reg_49_0_0_0,
  selector_MUX_195_reg_50_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1,
  selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2,
  selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0,
  selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1,
  selector_MUX_200_reg_55_0_0_0,
  selector_MUX_202_reg_57_0_0_0,
  selector_MUX_203_reg_58_0_0_0,
  selector_MUX_204_reg_59_0_0_0,
  selector_MUX_205_reg_6_0_0_0,
  selector_MUX_207_reg_61_0_0_0,
  selector_MUX_209_reg_63_0_0_0,
  selector_MUX_213_reg_67_0_0_0,
  selector_MUX_215_reg_69_0_0_0,
  selector_MUX_215_reg_69_0_0_1,
  selector_MUX_216_reg_7_0_0_0,
  selector_MUX_219_reg_72_0_0_0,
  selector_MUX_220_reg_73_0_0_0,
  selector_MUX_221_reg_74_0_0_0,
  selector_MUX_225_reg_78_0_0_0,
  selector_MUX_228_reg_80_0_0_0,
  selector_MUX_233_reg_85_0_0_0,
  selector_MUX_235_reg_87_0_0_0,
  selector_MUX_238_reg_9_0_0_0,
  selector_MUX_239_reg_90_0_0_0,
  selector_MUX_242_reg_93_0_0_0,
  selector_MUX_243_reg_94_0_0_0,
  selector_MUX_244_reg_95_0_0_0,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1,
  selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0,
  selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1,
  selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0,
  selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0,
  selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0,
  selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1,
  selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0,
  selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1,
  selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0,
  selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0,
  selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1,
  selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0,
  selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0,
  selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0,
  selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0,
  selector_MUX_75___udivsi3_192_i0_0_0_0,
  selector_MUX_75___udivsi3_192_i0_0_0_1,
  selector_MUX_75___udivsi3_192_i0_0_0_2,
  selector_MUX_75___udivsi3_192_i0_0_1_0,
  selector_MUX_75___udivsi3_192_i0_0_1_1,
  selector_MUX_76___udivsi3_192_i0_1_0_0,
  selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0,
  selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0,
  selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0,
  selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1,
  selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0,
  selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1,
  selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0,
  selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0,
  selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1,
  selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0,
  selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0,
  muenable_mu_S_308,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_100,
  wrenable_reg_101,
  wrenable_reg_102,
  wrenable_reg_103,
  wrenable_reg_104,
  wrenable_reg_105,
  wrenable_reg_106,
  wrenable_reg_107,
  wrenable_reg_108,
  wrenable_reg_109,
  wrenable_reg_11,
  wrenable_reg_110,
  wrenable_reg_111,
  wrenable_reg_112,
  wrenable_reg_113,
  wrenable_reg_114,
  wrenable_reg_115,
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
  wrenable_reg_49,
  wrenable_reg_5,
  wrenable_reg_50,
  wrenable_reg_51,
  wrenable_reg_52,
  wrenable_reg_53,
  wrenable_reg_54,
  wrenable_reg_55,
  wrenable_reg_56,
  wrenable_reg_57,
  wrenable_reg_58,
  wrenable_reg_59,
  wrenable_reg_6,
  wrenable_reg_60,
  wrenable_reg_61,
  wrenable_reg_62,
  wrenable_reg_63,
  wrenable_reg_64,
  wrenable_reg_65,
  wrenable_reg_66,
  wrenable_reg_67,
  wrenable_reg_68,
  wrenable_reg_69,
  wrenable_reg_7,
  wrenable_reg_70,
  wrenable_reg_71,
  wrenable_reg_72,
  wrenable_reg_73,
  wrenable_reg_74,
  wrenable_reg_75,
  wrenable_reg_76,
  wrenable_reg_77,
  wrenable_reg_78,
  wrenable_reg_79,
  wrenable_reg_8,
  wrenable_reg_80,
  wrenable_reg_81,
  wrenable_reg_82,
  wrenable_reg_83,
  wrenable_reg_84,
  wrenable_reg_85,
  wrenable_reg_86,
  wrenable_reg_87,
  wrenable_reg_88,
  wrenable_reg_89,
  wrenable_reg_9,
  wrenable_reg_90,
  wrenable_reg_91,
  wrenable_reg_92,
  wrenable_reg_93,
  wrenable_reg_94,
  wrenable_reg_95,
  wrenable_reg_96,
  wrenable_reg_97,
  wrenable_reg_98,
  wrenable_reg_99,
  OUT_CONDITION_cifar10_9853_11058,
  OUT_CONDITION_cifar10_9853_11083,
  OUT_CONDITION_cifar10_9853_11120,
  OUT_CONDITION_cifar10_9853_11123,
  OUT_CONDITION_cifar10_9853_11139,
  OUT_CONDITION_cifar10_9853_11266,
  OUT_CONDITION_cifar10_9853_11272,
  OUT_CONDITION_cifar10_9853_11280,
  OUT_CONDITION_cifar10_9853_11282,
  OUT_CONDITION_cifar10_9853_11286,
  OUT_CONDITION_cifar10_9853_11302,
  OUT_CONDITION_cifar10_9853_11335,
  OUT_CONDITION_cifar10_9853_11338,
  OUT_CONDITION_cifar10_9853_11350,
  OUT_CONDITION_cifar10_9853_11455,
  OUT_CONDITION_cifar10_9853_11461,
  OUT_CONDITION_cifar10_9853_11468,
  OUT_CONDITION_cifar10_9853_11470,
  OUT_CONDITION_cifar10_9853_11474,
  OUT_CONDITION_cifar10_9853_11502,
  OUT_CONDITION_cifar10_9853_11612,
  OUT_CONDITION_cifar10_9853_11614,
  OUT_CONDITION_cifar10_9853_11625,
  OUT_CONDITION_cifar10_9853_11628,
  OUT_CONDITION_cifar10_9853_11633,
  OUT_CONDITION_cifar10_9853_11646,
  OUT_CONDITION_cifar10_9853_11700,
  OUT_CONDITION_cifar10_9853_11711,
  OUT_CONDITION_cifar10_9853_11717,
  OUT_CONDITION_cifar10_9853_11735,
  OUT_CONDITION_cifar10_9853_11819,
  OUT_CONDITION_cifar10_9853_11821,
  OUT_CONDITION_cifar10_9853_11823,
  OUT_UNBOUNDED_cifar10_9853_11057,
  OUT_UNBOUNDED_cifar10_9853_11178,
  OUT_UNBOUNDED_cifar10_9853_11184,
  OUT_UNBOUNDED_cifar10_9853_11194,
  OUT_UNBOUNDED_cifar10_9853_11218,
  OUT_UNBOUNDED_cifar10_9853_11285,
  OUT_UNBOUNDED_cifar10_9853_11363,
  OUT_UNBOUNDED_cifar10_9853_11381,
  OUT_UNBOUNDED_cifar10_9853_11387,
  OUT_UNBOUNDED_cifar10_9853_11396,
  OUT_UNBOUNDED_cifar10_9853_11477,
  OUT_UNBOUNDED_cifar10_9853_11484,
  OUT_UNBOUNDED_cifar10_9853_11494,
  OUT_mu_S_308_MULTI_UNBOUNDED_0);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_output_data;
  input [31:0] in_port_conv_1_output;
  input [31:0] in_port_pooling_1_output;
  input [31:0] in_port_conv_2_output;
  input [31:0] in_port_pooling_2_output;
  input [31:0] in_port_dense_layer_1_output;
  input [31:0] in_port_dense_layer_2_output;
  input [31:0] in_port_input_data;
  input [31:0] in_port_kernel_1_data;
  input [31:0] in_port_kernel_2_data;
  input [31:0] in_port_weights_1;
  input [31:0] in_port_weights_2;
  input [31:0] in_port_input_data_size;
  input [31:0] in_port_output_data_size;
  input [31:0] in_port_kernel_1_size;
  input [31:0] in_port_kernel_2_size;
  input [31:0] in_port_stride_1_size;
  input [31:0] in_port_stride_2_size;
  input [31:0] in_port_neurons_dense_1_size;
  input [31:0] in_port_neurons_dense_2_size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_165_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_165_i0_STORE;
  input fuselector_BMEMORY_CTRLN_165_i1_LOAD;
  input fuselector_BMEMORY_CTRLN_165_i1_STORE;
  input selector_IN_UNBOUNDED_cifar10_9853_11057;
  input selector_IN_UNBOUNDED_cifar10_9853_11178;
  input selector_IN_UNBOUNDED_cifar10_9853_11184;
  input selector_IN_UNBOUNDED_cifar10_9853_11194;
  input selector_IN_UNBOUNDED_cifar10_9853_11218;
  input selector_IN_UNBOUNDED_cifar10_9853_11285;
  input selector_IN_UNBOUNDED_cifar10_9853_11363;
  input selector_IN_UNBOUNDED_cifar10_9853_11381;
  input selector_IN_UNBOUNDED_cifar10_9853_11387;
  input selector_IN_UNBOUNDED_cifar10_9853_11396;
  input selector_IN_UNBOUNDED_cifar10_9853_11477;
  input selector_IN_UNBOUNDED_cifar10_9853_11484;
  input selector_IN_UNBOUNDED_cifar10_9853_11494;
  input selector_MUX_135_reg_10_0_0_0;
  input selector_MUX_136_reg_100_0_0_0;
  input selector_MUX_139_reg_103_0_0_0;
  input selector_MUX_140_reg_104_0_0_0;
  input selector_MUX_142_reg_106_0_0_0;
  input selector_MUX_143_reg_107_0_0_0;
  input selector_MUX_145_reg_109_0_0_0;
  input selector_MUX_150_reg_113_0_0_0;
  input selector_MUX_161_reg_2_0_0_0;
  input selector_MUX_169_reg_27_0_0_0;
  input selector_MUX_170_reg_28_0_0_0;
  input selector_MUX_171_reg_29_0_0_0;
  input selector_MUX_176_reg_33_0_0_0;
  input selector_MUX_177_reg_34_0_0_0;
  input selector_MUX_183_reg_4_0_0_0;
  input selector_MUX_187_reg_43_0_0_0;
  input selector_MUX_189_reg_45_0_0_0;
  input selector_MUX_189_reg_45_0_0_1;
  input selector_MUX_192_reg_48_0_0_0;
  input selector_MUX_193_reg_49_0_0_0;
  input selector_MUX_195_reg_50_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2;
  input selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0;
  input selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1;
  input selector_MUX_200_reg_55_0_0_0;
  input selector_MUX_202_reg_57_0_0_0;
  input selector_MUX_203_reg_58_0_0_0;
  input selector_MUX_204_reg_59_0_0_0;
  input selector_MUX_205_reg_6_0_0_0;
  input selector_MUX_207_reg_61_0_0_0;
  input selector_MUX_209_reg_63_0_0_0;
  input selector_MUX_213_reg_67_0_0_0;
  input selector_MUX_215_reg_69_0_0_0;
  input selector_MUX_215_reg_69_0_0_1;
  input selector_MUX_216_reg_7_0_0_0;
  input selector_MUX_219_reg_72_0_0_0;
  input selector_MUX_220_reg_73_0_0_0;
  input selector_MUX_221_reg_74_0_0_0;
  input selector_MUX_225_reg_78_0_0_0;
  input selector_MUX_228_reg_80_0_0_0;
  input selector_MUX_233_reg_85_0_0_0;
  input selector_MUX_235_reg_87_0_0_0;
  input selector_MUX_238_reg_9_0_0_0;
  input selector_MUX_239_reg_90_0_0_0;
  input selector_MUX_242_reg_93_0_0_0;
  input selector_MUX_243_reg_94_0_0_0;
  input selector_MUX_244_reg_95_0_0_0;
  input selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0;
  input selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1;
  input selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2;
  input selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3;
  input selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4;
  input selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5;
  input selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0;
  input selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1;
  input selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2;
  input selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0;
  input selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1;
  input selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0;
  input selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1;
  input selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0;
  input selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0;
  input selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0;
  input selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0;
  input selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0;
  input selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1;
  input selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2;
  input selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3;
  input selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4;
  input selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5;
  input selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0;
  input selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1;
  input selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2;
  input selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0;
  input selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1;
  input selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0;
  input selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1;
  input selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0;
  input selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0;
  input selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1;
  input selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0;
  input selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0;
  input selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0;
  input selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0;
  input selector_MUX_75___udivsi3_192_i0_0_0_0;
  input selector_MUX_75___udivsi3_192_i0_0_0_1;
  input selector_MUX_75___udivsi3_192_i0_0_0_2;
  input selector_MUX_75___udivsi3_192_i0_0_1_0;
  input selector_MUX_75___udivsi3_192_i0_0_1_1;
  input selector_MUX_76___udivsi3_192_i0_1_0_0;
  input selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0;
  input selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0;
  input selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0;
  input selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1;
  input selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0;
  input selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1;
  input selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0;
  input selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0;
  input selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1;
  input selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0;
  input selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0;
  input muenable_mu_S_308;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_100;
  input wrenable_reg_101;
  input wrenable_reg_102;
  input wrenable_reg_103;
  input wrenable_reg_104;
  input wrenable_reg_105;
  input wrenable_reg_106;
  input wrenable_reg_107;
  input wrenable_reg_108;
  input wrenable_reg_109;
  input wrenable_reg_11;
  input wrenable_reg_110;
  input wrenable_reg_111;
  input wrenable_reg_112;
  input wrenable_reg_113;
  input wrenable_reg_114;
  input wrenable_reg_115;
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
  input wrenable_reg_49;
  input wrenable_reg_5;
  input wrenable_reg_50;
  input wrenable_reg_51;
  input wrenable_reg_52;
  input wrenable_reg_53;
  input wrenable_reg_54;
  input wrenable_reg_55;
  input wrenable_reg_56;
  input wrenable_reg_57;
  input wrenable_reg_58;
  input wrenable_reg_59;
  input wrenable_reg_6;
  input wrenable_reg_60;
  input wrenable_reg_61;
  input wrenable_reg_62;
  input wrenable_reg_63;
  input wrenable_reg_64;
  input wrenable_reg_65;
  input wrenable_reg_66;
  input wrenable_reg_67;
  input wrenable_reg_68;
  input wrenable_reg_69;
  input wrenable_reg_7;
  input wrenable_reg_70;
  input wrenable_reg_71;
  input wrenable_reg_72;
  input wrenable_reg_73;
  input wrenable_reg_74;
  input wrenable_reg_75;
  input wrenable_reg_76;
  input wrenable_reg_77;
  input wrenable_reg_78;
  input wrenable_reg_79;
  input wrenable_reg_8;
  input wrenable_reg_80;
  input wrenable_reg_81;
  input wrenable_reg_82;
  input wrenable_reg_83;
  input wrenable_reg_84;
  input wrenable_reg_85;
  input wrenable_reg_86;
  input wrenable_reg_87;
  input wrenable_reg_88;
  input wrenable_reg_89;
  input wrenable_reg_9;
  input wrenable_reg_90;
  input wrenable_reg_91;
  input wrenable_reg_92;
  input wrenable_reg_93;
  input wrenable_reg_94;
  input wrenable_reg_95;
  input wrenable_reg_96;
  input wrenable_reg_97;
  input wrenable_reg_98;
  input wrenable_reg_99;
  // OUT
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output OUT_CONDITION_cifar10_9853_11058;
  output OUT_CONDITION_cifar10_9853_11083;
  output OUT_CONDITION_cifar10_9853_11120;
  output OUT_CONDITION_cifar10_9853_11123;
  output OUT_CONDITION_cifar10_9853_11139;
  output OUT_CONDITION_cifar10_9853_11266;
  output OUT_CONDITION_cifar10_9853_11272;
  output OUT_CONDITION_cifar10_9853_11280;
  output OUT_CONDITION_cifar10_9853_11282;
  output OUT_CONDITION_cifar10_9853_11286;
  output OUT_CONDITION_cifar10_9853_11302;
  output OUT_CONDITION_cifar10_9853_11335;
  output OUT_CONDITION_cifar10_9853_11338;
  output OUT_CONDITION_cifar10_9853_11350;
  output OUT_CONDITION_cifar10_9853_11455;
  output OUT_CONDITION_cifar10_9853_11461;
  output OUT_CONDITION_cifar10_9853_11468;
  output OUT_CONDITION_cifar10_9853_11470;
  output OUT_CONDITION_cifar10_9853_11474;
  output OUT_CONDITION_cifar10_9853_11502;
  output OUT_CONDITION_cifar10_9853_11612;
  output OUT_CONDITION_cifar10_9853_11614;
  output OUT_CONDITION_cifar10_9853_11625;
  output OUT_CONDITION_cifar10_9853_11628;
  output OUT_CONDITION_cifar10_9853_11633;
  output OUT_CONDITION_cifar10_9853_11646;
  output OUT_CONDITION_cifar10_9853_11700;
  output OUT_CONDITION_cifar10_9853_11711;
  output OUT_CONDITION_cifar10_9853_11717;
  output OUT_CONDITION_cifar10_9853_11735;
  output OUT_CONDITION_cifar10_9853_11819;
  output OUT_CONDITION_cifar10_9853_11821;
  output OUT_CONDITION_cifar10_9853_11823;
  output OUT_UNBOUNDED_cifar10_9853_11057;
  output OUT_UNBOUNDED_cifar10_9853_11178;
  output OUT_UNBOUNDED_cifar10_9853_11184;
  output OUT_UNBOUNDED_cifar10_9853_11194;
  output OUT_UNBOUNDED_cifar10_9853_11218;
  output OUT_UNBOUNDED_cifar10_9853_11285;
  output OUT_UNBOUNDED_cifar10_9853_11363;
  output OUT_UNBOUNDED_cifar10_9853_11381;
  output OUT_UNBOUNDED_cifar10_9853_11387;
  output OUT_UNBOUNDED_cifar10_9853_11396;
  output OUT_UNBOUNDED_cifar10_9853_11477;
  output OUT_UNBOUNDED_cifar10_9853_11484;
  output OUT_UNBOUNDED_cifar10_9853_11494;
  output OUT_mu_S_308_MULTI_UNBOUNDED_0;
  // Component and signal declarations
  wire [28:0] out_ASSIGN_UNSIGNED_FU_157_i0_fu_cifar10_9853_15047;
  wire [63:0] out_BMEMORY_CTRLN_165_i0_BMEMORY_CTRLN_165_i0;
  wire [63:0] out_BMEMORY_CTRLN_165_i1_BMEMORY_CTRLN_165_i0;
  wire [31:0] out_MUX_135_reg_10_0_0_0;
  wire [63:0] out_MUX_136_reg_100_0_0_0;
  wire [31:0] out_MUX_139_reg_103_0_0_0;
  wire [63:0] out_MUX_140_reg_104_0_0_0;
  wire [63:0] out_MUX_142_reg_106_0_0_0;
  wire [63:0] out_MUX_143_reg_107_0_0_0;
  wire [31:0] out_MUX_145_reg_109_0_0_0;
  wire [31:0] out_MUX_150_reg_113_0_0_0;
  wire [31:0] out_MUX_161_reg_2_0_0_0;
  wire [31:0] out_MUX_169_reg_27_0_0_0;
  wire [31:0] out_MUX_170_reg_28_0_0_0;
  wire [31:0] out_MUX_171_reg_29_0_0_0;
  wire [31:0] out_MUX_176_reg_33_0_0_0;
  wire [31:0] out_MUX_177_reg_34_0_0_0;
  wire [31:0] out_MUX_183_reg_4_0_0_0;
  wire [31:0] out_MUX_187_reg_43_0_0_0;
  wire [31:0] out_MUX_189_reg_45_0_0_0;
  wire [31:0] out_MUX_189_reg_45_0_0_1;
  wire [63:0] out_MUX_192_reg_48_0_0_0;
  wire [31:0] out_MUX_193_reg_49_0_0_0;
  wire [31:0] out_MUX_195_reg_50_0_0_0;
  wire [63:0] out_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0;
  wire [63:0] out_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1;
  wire [63:0] out_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2;
  wire [63:0] out_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0;
  wire [63:0] out_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1;
  wire [63:0] out_MUX_200_reg_55_0_0_0;
  wire [31:0] out_MUX_202_reg_57_0_0_0;
  wire [31:0] out_MUX_203_reg_58_0_0_0;
  wire [31:0] out_MUX_204_reg_59_0_0_0;
  wire [31:0] out_MUX_205_reg_6_0_0_0;
  wire [31:0] out_MUX_207_reg_61_0_0_0;
  wire [31:0] out_MUX_209_reg_63_0_0_0;
  wire [31:0] out_MUX_213_reg_67_0_0_0;
  wire [31:0] out_MUX_215_reg_69_0_0_0;
  wire [31:0] out_MUX_215_reg_69_0_0_1;
  wire [31:0] out_MUX_216_reg_7_0_0_0;
  wire [63:0] out_MUX_219_reg_72_0_0_0;
  wire [31:0] out_MUX_220_reg_73_0_0_0;
  wire [31:0] out_MUX_221_reg_74_0_0_0;
  wire [63:0] out_MUX_225_reg_78_0_0_0;
  wire [31:0] out_MUX_228_reg_80_0_0_0;
  wire [63:0] out_MUX_233_reg_85_0_0_0;
  wire [31:0] out_MUX_235_reg_87_0_0_0;
  wire [31:0] out_MUX_238_reg_9_0_0_0;
  wire [63:0] out_MUX_239_reg_90_0_0_0;
  wire [31:0] out_MUX_242_reg_93_0_0_0;
  wire [31:0] out_MUX_243_reg_94_0_0_0;
  wire [63:0] out_MUX_244_reg_95_0_0_0;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0;
  wire [31:0] out_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1;
  wire [63:0] out_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0;
  wire [63:0] out_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1;
  wire [63:0] out_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0;
  wire [31:0] out_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0;
  wire [31:0] out_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0;
  wire [31:0] out_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0;
  wire [31:0] out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0;
  wire [31:0] out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1;
  wire [31:0] out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2;
  wire [31:0] out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3;
  wire [31:0] out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4;
  wire [31:0] out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5;
  wire [31:0] out_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0;
  wire [31:0] out_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1;
  wire [31:0] out_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2;
  wire [31:0] out_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0;
  wire [31:0] out_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1;
  wire [31:0] out_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0;
  wire [31:0] out_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1;
  wire [31:0] out_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0;
  wire [31:0] out_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0;
  wire [31:0] out_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1;
  wire [31:0] out_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0;
  wire [31:0] out_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0;
  wire [31:0] out_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0;
  wire [31:0] out_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0;
  wire [31:0] out_MUX_75___udivsi3_192_i0_0_0_0;
  wire [31:0] out_MUX_75___udivsi3_192_i0_0_0_1;
  wire [31:0] out_MUX_75___udivsi3_192_i0_0_0_2;
  wire [31:0] out_MUX_75___udivsi3_192_i0_0_1_0;
  wire [31:0] out_MUX_75___udivsi3_192_i0_0_1_1;
  wire [31:0] out_MUX_76___udivsi3_192_i0_1_0_0;
  wire [63:0] out_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0;
  wire [63:0] out_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0;
  wire [63:0] out_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0;
  wire [63:0] out_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1;
  wire [63:0] out_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0;
  wire [63:0] out_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1;
  wire [63:0] out_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0;
  wire [63:0] out_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0;
  wire [63:0] out_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1;
  wire [63:0] out_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0;
  wire [63:0] out_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0;
  wire signed [31:0] out_UIdata_converter_FU_158_i0_fu_cifar10_9853_11222;
  wire signed [31:0] out_UIdata_converter_FU_2_i0_fu_cifar10_9853_11055;
  wire signed [31:0] out_UIdata_converter_FU_3_i0_fu_cifar10_9853_11056;
  wire signed [31:0] out_UIdata_converter_FU_4_i0_fu_cifar10_9853_11492;
  wire signed [31:0] out_UIdata_converter_FU_6_i0_fu_cifar10_9853_11284;
  wire [31:0] out_UUdata_converter_FU_10_i0_fu_cifar10_9853_11617;
  wire [31:0] out_UUdata_converter_FU_115_i0_fu_cifar10_9853_11565;
  wire [31:0] out_UUdata_converter_FU_116_i0_fu_cifar10_9853_11516;
  wire [31:0] out_UUdata_converter_FU_11_i0_fu_cifar10_9853_11686;
  wire [31:0] out_UUdata_converter_FU_120_i0_fu_cifar10_9853_11600;
  wire [31:0] out_UUdata_converter_FU_12_i0_fu_cifar10_9853_11660;
  wire [31:0] out_UUdata_converter_FU_135_i0_fu_cifar10_9853_11640;
  wire [31:0] out_UUdata_converter_FU_136_i0_fu_cifar10_9853_11678;
  wire [31:0] out_UUdata_converter_FU_13_i0_fu_cifar10_9853_11703;
  wire [31:0] out_UUdata_converter_FU_140_i0_fu_cifar10_9853_11715;
  wire [31:0] out_UUdata_converter_FU_19_i0_fu_cifar10_9853_11081;
  wire [31:0] out_UUdata_converter_FU_37_i0_fu_cifar10_9853_11227;
  wire [31:0] out_UUdata_converter_FU_49_i0_fu_cifar10_9853_11137;
  wire [31:0] out_UUdata_converter_FU_56_i0_fu_cifar10_9853_11300;
  wire [31:0] out_UUdata_converter_FU_5_i0_fu_cifar10_9853_11105;
  wire [31:0] out_UUdata_converter_FU_74_i0_fu_cifar10_9853_11416;
  wire [31:0] out_UUdata_converter_FU_7_i0_fu_cifar10_9853_11322;
  wire [31:0] out_UUdata_converter_FU_87_i0_fu_cifar10_9853_11348;
  wire [31:0] out_UUdata_converter_FU_8_i0_fu_cifar10_9853_11524;
  wire [31:0] out_UUdata_converter_FU_9_i0_fu_cifar10_9853_11573;
  wire [31:0] out___udivsi3_192_i0___udivsi3_192_i0;
  wire out_const_0;
  wire [63:0] out_const_1;
  wire [63:0] out_const_2;
  wire [1:0] out_const_3;
  wire [7:0] out_const_4;
  wire [5:0] out_const_5;
  wire out_const_6;
  wire [1:0] out_const_7;
  wire [2:0] out_const_8;
  wire [28:0] out_conv_out___udivsi3_192_i0___udivsi3_192_i0_32_29;
  wire [31:0] out_conv_out_const_0_1_32;
  wire signed [31:0] out_conv_out_const_0_I_1_I_32;
  wire signed [31:0] out_conv_out_const_3_I_2_I_32;
  wire [6:0] out_conv_out_const_4_8_7;
  wire [63:0] out_fp_cond_expr_FU_64_64_64_64_166_i0_fu_cifar10_9853_11207;
  wire [63:0] out_fp_cond_expr_FU_64_64_64_64_166_i1_fu_cifar10_9853_11405;
  wire [63:0] out_fp_float_expr_32_64_FU_32_64_500_167_i0_fu_cifar10_9853_11783;
  wire out_fp_gt_expr_FU_64_64_64_500_168_i0_fp_gt_expr_FU_64_64_64_500_168_i0;
  wire out_fp_lt_expr_FU_64_64_64_500_169_i0_fp_lt_expr_FU_64_64_64_500_169_i0;
  wire [63:0] out_fp_mult_expr_FU_64_64_64_500_170_i0_fp_mult_expr_FU_64_64_64_500_170_i0;
  wire [63:0] out_fp_plus_expr_FU_64_64_64_500_171_i0_fp_plus_expr_FU_64_64_64_500_171_i0;
  wire [63:0] out_fp_rdiv_expr_FU_64_64_64_400_172_i0_fp_rdiv_expr_FU_64_64_64_400_172_i0;
  wire signed [31:0] out_ii_conv_conn_obj_10_IIdata_converter_FU_ii_conv_0;
  wire signed [31:0] out_ii_conv_conn_obj_3_IIdata_converter_FU_ii_conv_1;
  wire out_ne_expr_FU_32_0_32_173_i0_fu_cifar10_9853_14372;
  wire signed [31:0] out_plus_expr_FU_32_0_32_174_i0_fu_cifar10_9853_11789;
  wire out_read_cond_FU_101_i0_fu_cifar10_9853_11502;
  wire out_read_cond_FU_107_i0_fu_cifar10_9853_11612;
  wire out_read_cond_FU_110_i0_fu_cifar10_9853_11614;
  wire out_read_cond_FU_117_i0_fu_cifar10_9853_11625;
  wire out_read_cond_FU_121_i0_fu_cifar10_9853_11628;
  wire out_read_cond_FU_124_i0_fu_cifar10_9853_11633;
  wire out_read_cond_FU_128_i0_fu_cifar10_9853_11646;
  wire out_read_cond_FU_131_i0_fu_cifar10_9853_11700;
  wire out_read_cond_FU_137_i0_fu_cifar10_9853_11711;
  wire out_read_cond_FU_141_i0_fu_cifar10_9853_11717;
  wire out_read_cond_FU_144_i0_fu_cifar10_9853_11735;
  wire out_read_cond_FU_14_i0_fu_cifar10_9853_11058;
  wire out_read_cond_FU_152_i0_fu_cifar10_9853_11819;
  wire out_read_cond_FU_153_i0_fu_cifar10_9853_11821;
  wire out_read_cond_FU_156_i0_fu_cifar10_9853_11823;
  wire out_read_cond_FU_20_i0_fu_cifar10_9853_11083;
  wire out_read_cond_FU_23_i0_fu_cifar10_9853_11120;
  wire out_read_cond_FU_24_i0_fu_cifar10_9853_11123;
  wire out_read_cond_FU_31_i0_fu_cifar10_9853_11139;
  wire out_read_cond_FU_38_i0_fu_cifar10_9853_11266;
  wire out_read_cond_FU_39_i0_fu_cifar10_9853_11272;
  wire out_read_cond_FU_44_i0_fu_cifar10_9853_11280;
  wire out_read_cond_FU_45_i0_fu_cifar10_9853_11282;
  wire out_read_cond_FU_50_i0_fu_cifar10_9853_11286;
  wire out_read_cond_FU_57_i0_fu_cifar10_9853_11302;
  wire out_read_cond_FU_60_i0_fu_cifar10_9853_11335;
  wire out_read_cond_FU_61_i0_fu_cifar10_9853_11338;
  wire out_read_cond_FU_68_i0_fu_cifar10_9853_11350;
  wire out_read_cond_FU_75_i0_fu_cifar10_9853_11455;
  wire out_read_cond_FU_76_i0_fu_cifar10_9853_11461;
  wire out_read_cond_FU_81_i0_fu_cifar10_9853_11468;
  wire out_read_cond_FU_82_i0_fu_cifar10_9853_11470;
  wire out_read_cond_FU_98_i0_fu_cifar10_9853_11474;
  wire [31:0] out_reg_0_reg_0;
  wire [63:0] out_reg_100_reg_100;
  wire [31:0] out_reg_101_reg_101;
  wire [31:0] out_reg_102_reg_102;
  wire [31:0] out_reg_103_reg_103;
  wire [63:0] out_reg_104_reg_104;
  wire [31:0] out_reg_105_reg_105;
  wire [63:0] out_reg_106_reg_106;
  wire [63:0] out_reg_107_reg_107;
  wire [63:0] out_reg_108_reg_108;
  wire [31:0] out_reg_109_reg_109;
  wire [31:0] out_reg_10_reg_10;
  wire out_reg_110_reg_110;
  wire [63:0] out_reg_111_reg_111;
  wire out_reg_112_reg_112;
  wire [31:0] out_reg_113_reg_113;
  wire [31:0] out_reg_114_reg_114;
  wire out_reg_115_reg_115;
  wire [31:0] out_reg_11_reg_11;
  wire out_reg_12_reg_12;
  wire out_reg_13_reg_13;
  wire out_reg_14_reg_14;
  wire out_reg_15_reg_15;
  wire out_reg_16_reg_16;
  wire out_reg_17_reg_17;
  wire [28:0] out_reg_18_reg_18;
  wire [28:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [28:0] out_reg_20_reg_20;
  wire [28:0] out_reg_21_reg_21;
  wire [28:0] out_reg_22_reg_22;
  wire [28:0] out_reg_23_reg_23;
  wire [28:0] out_reg_24_reg_24;
  wire [28:0] out_reg_25_reg_25;
  wire [28:0] out_reg_26_reg_26;
  wire [31:0] out_reg_27_reg_27;
  wire [31:0] out_reg_28_reg_28;
  wire [31:0] out_reg_29_reg_29;
  wire [31:0] out_reg_2_reg_2;
  wire [31:0] out_reg_30_reg_30;
  wire [31:0] out_reg_31_reg_31;
  wire [28:0] out_reg_32_reg_32;
  wire [31:0] out_reg_33_reg_33;
  wire [31:0] out_reg_34_reg_34;
  wire out_reg_35_reg_35;
  wire [28:0] out_reg_36_reg_36;
  wire [28:0] out_reg_37_reg_37;
  wire [28:0] out_reg_38_reg_38;
  wire [28:0] out_reg_39_reg_39;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_40_reg_40;
  wire [31:0] out_reg_41_reg_41;
  wire [31:0] out_reg_42_reg_42;
  wire [31:0] out_reg_43_reg_43;
  wire [28:0] out_reg_44_reg_44;
  wire [31:0] out_reg_45_reg_45;
  wire [31:0] out_reg_46_reg_46;
  wire [31:0] out_reg_47_reg_47;
  wire [63:0] out_reg_48_reg_48;
  wire [31:0] out_reg_49_reg_49;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_50_reg_50;
  wire [31:0] out_reg_51_reg_51;
  wire [31:0] out_reg_52_reg_52;
  wire out_reg_53_reg_53;
  wire [63:0] out_reg_54_reg_54;
  wire [63:0] out_reg_55_reg_55;
  wire out_reg_56_reg_56;
  wire [31:0] out_reg_57_reg_57;
  wire [31:0] out_reg_58_reg_58;
  wire [31:0] out_reg_59_reg_59;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_60_reg_60;
  wire [31:0] out_reg_61_reg_61;
  wire [28:0] out_reg_62_reg_62;
  wire [31:0] out_reg_63_reg_63;
  wire [31:0] out_reg_64_reg_64;
  wire [31:0] out_reg_65_reg_65;
  wire [31:0] out_reg_66_reg_66;
  wire [31:0] out_reg_67_reg_67;
  wire [28:0] out_reg_68_reg_68;
  wire [31:0] out_reg_69_reg_69;
  wire [31:0] out_reg_6_reg_6;
  wire [31:0] out_reg_70_reg_70;
  wire [31:0] out_reg_71_reg_71;
  wire [63:0] out_reg_72_reg_72;
  wire [31:0] out_reg_73_reg_73;
  wire [31:0] out_reg_74_reg_74;
  wire [31:0] out_reg_75_reg_75;
  wire [31:0] out_reg_76_reg_76;
  wire out_reg_77_reg_77;
  wire [63:0] out_reg_78_reg_78;
  wire out_reg_79_reg_79;
  wire [31:0] out_reg_7_reg_7;
  wire [31:0] out_reg_80_reg_80;
  wire [31:0] out_reg_81_reg_81;
  wire out_reg_82_reg_82;
  wire [28:0] out_reg_83_reg_83;
  wire [31:0] out_reg_84_reg_84;
  wire [63:0] out_reg_85_reg_85;
  wire [31:0] out_reg_86_reg_86;
  wire [31:0] out_reg_87_reg_87;
  wire [31:0] out_reg_88_reg_88;
  wire out_reg_89_reg_89;
  wire [31:0] out_reg_8_reg_8;
  wire [63:0] out_reg_90_reg_90;
  wire [31:0] out_reg_91_reg_91;
  wire [31:0] out_reg_92_reg_92;
  wire [31:0] out_reg_93_reg_93;
  wire [31:0] out_reg_94_reg_94;
  wire [63:0] out_reg_95_reg_95;
  wire [31:0] out_reg_96_reg_96;
  wire [31:0] out_reg_97_reg_97;
  wire [31:0] out_reg_98_reg_98;
  wire out_reg_99_reg_99;
  wire [31:0] out_reg_9_reg_9;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i0_fu_cifar10_9853_14631;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i10_fu_cifar10_9853_14774;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i11_fu_cifar10_9853_14789;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i12_fu_cifar10_9853_14804;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i13_fu_cifar10_9853_14819;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i14_fu_cifar10_9853_14831;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i15_fu_cifar10_9853_14846;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i16_fu_cifar10_9853_14858;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i17_fu_cifar10_9853_14870;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i18_fu_cifar10_9853_14885;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i19_fu_cifar10_9853_14897;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i1_fu_cifar10_9853_14648;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i2_fu_cifar10_9853_14660;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i3_fu_cifar10_9853_14675;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i4_fu_cifar10_9853_14690;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i5_fu_cifar10_9853_14705;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i6_fu_cifar10_9853_14720;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i7_fu_cifar10_9853_14732;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i8_fu_cifar10_9853_14747;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_175_i9_fu_cifar10_9853_14759;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i0_fu_cifar10_9853_11107;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i10_fu_cifar10_9853_11433;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i11_fu_cifar10_9853_11441;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i12_fu_cifar10_9853_11449;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i13_fu_cifar10_9853_11458;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i14_fu_cifar10_9853_11528;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i15_fu_cifar10_9853_11577;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i16_fu_cifar10_9853_11607;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i17_fu_cifar10_9853_11664;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i18_fu_cifar10_9853_11690;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i19_fu_cifar10_9853_11729;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i1_fu_cifar10_9853_11112;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i2_fu_cifar10_9853_11242;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i3_fu_cifar10_9853_11244;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i4_fu_cifar10_9853_11252;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i5_fu_cifar10_9853_11260;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i6_fu_cifar10_9853_11269;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i7_fu_cifar10_9853_11324;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i8_fu_cifar10_9853_11329;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_176_i9_fu_cifar10_9853_11431;
  wire out_ui_gt_expr_FU_32_32_32_177_i0_fu_cifar10_9853_14326;
  wire out_ui_gt_expr_FU_32_32_32_177_i1_fu_cifar10_9853_14328;
  wire out_ui_gt_expr_FU_32_32_32_177_i2_fu_cifar10_9853_14344;
  wire out_ui_gt_expr_FU_32_32_32_177_i3_fu_cifar10_9853_14346;
  wire out_ui_gt_expr_FU_32_32_32_177_i4_fu_cifar10_9853_14376;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_178_i0_fu_cifar10_9853_11110;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_178_i1_fu_cifar10_9853_11171;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_178_i2_fu_cifar10_9853_11258;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_178_i3_fu_cifar10_9853_11327;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_178_i4_fu_cifar10_9853_11374;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_178_i5_fu_cifar10_9853_11447;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_178_i6_fu_cifar10_9853_14905;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_178_i7_fu_cifar10_9853_14912;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_179_i0_fu_cifar10_9853_11580;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_179_i10_fu_cifar10_9853_14256;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_179_i11_fu_cifar10_9853_14263;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_179_i1_fu_cifar10_9853_11667;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_179_i2_fu_cifar10_9853_14102;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_179_i3_fu_cifar10_9853_14132;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_179_i4_fu_cifar10_9853_14155;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_179_i5_fu_cifar10_9853_14162;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_179_i6_fu_cifar10_9853_14195;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_179_i7_fu_cifar10_9853_14202;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_179_i8_fu_cifar10_9853_14230;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_179_i9_fu_cifar10_9853_14241;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i0_fu_cifar10_9853_11623;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i10_fu_cifar10_9853_14744;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i11_fu_cifar10_9853_14756;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i12_fu_cifar10_9853_14771;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i13_fu_cifar10_9853_14786;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i14_fu_cifar10_9853_14801;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i15_fu_cifar10_9853_14816;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i16_fu_cifar10_9853_14828;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i17_fu_cifar10_9853_14843;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i18_fu_cifar10_9853_14855;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i19_fu_cifar10_9853_14867;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i1_fu_cifar10_9853_11709;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i20_fu_cifar10_9853_14882;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i21_fu_cifar10_9853_14894;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i2_fu_cifar10_9853_14627;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i3_fu_cifar10_9853_14645;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i4_fu_cifar10_9853_14657;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i5_fu_cifar10_9853_14672;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i6_fu_cifar10_9853_14687;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i7_fu_cifar10_9853_14702;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i8_fu_cifar10_9853_14717;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_180_i9_fu_cifar10_9853_14729;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_181_i0_fu_cifar10_9853_11180;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_181_i1_fu_cifar10_9853_11255;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_181_i2_fu_cifar10_9853_11383;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_181_i3_fu_cifar10_9853_11444;
  wire [31:0] out_ui_mult_expr_FU_32_32_32_0_181_i4_fu_cifar10_9853_11583;
  wire out_ui_ne_expr_FU_32_0_32_182_i0_fu_cifar10_9853_14312;
  wire out_ui_ne_expr_FU_32_0_32_182_i1_fu_cifar10_9853_14320;
  wire out_ui_ne_expr_FU_32_0_32_182_i2_fu_cifar10_9853_14330;
  wire out_ui_ne_expr_FU_32_0_32_182_i3_fu_cifar10_9853_14338;
  wire out_ui_ne_expr_FU_32_0_32_182_i4_fu_cifar10_9853_14348;
  wire out_ui_ne_expr_FU_32_0_32_182_i5_fu_cifar10_9853_14350;
  wire out_ui_ne_expr_FU_32_0_32_182_i6_fu_cifar10_9853_14356;
  wire out_ui_ne_expr_FU_32_0_32_182_i7_fu_cifar10_9853_14366;
  wire out_ui_ne_expr_FU_32_32_32_183_i0_fu_cifar10_9853_14316;
  wire out_ui_ne_expr_FU_32_32_32_183_i10_fu_cifar10_9853_14360;
  wire out_ui_ne_expr_FU_32_32_32_183_i11_fu_cifar10_9853_14362;
  wire out_ui_ne_expr_FU_32_32_32_183_i12_fu_cifar10_9853_14364;
  wire out_ui_ne_expr_FU_32_32_32_183_i13_fu_cifar10_9853_14370;
  wire out_ui_ne_expr_FU_32_32_32_183_i14_fu_cifar10_9853_14374;
  wire out_ui_ne_expr_FU_32_32_32_183_i1_fu_cifar10_9853_14318;
  wire out_ui_ne_expr_FU_32_32_32_183_i2_fu_cifar10_9853_14322;
  wire out_ui_ne_expr_FU_32_32_32_183_i3_fu_cifar10_9853_14324;
  wire out_ui_ne_expr_FU_32_32_32_183_i4_fu_cifar10_9853_14334;
  wire out_ui_ne_expr_FU_32_32_32_183_i5_fu_cifar10_9853_14336;
  wire out_ui_ne_expr_FU_32_32_32_183_i6_fu_cifar10_9853_14340;
  wire out_ui_ne_expr_FU_32_32_32_183_i7_fu_cifar10_9853_14342;
  wire out_ui_ne_expr_FU_32_32_32_183_i8_fu_cifar10_9853_14352;
  wire out_ui_ne_expr_FU_32_32_32_183_i9_fu_cifar10_9853_14354;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_184_i0_fu_cifar10_9853_11122;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_184_i1_fu_cifar10_9853_11271;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_184_i2_fu_cifar10_9853_11337;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_184_i3_fu_cifar10_9853_11460;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_184_i4_fu_cifar10_9853_11589;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_184_i5_fu_cifar10_9853_11645;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_184_i6_fu_cifar10_9853_11762;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_184_i7_fu_cifar10_9853_11799;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_185_i0_fu_cifar10_9853_14624;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_185_i1_fu_cifar10_9853_14654;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_185_i2_fu_cifar10_9853_14726;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_185_i3_fu_cifar10_9853_14753;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_185_i4_fu_cifar10_9853_14825;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_185_i5_fu_cifar10_9853_14852;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_185_i6_fu_cifar10_9853_14864;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_185_i7_fu_cifar10_9853_14891;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_186_i0_fu_cifar10_9853_11154;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i10_fu_cifar10_9853_14714;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i11_fu_cifar10_9853_14741;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i12_fu_cifar10_9853_14768;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i13_fu_cifar10_9853_14783;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i14_fu_cifar10_9853_14798;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i15_fu_cifar10_9853_14813;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i16_fu_cifar10_9853_14840;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i17_fu_cifar10_9853_14879;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i1_fu_cifar10_9853_11174;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_186_i2_fu_cifar10_9853_11191;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_186_i3_fu_cifar10_9853_11354;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i4_fu_cifar10_9853_11377;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_186_i5_fu_cifar10_9853_11393;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i6_fu_cifar10_9853_14642;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i7_fu_cifar10_9853_14669;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i8_fu_cifar10_9853_14684;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_186_i9_fu_cifar10_9853_14699;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i0_fu_cifar10_9853_11166;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i10_fu_cifar10_9853_14233;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i11_fu_cifar10_9853_14244;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i12_fu_cifar10_9853_14259;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i13_fu_cifar10_9853_14266;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i1_fu_cifar10_9853_11369;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i2_fu_cifar10_9853_11620;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i3_fu_cifar10_9853_11706;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i4_fu_cifar10_9853_14105;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i5_fu_cifar10_9853_14135;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i6_fu_cifar10_9853_14158;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i7_fu_cifar10_9853_14165;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i8_fu_cifar10_9853_14198;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_187_i9_fu_cifar10_9853_14205;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i0_fu_cifar10_9853_14619;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i10_fu_cifar10_9853_14709;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i11_fu_cifar10_9853_14712;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i12_fu_cifar10_9853_14724;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i13_fu_cifar10_9853_14736;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i14_fu_cifar10_9853_14739;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i15_fu_cifar10_9853_14751;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i16_fu_cifar10_9853_14763;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i17_fu_cifar10_9853_14766;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i18_fu_cifar10_9853_14778;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i19_fu_cifar10_9853_14781;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i1_fu_cifar10_9853_14636;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i20_fu_cifar10_9853_14793;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i21_fu_cifar10_9853_14796;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i22_fu_cifar10_9853_14808;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i23_fu_cifar10_9853_14811;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i24_fu_cifar10_9853_14823;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i25_fu_cifar10_9853_14835;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i26_fu_cifar10_9853_14838;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i27_fu_cifar10_9853_14850;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i28_fu_cifar10_9853_14862;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i29_fu_cifar10_9853_14874;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i2_fu_cifar10_9853_14640;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i30_fu_cifar10_9853_14877;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i31_fu_cifar10_9853_14889;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i3_fu_cifar10_9853_14652;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i4_fu_cifar10_9853_14664;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i5_fu_cifar10_9853_14667;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i6_fu_cifar10_9853_14679;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i7_fu_cifar10_9853_14682;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i8_fu_cifar10_9853_14694;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_188_i9_fu_cifar10_9853_14697;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_189_i0_fu_cifar10_9853_14901;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_189_i1_fu_cifar10_9853_14908;
  wire [63:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_2;
  wire [63:0] out_uu_conv_conn_obj_11_UUdata_converter_FU_uu_conv_4;
  wire [63:0] out_uu_conv_conn_obj_12_UUdata_converter_FU_uu_conv_5;
  wire [31:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3;
  wire [63:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_6;
  wire [63:0] out_uu_conv_conn_obj_4_UUdata_converter_FU_uu_conv_7;
  wire [63:0] out_uu_conv_conn_obj_5_UUdata_converter_FU_uu_conv_8;
  wire [63:0] out_uu_conv_conn_obj_6_UUdata_converter_FU_uu_conv_9;
  wire [63:0] out_uu_conv_conn_obj_7_UUdata_converter_FU_uu_conv_10;
  wire [63:0] out_uu_conv_conn_obj_8_UUdata_converter_FU_uu_conv_11;
  wire [63:0] out_uu_conv_conn_obj_9_UUdata_converter_FU_uu_conv_12;
  wire s__Z11convolutionPKdPdS0_iiii_190_i02;
  wire s__Z3lrnPKdPdi_191_i03;
  wire s___udivsi3_192_i04;
  wire s_done__Z11convolutionPKdPdS0_iiii_190_i0;
  wire s_done__Z3lrnPKdPdi_191_i0;
  wire s_done___udivsi3_192_i0;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_1;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_2;
  wire [63:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [63:0] sig_in_bus_mergerMout_addr_ram1_1;
  wire [63:0] sig_in_bus_mergerMout_addr_ram1_2;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_1;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_2;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_1;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_2;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_1;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_2;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_1;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_2;
  wire [63:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [63:0] sig_in_vector_bus_mergerMout_addr_ram1_1;
  wire [63:0] sig_in_vector_bus_mergerMout_addr_ram1_2;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_1;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_2;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_1;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_2;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_1;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_2;
  wire [127:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [63:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [13:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_165_i0 (.out1({out_BMEMORY_CTRLN_165_i1_BMEMORY_CTRLN_165_i0,
      out_BMEMORY_CTRLN_165_i0_BMEMORY_CTRLN_165_i0}),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .in1({out_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0,
      out_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1}),
    .in2({out_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1,
      out_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1}),
    .in3({out_conv_out_const_4_8_7,
      out_conv_out_const_4_8_7}),
    .in4({out_const_6,
      out_const_6}),
    .sel_LOAD({fuselector_BMEMORY_CTRLN_165_i1_LOAD,
      fuselector_BMEMORY_CTRLN_165_i0_LOAD}),
    .sel_STORE({fuselector_BMEMORY_CTRLN_165_i1_STORE,
      fuselector_BMEMORY_CTRLN_165_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  IIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IIdata_converter_FU_ii_conv_0 (.out1(out_ii_conv_conn_obj_10_IIdata_converter_FU_ii_conv_0),
    .in1(out_conv_out_const_3_I_2_I_32));
  IIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IIdata_converter_FU_ii_conv_1 (.out1(out_ii_conv_conn_obj_3_IIdata_converter_FU_ii_conv_1),
    .in1(out_conv_out_const_0_I_1_I_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_135_reg_10_0_0_0 (.out1(out_MUX_135_reg_10_0_0_0),
    .sel(selector_MUX_135_reg_10_0_0_0),
    .in1(out_reg_102_reg_102),
    .in2(out_UUdata_converter_FU_11_i0_fu_cifar10_9853_11686));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_136_reg_100_0_0_0 (.out1(out_MUX_136_reg_100_0_0_0),
    .sel(selector_MUX_136_reg_100_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_plus_expr_FU_64_64_64_500_171_i0_fp_plus_expr_FU_64_64_64_500_171_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_139_reg_103_0_0_0 (.out1(out_MUX_139_reg_103_0_0_0),
    .sel(selector_MUX_139_reg_103_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_184_i6_fu_cifar10_9853_11762),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_140_reg_104_0_0_0 (.out1(out_MUX_140_reg_104_0_0_0),
    .sel(selector_MUX_140_reg_104_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_plus_expr_FU_64_64_64_500_171_i0_fp_plus_expr_FU_64_64_64_500_171_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_142_reg_106_0_0_0 (.out1(out_MUX_142_reg_106_0_0_0),
    .sel(selector_MUX_142_reg_106_0_0_0),
    .in1(out_const_2),
    .in2(out_fp_plus_expr_FU_64_64_64_500_171_i0_fp_plus_expr_FU_64_64_64_500_171_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_143_reg_107_0_0_0 (.out1(out_MUX_143_reg_107_0_0_0),
    .sel(selector_MUX_143_reg_107_0_0_0),
    .in1(out_const_2),
    .in2(out_fp_mult_expr_FU_64_64_64_500_170_i0_fp_mult_expr_FU_64_64_64_500_170_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_145_reg_109_0_0_0 (.out1(out_MUX_145_reg_109_0_0_0),
    .sel(selector_MUX_145_reg_109_0_0_0),
    .in1(out_ii_conv_conn_obj_10_IIdata_converter_FU_ii_conv_0),
    .in2(out_plus_expr_FU_32_0_32_174_i0_fu_cifar10_9853_11789));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_150_reg_113_0_0_0 (.out1(out_MUX_150_reg_113_0_0_0),
    .sel(selector_MUX_150_reg_113_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_184_i7_fu_cifar10_9853_11799),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_161_reg_2_0_0_0 (.out1(out_MUX_161_reg_2_0_0_0),
    .sel(selector_MUX_161_reg_2_0_0_0),
    .in1(out_reg_41_reg_41),
    .in2(out_UUdata_converter_FU_5_i0_fu_cifar10_9853_11105));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_169_reg_27_0_0_0 (.out1(out_MUX_169_reg_27_0_0_0),
    .sel(selector_MUX_169_reg_27_0_0_0),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_bit_ior_concat_expr_FU_176_i0_fu_cifar10_9853_11107));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_170_reg_28_0_0_0 (.out1(out_MUX_170_reg_28_0_0_0),
    .sel(selector_MUX_170_reg_28_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_184_i0_fu_cifar10_9853_11122),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_171_reg_29_0_0_0 (.out1(out_MUX_171_reg_29_0_0_0),
    .sel(selector_MUX_171_reg_29_0_0_0),
    .in1(out_reg_27_reg_27),
    .in2(out_ui_bit_ior_concat_expr_FU_176_i1_fu_cifar10_9853_11112));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_176_reg_33_0_0_0 (.out1(out_MUX_176_reg_33_0_0_0),
    .sel(selector_MUX_176_reg_33_0_0_0),
    .in1(out_reg_40_reg_40),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_177_reg_34_0_0_0 (.out1(out_MUX_177_reg_34_0_0_0),
    .sel(selector_MUX_177_reg_34_0_0_0),
    .in1(out_UIdata_converter_FU_158_i0_fu_cifar10_9853_11222),
    .in2(out_ii_conv_conn_obj_3_IIdata_converter_FU_ii_conv_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_183_reg_4_0_0_0 (.out1(out_MUX_183_reg_4_0_0_0),
    .sel(selector_MUX_183_reg_4_0_0_0),
    .in1(out_reg_65_reg_65),
    .in2(out_UUdata_converter_FU_7_i0_fu_cifar10_9853_11322));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_187_reg_43_0_0_0 (.out1(out_MUX_187_reg_43_0_0_0),
    .sel(selector_MUX_187_reg_43_0_0_0),
    .in1(out_reg_46_reg_46),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_189_reg_45_0_0_0 (.out1(out_MUX_189_reg_45_0_0_0),
    .sel(selector_MUX_189_reg_45_0_0_0),
    .in1(out_reg_51_reg_51),
    .in2(out_reg_47_reg_47));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_189_reg_45_0_0_1 (.out1(out_MUX_189_reg_45_0_0_1),
    .sel(selector_MUX_189_reg_45_0_0_1),
    .in1(out_reg_2_reg_2),
    .in2(out_MUX_189_reg_45_0_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_192_reg_48_0_0_0 (.out1(out_MUX_192_reg_48_0_0_0),
    .sel(selector_MUX_192_reg_48_0_0_0),
    .in1(out_BMEMORY_CTRLN_165_i0_BMEMORY_CTRLN_165_i0),
    .in2(out_fp_cond_expr_FU_64_64_64_64_166_i0_fu_cifar10_9853_11207));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_193_reg_49_0_0_0 (.out1(out_MUX_193_reg_49_0_0_0),
    .sel(selector_MUX_193_reg_49_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_184_i1_fu_cifar10_9853_11271),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_195_reg_50_0_0_0 (.out1(out_MUX_195_reg_50_0_0_0),
    .sel(selector_MUX_195_reg_50_0_0_0),
    .in1(out_reg_45_reg_45),
    .in2(out_ui_bit_ior_concat_expr_FU_176_i3_fu_cifar10_9853_11244));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_1_BMEMORY_CTRLN_165_i0_0_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0),
    .in1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_2),
    .in2(out_uu_conv_conn_obj_11_UUdata_converter_FU_uu_conv_4));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_1_BMEMORY_CTRLN_165_i0_0_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1),
    .in1(out_uu_conv_conn_obj_12_UUdata_converter_FU_uu_conv_5),
    .in2(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_6));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_1_BMEMORY_CTRLN_165_i0_0_0_2 (.out1(out_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2),
    .sel(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2),
    .in1(out_uu_conv_conn_obj_8_UUdata_converter_FU_uu_conv_11),
    .in2(out_uu_conv_conn_obj_9_UUdata_converter_FU_uu_conv_12));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_1_BMEMORY_CTRLN_165_i0_0_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_1_BMEMORY_CTRLN_165_i0_0_1_1 (.out1(out_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1),
    .in1(out_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2),
    .in2(out_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_200_reg_55_0_0_0 (.out1(out_MUX_200_reg_55_0_0_0),
    .sel(selector_MUX_200_reg_55_0_0_0),
    .in1(out_reg_48_reg_48),
    .in2(out_BMEMORY_CTRLN_165_i0_BMEMORY_CTRLN_165_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_202_reg_57_0_0_0 (.out1(out_MUX_202_reg_57_0_0_0),
    .sel(selector_MUX_202_reg_57_0_0_0),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_bit_ior_concat_expr_FU_176_i7_fu_cifar10_9853_11324));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_203_reg_58_0_0_0 (.out1(out_MUX_203_reg_58_0_0_0),
    .sel(selector_MUX_203_reg_58_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_184_i2_fu_cifar10_9853_11337),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_204_reg_59_0_0_0 (.out1(out_MUX_204_reg_59_0_0_0),
    .sel(selector_MUX_204_reg_59_0_0_0),
    .in1(out_reg_57_reg_57),
    .in2(out_ui_bit_ior_concat_expr_FU_176_i8_fu_cifar10_9853_11329));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_205_reg_6_0_0_0 (.out1(out_MUX_205_reg_6_0_0_0),
    .sel(selector_MUX_205_reg_6_0_0_0),
    .in1(out_reg_92_reg_92),
    .in2(out_UUdata_converter_FU_8_i0_fu_cifar10_9853_11524));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_207_reg_61_0_0_0 (.out1(out_MUX_207_reg_61_0_0_0),
    .sel(selector_MUX_207_reg_61_0_0_0),
    .in1(out___udivsi3_192_i0___udivsi3_192_i0),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_209_reg_63_0_0_0 (.out1(out_MUX_209_reg_63_0_0_0),
    .sel(selector_MUX_209_reg_63_0_0_0),
    .in1(out_reg_64_reg_64),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_213_reg_67_0_0_0 (.out1(out_MUX_213_reg_67_0_0_0),
    .sel(selector_MUX_213_reg_67_0_0_0),
    .in1(out_reg_70_reg_70),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_215_reg_69_0_0_0 (.out1(out_MUX_215_reg_69_0_0_0),
    .sel(selector_MUX_215_reg_69_0_0_0),
    .in1(out_reg_75_reg_75),
    .in2(out_reg_71_reg_71));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_215_reg_69_0_0_1 (.out1(out_MUX_215_reg_69_0_0_1),
    .sel(selector_MUX_215_reg_69_0_0_1),
    .in1(out_reg_4_reg_4),
    .in2(out_MUX_215_reg_69_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_216_reg_7_0_0_0 (.out1(out_MUX_216_reg_7_0_0_0),
    .sel(selector_MUX_216_reg_7_0_0_0),
    .in1(out_reg_88_reg_88),
    .in2(out_UUdata_converter_FU_9_i0_fu_cifar10_9853_11573));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_219_reg_72_0_0_0 (.out1(out_MUX_219_reg_72_0_0_0),
    .sel(selector_MUX_219_reg_72_0_0_0),
    .in1(out_BMEMORY_CTRLN_165_i1_BMEMORY_CTRLN_165_i0),
    .in2(out_fp_cond_expr_FU_64_64_64_64_166_i1_fu_cifar10_9853_11405));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_220_reg_73_0_0_0 (.out1(out_MUX_220_reg_73_0_0_0),
    .sel(selector_MUX_220_reg_73_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_184_i3_fu_cifar10_9853_11460),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_221_reg_74_0_0_0 (.out1(out_MUX_221_reg_74_0_0_0),
    .sel(selector_MUX_221_reg_74_0_0_0),
    .in1(out_reg_69_reg_69),
    .in2(out_ui_bit_ior_concat_expr_FU_176_i10_fu_cifar10_9853_11433));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_225_reg_78_0_0_0 (.out1(out_MUX_225_reg_78_0_0_0),
    .sel(selector_MUX_225_reg_78_0_0_0),
    .in1(out_reg_72_reg_72),
    .in2(out_BMEMORY_CTRLN_165_i1_BMEMORY_CTRLN_165_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_228_reg_80_0_0_0 (.out1(out_MUX_228_reg_80_0_0_0),
    .sel(selector_MUX_228_reg_80_0_0_0),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_bit_ior_concat_expr_FU_176_i14_fu_cifar10_9853_11528));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_233_reg_85_0_0_0 (.out1(out_MUX_233_reg_85_0_0_0),
    .sel(selector_MUX_233_reg_85_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_plus_expr_FU_64_64_64_500_171_i0_fp_plus_expr_FU_64_64_64_500_171_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_235_reg_87_0_0_0 (.out1(out_MUX_235_reg_87_0_0_0),
    .sel(selector_MUX_235_reg_87_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_184_i4_fu_cifar10_9853_11589),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_238_reg_9_0_0_0 (.out1(out_MUX_238_reg_9_0_0_0),
    .sel(selector_MUX_238_reg_9_0_0_0),
    .in1(out_reg_97_reg_97),
    .in2(out_UUdata_converter_FU_12_i0_fu_cifar10_9853_11660));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_239_reg_90_0_0_0 (.out1(out_MUX_239_reg_90_0_0_0),
    .sel(selector_MUX_239_reg_90_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_plus_expr_FU_64_64_64_500_171_i0_fp_plus_expr_FU_64_64_64_500_171_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_242_reg_93_0_0_0 (.out1(out_MUX_242_reg_93_0_0_0),
    .sel(selector_MUX_242_reg_93_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_ui_bit_ior_concat_expr_FU_176_i18_fu_cifar10_9853_11690));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_243_reg_94_0_0_0 (.out1(out_MUX_243_reg_94_0_0_0),
    .sel(selector_MUX_243_reg_94_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_184_i5_fu_cifar10_9853_11645),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_244_reg_95_0_0_0 (.out1(out_MUX_244_reg_95_0_0_0),
    .sel(selector_MUX_244_reg_95_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_plus_expr_FU_64_64_64_500_171_i0_fp_plus_expr_FU_64_64_64_500_171_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_165_i0_1_0_0 (.out1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0),
    .sel(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0),
    .in1(out_reg_98_reg_98),
    .in2(out_reg_30_reg_30));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_165_i0_1_0_1 (.out1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1),
    .sel(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1),
    .in1(out_reg_114_reg_114),
    .in2(out_reg_105_reg_105));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_165_i0_1_0_2 (.out1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2),
    .sel(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2),
    .in1(out_reg_101_reg_101),
    .in2(out_UUdata_converter_FU_140_i0_fu_cifar10_9853_11715));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_165_i0_1_0_3 (.out1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3),
    .sel(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_187_i0_fu_cifar10_9853_11166),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_187_i10_fu_cifar10_9853_14233));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_165_i0_1_0_4 (.out1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4),
    .sel(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_187_i12_fu_cifar10_9853_14259),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_187_i4_fu_cifar10_9853_14105));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_165_i0_1_0_5 (.out1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5),
    .sel(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_187_i7_fu_cifar10_9853_14165),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_187_i8_fu_cifar10_9853_14198));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_165_i0_1_1_0 (.out1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0),
    .sel(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0),
    .in1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0),
    .in2(out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_165_i0_1_1_1 (.out1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1),
    .sel(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1),
    .in1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2),
    .in2(out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_165_i0_1_1_2 (.out1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2),
    .sel(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2),
    .in1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4),
    .in2(out_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_165_i0_1_2_0 (.out1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0),
    .sel(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0),
    .in1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0),
    .in2(out_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_2_BMEMORY_CTRLN_165_i0_1_2_1 (.out1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1),
    .sel(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1),
    .in1(out_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2),
    .in2(out_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_5_BMEMORY_CTRLN_165_i1_0_0_0 (.out1(out_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0),
    .sel(selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0),
    .in1(out_uu_conv_conn_obj_4_UUdata_converter_FU_uu_conv_7),
    .in2(out_uu_conv_conn_obj_5_UUdata_converter_FU_uu_conv_8));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_5_BMEMORY_CTRLN_165_i1_0_0_1 (.out1(out_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1),
    .sel(selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1),
    .in1(out_uu_conv_conn_obj_6_UUdata_converter_FU_uu_conv_9),
    .in2(out_uu_conv_conn_obj_7_UUdata_converter_FU_uu_conv_10));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_5_BMEMORY_CTRLN_165_i1_0_1_0 (.out1(out_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0),
    .sel(selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0),
    .in1(out_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0),
    .in2(out_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0 (.out1(out_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0),
    .sel(selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0),
    .in1(in_port_input_data),
    .in2(in_port_pooling_1_output));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0 (.out1(out_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0),
    .sel(selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0),
    .in1(in_port_conv_1_output),
    .in2(in_port_conv_2_output));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0 (.out1(out_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0),
    .sel(selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0),
    .in1(in_port_kernel_1_data),
    .in2(in_port_kernel_2_data));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_6_BMEMORY_CTRLN_165_i1_1_0_0 (.out1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0),
    .sel(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0),
    .in1(out_reg_91_reg_91),
    .in2(out_reg_84_reg_84));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_6_BMEMORY_CTRLN_165_i1_1_0_1 (.out1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1),
    .sel(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1),
    .in1(out_reg_60_reg_60),
    .in2(out_UUdata_converter_FU_120_i0_fu_cifar10_9853_11600));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_6_BMEMORY_CTRLN_165_i1_1_0_2 (.out1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2),
    .sel(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2),
    .in1(out_UUdata_converter_FU_19_i0_fu_cifar10_9853_11081),
    .in2(out_UUdata_converter_FU_37_i0_fu_cifar10_9853_11227));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_6_BMEMORY_CTRLN_165_i1_1_0_3 (.out1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3),
    .sel(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3),
    .in1(out_UUdata_converter_FU_56_i0_fu_cifar10_9853_11300),
    .in2(out_UUdata_converter_FU_74_i0_fu_cifar10_9853_11416));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_6_BMEMORY_CTRLN_165_i1_1_0_4 (.out1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4),
    .sel(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_187_i1_fu_cifar10_9853_11369),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_187_i5_fu_cifar10_9853_14135));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_6_BMEMORY_CTRLN_165_i1_1_0_5 (.out1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5),
    .sel(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_187_i6_fu_cifar10_9853_14158),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_187_i9_fu_cifar10_9853_14205));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_6_BMEMORY_CTRLN_165_i1_1_1_0 (.out1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0),
    .sel(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0),
    .in1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0),
    .in2(out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_6_BMEMORY_CTRLN_165_i1_1_1_1 (.out1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1),
    .sel(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1),
    .in1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2),
    .in2(out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_6_BMEMORY_CTRLN_165_i1_1_1_2 (.out1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2),
    .sel(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2),
    .in1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4),
    .in2(out_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_6_BMEMORY_CTRLN_165_i1_1_2_0 (.out1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0),
    .sel(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0),
    .in1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0),
    .in2(out_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_6_BMEMORY_CTRLN_165_i1_1_2_1 (.out1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1),
    .sel(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1),
    .in1(out_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2),
    .in2(out_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0 (.out1(out_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0),
    .sel(selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0),
    .in1(out_reg_34_reg_34),
    .in2(out_reg_1_reg_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1 (.out1(out_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1),
    .sel(selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1),
    .in1(out_conv_out_const_0_I_1_I_32),
    .in2(out_UIdata_converter_FU_3_i0_fu_cifar10_9853_11056));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0 (.out1(out_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0),
    .sel(selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0),
    .in1(out_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0),
    .in2(out_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0 (.out1(out_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0),
    .sel(selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_3_reg_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1 (.out1(out_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1),
    .sel(selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1),
    .in1(out_reg_0_reg_0),
    .in2(out_UIdata_converter_FU_2_i0_fu_cifar10_9853_11055));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0 (.out1(out_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0),
    .sel(selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0),
    .in1(out_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0),
    .in2(out_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_72__Z3lrnPKdPdi_191_i0_0_0_0 (.out1(out_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0),
    .sel(selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0),
    .in1(in_port_conv_2_output),
    .in2(in_port_pooling_1_output));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_73__Z3lrnPKdPdi_191_i0_1_0_0 (.out1(out_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0),
    .sel(selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0),
    .in1(in_port_conv_2_output),
    .in2(in_port_pooling_1_output));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_74__Z3lrnPKdPdi_191_i0_2_0_0 (.out1(out_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0),
    .sel(selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0),
    .in1(out_reg_34_reg_34),
    .in2(out_conv_out_const_0_I_1_I_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_75___udivsi3_192_i0_0_0_0 (.out1(out_MUX_75___udivsi3_192_i0_0_0_0),
    .sel(selector_MUX_75___udivsi3_192_i0_0_0_0),
    .in1(out_reg_67_reg_67),
    .in2(out_reg_63_reg_63));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_75___udivsi3_192_i0_0_0_1 (.out1(out_MUX_75___udivsi3_192_i0_0_0_1),
    .sel(selector_MUX_75___udivsi3_192_i0_0_0_1),
    .in1(out_reg_43_reg_43),
    .in2(out_reg_33_reg_33));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_75___udivsi3_192_i0_0_0_2 (.out1(out_MUX_75___udivsi3_192_i0_0_0_2),
    .sel(selector_MUX_75___udivsi3_192_i0_0_0_2),
    .in1(out_reg_31_reg_31),
    .in2(in_port_input_data_size));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_75___udivsi3_192_i0_0_1_0 (.out1(out_MUX_75___udivsi3_192_i0_0_1_0),
    .sel(selector_MUX_75___udivsi3_192_i0_0_1_0),
    .in1(out_MUX_75___udivsi3_192_i0_0_0_0),
    .in2(out_MUX_75___udivsi3_192_i0_0_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_75___udivsi3_192_i0_0_1_1 (.out1(out_MUX_75___udivsi3_192_i0_0_1_1),
    .sel(selector_MUX_75___udivsi3_192_i0_0_1_1),
    .in1(out_MUX_75___udivsi3_192_i0_0_0_2),
    .in2(out_MUX_75___udivsi3_192_i0_0_1_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_76___udivsi3_192_i0_1_0_0 (.out1(out_MUX_76___udivsi3_192_i0_1_0_0),
    .sel(selector_MUX_76___udivsi3_192_i0_1_0_0),
    .in1(in_port_stride_1_size),
    .in2(in_port_stride_2_size));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0 (.out1(out_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0),
    .sel(selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0),
    .in1(out_BMEMORY_CTRLN_165_i0_BMEMORY_CTRLN_165_i0),
    .in2(out_BMEMORY_CTRLN_165_i1_BMEMORY_CTRLN_165_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0 (.out1(out_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0),
    .sel(selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0),
    .in1(out_reg_72_reg_72),
    .in2(out_reg_48_reg_48));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0 (.out1(out_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0),
    .sel(selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0),
    .in1(out_BMEMORY_CTRLN_165_i0_BMEMORY_CTRLN_165_i0),
    .in2(out_BMEMORY_CTRLN_165_i1_BMEMORY_CTRLN_165_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1 (.out1(out_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1),
    .sel(selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1),
    .in1(out_fp_rdiv_expr_FU_64_64_64_400_172_i0_fp_rdiv_expr_FU_64_64_64_400_172_i0),
    .in2(out_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0 (.out1(out_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0),
    .sel(selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0),
    .in1(out_reg_107_reg_107),
    .in2(out_BMEMORY_CTRLN_165_i0_BMEMORY_CTRLN_165_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1 (.out1(out_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1),
    .sel(selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1),
    .in1(out_BMEMORY_CTRLN_165_i1_BMEMORY_CTRLN_165_i0),
    .in2(out_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0 (.out1(out_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0),
    .sel(selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0),
    .in1(out_reg_104_reg_104),
    .in2(out_fp_mult_expr_FU_64_64_64_500_170_i0_fp_mult_expr_FU_64_64_64_500_170_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0 (.out1(out_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0),
    .sel(selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0),
    .in1(out_reg_95_reg_95),
    .in2(out_reg_85_reg_85));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1 (.out1(out_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1),
    .sel(selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1),
    .in1(out_reg_106_reg_106),
    .in2(out_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0 (.out1(out_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0),
    .sel(selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0),
    .in1(out_reg_108_reg_108),
    .in2(out_BMEMORY_CTRLN_165_i0_BMEMORY_CTRLN_165_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0 (.out1(out_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0),
    .sel(selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0),
    .in1(out_reg_111_reg_111),
    .in2(out_reg_104_reg_104));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_10 (.out1(out_uu_conv_conn_obj_7_UUdata_converter_FU_uu_conv_10),
    .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_11 (.out1(out_uu_conv_conn_obj_8_UUdata_converter_FU_uu_conv_11),
    .in1(out_reg_100_reg_100));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_12 (.out1(out_uu_conv_conn_obj_9_UUdata_converter_FU_uu_conv_12),
    .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_2),
    .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_3 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_3),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_4 (.out1(out_uu_conv_conn_obj_11_UUdata_converter_FU_uu_conv_4),
    .in1(out_reg_106_reg_106));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_5 (.out1(out_uu_conv_conn_obj_12_UUdata_converter_FU_uu_conv_5),
    .in1(out_fp_rdiv_expr_FU_64_64_64_400_172_i0_fp_rdiv_expr_FU_64_64_64_400_172_i0));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_6 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_6),
    .in1(out_reg_55_reg_55));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_7 (.out1(out_uu_conv_conn_obj_4_UUdata_converter_FU_uu_conv_7),
    .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_8 (.out1(out_uu_conv_conn_obj_5_UUdata_converter_FU_uu_conv_8),
    .in1(out_reg_78_reg_78));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_9 (.out1(out_uu_conv_conn_obj_6_UUdata_converter_FU_uu_conv_9),
    .in1(out_reg_90_reg_90));
  _Z11convolutionPKdPdS0_iiii _Z11convolutionPKdPdS0_iiii_190_i0 (.done_port(s_done__Z11convolutionPKdPdS0_iiii_190_i0),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_1),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_1),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_1),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_1),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_1),
    .clock(clock),
    .reset(reset),
    .start_port(s__Z11convolutionPKdPdS0_iiii_190_i02),
    .A(out_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0),
    .B(out_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0),
    .kernel(out_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0),
    .n(out_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0),
    .kernel_size(out_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size));
  _Z3lrnPKdPdi _Z3lrnPKdPdi_191_i0 (.done_port(s_done__Z3lrnPKdPdi_191_i0),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_2),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_2),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_2),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_2),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_2),
    .clock(clock),
    .reset(reset),
    .start_port(s__Z3lrnPKdPdi_191_i03),
    .A(out_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0),
    .B(out_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0),
    .size(out_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size));
  __udivsi3 __udivsi3_192_i0 (.done_port(s_done___udivsi3_192_i0),
    .return_port(out___udivsi3_192_i0___udivsi3_192_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___udivsi3_192_i04),
    .u(out_MUX_75___udivsi3_192_i0_0_1_1),
    .v(out_MUX_76___udivsi3_192_i0_1_0_0));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(3),
    .BITSIZE_out1(128)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_2,
      sig_in_bus_mergerMout_Wdata_ram0_1,
      sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(3),
    .BITSIZE_out1(64)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_2,
      sig_in_bus_mergerMout_addr_ram1_1,
      sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(3),
    .BITSIZE_out1(14)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
    .in1({sig_in_bus_mergerMout_data_ram_size2_2,
      sig_in_bus_mergerMout_data_ram_size2_1,
      sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(3),
    .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_),
    .in1({sig_in_bus_mergerMout_oe_ram3_2,
      sig_in_bus_mergerMout_oe_ram3_1,
      sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(3),
    .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_),
    .in1({sig_in_bus_mergerMout_we_ram4_2,
      sig_in_bus_mergerMout_we_ram4_1,
      sig_in_bus_mergerMout_we_ram4_0}));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0000000000000000000000000000000000000000000000000000000000000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0011111111110000000000000000000000000000000000000000000000000000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b01000000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010101)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_8 (.out1(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) conv_out___udivsi3_192_i0___udivsi3_192_i0_32_29 (.out1(out_conv_out___udivsi3_192_i0___udivsi3_192_i0_32_29),
    .in1(out___udivsi3_192_i0___udivsi3_192_i0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  IIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_I_1_I_32 (.out1(out_conv_out_const_0_I_1_I_32),
    .in1(out_const_0));
  IIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(32)) conv_out_const_3_I_2_I_32 (.out1(out_conv_out_const_3_I_2_I_32),
    .in1(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(7)) conv_out_const_4_8_7 (.out1(out_conv_out_const_4_8_7),
    .in1(out_const_4));
  fp_gt_expr_FU_64_1_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(1)) fp_gt_expr_FU_64_64_64_500_168_i0 (.R(out_fp_gt_expr_FU_64_64_64_500_168_i0_fp_gt_expr_FU_64_64_64_500_168_i0),
    .clock(clock),
    .reset(reset),
    .X(out_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0),
    .Y(out_const_1));
  fp_lt_expr_FU_64_1_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(1)) fp_lt_expr_FU_64_64_64_500_169_i0 (.R(out_fp_lt_expr_FU_64_64_64_500_169_i0_fp_lt_expr_FU_64_64_64_500_169_i0),
    .clock(clock),
    .reset(reset),
    .X(out_BMEMORY_CTRLN_165_i1_BMEMORY_CTRLN_165_i0),
    .Y(out_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0));
  fp_mult_expr_FU_64_64_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fp_mult_expr_FU_64_64_64_500_170_i0 (.R(out_fp_mult_expr_FU_64_64_64_500_170_i0_fp_mult_expr_FU_64_64_64_500_170_i0),
    .clock(clock),
    .reset(reset),
    .X(out_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1),
    .Y(out_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1));
  fp_plus_expr_FU_64_64_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fp_plus_expr_FU_64_64_64_500_171_i0 (.R(out_fp_plus_expr_FU_64_64_64_500_171_i0_fp_plus_expr_FU_64_64_64_500_171_i0),
    .clock(clock),
    .reset(reset),
    .X(out_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0),
    .Y(out_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1));
  fp_rdiv_expr_FU_64_64_400 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fp_rdiv_expr_FU_64_64_64_400_172_i0 (.R(out_fp_rdiv_expr_FU_64_64_64_400_172_i0_fp_rdiv_expr_FU_64_64_64_400_172_i0),
    .clock(clock),
    .reset(reset),
    .X(out_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0),
    .Y(out_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11055 (.out1(out_UIdata_converter_FU_2_i0_fu_cifar10_9853_11055),
    .in1(in_port_kernel_1_size));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11056 (.out1(out_UIdata_converter_FU_3_i0_fu_cifar10_9853_11056),
    .in1(in_port_input_data_size));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11058 (.out1(out_read_cond_FU_14_i0_fu_cifar10_9853_11058),
    .in1(out_reg_12_reg_12));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11081 (.out1(out_UUdata_converter_FU_19_i0_fu_cifar10_9853_11081),
    .in1(out_reg_29_reg_29));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11083 (.out1(out_read_cond_FU_20_i0_fu_cifar10_9853_11083),
    .in1(out_fp_gt_expr_FU_64_64_64_500_168_i0_fp_gt_expr_FU_64_64_64_500_168_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11105 (.out1(out_UUdata_converter_FU_5_i0_fu_cifar10_9853_11105),
    .in1(in_port_conv_1_output));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11107 (.out1(out_ui_bit_ior_concat_expr_FU_176_i0_fu_cifar10_9853_11107),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i3_fu_cifar10_9853_14645),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i1_fu_cifar10_9853_14648),
    .in3(out_const_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_11110 (.out1(out_ui_lshift_expr_FU_32_0_32_178_i0_fu_cifar10_9853_11110),
    .in1(in_port_input_data_size),
    .in2(out_const_7));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11112 (.out1(out_ui_bit_ior_concat_expr_FU_176_i1_fu_cifar10_9853_11112),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i2_fu_cifar10_9853_14627),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i0_fu_cifar10_9853_14631),
    .in3(out_const_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11120 (.out1(out_read_cond_FU_23_i0_fu_cifar10_9853_11120),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i0_fu_cifar10_9853_14316));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_cifar10_9853_11122 (.out1(out_ui_plus_expr_FU_32_0_32_184_i0_fu_cifar10_9853_11122),
    .in1(out_reg_28_reg_28),
    .in2(out_const_6));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11123 (.out1(out_read_cond_FU_24_i0_fu_cifar10_9853_11123),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i1_fu_cifar10_9853_14318));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11137 (.out1(out_UUdata_converter_FU_49_i0_fu_cifar10_9853_11137),
    .in1(out_reg_2_reg_2));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11139 (.out1(out_read_cond_FU_31_i0_fu_cifar10_9853_11139),
    .in1(out_reg_13_reg_13));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11154 (.out1(out_ui_plus_expr_FU_32_32_32_186_i0_fu_cifar10_9853_11154),
    .in1(out_reg_43_reg_43),
    .in2(in_port_stride_1_size));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_11166 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i0_fu_cifar10_9853_11166),
    .in1(in_port_pooling_1_output),
    .in2(out_ui_lshift_expr_FU_32_0_32_178_i1_fu_cifar10_9853_11171));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_11171 (.out1(out_ui_lshift_expr_FU_32_0_32_178_i1_fu_cifar10_9853_11171),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i1_fu_cifar10_9853_11174),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_11174 (.out1(out_ui_plus_expr_FU_32_32_32_186_i1_fu_cifar10_9853_11174),
    .in1(out_reg_39_reg_39),
    .in2(out_reg_44_reg_44));
  ui_mult_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu_cifar10_9853_11180 (.out1(out_ui_mult_expr_FU_32_32_32_0_181_i0_fu_cifar10_9853_11180),
    .clock(clock),
    .in1(out_reg_39_reg_39),
    .in2(out_reg_31_reg_31));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11191 (.out1(out_ui_plus_expr_FU_32_32_32_186_i2_fu_cifar10_9853_11191),
    .in1(out_reg_33_reg_33),
    .in2(in_port_stride_1_size));
  fp_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu_cifar10_9853_11207 (.out1(out_fp_cond_expr_FU_64_64_64_64_166_i0_fu_cifar10_9853_11207),
    .in1(out_fp_lt_expr_FU_64_64_64_500_169_i0_fp_lt_expr_FU_64_64_64_500_169_i0),
    .in2(out_reg_48_reg_48),
    .in3(out_reg_54_reg_54));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11222 (.out1(out_UIdata_converter_FU_158_i0_fu_cifar10_9853_11222),
    .in1(out_reg_31_reg_31));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11227 (.out1(out_UUdata_converter_FU_37_i0_fu_cifar10_9853_11227),
    .in1(out_reg_50_reg_50));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11242 (.out1(out_ui_bit_ior_concat_expr_FU_176_i2_fu_cifar10_9853_11242),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i5_fu_cifar10_9853_14672),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i3_fu_cifar10_9853_14675),
    .in3(out_const_7));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11244 (.out1(out_ui_bit_ior_concat_expr_FU_176_i3_fu_cifar10_9853_11244),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i4_fu_cifar10_9853_14657),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i2_fu_cifar10_9853_14660),
    .in3(out_const_7));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11252 (.out1(out_ui_bit_ior_concat_expr_FU_176_i4_fu_cifar10_9853_11252),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i8_fu_cifar10_9853_14717),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i6_fu_cifar10_9853_14720),
    .in3(out_const_7));
  ui_mult_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu_cifar10_9853_11255 (.out1(out_ui_mult_expr_FU_32_32_32_0_181_i1_fu_cifar10_9853_11255),
    .clock(clock),
    .in1(out_reg_25_reg_25),
    .in2(in_port_input_data_size));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_11258 (.out1(out_ui_lshift_expr_FU_32_0_32_178_i2_fu_cifar10_9853_11258),
    .in1(in_port_stride_1_size),
    .in2(out_const_7));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11260 (.out1(out_ui_bit_ior_concat_expr_FU_176_i5_fu_cifar10_9853_11260),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i7_fu_cifar10_9853_14702),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i5_fu_cifar10_9853_14705),
    .in3(out_const_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11266 (.out1(out_read_cond_FU_38_i0_fu_cifar10_9853_11266),
    .in1(out_reg_53_reg_53));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11269 (.out1(out_ui_bit_ior_concat_expr_FU_176_i6_fu_cifar10_9853_11269),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i6_fu_cifar10_9853_14687),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i4_fu_cifar10_9853_14690),
    .in3(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_cifar10_9853_11271 (.out1(out_ui_plus_expr_FU_32_0_32_184_i1_fu_cifar10_9853_11271),
    .in1(out_reg_49_reg_49),
    .in2(out_const_6));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11272 (.out1(out_read_cond_FU_39_i0_fu_cifar10_9853_11272),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i3_fu_cifar10_9853_14324));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11280 (.out1(out_read_cond_FU_44_i0_fu_cifar10_9853_11280),
    .in1(out_reg_56_reg_56));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11282 (.out1(out_read_cond_FU_45_i0_fu_cifar10_9853_11282),
    .in1(out_ui_gt_expr_FU_32_32_32_177_i1_fu_cifar10_9853_14328));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11284 (.out1(out_UIdata_converter_FU_6_i0_fu_cifar10_9853_11284),
    .in1(in_port_kernel_2_size));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11286 (.out1(out_read_cond_FU_50_i0_fu_cifar10_9853_11286),
    .in1(out_reg_35_reg_35));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11300 (.out1(out_UUdata_converter_FU_56_i0_fu_cifar10_9853_11300),
    .in1(out_reg_59_reg_59));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11302 (.out1(out_read_cond_FU_57_i0_fu_cifar10_9853_11302),
    .in1(out_fp_gt_expr_FU_64_64_64_500_168_i0_fp_gt_expr_FU_64_64_64_500_168_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11322 (.out1(out_UUdata_converter_FU_7_i0_fu_cifar10_9853_11322),
    .in1(in_port_conv_2_output));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11324 (.out1(out_ui_bit_ior_concat_expr_FU_176_i7_fu_cifar10_9853_11324),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i10_fu_cifar10_9853_14744),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i8_fu_cifar10_9853_14747),
    .in3(out_const_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_11327 (.out1(out_ui_lshift_expr_FU_32_0_32_178_i3_fu_cifar10_9853_11327),
    .in1(out_reg_31_reg_31),
    .in2(out_const_7));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11329 (.out1(out_ui_bit_ior_concat_expr_FU_176_i8_fu_cifar10_9853_11329),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i9_fu_cifar10_9853_14729),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i7_fu_cifar10_9853_14732),
    .in3(out_const_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11335 (.out1(out_read_cond_FU_60_i0_fu_cifar10_9853_11335),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i4_fu_cifar10_9853_14334));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_cifar10_9853_11337 (.out1(out_ui_plus_expr_FU_32_0_32_184_i2_fu_cifar10_9853_11337),
    .in1(out_reg_58_reg_58),
    .in2(out_const_6));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11338 (.out1(out_read_cond_FU_61_i0_fu_cifar10_9853_11338),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i5_fu_cifar10_9853_14336));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11348 (.out1(out_UUdata_converter_FU_87_i0_fu_cifar10_9853_11348),
    .in1(out_reg_4_reg_4));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11350 (.out1(out_read_cond_FU_68_i0_fu_cifar10_9853_11350),
    .in1(out_reg_14_reg_14));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11354 (.out1(out_ui_plus_expr_FU_32_32_32_186_i3_fu_cifar10_9853_11354),
    .in1(out_reg_67_reg_67),
    .in2(in_port_stride_2_size));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_11369 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i1_fu_cifar10_9853_11369),
    .in1(in_port_pooling_2_output),
    .in2(out_ui_lshift_expr_FU_32_0_32_178_i4_fu_cifar10_9853_11374));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_11374 (.out1(out_ui_lshift_expr_FU_32_0_32_178_i4_fu_cifar10_9853_11374),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i4_fu_cifar10_9853_11377),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_11377 (.out1(out_ui_plus_expr_FU_32_32_32_186_i4_fu_cifar10_9853_11377),
    .in1(out_reg_39_reg_39),
    .in2(out_reg_68_reg_68));
  ui_mult_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu_cifar10_9853_11383 (.out1(out_ui_mult_expr_FU_32_32_32_0_181_i2_fu_cifar10_9853_11383),
    .clock(clock),
    .in1(out_reg_39_reg_39),
    .in2(out_reg_61_reg_61));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11393 (.out1(out_ui_plus_expr_FU_32_32_32_186_i5_fu_cifar10_9853_11393),
    .in1(out_reg_63_reg_63),
    .in2(in_port_stride_2_size));
  fp_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu_cifar10_9853_11405 (.out1(out_fp_cond_expr_FU_64_64_64_64_166_i1_fu_cifar10_9853_11405),
    .in1(out_fp_lt_expr_FU_64_64_64_500_169_i0_fp_lt_expr_FU_64_64_64_500_169_i0),
    .in2(out_reg_72_reg_72),
    .in3(out_reg_54_reg_54));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11416 (.out1(out_UUdata_converter_FU_74_i0_fu_cifar10_9853_11416),
    .in1(out_reg_74_reg_74));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11431 (.out1(out_ui_bit_ior_concat_expr_FU_176_i9_fu_cifar10_9853_11431),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i12_fu_cifar10_9853_14771),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i10_fu_cifar10_9853_14774),
    .in3(out_const_7));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11433 (.out1(out_ui_bit_ior_concat_expr_FU_176_i10_fu_cifar10_9853_11433),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i11_fu_cifar10_9853_14756),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i9_fu_cifar10_9853_14759),
    .in3(out_const_7));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11441 (.out1(out_ui_bit_ior_concat_expr_FU_176_i11_fu_cifar10_9853_11441),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i15_fu_cifar10_9853_14816),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i13_fu_cifar10_9853_14819),
    .in3(out_const_7));
  ui_mult_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu_cifar10_9853_11444 (.out1(out_ui_mult_expr_FU_32_32_32_0_181_i3_fu_cifar10_9853_11444),
    .clock(clock),
    .in1(out_reg_26_reg_26),
    .in2(out_reg_38_reg_38));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_11447 (.out1(out_ui_lshift_expr_FU_32_0_32_178_i5_fu_cifar10_9853_11447),
    .in1(in_port_stride_2_size),
    .in2(out_const_7));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11449 (.out1(out_ui_bit_ior_concat_expr_FU_176_i12_fu_cifar10_9853_11449),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i14_fu_cifar10_9853_14801),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i12_fu_cifar10_9853_14804),
    .in3(out_const_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11455 (.out1(out_read_cond_FU_75_i0_fu_cifar10_9853_11455),
    .in1(out_reg_77_reg_77));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11458 (.out1(out_ui_bit_ior_concat_expr_FU_176_i13_fu_cifar10_9853_11458),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i13_fu_cifar10_9853_14786),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i11_fu_cifar10_9853_14789),
    .in3(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_cifar10_9853_11460 (.out1(out_ui_plus_expr_FU_32_0_32_184_i3_fu_cifar10_9853_11460),
    .in1(out_reg_73_reg_73),
    .in2(out_const_6));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11461 (.out1(out_read_cond_FU_76_i0_fu_cifar10_9853_11461),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i7_fu_cifar10_9853_14342));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11468 (.out1(out_read_cond_FU_81_i0_fu_cifar10_9853_11468),
    .in1(out_reg_79_reg_79));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11470 (.out1(out_read_cond_FU_82_i0_fu_cifar10_9853_11470),
    .in1(out_ui_gt_expr_FU_32_32_32_177_i3_fu_cifar10_9853_14346));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11474 (.out1(out_read_cond_FU_98_i0_fu_cifar10_9853_11474),
    .in1(out_reg_15_reg_15));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11492 (.out1(out_UIdata_converter_FU_4_i0_fu_cifar10_9853_11492),
    .in1(in_port_kernel_2_size));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11502 (.out1(out_read_cond_FU_101_i0_fu_cifar10_9853_11502),
    .in1(out_reg_16_reg_16));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11516 (.out1(out_UUdata_converter_FU_116_i0_fu_cifar10_9853_11516),
    .in1(out_reg_80_reg_80));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11524 (.out1(out_UUdata_converter_FU_8_i0_fu_cifar10_9853_11524),
    .in1(in_port_dense_layer_1_output));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11528 (.out1(out_ui_bit_ior_concat_expr_FU_176_i14_fu_cifar10_9853_11528),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i16_fu_cifar10_9853_14828),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i14_fu_cifar10_9853_14831),
    .in3(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11565 (.out1(out_UUdata_converter_FU_115_i0_fu_cifar10_9853_11565),
    .in1(out_reg_7_reg_7));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11573 (.out1(out_UUdata_converter_FU_9_i0_fu_cifar10_9853_11573),
    .in1(in_port_weights_1));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11577 (.out1(out_ui_bit_ior_concat_expr_FU_176_i15_fu_cifar10_9853_11577),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i17_fu_cifar10_9853_14843),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i15_fu_cifar10_9853_14846),
    .in3(out_const_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_11580 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i0_fu_cifar10_9853_11580),
    .in1(out_ui_mult_expr_FU_32_32_32_0_181_i4_fu_cifar10_9853_11583),
    .in2(out_const_7));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_cifar10_9853_11583 (.out1(out_ui_mult_expr_FU_32_32_32_0_181_i4_fu_cifar10_9853_11583),
    .clock(clock),
    .in1(out_reg_61_reg_61),
    .in2(out_reg_61_reg_61));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_cifar10_9853_11589 (.out1(out_ui_plus_expr_FU_32_0_32_184_i4_fu_cifar10_9853_11589),
    .in1(out_reg_87_reg_87),
    .in2(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11600 (.out1(out_UUdata_converter_FU_120_i0_fu_cifar10_9853_11600),
    .in1(out_reg_6_reg_6));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11607 (.out1(out_ui_bit_ior_concat_expr_FU_176_i16_fu_cifar10_9853_11607),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i18_fu_cifar10_9853_14855),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i16_fu_cifar10_9853_14858),
    .in3(out_const_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11612 (.out1(out_read_cond_FU_107_i0_fu_cifar10_9853_11612),
    .in1(out_reg_89_reg_89));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11614 (.out1(out_read_cond_FU_110_i0_fu_cifar10_9853_11614),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i9_fu_cifar10_9853_14354));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11617 (.out1(out_UUdata_converter_FU_10_i0_fu_cifar10_9853_11617),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_187_i2_fu_cifar10_9853_11620));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_11620 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i2_fu_cifar10_9853_11620),
    .in1(in_port_dense_layer_1_output),
    .in2(out_ui_lshift_expr_FU_32_0_32_180_i0_fu_cifar10_9853_11623));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_11623 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i0_fu_cifar10_9853_11623),
    .in1(in_port_neurons_dense_1_size),
    .in2(out_const_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11625 (.out1(out_read_cond_FU_117_i0_fu_cifar10_9853_11625),
    .in1(out_reg_82_reg_82));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11628 (.out1(out_read_cond_FU_121_i0_fu_cifar10_9853_11628),
    .in1(out_fp_gt_expr_FU_64_64_64_500_168_i0_fp_gt_expr_FU_64_64_64_500_168_i0));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11633 (.out1(out_read_cond_FU_124_i0_fu_cifar10_9853_11633),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i10_fu_cifar10_9853_14360));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11640 (.out1(out_UUdata_converter_FU_135_i0_fu_cifar10_9853_11640),
    .in1(out_reg_9_reg_9));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_cifar10_9853_11645 (.out1(out_ui_plus_expr_FU_32_0_32_184_i5_fu_cifar10_9853_11645),
    .in1(out_reg_94_reg_94),
    .in2(out_const_6));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11646 (.out1(out_read_cond_FU_128_i0_fu_cifar10_9853_11646),
    .in1(out_reg_99_reg_99));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11660 (.out1(out_UUdata_converter_FU_12_i0_fu_cifar10_9853_11660),
    .in1(in_port_weights_2));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11664 (.out1(out_ui_bit_ior_concat_expr_FU_176_i17_fu_cifar10_9853_11664),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i20_fu_cifar10_9853_14882),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i18_fu_cifar10_9853_14885),
    .in3(out_const_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_11667 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i1_fu_cifar10_9853_11667),
    .in1(in_port_neurons_dense_1_size),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11678 (.out1(out_UUdata_converter_FU_136_i0_fu_cifar10_9853_11678),
    .in1(out_reg_93_reg_93));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11686 (.out1(out_UUdata_converter_FU_11_i0_fu_cifar10_9853_11686),
    .in1(in_port_dense_layer_2_output));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11690 (.out1(out_ui_bit_ior_concat_expr_FU_176_i18_fu_cifar10_9853_11690),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i19_fu_cifar10_9853_14867),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i17_fu_cifar10_9853_14870),
    .in3(out_const_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11700 (.out1(out_read_cond_FU_131_i0_fu_cifar10_9853_11700),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i12_fu_cifar10_9853_14364));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11703 (.out1(out_UUdata_converter_FU_13_i0_fu_cifar10_9853_11703),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_187_i3_fu_cifar10_9853_11706));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_11706 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i3_fu_cifar10_9853_11706),
    .in1(in_port_dense_layer_2_output),
    .in2(out_ui_lshift_expr_FU_32_0_32_180_i1_fu_cifar10_9853_11709));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_11709 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i1_fu_cifar10_9853_11709),
    .in1(in_port_neurons_dense_2_size),
    .in2(out_const_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11711 (.out1(out_read_cond_FU_137_i0_fu_cifar10_9853_11711),
    .in1(out_reg_17_reg_17));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_cifar10_9853_11715 (.out1(out_UUdata_converter_FU_140_i0_fu_cifar10_9853_11715),
    .in1(out_reg_10_reg_10));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11717 (.out1(out_read_cond_FU_141_i0_fu_cifar10_9853_11717),
    .in1(out_fp_gt_expr_FU_64_64_64_500_168_i0_fp_gt_expr_FU_64_64_64_500_168_i0));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_cifar10_9853_11729 (.out1(out_ui_bit_ior_concat_expr_FU_176_i19_fu_cifar10_9853_11729),
    .in1(out_ui_lshift_expr_FU_32_0_32_180_i21_fu_cifar10_9853_14894),
    .in2(out_ui_bit_and_expr_FU_8_0_8_175_i19_fu_cifar10_9853_14897),
    .in3(out_const_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11735 (.out1(out_read_cond_FU_144_i0_fu_cifar10_9853_11735),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i13_fu_cifar10_9853_14370));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_cifar10_9853_11762 (.out1(out_ui_plus_expr_FU_32_0_32_184_i6_fu_cifar10_9853_11762),
    .in1(out_reg_103_reg_103),
    .in2(out_const_6));
  fp_float_expr_32_64_FU_32_64_500 #(.BITSIZE_I(32),
    .BITSIZE_O(64)) fu_cifar10_9853_11783 (.O(out_fp_float_expr_32_64_FU_32_64_500_167_i0_fu_cifar10_9853_11783),
    .clock(clock),
    .reset(reset),
    .I(out_reg_109_reg_109));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_cifar10_9853_11789 (.out1(out_plus_expr_FU_32_0_32_174_i0_fu_cifar10_9853_11789),
    .in1(out_reg_109_reg_109),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_cifar10_9853_11799 (.out1(out_ui_plus_expr_FU_32_0_32_184_i7_fu_cifar10_9853_11799),
    .in1(out_reg_113_reg_113),
    .in2(out_const_6));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11819 (.out1(out_read_cond_FU_152_i0_fu_cifar10_9853_11819),
    .in1(out_reg_110_reg_110));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11821 (.out1(out_read_cond_FU_153_i0_fu_cifar10_9853_11821),
    .in1(out_reg_112_reg_112));
  read_cond_FU #(.BITSIZE_in1(1)) fu_cifar10_9853_11823 (.out1(out_read_cond_FU_156_i0_fu_cifar10_9853_11823),
    .in1(out_reg_115_reg_115));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14102 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i2_fu_cifar10_9853_14102),
    .in1(out_reg_43_reg_43),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_14105 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i4_fu_cifar10_9853_14105),
    .in1(out_reg_42_reg_42),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i2_fu_cifar10_9853_14102));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14132 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i3_fu_cifar10_9853_14132),
    .in1(out_reg_67_reg_67),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_14135 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i5_fu_cifar10_9853_14135),
    .in1(out_reg_66_reg_66),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i3_fu_cifar10_9853_14132));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14155 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i4_fu_cifar10_9853_14155),
    .in1(out_reg_87_reg_87),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_14158 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i6_fu_cifar10_9853_14158),
    .in1(out_reg_86_reg_86),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i4_fu_cifar10_9853_14155));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14162 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i5_fu_cifar10_9853_14162),
    .in1(out_reg_87_reg_87),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_14165 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i7_fu_cifar10_9853_14165),
    .in1(in_port_pooling_2_output),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i5_fu_cifar10_9853_14162));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14195 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i6_fu_cifar10_9853_14195),
    .in1(out_reg_94_reg_94),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_14198 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i8_fu_cifar10_9853_14198),
    .in1(out_reg_96_reg_96),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i6_fu_cifar10_9853_14195));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14202 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i7_fu_cifar10_9853_14202),
    .in1(out_reg_94_reg_94),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_14205 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i9_fu_cifar10_9853_14205),
    .in1(in_port_dense_layer_1_output),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i7_fu_cifar10_9853_14202));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14230 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i8_fu_cifar10_9853_14230),
    .in1(out_reg_103_reg_103),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_14233 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i10_fu_cifar10_9853_14233),
    .in1(in_port_dense_layer_2_output),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i8_fu_cifar10_9853_14230));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14241 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i9_fu_cifar10_9853_14241),
    .in1(out_reg_103_reg_103),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_14244 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i11_fu_cifar10_9853_14244),
    .in1(in_port_output_data),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i9_fu_cifar10_9853_14241));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14256 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i10_fu_cifar10_9853_14256),
    .in1(out_reg_113_reg_113),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_14259 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i12_fu_cifar10_9853_14259),
    .in1(in_port_output_data),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i10_fu_cifar10_9853_14256));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14263 (.out1(out_ui_lshift_expr_FU_32_0_32_179_i11_fu_cifar10_9853_14263),
    .in1(out_reg_113_reg_113),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_cifar10_9853_14266 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_187_i13_fu_cifar10_9853_14266),
    .in1(in_port_output_data),
    .in2(out_ui_lshift_expr_FU_32_0_32_179_i11_fu_cifar10_9853_14263));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_cifar10_9853_14312 (.out1(out_ui_ne_expr_FU_32_0_32_182_i0_fu_cifar10_9853_14312),
    .in1(in_port_input_data_size),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14316 (.out1(out_ui_ne_expr_FU_32_32_32_183_i0_fu_cifar10_9853_14316),
    .in1(out_reg_29_reg_29),
    .in2(out_reg_27_reg_27));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14318 (.out1(out_ui_ne_expr_FU_32_32_32_183_i1_fu_cifar10_9853_14318),
    .in1(out_reg_28_reg_28),
    .in2(in_port_input_data_size));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_cifar10_9853_14320 (.out1(out_ui_ne_expr_FU_32_0_32_182_i1_fu_cifar10_9853_14320),
    .in1(in_port_stride_1_size),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14322 (.out1(out_ui_ne_expr_FU_32_32_32_183_i2_fu_cifar10_9853_14322),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i3_fu_cifar10_9853_11244),
    .in2(out_reg_52_reg_52));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14324 (.out1(out_ui_ne_expr_FU_32_32_32_183_i3_fu_cifar10_9853_14324),
    .in1(out_reg_49_reg_49),
    .in2(in_port_stride_1_size));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14326 (.out1(out_ui_gt_expr_FU_32_32_32_177_i0_fu_cifar10_9853_14326),
    .in1(in_port_input_data_size),
    .in2(out_reg_46_reg_46));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14328 (.out1(out_ui_gt_expr_FU_32_32_32_177_i1_fu_cifar10_9853_14328),
    .in1(in_port_input_data_size),
    .in2(out_reg_40_reg_40));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_cifar10_9853_14330 (.out1(out_ui_ne_expr_FU_32_0_32_182_i2_fu_cifar10_9853_14330),
    .in1(out_reg_31_reg_31),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14334 (.out1(out_ui_ne_expr_FU_32_32_32_183_i4_fu_cifar10_9853_14334),
    .in1(out_reg_57_reg_57),
    .in2(out_reg_59_reg_59));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14336 (.out1(out_ui_ne_expr_FU_32_32_32_183_i5_fu_cifar10_9853_14336),
    .in1(out_reg_58_reg_58),
    .in2(out_reg_31_reg_31));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_cifar10_9853_14338 (.out1(out_ui_ne_expr_FU_32_0_32_182_i3_fu_cifar10_9853_14338),
    .in1(in_port_stride_2_size),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14340 (.out1(out_ui_ne_expr_FU_32_32_32_183_i6_fu_cifar10_9853_14340),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i10_fu_cifar10_9853_11433),
    .in2(out_reg_76_reg_76));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14342 (.out1(out_ui_ne_expr_FU_32_32_32_183_i7_fu_cifar10_9853_14342),
    .in1(out_reg_73_reg_73),
    .in2(in_port_stride_2_size));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14344 (.out1(out_ui_gt_expr_FU_32_32_32_177_i2_fu_cifar10_9853_14344),
    .in1(out_reg_31_reg_31),
    .in2(out_reg_70_reg_70));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14346 (.out1(out_ui_gt_expr_FU_32_32_32_177_i3_fu_cifar10_9853_14346),
    .in1(out_reg_31_reg_31),
    .in2(out_reg_64_reg_64));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_cifar10_9853_14348 (.out1(out_ui_ne_expr_FU_32_0_32_182_i4_fu_cifar10_9853_14348),
    .in1(in_port_neurons_dense_1_size),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_cifar10_9853_14350 (.out1(out_ui_ne_expr_FU_32_0_32_182_i5_fu_cifar10_9853_14350),
    .in1(in_port_neurons_dense_2_size),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14352 (.out1(out_ui_ne_expr_FU_32_32_32_183_i8_fu_cifar10_9853_14352),
    .in1(out_ui_plus_expr_FU_32_0_32_184_i4_fu_cifar10_9853_11589),
    .in2(out_reg_81_reg_81));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14354 (.out1(out_ui_ne_expr_FU_32_32_32_183_i9_fu_cifar10_9853_14354),
    .in1(out_reg_80_reg_80),
    .in2(out_reg_8_reg_8));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_cifar10_9853_14356 (.out1(out_ui_ne_expr_FU_32_0_32_182_i6_fu_cifar10_9853_14356),
    .in1(out_ui_mult_expr_FU_32_32_32_0_181_i4_fu_cifar10_9853_11583),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14360 (.out1(out_ui_ne_expr_FU_32_32_32_183_i10_fu_cifar10_9853_14360),
    .in1(out_reg_92_reg_92),
    .in2(out_reg_8_reg_8));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14362 (.out1(out_ui_ne_expr_FU_32_32_32_183_i11_fu_cifar10_9853_14362),
    .in1(out_ui_plus_expr_FU_32_0_32_184_i5_fu_cifar10_9853_11645),
    .in2(in_port_neurons_dense_1_size));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14364 (.out1(out_ui_ne_expr_FU_32_32_32_183_i12_fu_cifar10_9853_14364),
    .in1(out_reg_93_reg_93),
    .in2(out_reg_11_reg_11));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_cifar10_9853_14366 (.out1(out_ui_ne_expr_FU_32_0_32_182_i7_fu_cifar10_9853_14366),
    .in1(in_port_neurons_dense_1_size),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14370 (.out1(out_ui_ne_expr_FU_32_32_32_183_i13_fu_cifar10_9853_14370),
    .in1(out_reg_102_reg_102),
    .in2(out_reg_11_reg_11));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu_cifar10_9853_14372 (.out1(out_ne_expr_FU_32_0_32_173_i0_fu_cifar10_9853_14372),
    .in1(out_plus_expr_FU_32_0_32_174_i0_fu_cifar10_9853_11789),
    .in2(out_const_5));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14374 (.out1(out_ui_ne_expr_FU_32_32_32_183_i14_fu_cifar10_9853_14374),
    .in1(out_reg_103_reg_103),
    .in2(in_port_neurons_dense_2_size));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_cifar10_9853_14376 (.out1(out_ui_gt_expr_FU_32_32_32_177_i4_fu_cifar10_9853_14376),
    .in1(in_port_neurons_dense_2_size),
    .in2(out_ui_plus_expr_FU_32_0_32_184_i7_fu_cifar10_9853_11799));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14619 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i0_fu_cifar10_9853_14619),
    .in1(out_reg_29_reg_29),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_cifar10_9853_14624 (.out1(out_ui_plus_expr_FU_32_0_32_185_i0_fu_cifar10_9853_14624),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i0_fu_cifar10_9853_14619),
    .in2(out_const_6));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14627 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i2_fu_cifar10_9853_14627),
    .in1(out_ui_plus_expr_FU_32_0_32_185_i0_fu_cifar10_9853_14624),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14631 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i0_fu_cifar10_9853_14631),
    .in1(out_reg_29_reg_29),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14636 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i1_fu_cifar10_9853_14636),
    .in1(out_ui_lshift_expr_FU_32_0_32_178_i0_fu_cifar10_9853_11110),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14640 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i2_fu_cifar10_9853_14640),
    .in1(out_reg_27_reg_27),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_14642 (.out1(out_ui_plus_expr_FU_32_32_32_186_i6_fu_cifar10_9853_14642),
    .in1(out_reg_18_reg_18),
    .in2(out_ui_rshift_expr_FU_32_0_32_188_i2_fu_cifar10_9853_14640));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14645 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i3_fu_cifar10_9853_14645),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i6_fu_cifar10_9853_14642),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14648 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i1_fu_cifar10_9853_14648),
    .in1(out_reg_27_reg_27),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14652 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i3_fu_cifar10_9853_14652),
    .in1(out_reg_50_reg_50),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_cifar10_9853_14654 (.out1(out_ui_plus_expr_FU_32_0_32_185_i1_fu_cifar10_9853_14654),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i3_fu_cifar10_9853_14652),
    .in2(out_const_6));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14657 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i4_fu_cifar10_9853_14657),
    .in1(out_ui_plus_expr_FU_32_0_32_185_i1_fu_cifar10_9853_14654),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14660 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i2_fu_cifar10_9853_14660),
    .in1(out_reg_50_reg_50),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14664 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i4_fu_cifar10_9853_14664),
    .in1(out_ui_lshift_expr_FU_32_0_32_178_i0_fu_cifar10_9853_11110),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14667 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i5_fu_cifar10_9853_14667),
    .in1(out_reg_45_reg_45),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_14669 (.out1(out_ui_plus_expr_FU_32_32_32_186_i7_fu_cifar10_9853_14669),
    .in1(out_reg_19_reg_19),
    .in2(out_ui_rshift_expr_FU_32_0_32_188_i5_fu_cifar10_9853_14667));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14672 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i5_fu_cifar10_9853_14672),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i7_fu_cifar10_9853_14669),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14675 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i3_fu_cifar10_9853_14675),
    .in1(out_reg_45_reg_45),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14679 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i6_fu_cifar10_9853_14679),
    .in1(out_reg_45_reg_45),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14682 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i7_fu_cifar10_9853_14682),
    .in1(out_ui_lshift_expr_FU_32_0_32_178_i2_fu_cifar10_9853_11258),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_14684 (.out1(out_ui_plus_expr_FU_32_32_32_186_i8_fu_cifar10_9853_14684),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i6_fu_cifar10_9853_14679),
    .in2(out_reg_20_reg_20));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14687 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i6_fu_cifar10_9853_14687),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i8_fu_cifar10_9853_14684),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14690 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i4_fu_cifar10_9853_14690),
    .in1(out_reg_45_reg_45),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14694 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i8_fu_cifar10_9853_14694),
    .in1(out_ui_lshift_expr_FU_32_0_32_178_i2_fu_cifar10_9853_11258),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14697 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i9_fu_cifar10_9853_14697),
    .in1(out_reg_45_reg_45),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_14699 (.out1(out_ui_plus_expr_FU_32_32_32_186_i9_fu_cifar10_9853_14699),
    .in1(out_reg_21_reg_21),
    .in2(out_ui_rshift_expr_FU_32_0_32_188_i9_fu_cifar10_9853_14697));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14702 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i7_fu_cifar10_9853_14702),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i9_fu_cifar10_9853_14699),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14705 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i5_fu_cifar10_9853_14705),
    .in1(out_reg_45_reg_45),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14709 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i10_fu_cifar10_9853_14709),
    .in1(out_reg_2_reg_2),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14712 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i11_fu_cifar10_9853_14712),
    .in1(out_ui_lshift_expr_FU_32_0_32_178_i6_fu_cifar10_9853_14905),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_14714 (.out1(out_ui_plus_expr_FU_32_32_32_186_i10_fu_cifar10_9853_14714),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i10_fu_cifar10_9853_14709),
    .in2(out_reg_32_reg_32));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14717 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i8_fu_cifar10_9853_14717),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i10_fu_cifar10_9853_14714),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14720 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i6_fu_cifar10_9853_14720),
    .in1(out_reg_2_reg_2),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14724 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i12_fu_cifar10_9853_14724),
    .in1(out_reg_59_reg_59),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_cifar10_9853_14726 (.out1(out_ui_plus_expr_FU_32_0_32_185_i2_fu_cifar10_9853_14726),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i12_fu_cifar10_9853_14724),
    .in2(out_const_6));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14729 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i9_fu_cifar10_9853_14729),
    .in1(out_ui_plus_expr_FU_32_0_32_185_i2_fu_cifar10_9853_14726),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14732 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i7_fu_cifar10_9853_14732),
    .in1(out_reg_59_reg_59),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14736 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i13_fu_cifar10_9853_14736),
    .in1(out_ui_lshift_expr_FU_32_0_32_178_i3_fu_cifar10_9853_11327),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14739 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i14_fu_cifar10_9853_14739),
    .in1(out_reg_57_reg_57),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_14741 (.out1(out_ui_plus_expr_FU_32_32_32_186_i11_fu_cifar10_9853_14741),
    .in1(out_reg_36_reg_36),
    .in2(out_ui_rshift_expr_FU_32_0_32_188_i14_fu_cifar10_9853_14739));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14744 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i10_fu_cifar10_9853_14744),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i11_fu_cifar10_9853_14741),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14747 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i8_fu_cifar10_9853_14747),
    .in1(out_reg_57_reg_57),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14751 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i15_fu_cifar10_9853_14751),
    .in1(out_reg_74_reg_74),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_cifar10_9853_14753 (.out1(out_ui_plus_expr_FU_32_0_32_185_i3_fu_cifar10_9853_14753),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i15_fu_cifar10_9853_14751),
    .in2(out_const_6));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14756 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i11_fu_cifar10_9853_14756),
    .in1(out_ui_plus_expr_FU_32_0_32_185_i3_fu_cifar10_9853_14753),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14759 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i9_fu_cifar10_9853_14759),
    .in1(out_reg_74_reg_74),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14763 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i16_fu_cifar10_9853_14763),
    .in1(out_ui_lshift_expr_FU_32_0_32_178_i3_fu_cifar10_9853_11327),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14766 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i17_fu_cifar10_9853_14766),
    .in1(out_reg_69_reg_69),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_14768 (.out1(out_ui_plus_expr_FU_32_32_32_186_i12_fu_cifar10_9853_14768),
    .in1(out_reg_37_reg_37),
    .in2(out_ui_rshift_expr_FU_32_0_32_188_i17_fu_cifar10_9853_14766));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14771 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i12_fu_cifar10_9853_14771),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i12_fu_cifar10_9853_14768),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14774 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i10_fu_cifar10_9853_14774),
    .in1(out_reg_69_reg_69),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14778 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i18_fu_cifar10_9853_14778),
    .in1(out_reg_69_reg_69),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14781 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i19_fu_cifar10_9853_14781),
    .in1(out_ui_lshift_expr_FU_32_0_32_178_i5_fu_cifar10_9853_11447),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_14783 (.out1(out_ui_plus_expr_FU_32_32_32_186_i13_fu_cifar10_9853_14783),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i18_fu_cifar10_9853_14778),
    .in2(out_reg_22_reg_22));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14786 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i13_fu_cifar10_9853_14786),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i13_fu_cifar10_9853_14783),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14789 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i11_fu_cifar10_9853_14789),
    .in1(out_reg_69_reg_69),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14793 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i20_fu_cifar10_9853_14793),
    .in1(out_reg_69_reg_69),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14796 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i21_fu_cifar10_9853_14796),
    .in1(out_ui_lshift_expr_FU_32_0_32_178_i5_fu_cifar10_9853_11447),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_14798 (.out1(out_ui_plus_expr_FU_32_32_32_186_i14_fu_cifar10_9853_14798),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i20_fu_cifar10_9853_14793),
    .in2(out_reg_23_reg_23));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14801 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i14_fu_cifar10_9853_14801),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i14_fu_cifar10_9853_14798),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14804 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i12_fu_cifar10_9853_14804),
    .in1(out_reg_69_reg_69),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14808 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i22_fu_cifar10_9853_14808),
    .in1(out_reg_4_reg_4),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14811 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i23_fu_cifar10_9853_14811),
    .in1(out_ui_lshift_expr_FU_32_0_32_178_i7_fu_cifar10_9853_14912),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_14813 (.out1(out_ui_plus_expr_FU_32_32_32_186_i15_fu_cifar10_9853_14813),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i22_fu_cifar10_9853_14808),
    .in2(out_reg_62_reg_62));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14816 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i15_fu_cifar10_9853_14816),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i15_fu_cifar10_9853_14813),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14819 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i13_fu_cifar10_9853_14819),
    .in1(out_reg_4_reg_4),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14823 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i24_fu_cifar10_9853_14823),
    .in1(out_reg_80_reg_80),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_cifar10_9853_14825 (.out1(out_ui_plus_expr_FU_32_0_32_185_i4_fu_cifar10_9853_14825),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i24_fu_cifar10_9853_14823),
    .in2(out_const_6));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14828 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i16_fu_cifar10_9853_14828),
    .in1(out_ui_plus_expr_FU_32_0_32_185_i4_fu_cifar10_9853_14825),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14831 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i14_fu_cifar10_9853_14831),
    .in1(out_reg_80_reg_80),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14835 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i25_fu_cifar10_9853_14835),
    .in1(out_reg_7_reg_7),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14838 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i26_fu_cifar10_9853_14838),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i0_fu_cifar10_9853_11580),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_14840 (.out1(out_ui_plus_expr_FU_32_32_32_186_i16_fu_cifar10_9853_14840),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i25_fu_cifar10_9853_14835),
    .in2(out_reg_83_reg_83));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14843 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i17_fu_cifar10_9853_14843),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i16_fu_cifar10_9853_14840),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14846 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i15_fu_cifar10_9853_14846),
    .in1(out_reg_7_reg_7),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14850 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i27_fu_cifar10_9853_14850),
    .in1(out_reg_6_reg_6),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_cifar10_9853_14852 (.out1(out_ui_plus_expr_FU_32_0_32_185_i5_fu_cifar10_9853_14852),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i27_fu_cifar10_9853_14850),
    .in2(out_const_6));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14855 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i18_fu_cifar10_9853_14855),
    .in1(out_ui_plus_expr_FU_32_0_32_185_i5_fu_cifar10_9853_14852),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14858 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i16_fu_cifar10_9853_14858),
    .in1(out_reg_6_reg_6),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14862 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i28_fu_cifar10_9853_14862),
    .in1(out_reg_93_reg_93),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_cifar10_9853_14864 (.out1(out_ui_plus_expr_FU_32_0_32_185_i6_fu_cifar10_9853_14864),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i28_fu_cifar10_9853_14862),
    .in2(out_const_6));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14867 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i19_fu_cifar10_9853_14867),
    .in1(out_ui_plus_expr_FU_32_0_32_185_i6_fu_cifar10_9853_14864),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14870 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i17_fu_cifar10_9853_14870),
    .in1(out_reg_93_reg_93),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14874 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i29_fu_cifar10_9853_14874),
    .in1(out_reg_9_reg_9),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14877 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i30_fu_cifar10_9853_14877),
    .in1(out_ui_lshift_expr_FU_32_0_32_179_i1_fu_cifar10_9853_11667),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_cifar10_9853_14879 (.out1(out_ui_plus_expr_FU_32_32_32_186_i17_fu_cifar10_9853_14879),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i29_fu_cifar10_9853_14874),
    .in2(out_reg_24_reg_24));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14882 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i20_fu_cifar10_9853_14882),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i17_fu_cifar10_9853_14879),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14885 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i18_fu_cifar10_9853_14885),
    .in1(out_reg_9_reg_9),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14889 (.out1(out_ui_rshift_expr_FU_32_0_32_188_i31_fu_cifar10_9853_14889),
    .in1(out_reg_10_reg_10),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_cifar10_9853_14891 (.out1(out_ui_plus_expr_FU_32_0_32_185_i7_fu_cifar10_9853_14891),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i31_fu_cifar10_9853_14889),
    .in2(out_const_6));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14894 (.out1(out_ui_lshift_expr_FU_32_0_32_180_i21_fu_cifar10_9853_14894),
    .in1(out_ui_plus_expr_FU_32_0_32_185_i7_fu_cifar10_9853_14891),
    .in2(out_const_7));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_cifar10_9853_14897 (.out1(out_ui_bit_and_expr_FU_8_0_8_175_i19_fu_cifar10_9853_14897),
    .in1(out_reg_10_reg_10),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14901 (.out1(out_ui_rshift_expr_FU_32_0_32_189_i0_fu_cifar10_9853_14901),
    .in1(out_ui_lshift_expr_FU_32_0_32_178_i2_fu_cifar10_9853_11258),
    .in2(out_const_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14905 (.out1(out_ui_lshift_expr_FU_32_0_32_178_i6_fu_cifar10_9853_14905),
    .in1(out_ui_mult_expr_FU_32_32_32_0_181_i1_fu_cifar10_9853_11255),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_cifar10_9853_14908 (.out1(out_ui_rshift_expr_FU_32_0_32_189_i1_fu_cifar10_9853_14908),
    .in1(out_ui_lshift_expr_FU_32_0_32_178_i5_fu_cifar10_9853_11447),
    .in2(out_const_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_cifar10_9853_14912 (.out1(out_ui_lshift_expr_FU_32_0_32_178_i7_fu_cifar10_9853_14912),
    .in1(out_ui_mult_expr_FU_32_32_32_0_181_i3_fu_cifar10_9853_11444),
    .in2(out_const_7));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) fu_cifar10_9853_15047 (.out1(out_ASSIGN_UNSIGNED_FU_157_i0_fu_cifar10_9853_15047),
    .in1(out_reg_31_reg_31));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_1 (.out1(sig_in_bus_mergerMout_Wdata_ram0_1),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_1));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_2 (.out1(sig_in_bus_mergerMout_Wdata_ram0_2),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_2));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_addr_ram1_1 (.out1(sig_in_bus_mergerMout_addr_ram1_1),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_1));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_addr_ram1_2 (.out1(sig_in_bus_mergerMout_addr_ram1_2),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_2));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_1 (.out1(sig_in_bus_mergerMout_data_ram_size2_1),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_1));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_2 (.out1(sig_in_bus_mergerMout_data_ram_size2_2),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_2));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_1 (.out1(sig_in_bus_mergerMout_oe_ram3_1),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_2 (.out1(sig_in_bus_mergerMout_oe_ram3_2),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_2));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_1 (.out1(sig_in_bus_mergerMout_we_ram4_1),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_2 (.out1(sig_in_bus_mergerMout_we_ram4_2),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_2));
  SIMPLEJOIN_FU #(.BITSIZE_ops(1),
    .PORTSIZE_ops(2)) mu_S_308 (.sop(OUT_mu_S_308_MULTI_UNBOUNDED_0),
    .clock(clock),
    .reset(reset),
    .enable(muenable_mu_S_308),
    .ops({s_done__Z3lrnPKdPdi_191_i0,
      s_done___udivsi3_192_i0}));
  or or_or__Z11convolutionPKdPdS0_iiii_190_i02( s__Z11convolutionPKdPdS0_iiii_190_i02, selector_IN_UNBOUNDED_cifar10_9853_11057, selector_IN_UNBOUNDED_cifar10_9853_11285, selector_IN_UNBOUNDED_cifar10_9853_11484);
  or or_or__Z3lrnPKdPdi_191_i03( s__Z3lrnPKdPdi_191_i03, selector_IN_UNBOUNDED_cifar10_9853_11218, selector_IN_UNBOUNDED_cifar10_9853_11363, selector_IN_UNBOUNDED_cifar10_9853_11477, selector_IN_UNBOUNDED_cifar10_9853_11494);
  or or_or___udivsi3_192_i04( s___udivsi3_192_i04, selector_IN_UNBOUNDED_cifar10_9853_11178, selector_IN_UNBOUNDED_cifar10_9853_11184, selector_IN_UNBOUNDED_cifar10_9853_11194, selector_IN_UNBOUNDED_cifar10_9853_11381, selector_IN_UNBOUNDED_cifar10_9853_11387, selector_IN_UNBOUNDED_cifar10_9853_11396);
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_2_i0_fu_cifar10_9853_11055),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_3_i0_fu_cifar10_9853_11056),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_135_reg_10_0_0_0),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_100 (.out1(out_reg_100_reg_100),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_136_reg_100_0_0_0),
    .wenable(wrenable_reg_100));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_101 (.out1(out_reg_101_reg_101),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_140_i0_fu_cifar10_9853_11715),
    .wenable(wrenable_reg_101));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_102 (.out1(out_reg_102_reg_102),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i19_fu_cifar10_9853_11729),
    .wenable(wrenable_reg_102));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_103 (.out1(out_reg_103_reg_103),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_139_reg_103_0_0_0),
    .wenable(wrenable_reg_103));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_104 (.out1(out_reg_104_reg_104),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_140_reg_104_0_0_0),
    .wenable(wrenable_reg_104));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_105 (.out1(out_reg_105_reg_105),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_187_i11_fu_cifar10_9853_14244),
    .wenable(wrenable_reg_105));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_106 (.out1(out_reg_106_reg_106),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_142_reg_106_0_0_0),
    .wenable(wrenable_reg_106));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_107 (.out1(out_reg_107_reg_107),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_143_reg_107_0_0_0),
    .wenable(wrenable_reg_107));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_108 (.out1(out_reg_108_reg_108),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_165_i0_BMEMORY_CTRLN_165_i0),
    .wenable(wrenable_reg_108));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_109 (.out1(out_reg_109_reg_109),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_145_reg_109_0_0_0),
    .wenable(wrenable_reg_109));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_13_i0_fu_cifar10_9853_11703),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_110 (.out1(out_reg_110_reg_110),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_0_32_173_i0_fu_cifar10_9853_14372),
    .wenable(wrenable_reg_110));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_111 (.out1(out_reg_111_reg_111),
    .clock(clock),
    .reset(reset),
    .in1(out_fp_float_expr_32_64_FU_32_64_500_167_i0_fu_cifar10_9853_11783),
    .wenable(wrenable_reg_111));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_112 (.out1(out_reg_112_reg_112),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i14_fu_cifar10_9853_14374),
    .wenable(wrenable_reg_112));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_113 (.out1(out_reg_113_reg_113),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_150_reg_113_0_0_0),
    .wenable(wrenable_reg_113));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_114 (.out1(out_reg_114_reg_114),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_187_i13_fu_cifar10_9853_14266),
    .wenable(wrenable_reg_114));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_115 (.out1(out_reg_115_reg_115),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_gt_expr_FU_32_32_32_177_i4_fu_cifar10_9853_14376),
    .wenable(wrenable_reg_115));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_182_i0_fu_cifar10_9853_14312),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_182_i1_fu_cifar10_9853_14320),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_182_i3_fu_cifar10_9853_14338),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_182_i4_fu_cifar10_9853_14348),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_182_i5_fu_cifar10_9853_14350),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_182_i7_fu_cifar10_9853_14366),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i1_fu_cifar10_9853_14636),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i4_fu_cifar10_9853_14664),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_161_reg_2_0_0_0),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i7_fu_cifar10_9853_14682),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i8_fu_cifar10_9853_14694),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i19_fu_cifar10_9853_14781),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i21_fu_cifar10_9853_14796),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i30_fu_cifar10_9853_14877),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_189_i0_fu_cifar10_9853_14901),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_189_i1_fu_cifar10_9853_14908),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_169_reg_27_0_0_0),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_170_reg_28_0_0_0),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_171_reg_29_0_0_0),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_6_i0_fu_cifar10_9853_11284),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_19_i0_fu_cifar10_9853_11081),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out___udivsi3_192_i0___udivsi3_192_i0),
    .wenable(wrenable_reg_31));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i11_fu_cifar10_9853_14712),
    .wenable(wrenable_reg_32));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_176_reg_33_0_0_0),
    .wenable(wrenable_reg_33));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_177_reg_34_0_0_0),
    .wenable(wrenable_reg_34));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_182_i2_fu_cifar10_9853_14330),
    .wenable(wrenable_reg_35));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i13_fu_cifar10_9853_14736),
    .wenable(wrenable_reg_36));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i16_fu_cifar10_9853_14763),
    .wenable(wrenable_reg_37));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_157_i0_fu_cifar10_9853_15047),
    .wenable(wrenable_reg_38));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_conv_out___udivsi3_192_i0___udivsi3_192_i0_32_29),
    .wenable(wrenable_reg_39));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_183_reg_4_0_0_0),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i2_fu_cifar10_9853_11191),
    .wenable(wrenable_reg_40));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_41 (.out1(out_reg_41_reg_41),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i4_fu_cifar10_9853_11252),
    .wenable(wrenable_reg_41));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_42 (.out1(out_reg_42_reg_42),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_49_i0_fu_cifar10_9853_11137),
    .wenable(wrenable_reg_42));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_43 (.out1(out_reg_43_reg_43),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_187_reg_43_0_0_0),
    .wenable(wrenable_reg_43));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_44 (.out1(out_reg_44_reg_44),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_181_i0_fu_cifar10_9853_11180),
    .wenable(wrenable_reg_44));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_45 (.out1(out_reg_45_reg_45),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_189_reg_45_0_0_1),
    .wenable(wrenable_reg_45));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_46 (.out1(out_reg_46_reg_46),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i0_fu_cifar10_9853_11154),
    .wenable(wrenable_reg_46));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_47 (.out1(out_reg_47_reg_47),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i5_fu_cifar10_9853_11260),
    .wenable(wrenable_reg_47));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_48 (.out1(out_reg_48_reg_48),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_192_reg_48_0_0_0),
    .wenable(wrenable_reg_48));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_49 (.out1(out_reg_49_reg_49),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_193_reg_49_0_0_0),
    .wenable(wrenable_reg_49));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_UIdata_converter_FU_4_i0_fu_cifar10_9853_11492),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_50 (.out1(out_reg_50_reg_50),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_195_reg_50_0_0_0),
    .wenable(wrenable_reg_50));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_51 (.out1(out_reg_51_reg_51),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i2_fu_cifar10_9853_11242),
    .wenable(wrenable_reg_51));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_52 (.out1(out_reg_52_reg_52),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i6_fu_cifar10_9853_11269),
    .wenable(wrenable_reg_52));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_53 (.out1(out_reg_53_reg_53),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i2_fu_cifar10_9853_14322),
    .wenable(wrenable_reg_53));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_54 (.out1(out_reg_54_reg_54),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_165_i1_BMEMORY_CTRLN_165_i0),
    .wenable(wrenable_reg_54));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_55 (.out1(out_reg_55_reg_55),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_200_reg_55_0_0_0),
    .wenable(wrenable_reg_55));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_56 (.out1(out_reg_56_reg_56),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_gt_expr_FU_32_32_32_177_i0_fu_cifar10_9853_14326),
    .wenable(wrenable_reg_56));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_57 (.out1(out_reg_57_reg_57),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_202_reg_57_0_0_0),
    .wenable(wrenable_reg_57));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_58 (.out1(out_reg_58_reg_58),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_203_reg_58_0_0_0),
    .wenable(wrenable_reg_58));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_59 (.out1(out_reg_59_reg_59),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_204_reg_59_0_0_0),
    .wenable(wrenable_reg_59));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_205_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_60 (.out1(out_reg_60_reg_60),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_56_i0_fu_cifar10_9853_11300),
    .wenable(wrenable_reg_60));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_61 (.out1(out_reg_61_reg_61),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_207_reg_61_0_0_0),
    .wenable(wrenable_reg_61));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_62 (.out1(out_reg_62_reg_62),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i23_fu_cifar10_9853_14811),
    .wenable(wrenable_reg_62));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_63 (.out1(out_reg_63_reg_63),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_209_reg_63_0_0_0),
    .wenable(wrenable_reg_63));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_64 (.out1(out_reg_64_reg_64),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i5_fu_cifar10_9853_11393),
    .wenable(wrenable_reg_64));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_65 (.out1(out_reg_65_reg_65),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i11_fu_cifar10_9853_11441),
    .wenable(wrenable_reg_65));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_66 (.out1(out_reg_66_reg_66),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_87_i0_fu_cifar10_9853_11348),
    .wenable(wrenable_reg_66));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_67 (.out1(out_reg_67_reg_67),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_213_reg_67_0_0_0),
    .wenable(wrenable_reg_67));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_68 (.out1(out_reg_68_reg_68),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_181_i2_fu_cifar10_9853_11383),
    .wenable(wrenable_reg_68));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_69 (.out1(out_reg_69_reg_69),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_215_reg_69_0_0_1),
    .wenable(wrenable_reg_69));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_216_reg_7_0_0_0),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_70 (.out1(out_reg_70_reg_70),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_186_i3_fu_cifar10_9853_11354),
    .wenable(wrenable_reg_70));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_71 (.out1(out_reg_71_reg_71),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i12_fu_cifar10_9853_11449),
    .wenable(wrenable_reg_71));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_72 (.out1(out_reg_72_reg_72),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_219_reg_72_0_0_0),
    .wenable(wrenable_reg_72));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_73 (.out1(out_reg_73_reg_73),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_220_reg_73_0_0_0),
    .wenable(wrenable_reg_73));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_74 (.out1(out_reg_74_reg_74),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_221_reg_74_0_0_0),
    .wenable(wrenable_reg_74));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_75 (.out1(out_reg_75_reg_75),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i9_fu_cifar10_9853_11431),
    .wenable(wrenable_reg_75));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_76 (.out1(out_reg_76_reg_76),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i13_fu_cifar10_9853_11458),
    .wenable(wrenable_reg_76));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_77 (.out1(out_reg_77_reg_77),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i6_fu_cifar10_9853_14340),
    .wenable(wrenable_reg_77));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_78 (.out1(out_reg_78_reg_78),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_225_reg_78_0_0_0),
    .wenable(wrenable_reg_78));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_79 (.out1(out_reg_79_reg_79),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_gt_expr_FU_32_32_32_177_i2_fu_cifar10_9853_14344),
    .wenable(wrenable_reg_79));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_10_i0_fu_cifar10_9853_11617),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_80 (.out1(out_reg_80_reg_80),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_228_reg_80_0_0_0),
    .wenable(wrenable_reg_80));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_81 (.out1(out_reg_81_reg_81),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_181_i4_fu_cifar10_9853_11583),
    .wenable(wrenable_reg_81));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_82 (.out1(out_reg_82_reg_82),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_182_i6_fu_cifar10_9853_14356),
    .wenable(wrenable_reg_82));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_83 (.out1(out_reg_83_reg_83),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_188_i26_fu_cifar10_9853_14838),
    .wenable(wrenable_reg_83));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_84 (.out1(out_reg_84_reg_84),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_116_i0_fu_cifar10_9853_11516),
    .wenable(wrenable_reg_84));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_85 (.out1(out_reg_85_reg_85),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_233_reg_85_0_0_0),
    .wenable(wrenable_reg_85));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_86 (.out1(out_reg_86_reg_86),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_115_i0_fu_cifar10_9853_11565),
    .wenable(wrenable_reg_86));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_87 (.out1(out_reg_87_reg_87),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_235_reg_87_0_0_0),
    .wenable(wrenable_reg_87));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_88 (.out1(out_reg_88_reg_88),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i15_fu_cifar10_9853_11577),
    .wenable(wrenable_reg_88));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_89 (.out1(out_reg_89_reg_89),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i8_fu_cifar10_9853_14352),
    .wenable(wrenable_reg_89));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_238_reg_9_0_0_0),
    .wenable(wrenable_reg_9));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_90 (.out1(out_reg_90_reg_90),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_239_reg_90_0_0_0),
    .wenable(wrenable_reg_90));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_91 (.out1(out_reg_91_reg_91),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_120_i0_fu_cifar10_9853_11600),
    .wenable(wrenable_reg_91));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_92 (.out1(out_reg_92_reg_92),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i16_fu_cifar10_9853_11607),
    .wenable(wrenable_reg_92));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_93 (.out1(out_reg_93_reg_93),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_242_reg_93_0_0_0),
    .wenable(wrenable_reg_93));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_94 (.out1(out_reg_94_reg_94),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_243_reg_94_0_0_0),
    .wenable(wrenable_reg_94));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_95 (.out1(out_reg_95_reg_95),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_244_reg_95_0_0_0),
    .wenable(wrenable_reg_95));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_96 (.out1(out_reg_96_reg_96),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_135_i0_fu_cifar10_9853_11640),
    .wenable(wrenable_reg_96));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_97 (.out1(out_reg_97_reg_97),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_176_i17_fu_cifar10_9853_11664),
    .wenable(wrenable_reg_97));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_98 (.out1(out_reg_98_reg_98),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_136_i0_fu_cifar10_9853_11678),
    .wenable(wrenable_reg_98));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_99 (.out1(out_reg_99_reg_99),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_183_i11_fu_cifar10_9853_14362),
    .wenable(wrenable_reg_99));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_data_ram_size2_ (.out1(Mout_data_ram_size),
    .in1(sig_out_bus_mergerMout_data_ram_size2_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_oe_ram3_ (.out1(Mout_oe_ram),
    .in1(sig_out_bus_mergerMout_oe_ram3_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_we_ram4_ (.out1(Mout_we_ram),
    .in1(sig_out_bus_mergerMout_we_ram4_));
  // io-signal post fix
  assign OUT_CONDITION_cifar10_9853_11058 = out_read_cond_FU_14_i0_fu_cifar10_9853_11058;
  assign OUT_CONDITION_cifar10_9853_11083 = out_read_cond_FU_20_i0_fu_cifar10_9853_11083;
  assign OUT_CONDITION_cifar10_9853_11120 = out_read_cond_FU_23_i0_fu_cifar10_9853_11120;
  assign OUT_CONDITION_cifar10_9853_11123 = out_read_cond_FU_24_i0_fu_cifar10_9853_11123;
  assign OUT_CONDITION_cifar10_9853_11139 = out_read_cond_FU_31_i0_fu_cifar10_9853_11139;
  assign OUT_CONDITION_cifar10_9853_11266 = out_read_cond_FU_38_i0_fu_cifar10_9853_11266;
  assign OUT_CONDITION_cifar10_9853_11272 = out_read_cond_FU_39_i0_fu_cifar10_9853_11272;
  assign OUT_CONDITION_cifar10_9853_11280 = out_read_cond_FU_44_i0_fu_cifar10_9853_11280;
  assign OUT_CONDITION_cifar10_9853_11282 = out_read_cond_FU_45_i0_fu_cifar10_9853_11282;
  assign OUT_CONDITION_cifar10_9853_11286 = out_read_cond_FU_50_i0_fu_cifar10_9853_11286;
  assign OUT_CONDITION_cifar10_9853_11302 = out_read_cond_FU_57_i0_fu_cifar10_9853_11302;
  assign OUT_CONDITION_cifar10_9853_11335 = out_read_cond_FU_60_i0_fu_cifar10_9853_11335;
  assign OUT_CONDITION_cifar10_9853_11338 = out_read_cond_FU_61_i0_fu_cifar10_9853_11338;
  assign OUT_CONDITION_cifar10_9853_11350 = out_read_cond_FU_68_i0_fu_cifar10_9853_11350;
  assign OUT_CONDITION_cifar10_9853_11455 = out_read_cond_FU_75_i0_fu_cifar10_9853_11455;
  assign OUT_CONDITION_cifar10_9853_11461 = out_read_cond_FU_76_i0_fu_cifar10_9853_11461;
  assign OUT_CONDITION_cifar10_9853_11468 = out_read_cond_FU_81_i0_fu_cifar10_9853_11468;
  assign OUT_CONDITION_cifar10_9853_11470 = out_read_cond_FU_82_i0_fu_cifar10_9853_11470;
  assign OUT_CONDITION_cifar10_9853_11474 = out_read_cond_FU_98_i0_fu_cifar10_9853_11474;
  assign OUT_CONDITION_cifar10_9853_11502 = out_read_cond_FU_101_i0_fu_cifar10_9853_11502;
  assign OUT_CONDITION_cifar10_9853_11612 = out_read_cond_FU_107_i0_fu_cifar10_9853_11612;
  assign OUT_CONDITION_cifar10_9853_11614 = out_read_cond_FU_110_i0_fu_cifar10_9853_11614;
  assign OUT_CONDITION_cifar10_9853_11625 = out_read_cond_FU_117_i0_fu_cifar10_9853_11625;
  assign OUT_CONDITION_cifar10_9853_11628 = out_read_cond_FU_121_i0_fu_cifar10_9853_11628;
  assign OUT_CONDITION_cifar10_9853_11633 = out_read_cond_FU_124_i0_fu_cifar10_9853_11633;
  assign OUT_CONDITION_cifar10_9853_11646 = out_read_cond_FU_128_i0_fu_cifar10_9853_11646;
  assign OUT_CONDITION_cifar10_9853_11700 = out_read_cond_FU_131_i0_fu_cifar10_9853_11700;
  assign OUT_CONDITION_cifar10_9853_11711 = out_read_cond_FU_137_i0_fu_cifar10_9853_11711;
  assign OUT_CONDITION_cifar10_9853_11717 = out_read_cond_FU_141_i0_fu_cifar10_9853_11717;
  assign OUT_CONDITION_cifar10_9853_11735 = out_read_cond_FU_144_i0_fu_cifar10_9853_11735;
  assign OUT_CONDITION_cifar10_9853_11819 = out_read_cond_FU_152_i0_fu_cifar10_9853_11819;
  assign OUT_CONDITION_cifar10_9853_11821 = out_read_cond_FU_153_i0_fu_cifar10_9853_11821;
  assign OUT_CONDITION_cifar10_9853_11823 = out_read_cond_FU_156_i0_fu_cifar10_9853_11823;
  assign OUT_UNBOUNDED_cifar10_9853_11057 = s_done__Z11convolutionPKdPdS0_iiii_190_i0;
  assign OUT_UNBOUNDED_cifar10_9853_11178 = s_done___udivsi3_192_i0;
  assign OUT_UNBOUNDED_cifar10_9853_11184 = s_done___udivsi3_192_i0;
  assign OUT_UNBOUNDED_cifar10_9853_11194 = s_done___udivsi3_192_i0;
  assign OUT_UNBOUNDED_cifar10_9853_11218 = s_done__Z3lrnPKdPdi_191_i0;
  assign OUT_UNBOUNDED_cifar10_9853_11285 = s_done__Z11convolutionPKdPdS0_iiii_190_i0;
  assign OUT_UNBOUNDED_cifar10_9853_11363 = s_done__Z3lrnPKdPdi_191_i0;
  assign OUT_UNBOUNDED_cifar10_9853_11381 = s_done___udivsi3_192_i0;
  assign OUT_UNBOUNDED_cifar10_9853_11387 = s_done___udivsi3_192_i0;
  assign OUT_UNBOUNDED_cifar10_9853_11396 = s_done___udivsi3_192_i0;
  assign OUT_UNBOUNDED_cifar10_9853_11477 = s_done__Z3lrnPKdPdi_191_i0;
  assign OUT_UNBOUNDED_cifar10_9853_11484 = s_done__Z11convolutionPKdPdS0_iiii_190_i0;
  assign OUT_UNBOUNDED_cifar10_9853_11494 = s_done__Z3lrnPKdPdi_191_i0;

endmodule

// FSM based controller description for cifar10
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_cifar10(done_port,
  fuselector_BMEMORY_CTRLN_165_i0_LOAD,
  fuselector_BMEMORY_CTRLN_165_i0_STORE,
  fuselector_BMEMORY_CTRLN_165_i1_LOAD,
  fuselector_BMEMORY_CTRLN_165_i1_STORE,
  selector_IN_UNBOUNDED_cifar10_9853_11057,
  selector_IN_UNBOUNDED_cifar10_9853_11178,
  selector_IN_UNBOUNDED_cifar10_9853_11184,
  selector_IN_UNBOUNDED_cifar10_9853_11194,
  selector_IN_UNBOUNDED_cifar10_9853_11218,
  selector_IN_UNBOUNDED_cifar10_9853_11285,
  selector_IN_UNBOUNDED_cifar10_9853_11363,
  selector_IN_UNBOUNDED_cifar10_9853_11381,
  selector_IN_UNBOUNDED_cifar10_9853_11387,
  selector_IN_UNBOUNDED_cifar10_9853_11396,
  selector_IN_UNBOUNDED_cifar10_9853_11477,
  selector_IN_UNBOUNDED_cifar10_9853_11484,
  selector_IN_UNBOUNDED_cifar10_9853_11494,
  selector_MUX_135_reg_10_0_0_0,
  selector_MUX_136_reg_100_0_0_0,
  selector_MUX_139_reg_103_0_0_0,
  selector_MUX_140_reg_104_0_0_0,
  selector_MUX_142_reg_106_0_0_0,
  selector_MUX_143_reg_107_0_0_0,
  selector_MUX_145_reg_109_0_0_0,
  selector_MUX_150_reg_113_0_0_0,
  selector_MUX_161_reg_2_0_0_0,
  selector_MUX_169_reg_27_0_0_0,
  selector_MUX_170_reg_28_0_0_0,
  selector_MUX_171_reg_29_0_0_0,
  selector_MUX_176_reg_33_0_0_0,
  selector_MUX_177_reg_34_0_0_0,
  selector_MUX_183_reg_4_0_0_0,
  selector_MUX_187_reg_43_0_0_0,
  selector_MUX_189_reg_45_0_0_0,
  selector_MUX_189_reg_45_0_0_1,
  selector_MUX_192_reg_48_0_0_0,
  selector_MUX_193_reg_49_0_0_0,
  selector_MUX_195_reg_50_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1,
  selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2,
  selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0,
  selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1,
  selector_MUX_200_reg_55_0_0_0,
  selector_MUX_202_reg_57_0_0_0,
  selector_MUX_203_reg_58_0_0_0,
  selector_MUX_204_reg_59_0_0_0,
  selector_MUX_205_reg_6_0_0_0,
  selector_MUX_207_reg_61_0_0_0,
  selector_MUX_209_reg_63_0_0_0,
  selector_MUX_213_reg_67_0_0_0,
  selector_MUX_215_reg_69_0_0_0,
  selector_MUX_215_reg_69_0_0_1,
  selector_MUX_216_reg_7_0_0_0,
  selector_MUX_219_reg_72_0_0_0,
  selector_MUX_220_reg_73_0_0_0,
  selector_MUX_221_reg_74_0_0_0,
  selector_MUX_225_reg_78_0_0_0,
  selector_MUX_228_reg_80_0_0_0,
  selector_MUX_233_reg_85_0_0_0,
  selector_MUX_235_reg_87_0_0_0,
  selector_MUX_238_reg_9_0_0_0,
  selector_MUX_239_reg_90_0_0_0,
  selector_MUX_242_reg_93_0_0_0,
  selector_MUX_243_reg_94_0_0_0,
  selector_MUX_244_reg_95_0_0_0,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0,
  selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1,
  selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0,
  selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1,
  selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0,
  selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0,
  selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0,
  selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0,
  selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1,
  selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0,
  selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1,
  selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0,
  selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0,
  selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1,
  selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0,
  selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0,
  selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0,
  selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0,
  selector_MUX_75___udivsi3_192_i0_0_0_0,
  selector_MUX_75___udivsi3_192_i0_0_0_1,
  selector_MUX_75___udivsi3_192_i0_0_0_2,
  selector_MUX_75___udivsi3_192_i0_0_1_0,
  selector_MUX_75___udivsi3_192_i0_0_1_1,
  selector_MUX_76___udivsi3_192_i0_1_0_0,
  selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0,
  selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0,
  selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0,
  selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1,
  selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0,
  selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1,
  selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0,
  selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0,
  selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1,
  selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0,
  selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0,
  muenable_mu_S_308,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_100,
  wrenable_reg_101,
  wrenable_reg_102,
  wrenable_reg_103,
  wrenable_reg_104,
  wrenable_reg_105,
  wrenable_reg_106,
  wrenable_reg_107,
  wrenable_reg_108,
  wrenable_reg_109,
  wrenable_reg_11,
  wrenable_reg_110,
  wrenable_reg_111,
  wrenable_reg_112,
  wrenable_reg_113,
  wrenable_reg_114,
  wrenable_reg_115,
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
  wrenable_reg_49,
  wrenable_reg_5,
  wrenable_reg_50,
  wrenable_reg_51,
  wrenable_reg_52,
  wrenable_reg_53,
  wrenable_reg_54,
  wrenable_reg_55,
  wrenable_reg_56,
  wrenable_reg_57,
  wrenable_reg_58,
  wrenable_reg_59,
  wrenable_reg_6,
  wrenable_reg_60,
  wrenable_reg_61,
  wrenable_reg_62,
  wrenable_reg_63,
  wrenable_reg_64,
  wrenable_reg_65,
  wrenable_reg_66,
  wrenable_reg_67,
  wrenable_reg_68,
  wrenable_reg_69,
  wrenable_reg_7,
  wrenable_reg_70,
  wrenable_reg_71,
  wrenable_reg_72,
  wrenable_reg_73,
  wrenable_reg_74,
  wrenable_reg_75,
  wrenable_reg_76,
  wrenable_reg_77,
  wrenable_reg_78,
  wrenable_reg_79,
  wrenable_reg_8,
  wrenable_reg_80,
  wrenable_reg_81,
  wrenable_reg_82,
  wrenable_reg_83,
  wrenable_reg_84,
  wrenable_reg_85,
  wrenable_reg_86,
  wrenable_reg_87,
  wrenable_reg_88,
  wrenable_reg_89,
  wrenable_reg_9,
  wrenable_reg_90,
  wrenable_reg_91,
  wrenable_reg_92,
  wrenable_reg_93,
  wrenable_reg_94,
  wrenable_reg_95,
  wrenable_reg_96,
  wrenable_reg_97,
  wrenable_reg_98,
  wrenable_reg_99,
  OUT_CONDITION_cifar10_9853_11058,
  OUT_CONDITION_cifar10_9853_11083,
  OUT_CONDITION_cifar10_9853_11120,
  OUT_CONDITION_cifar10_9853_11123,
  OUT_CONDITION_cifar10_9853_11139,
  OUT_CONDITION_cifar10_9853_11266,
  OUT_CONDITION_cifar10_9853_11272,
  OUT_CONDITION_cifar10_9853_11280,
  OUT_CONDITION_cifar10_9853_11282,
  OUT_CONDITION_cifar10_9853_11286,
  OUT_CONDITION_cifar10_9853_11302,
  OUT_CONDITION_cifar10_9853_11335,
  OUT_CONDITION_cifar10_9853_11338,
  OUT_CONDITION_cifar10_9853_11350,
  OUT_CONDITION_cifar10_9853_11455,
  OUT_CONDITION_cifar10_9853_11461,
  OUT_CONDITION_cifar10_9853_11468,
  OUT_CONDITION_cifar10_9853_11470,
  OUT_CONDITION_cifar10_9853_11474,
  OUT_CONDITION_cifar10_9853_11502,
  OUT_CONDITION_cifar10_9853_11612,
  OUT_CONDITION_cifar10_9853_11614,
  OUT_CONDITION_cifar10_9853_11625,
  OUT_CONDITION_cifar10_9853_11628,
  OUT_CONDITION_cifar10_9853_11633,
  OUT_CONDITION_cifar10_9853_11646,
  OUT_CONDITION_cifar10_9853_11700,
  OUT_CONDITION_cifar10_9853_11711,
  OUT_CONDITION_cifar10_9853_11717,
  OUT_CONDITION_cifar10_9853_11735,
  OUT_CONDITION_cifar10_9853_11819,
  OUT_CONDITION_cifar10_9853_11821,
  OUT_CONDITION_cifar10_9853_11823,
  OUT_UNBOUNDED_cifar10_9853_11057,
  OUT_UNBOUNDED_cifar10_9853_11178,
  OUT_UNBOUNDED_cifar10_9853_11184,
  OUT_UNBOUNDED_cifar10_9853_11194,
  OUT_UNBOUNDED_cifar10_9853_11218,
  OUT_UNBOUNDED_cifar10_9853_11285,
  OUT_UNBOUNDED_cifar10_9853_11363,
  OUT_UNBOUNDED_cifar10_9853_11381,
  OUT_UNBOUNDED_cifar10_9853_11387,
  OUT_UNBOUNDED_cifar10_9853_11396,
  OUT_UNBOUNDED_cifar10_9853_11477,
  OUT_UNBOUNDED_cifar10_9853_11484,
  OUT_UNBOUNDED_cifar10_9853_11494,
  OUT_mu_S_308_MULTI_UNBOUNDED_0,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_cifar10_9853_11058;
  input OUT_CONDITION_cifar10_9853_11083;
  input OUT_CONDITION_cifar10_9853_11120;
  input OUT_CONDITION_cifar10_9853_11123;
  input OUT_CONDITION_cifar10_9853_11139;
  input OUT_CONDITION_cifar10_9853_11266;
  input OUT_CONDITION_cifar10_9853_11272;
  input OUT_CONDITION_cifar10_9853_11280;
  input OUT_CONDITION_cifar10_9853_11282;
  input OUT_CONDITION_cifar10_9853_11286;
  input OUT_CONDITION_cifar10_9853_11302;
  input OUT_CONDITION_cifar10_9853_11335;
  input OUT_CONDITION_cifar10_9853_11338;
  input OUT_CONDITION_cifar10_9853_11350;
  input OUT_CONDITION_cifar10_9853_11455;
  input OUT_CONDITION_cifar10_9853_11461;
  input OUT_CONDITION_cifar10_9853_11468;
  input OUT_CONDITION_cifar10_9853_11470;
  input OUT_CONDITION_cifar10_9853_11474;
  input OUT_CONDITION_cifar10_9853_11502;
  input OUT_CONDITION_cifar10_9853_11612;
  input OUT_CONDITION_cifar10_9853_11614;
  input OUT_CONDITION_cifar10_9853_11625;
  input OUT_CONDITION_cifar10_9853_11628;
  input OUT_CONDITION_cifar10_9853_11633;
  input OUT_CONDITION_cifar10_9853_11646;
  input OUT_CONDITION_cifar10_9853_11700;
  input OUT_CONDITION_cifar10_9853_11711;
  input OUT_CONDITION_cifar10_9853_11717;
  input OUT_CONDITION_cifar10_9853_11735;
  input OUT_CONDITION_cifar10_9853_11819;
  input OUT_CONDITION_cifar10_9853_11821;
  input OUT_CONDITION_cifar10_9853_11823;
  input OUT_UNBOUNDED_cifar10_9853_11057;
  input OUT_UNBOUNDED_cifar10_9853_11178;
  input OUT_UNBOUNDED_cifar10_9853_11184;
  input OUT_UNBOUNDED_cifar10_9853_11194;
  input OUT_UNBOUNDED_cifar10_9853_11218;
  input OUT_UNBOUNDED_cifar10_9853_11285;
  input OUT_UNBOUNDED_cifar10_9853_11363;
  input OUT_UNBOUNDED_cifar10_9853_11381;
  input OUT_UNBOUNDED_cifar10_9853_11387;
  input OUT_UNBOUNDED_cifar10_9853_11396;
  input OUT_UNBOUNDED_cifar10_9853_11477;
  input OUT_UNBOUNDED_cifar10_9853_11484;
  input OUT_UNBOUNDED_cifar10_9853_11494;
  input OUT_mu_S_308_MULTI_UNBOUNDED_0;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_165_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_165_i0_STORE;
  output fuselector_BMEMORY_CTRLN_165_i1_LOAD;
  output fuselector_BMEMORY_CTRLN_165_i1_STORE;
  output selector_IN_UNBOUNDED_cifar10_9853_11057;
  output selector_IN_UNBOUNDED_cifar10_9853_11178;
  output selector_IN_UNBOUNDED_cifar10_9853_11184;
  output selector_IN_UNBOUNDED_cifar10_9853_11194;
  output selector_IN_UNBOUNDED_cifar10_9853_11218;
  output selector_IN_UNBOUNDED_cifar10_9853_11285;
  output selector_IN_UNBOUNDED_cifar10_9853_11363;
  output selector_IN_UNBOUNDED_cifar10_9853_11381;
  output selector_IN_UNBOUNDED_cifar10_9853_11387;
  output selector_IN_UNBOUNDED_cifar10_9853_11396;
  output selector_IN_UNBOUNDED_cifar10_9853_11477;
  output selector_IN_UNBOUNDED_cifar10_9853_11484;
  output selector_IN_UNBOUNDED_cifar10_9853_11494;
  output selector_MUX_135_reg_10_0_0_0;
  output selector_MUX_136_reg_100_0_0_0;
  output selector_MUX_139_reg_103_0_0_0;
  output selector_MUX_140_reg_104_0_0_0;
  output selector_MUX_142_reg_106_0_0_0;
  output selector_MUX_143_reg_107_0_0_0;
  output selector_MUX_145_reg_109_0_0_0;
  output selector_MUX_150_reg_113_0_0_0;
  output selector_MUX_161_reg_2_0_0_0;
  output selector_MUX_169_reg_27_0_0_0;
  output selector_MUX_170_reg_28_0_0_0;
  output selector_MUX_171_reg_29_0_0_0;
  output selector_MUX_176_reg_33_0_0_0;
  output selector_MUX_177_reg_34_0_0_0;
  output selector_MUX_183_reg_4_0_0_0;
  output selector_MUX_187_reg_43_0_0_0;
  output selector_MUX_189_reg_45_0_0_0;
  output selector_MUX_189_reg_45_0_0_1;
  output selector_MUX_192_reg_48_0_0_0;
  output selector_MUX_193_reg_49_0_0_0;
  output selector_MUX_195_reg_50_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2;
  output selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0;
  output selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1;
  output selector_MUX_200_reg_55_0_0_0;
  output selector_MUX_202_reg_57_0_0_0;
  output selector_MUX_203_reg_58_0_0_0;
  output selector_MUX_204_reg_59_0_0_0;
  output selector_MUX_205_reg_6_0_0_0;
  output selector_MUX_207_reg_61_0_0_0;
  output selector_MUX_209_reg_63_0_0_0;
  output selector_MUX_213_reg_67_0_0_0;
  output selector_MUX_215_reg_69_0_0_0;
  output selector_MUX_215_reg_69_0_0_1;
  output selector_MUX_216_reg_7_0_0_0;
  output selector_MUX_219_reg_72_0_0_0;
  output selector_MUX_220_reg_73_0_0_0;
  output selector_MUX_221_reg_74_0_0_0;
  output selector_MUX_225_reg_78_0_0_0;
  output selector_MUX_228_reg_80_0_0_0;
  output selector_MUX_233_reg_85_0_0_0;
  output selector_MUX_235_reg_87_0_0_0;
  output selector_MUX_238_reg_9_0_0_0;
  output selector_MUX_239_reg_90_0_0_0;
  output selector_MUX_242_reg_93_0_0_0;
  output selector_MUX_243_reg_94_0_0_0;
  output selector_MUX_244_reg_95_0_0_0;
  output selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0;
  output selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1;
  output selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2;
  output selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3;
  output selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4;
  output selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5;
  output selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0;
  output selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1;
  output selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2;
  output selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0;
  output selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1;
  output selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0;
  output selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1;
  output selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0;
  output selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0;
  output selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0;
  output selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0;
  output selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0;
  output selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1;
  output selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2;
  output selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3;
  output selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4;
  output selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5;
  output selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0;
  output selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1;
  output selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2;
  output selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0;
  output selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1;
  output selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0;
  output selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1;
  output selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0;
  output selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0;
  output selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1;
  output selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0;
  output selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0;
  output selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0;
  output selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0;
  output selector_MUX_75___udivsi3_192_i0_0_0_0;
  output selector_MUX_75___udivsi3_192_i0_0_0_1;
  output selector_MUX_75___udivsi3_192_i0_0_0_2;
  output selector_MUX_75___udivsi3_192_i0_0_1_0;
  output selector_MUX_75___udivsi3_192_i0_0_1_1;
  output selector_MUX_76___udivsi3_192_i0_1_0_0;
  output selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0;
  output selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0;
  output selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0;
  output selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1;
  output selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0;
  output selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1;
  output selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0;
  output selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0;
  output selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1;
  output selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0;
  output selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0;
  output muenable_mu_S_308;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_100;
  output wrenable_reg_101;
  output wrenable_reg_102;
  output wrenable_reg_103;
  output wrenable_reg_104;
  output wrenable_reg_105;
  output wrenable_reg_106;
  output wrenable_reg_107;
  output wrenable_reg_108;
  output wrenable_reg_109;
  output wrenable_reg_11;
  output wrenable_reg_110;
  output wrenable_reg_111;
  output wrenable_reg_112;
  output wrenable_reg_113;
  output wrenable_reg_114;
  output wrenable_reg_115;
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
  output wrenable_reg_49;
  output wrenable_reg_5;
  output wrenable_reg_50;
  output wrenable_reg_51;
  output wrenable_reg_52;
  output wrenable_reg_53;
  output wrenable_reg_54;
  output wrenable_reg_55;
  output wrenable_reg_56;
  output wrenable_reg_57;
  output wrenable_reg_58;
  output wrenable_reg_59;
  output wrenable_reg_6;
  output wrenable_reg_60;
  output wrenable_reg_61;
  output wrenable_reg_62;
  output wrenable_reg_63;
  output wrenable_reg_64;
  output wrenable_reg_65;
  output wrenable_reg_66;
  output wrenable_reg_67;
  output wrenable_reg_68;
  output wrenable_reg_69;
  output wrenable_reg_7;
  output wrenable_reg_70;
  output wrenable_reg_71;
  output wrenable_reg_72;
  output wrenable_reg_73;
  output wrenable_reg_74;
  output wrenable_reg_75;
  output wrenable_reg_76;
  output wrenable_reg_77;
  output wrenable_reg_78;
  output wrenable_reg_79;
  output wrenable_reg_8;
  output wrenable_reg_80;
  output wrenable_reg_81;
  output wrenable_reg_82;
  output wrenable_reg_83;
  output wrenable_reg_84;
  output wrenable_reg_85;
  output wrenable_reg_86;
  output wrenable_reg_87;
  output wrenable_reg_88;
  output wrenable_reg_89;
  output wrenable_reg_9;
  output wrenable_reg_90;
  output wrenable_reg_91;
  output wrenable_reg_92;
  output wrenable_reg_93;
  output wrenable_reg_94;
  output wrenable_reg_95;
  output wrenable_reg_96;
  output wrenable_reg_97;
  output wrenable_reg_98;
  output wrenable_reg_99;
  parameter [8:0] S_0 = 9'd0,
    S_1 = 9'd1,
    S_2 = 9'd2,
    S_312 = 9'd312,
    S_313 = 9'd313,
    S_314 = 9'd314,
    S_315 = 9'd315,
    S_23 = 9'd23,
    S_3 = 9'd3,
    S_4 = 9'd4,
    S_5 = 9'd5,
    S_6 = 9'd6,
    S_7 = 9'd7,
    S_8 = 9'd8,
    S_9 = 9'd9,
    S_10 = 9'd10,
    S_11 = 9'd11,
    S_12 = 9'd12,
    S_13 = 9'd13,
    S_14 = 9'd14,
    S_15 = 9'd15,
    S_16 = 9'd16,
    S_17 = 9'd17,
    S_18 = 9'd18,
    S_19 = 9'd19,
    S_20 = 9'd20,
    S_21 = 9'd21,
    S_22 = 9'd22,
    S_305 = 9'd305,
    S_306 = 9'd306,
    S_307 = 9'd307,
    S_49 = 9'd49,
    S_50 = 9'd50,
    S_51 = 9'd51,
    S_24 = 9'd24,
    S_25 = 9'd25,
    S_44 = 9'd44,
    S_26 = 9'd26,
    S_27 = 9'd27,
    S_28 = 9'd28,
    S_29 = 9'd29,
    S_30 = 9'd30,
    S_31 = 9'd31,
    S_32 = 9'd32,
    S_33 = 9'd33,
    S_34 = 9'd34,
    S_35 = 9'd35,
    S_36 = 9'd36,
    S_37 = 9'd37,
    S_38 = 9'd38,
    S_39 = 9'd39,
    S_40 = 9'd40,
    S_41 = 9'd41,
    S_42 = 9'd42,
    S_43 = 9'd43,
    S_45 = 9'd45,
    S_46 = 9'd46,
    S_47 = 9'd47,
    S_48 = 9'd48,
    S_52 = 9'd52,
    S_53 = 9'd53,
    S_54 = 9'd54,
    S_55 = 9'd55,
    S_56 = 9'd56,
    S_310 = 9'd310,
    S_311 = 9'd311,
    S_77 = 9'd77,
    S_57 = 9'd57,
    S_58 = 9'd58,
    S_59 = 9'd59,
    S_60 = 9'd60,
    S_61 = 9'd61,
    S_62 = 9'd62,
    S_63 = 9'd63,
    S_64 = 9'd64,
    S_65 = 9'd65,
    S_66 = 9'd66,
    S_67 = 9'd67,
    S_68 = 9'd68,
    S_69 = 9'd69,
    S_70 = 9'd70,
    S_71 = 9'd71,
    S_72 = 9'd72,
    S_73 = 9'd73,
    S_74 = 9'd74,
    S_75 = 9'd75,
    S_76 = 9'd76,
    S_308 = 9'd308,
    S_309 = 9'd309,
    S_103 = 9'd103,
    S_104 = 9'd104,
    S_105 = 9'd105,
    S_78 = 9'd78,
    S_79 = 9'd79,
    S_98 = 9'd98,
    S_80 = 9'd80,
    S_81 = 9'd81,
    S_82 = 9'd82,
    S_83 = 9'd83,
    S_84 = 9'd84,
    S_85 = 9'd85,
    S_86 = 9'd86,
    S_87 = 9'd87,
    S_88 = 9'd88,
    S_89 = 9'd89,
    S_90 = 9'd90,
    S_91 = 9'd91,
    S_92 = 9'd92,
    S_93 = 9'd93,
    S_94 = 9'd94,
    S_95 = 9'd95,
    S_96 = 9'd96,
    S_97 = 9'd97,
    S_99 = 9'd99,
    S_100 = 9'd100,
    S_101 = 9'd101,
    S_102 = 9'd102,
    S_106 = 9'd106,
    S_132 = 9'd132,
    S_133 = 9'd133,
    S_108 = 9'd108,
    S_109 = 9'd109,
    S_110 = 9'd110,
    S_111 = 9'd111,
    S_112 = 9'd112,
    S_113 = 9'd113,
    S_114 = 9'd114,
    S_115 = 9'd115,
    S_116 = 9'd116,
    S_117 = 9'd117,
    S_118 = 9'd118,
    S_119 = 9'd119,
    S_120 = 9'd120,
    S_121 = 9'd121,
    S_122 = 9'd122,
    S_123 = 9'd123,
    S_124 = 9'd124,
    S_125 = 9'd125,
    S_126 = 9'd126,
    S_127 = 9'd127,
    S_128 = 9'd128,
    S_129 = 9'd129,
    S_130 = 9'd130,
    S_131 = 9'd131,
    S_134 = 9'd134,
    S_135 = 9'd135,
    S_136 = 9'd136,
    S_137 = 9'd137,
    S_138 = 9'd138,
    S_139 = 9'd139,
    S_140 = 9'd140,
    S_141 = 9'd141,
    S_142 = 9'd142,
    S_143 = 9'd143,
    S_144 = 9'd144,
    S_145 = 9'd145,
    S_146 = 9'd146,
    S_147 = 9'd147,
    S_148 = 9'd148,
    S_149 = 9'd149,
    S_150 = 9'd150,
    S_151 = 9'd151,
    S_152 = 9'd152,
    S_107 = 9'd107,
    S_316 = 9'd316,
    S_177 = 9'd177,
    S_153 = 9'd153,
    S_154 = 9'd154,
    S_155 = 9'd155,
    S_156 = 9'd156,
    S_157 = 9'd157,
    S_158 = 9'd158,
    S_159 = 9'd159,
    S_160 = 9'd160,
    S_161 = 9'd161,
    S_162 = 9'd162,
    S_163 = 9'd163,
    S_164 = 9'd164,
    S_165 = 9'd165,
    S_166 = 9'd166,
    S_167 = 9'd167,
    S_168 = 9'd168,
    S_169 = 9'd169,
    S_170 = 9'd170,
    S_171 = 9'd171,
    S_172 = 9'd172,
    S_173 = 9'd173,
    S_174 = 9'd174,
    S_175 = 9'd175,
    S_176 = 9'd176,
    S_178 = 9'd178,
    S_179 = 9'd179,
    S_180 = 9'd180,
    S_181 = 9'd181,
    S_182 = 9'd182,
    S_183 = 9'd183,
    S_184 = 9'd184,
    S_185 = 9'd185,
    S_186 = 9'd186,
    S_187 = 9'd187,
    S_188 = 9'd188,
    S_189 = 9'd189,
    S_190 = 9'd190,
    S_191 = 9'd191,
    S_192 = 9'd192,
    S_193 = 9'd193,
    S_194 = 9'd194,
    S_195 = 9'd195,
    S_196 = 9'd196,
    S_197 = 9'd197,
    S_198 = 9'd198,
    S_199 = 9'd199,
    S_200 = 9'd200,
    S_201 = 9'd201,
    S_202 = 9'd202,
    S_203 = 9'd203,
    S_204 = 9'd204,
    S_205 = 9'd205,
    S_206 = 9'd206,
    S_207 = 9'd207,
    S_208 = 9'd208,
    S_209 = 9'd209,
    S_210 = 9'd210,
    S_211 = 9'd211,
    S_212 = 9'd212,
    S_213 = 9'd213,
    S_214 = 9'd214,
    S_215 = 9'd215,
    S_216 = 9'd216,
    S_217 = 9'd217,
    S_218 = 9'd218,
    S_219 = 9'd219,
    S_220 = 9'd220,
    S_221 = 9'd221,
    S_222 = 9'd222,
    S_223 = 9'd223,
    S_224 = 9'd224,
    S_225 = 9'd225,
    S_226 = 9'd226,
    S_227 = 9'd227,
    S_228 = 9'd228,
    S_229 = 9'd229,
    S_230 = 9'd230,
    S_231 = 9'd231,
    S_232 = 9'd232,
    S_233 = 9'd233,
    S_234 = 9'd234,
    S_235 = 9'd235,
    S_236 = 9'd236,
    S_237 = 9'd237,
    S_238 = 9'd238,
    S_239 = 9'd239,
    S_240 = 9'd240,
    S_241 = 9'd241,
    S_242 = 9'd242,
    S_243 = 9'd243,
    S_244 = 9'd244,
    S_245 = 9'd245,
    S_246 = 9'd246,
    S_247 = 9'd247,
    S_248 = 9'd248,
    S_249 = 9'd249,
    S_250 = 9'd250,
    S_251 = 9'd251,
    S_252 = 9'd252,
    S_253 = 9'd253,
    S_254 = 9'd254,
    S_255 = 9'd255,
    S_256 = 9'd256,
    S_257 = 9'd257,
    S_258 = 9'd258,
    S_259 = 9'd259,
    S_260 = 9'd260,
    S_261 = 9'd261,
    S_262 = 9'd262,
    S_263 = 9'd263,
    S_264 = 9'd264,
    S_265 = 9'd265,
    S_266 = 9'd266,
    S_267 = 9'd267,
    S_268 = 9'd268,
    S_269 = 9'd269,
    S_270 = 9'd270,
    S_271 = 9'd271,
    S_272 = 9'd272,
    S_273 = 9'd273,
    S_274 = 9'd274,
    S_275 = 9'd275,
    S_276 = 9'd276,
    S_277 = 9'd277,
    S_278 = 9'd278,
    S_279 = 9'd279,
    S_280 = 9'd280,
    S_281 = 9'd281,
    S_282 = 9'd282,
    S_283 = 9'd283,
    S_284 = 9'd284,
    S_285 = 9'd285,
    S_286 = 9'd286,
    S_287 = 9'd287,
    S_288 = 9'd288,
    S_289 = 9'd289,
    S_290 = 9'd290,
    S_291 = 9'd291,
    S_292 = 9'd292,
    S_293 = 9'd293,
    S_294 = 9'd294,
    S_295 = 9'd295,
    S_296 = 9'd296,
    S_297 = 9'd297,
    S_298 = 9'd298,
    S_299 = 9'd299,
    S_300 = 9'd300,
    S_301 = 9'd301,
    S_302 = 9'd302,
    S_303 = 9'd303,
    S_304 = 9'd304,
    S_317 = 9'd317;
  reg [8:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_165_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_165_i0_STORE;
  reg fuselector_BMEMORY_CTRLN_165_i1_LOAD;
  reg fuselector_BMEMORY_CTRLN_165_i1_STORE;
  reg selector_IN_UNBOUNDED_cifar10_9853_11057;
  reg selector_IN_UNBOUNDED_cifar10_9853_11178;
  reg selector_IN_UNBOUNDED_cifar10_9853_11184;
  reg selector_IN_UNBOUNDED_cifar10_9853_11194;
  reg selector_IN_UNBOUNDED_cifar10_9853_11218;
  reg selector_IN_UNBOUNDED_cifar10_9853_11285;
  reg selector_IN_UNBOUNDED_cifar10_9853_11363;
  reg selector_IN_UNBOUNDED_cifar10_9853_11381;
  reg selector_IN_UNBOUNDED_cifar10_9853_11387;
  reg selector_IN_UNBOUNDED_cifar10_9853_11396;
  reg selector_IN_UNBOUNDED_cifar10_9853_11477;
  reg selector_IN_UNBOUNDED_cifar10_9853_11484;
  reg selector_IN_UNBOUNDED_cifar10_9853_11494;
  reg selector_MUX_135_reg_10_0_0_0;
  reg selector_MUX_136_reg_100_0_0_0;
  reg selector_MUX_139_reg_103_0_0_0;
  reg selector_MUX_140_reg_104_0_0_0;
  reg selector_MUX_142_reg_106_0_0_0;
  reg selector_MUX_143_reg_107_0_0_0;
  reg selector_MUX_145_reg_109_0_0_0;
  reg selector_MUX_150_reg_113_0_0_0;
  reg selector_MUX_161_reg_2_0_0_0;
  reg selector_MUX_169_reg_27_0_0_0;
  reg selector_MUX_170_reg_28_0_0_0;
  reg selector_MUX_171_reg_29_0_0_0;
  reg selector_MUX_176_reg_33_0_0_0;
  reg selector_MUX_177_reg_34_0_0_0;
  reg selector_MUX_183_reg_4_0_0_0;
  reg selector_MUX_187_reg_43_0_0_0;
  reg selector_MUX_189_reg_45_0_0_0;
  reg selector_MUX_189_reg_45_0_0_1;
  reg selector_MUX_192_reg_48_0_0_0;
  reg selector_MUX_193_reg_49_0_0_0;
  reg selector_MUX_195_reg_50_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2;
  reg selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0;
  reg selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1;
  reg selector_MUX_200_reg_55_0_0_0;
  reg selector_MUX_202_reg_57_0_0_0;
  reg selector_MUX_203_reg_58_0_0_0;
  reg selector_MUX_204_reg_59_0_0_0;
  reg selector_MUX_205_reg_6_0_0_0;
  reg selector_MUX_207_reg_61_0_0_0;
  reg selector_MUX_209_reg_63_0_0_0;
  reg selector_MUX_213_reg_67_0_0_0;
  reg selector_MUX_215_reg_69_0_0_0;
  reg selector_MUX_215_reg_69_0_0_1;
  reg selector_MUX_216_reg_7_0_0_0;
  reg selector_MUX_219_reg_72_0_0_0;
  reg selector_MUX_220_reg_73_0_0_0;
  reg selector_MUX_221_reg_74_0_0_0;
  reg selector_MUX_225_reg_78_0_0_0;
  reg selector_MUX_228_reg_80_0_0_0;
  reg selector_MUX_233_reg_85_0_0_0;
  reg selector_MUX_235_reg_87_0_0_0;
  reg selector_MUX_238_reg_9_0_0_0;
  reg selector_MUX_239_reg_90_0_0_0;
  reg selector_MUX_242_reg_93_0_0_0;
  reg selector_MUX_243_reg_94_0_0_0;
  reg selector_MUX_244_reg_95_0_0_0;
  reg selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0;
  reg selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1;
  reg selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2;
  reg selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3;
  reg selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4;
  reg selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5;
  reg selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0;
  reg selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1;
  reg selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2;
  reg selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0;
  reg selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1;
  reg selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0;
  reg selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1;
  reg selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0;
  reg selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0;
  reg selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0;
  reg selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0;
  reg selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0;
  reg selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1;
  reg selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2;
  reg selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3;
  reg selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4;
  reg selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5;
  reg selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0;
  reg selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1;
  reg selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2;
  reg selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0;
  reg selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1;
  reg selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0;
  reg selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1;
  reg selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0;
  reg selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0;
  reg selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1;
  reg selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0;
  reg selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0;
  reg selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0;
  reg selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0;
  reg selector_MUX_75___udivsi3_192_i0_0_0_0;
  reg selector_MUX_75___udivsi3_192_i0_0_0_1;
  reg selector_MUX_75___udivsi3_192_i0_0_0_2;
  reg selector_MUX_75___udivsi3_192_i0_0_1_0;
  reg selector_MUX_75___udivsi3_192_i0_0_1_1;
  reg selector_MUX_76___udivsi3_192_i0_1_0_0;
  reg selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0;
  reg selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0;
  reg selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0;
  reg selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1;
  reg selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0;
  reg selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1;
  reg selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0;
  reg selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0;
  reg selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1;
  reg selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0;
  reg selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0;
  reg muenable_mu_S_308;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_100;
  reg wrenable_reg_101;
  reg wrenable_reg_102;
  reg wrenable_reg_103;
  reg wrenable_reg_104;
  reg wrenable_reg_105;
  reg wrenable_reg_106;
  reg wrenable_reg_107;
  reg wrenable_reg_108;
  reg wrenable_reg_109;
  reg wrenable_reg_11;
  reg wrenable_reg_110;
  reg wrenable_reg_111;
  reg wrenable_reg_112;
  reg wrenable_reg_113;
  reg wrenable_reg_114;
  reg wrenable_reg_115;
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
  reg wrenable_reg_49;
  reg wrenable_reg_5;
  reg wrenable_reg_50;
  reg wrenable_reg_51;
  reg wrenable_reg_52;
  reg wrenable_reg_53;
  reg wrenable_reg_54;
  reg wrenable_reg_55;
  reg wrenable_reg_56;
  reg wrenable_reg_57;
  reg wrenable_reg_58;
  reg wrenable_reg_59;
  reg wrenable_reg_6;
  reg wrenable_reg_60;
  reg wrenable_reg_61;
  reg wrenable_reg_62;
  reg wrenable_reg_63;
  reg wrenable_reg_64;
  reg wrenable_reg_65;
  reg wrenable_reg_66;
  reg wrenable_reg_67;
  reg wrenable_reg_68;
  reg wrenable_reg_69;
  reg wrenable_reg_7;
  reg wrenable_reg_70;
  reg wrenable_reg_71;
  reg wrenable_reg_72;
  reg wrenable_reg_73;
  reg wrenable_reg_74;
  reg wrenable_reg_75;
  reg wrenable_reg_76;
  reg wrenable_reg_77;
  reg wrenable_reg_78;
  reg wrenable_reg_79;
  reg wrenable_reg_8;
  reg wrenable_reg_80;
  reg wrenable_reg_81;
  reg wrenable_reg_82;
  reg wrenable_reg_83;
  reg wrenable_reg_84;
  reg wrenable_reg_85;
  reg wrenable_reg_86;
  reg wrenable_reg_87;
  reg wrenable_reg_88;
  reg wrenable_reg_89;
  reg wrenable_reg_9;
  reg wrenable_reg_90;
  reg wrenable_reg_91;
  reg wrenable_reg_92;
  reg wrenable_reg_93;
  reg wrenable_reg_94;
  reg wrenable_reg_95;
  reg wrenable_reg_96;
  reg wrenable_reg_97;
  reg wrenable_reg_98;
  reg wrenable_reg_99;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_165_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_165_i0_STORE = 1'b0;
    fuselector_BMEMORY_CTRLN_165_i1_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_165_i1_STORE = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11057 = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11178 = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11184 = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11194 = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11218 = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11285 = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11363 = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11381 = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11387 = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11396 = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11477 = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11484 = 1'b0;
    selector_IN_UNBOUNDED_cifar10_9853_11494 = 1'b0;
    selector_MUX_135_reg_10_0_0_0 = 1'b0;
    selector_MUX_136_reg_100_0_0_0 = 1'b0;
    selector_MUX_139_reg_103_0_0_0 = 1'b0;
    selector_MUX_140_reg_104_0_0_0 = 1'b0;
    selector_MUX_142_reg_106_0_0_0 = 1'b0;
    selector_MUX_143_reg_107_0_0_0 = 1'b0;
    selector_MUX_145_reg_109_0_0_0 = 1'b0;
    selector_MUX_150_reg_113_0_0_0 = 1'b0;
    selector_MUX_161_reg_2_0_0_0 = 1'b0;
    selector_MUX_169_reg_27_0_0_0 = 1'b0;
    selector_MUX_170_reg_28_0_0_0 = 1'b0;
    selector_MUX_171_reg_29_0_0_0 = 1'b0;
    selector_MUX_176_reg_33_0_0_0 = 1'b0;
    selector_MUX_177_reg_34_0_0_0 = 1'b0;
    selector_MUX_183_reg_4_0_0_0 = 1'b0;
    selector_MUX_187_reg_43_0_0_0 = 1'b0;
    selector_MUX_189_reg_45_0_0_0 = 1'b0;
    selector_MUX_189_reg_45_0_0_1 = 1'b0;
    selector_MUX_192_reg_48_0_0_0 = 1'b0;
    selector_MUX_193_reg_49_0_0_0 = 1'b0;
    selector_MUX_195_reg_50_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1 = 1'b0;
    selector_MUX_200_reg_55_0_0_0 = 1'b0;
    selector_MUX_202_reg_57_0_0_0 = 1'b0;
    selector_MUX_203_reg_58_0_0_0 = 1'b0;
    selector_MUX_204_reg_59_0_0_0 = 1'b0;
    selector_MUX_205_reg_6_0_0_0 = 1'b0;
    selector_MUX_207_reg_61_0_0_0 = 1'b0;
    selector_MUX_209_reg_63_0_0_0 = 1'b0;
    selector_MUX_213_reg_67_0_0_0 = 1'b0;
    selector_MUX_215_reg_69_0_0_0 = 1'b0;
    selector_MUX_215_reg_69_0_0_1 = 1'b0;
    selector_MUX_216_reg_7_0_0_0 = 1'b0;
    selector_MUX_219_reg_72_0_0_0 = 1'b0;
    selector_MUX_220_reg_73_0_0_0 = 1'b0;
    selector_MUX_221_reg_74_0_0_0 = 1'b0;
    selector_MUX_225_reg_78_0_0_0 = 1'b0;
    selector_MUX_228_reg_80_0_0_0 = 1'b0;
    selector_MUX_233_reg_85_0_0_0 = 1'b0;
    selector_MUX_235_reg_87_0_0_0 = 1'b0;
    selector_MUX_238_reg_9_0_0_0 = 1'b0;
    selector_MUX_239_reg_90_0_0_0 = 1'b0;
    selector_MUX_242_reg_93_0_0_0 = 1'b0;
    selector_MUX_243_reg_94_0_0_0 = 1'b0;
    selector_MUX_244_reg_95_0_0_0 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0 = 1'b0;
    selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0 = 1'b0;
    selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0 = 1'b0;
    selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0 = 1'b0;
    selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0 = 1'b0;
    selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1 = 1'b0;
    selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2 = 1'b0;
    selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3 = 1'b0;
    selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4 = 1'b0;
    selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5 = 1'b0;
    selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0 = 1'b0;
    selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1 = 1'b0;
    selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2 = 1'b0;
    selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0 = 1'b0;
    selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1 = 1'b0;
    selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0 = 1'b0;
    selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1 = 1'b0;
    selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0 = 1'b0;
    selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0 = 1'b0;
    selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1 = 1'b0;
    selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0 = 1'b0;
    selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0 = 1'b0;
    selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0 = 1'b0;
    selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0 = 1'b0;
    selector_MUX_75___udivsi3_192_i0_0_0_0 = 1'b0;
    selector_MUX_75___udivsi3_192_i0_0_0_1 = 1'b0;
    selector_MUX_75___udivsi3_192_i0_0_0_2 = 1'b0;
    selector_MUX_75___udivsi3_192_i0_0_1_0 = 1'b0;
    selector_MUX_75___udivsi3_192_i0_0_1_1 = 1'b0;
    selector_MUX_76___udivsi3_192_i0_1_0_0 = 1'b0;
    selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0 = 1'b0;
    selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0 = 1'b0;
    selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0 = 1'b0;
    selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1 = 1'b0;
    selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0 = 1'b0;
    selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1 = 1'b0;
    selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0 = 1'b0;
    selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0 = 1'b0;
    selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1 = 1'b0;
    selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0 = 1'b0;
    selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0 = 1'b0;
    muenable_mu_S_308 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_100 = 1'b0;
    wrenable_reg_101 = 1'b0;
    wrenable_reg_102 = 1'b0;
    wrenable_reg_103 = 1'b0;
    wrenable_reg_104 = 1'b0;
    wrenable_reg_105 = 1'b0;
    wrenable_reg_106 = 1'b0;
    wrenable_reg_107 = 1'b0;
    wrenable_reg_108 = 1'b0;
    wrenable_reg_109 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_110 = 1'b0;
    wrenable_reg_111 = 1'b0;
    wrenable_reg_112 = 1'b0;
    wrenable_reg_113 = 1'b0;
    wrenable_reg_114 = 1'b0;
    wrenable_reg_115 = 1'b0;
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
    wrenable_reg_49 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_50 = 1'b0;
    wrenable_reg_51 = 1'b0;
    wrenable_reg_52 = 1'b0;
    wrenable_reg_53 = 1'b0;
    wrenable_reg_54 = 1'b0;
    wrenable_reg_55 = 1'b0;
    wrenable_reg_56 = 1'b0;
    wrenable_reg_57 = 1'b0;
    wrenable_reg_58 = 1'b0;
    wrenable_reg_59 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_60 = 1'b0;
    wrenable_reg_61 = 1'b0;
    wrenable_reg_62 = 1'b0;
    wrenable_reg_63 = 1'b0;
    wrenable_reg_64 = 1'b0;
    wrenable_reg_65 = 1'b0;
    wrenable_reg_66 = 1'b0;
    wrenable_reg_67 = 1'b0;
    wrenable_reg_68 = 1'b0;
    wrenable_reg_69 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_70 = 1'b0;
    wrenable_reg_71 = 1'b0;
    wrenable_reg_72 = 1'b0;
    wrenable_reg_73 = 1'b0;
    wrenable_reg_74 = 1'b0;
    wrenable_reg_75 = 1'b0;
    wrenable_reg_76 = 1'b0;
    wrenable_reg_77 = 1'b0;
    wrenable_reg_78 = 1'b0;
    wrenable_reg_79 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_80 = 1'b0;
    wrenable_reg_81 = 1'b0;
    wrenable_reg_82 = 1'b0;
    wrenable_reg_83 = 1'b0;
    wrenable_reg_84 = 1'b0;
    wrenable_reg_85 = 1'b0;
    wrenable_reg_86 = 1'b0;
    wrenable_reg_87 = 1'b0;
    wrenable_reg_88 = 1'b0;
    wrenable_reg_89 = 1'b0;
    wrenable_reg_9 = 1'b0;
    wrenable_reg_90 = 1'b0;
    wrenable_reg_91 = 1'b0;
    wrenable_reg_92 = 1'b0;
    wrenable_reg_93 = 1'b0;
    wrenable_reg_94 = 1'b0;
    wrenable_reg_95 = 1'b0;
    wrenable_reg_96 = 1'b0;
    wrenable_reg_97 = 1'b0;
    wrenable_reg_98 = 1'b0;
    wrenable_reg_99 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_IN_UNBOUNDED_cifar10_9853_11057 = 1'b1;
          selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0 = 1'b1;
          selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0 = 1'b1;
          selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11057 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_2;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0 = 1'b1;
          selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0 = 1'b1;
          selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0 = 1'b1;
          selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0 = 1'b1;
          selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11057 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_2;
            end
        end
      S_2 :
        begin
          selector_MUX_169_reg_27_0_0_0 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11058 == 1'b1)
            begin
              _next_state = S_23;
            end
          else
            begin
              _next_state = S_312;
              selector_MUX_169_reg_27_0_0_0 = 1'b0;
              wrenable_reg_27 = 1'b0;
              wrenable_reg_28 = 1'b0;
            end
        end
      S_312 :
        begin
          selector_IN_UNBOUNDED_cifar10_9853_11494 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11494 == 1'b0)
            begin
              _next_state = S_313;
            end
          else
            begin
              _next_state = S_314;
            end
        end
      S_313 :
        begin
          if (OUT_UNBOUNDED_cifar10_9853_11494 == 1'b0)
            begin
              _next_state = S_313;
            end
          else
            begin
              _next_state = S_314;
            end
        end
      S_314 :
        begin
          selector_IN_UNBOUNDED_cifar10_9853_11484 = 1'b1;
          selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1 = 1'b1;
          selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0 = 1'b1;
          selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0 = 1'b1;
          wrenable_reg_34 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11484 == 1'b0)
            begin
              _next_state = S_315;
              wrenable_reg_34 = 1'b0;
            end
          else
            begin
              _next_state = S_310;
            end
        end
      S_315 :
        begin
          selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1 = 1'b1;
          selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0 = 1'b1;
          selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0 = 1'b1;
          wrenable_reg_34 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11484 == 1'b0)
            begin
              _next_state = S_315;
              wrenable_reg_34 = 1'b0;
            end
          else
            begin
              _next_state = S_310;
            end
        end
      S_23 :
        begin
          selector_MUX_170_reg_28_0_0_0 = 1'b1;
          selector_MUX_171_reg_29_0_0_0 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          fuselector_BMEMORY_CTRLN_165_i1_LOAD = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_30 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          _next_state = S_5;
        end
      S_5 :
        begin
          _next_state = S_6;
        end
      S_6 :
        begin
          _next_state = S_7;
        end
      S_7 :
        begin
          _next_state = S_8;
        end
      S_8 :
        begin
          _next_state = S_9;
        end
      S_9 :
        begin
          _next_state = S_10;
        end
      S_10 :
        begin
          _next_state = S_11;
        end
      S_11 :
        begin
          _next_state = S_12;
        end
      S_12 :
        begin
          _next_state = S_13;
        end
      S_13 :
        begin
          _next_state = S_14;
        end
      S_14 :
        begin
          _next_state = S_15;
        end
      S_15 :
        begin
          _next_state = S_16;
        end
      S_16 :
        begin
          _next_state = S_17;
        end
      S_17 :
        begin
          _next_state = S_18;
        end
      S_18 :
        begin
          _next_state = S_19;
        end
      S_19 :
        begin
          if (OUT_CONDITION_cifar10_9853_11083 == 1'b1)
            begin
              _next_state = S_21;
            end
          else
            begin
              _next_state = S_20;
            end
        end
      S_20 :
        begin
          fuselector_BMEMORY_CTRLN_165_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0 = 1'b1;
          _next_state = S_21;
        end
      S_21 :
        begin
          if (OUT_CONDITION_cifar10_9853_11120 == 1'b1)
            begin
              _next_state = S_3;
            end
          else
            begin
              _next_state = S_22;
            end
        end
      S_22 :
        begin
          if (OUT_CONDITION_cifar10_9853_11123 == 1'b1)
            begin
              _next_state = S_23;
            end
          else
            begin
              _next_state = S_305;
            end
        end
      S_305 :
        begin
          selector_IN_UNBOUNDED_cifar10_9853_11194 = 1'b1;
          selector_MUX_75___udivsi3_192_i0_0_1_1 = 1'b1;
          selector_MUX_76___udivsi3_192_i0_1_0_0 = 1'b1;
          wrenable_reg_31 = OUT_UNBOUNDED_cifar10_9853_11194;
          wrenable_reg_32 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11194 == 1'b0)
            begin
              _next_state = S_306;
            end
          else
            begin
              _next_state = S_307;
            end
        end
      S_306 :
        begin
          selector_MUX_75___udivsi3_192_i0_0_1_1 = 1'b1;
          selector_MUX_76___udivsi3_192_i0_1_0_0 = 1'b1;
          wrenable_reg_31 = OUT_UNBOUNDED_cifar10_9853_11194;
          if (OUT_UNBOUNDED_cifar10_9853_11194 == 1'b0)
            begin
              _next_state = S_306;
            end
          else
            begin
              _next_state = S_307;
            end
        end
      S_307 :
        begin
          selector_MUX_177_reg_34_0_0_0 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          _next_state = S_49;
        end
      S_49 :
        begin
          selector_IN_UNBOUNDED_cifar10_9853_11184 = 1'b1;
          selector_MUX_76___udivsi3_192_i0_1_0_0 = 1'b1;
          wrenable_reg_39 = OUT_UNBOUNDED_cifar10_9853_11184;
          wrenable_reg_40 = 1'b1;
          wrenable_reg_41 = 1'b1;
          wrenable_reg_42 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11184 == 1'b0)
            begin
              _next_state = S_50;
            end
          else
            begin
              _next_state = S_51;
            end
        end
      S_50 :
        begin
          selector_MUX_76___udivsi3_192_i0_1_0_0 = 1'b1;
          wrenable_reg_39 = OUT_UNBOUNDED_cifar10_9853_11184;
          if (OUT_UNBOUNDED_cifar10_9853_11184 == 1'b0)
            begin
              _next_state = S_50;
            end
          else
            begin
              _next_state = S_51;
            end
        end
      S_51 :
        begin
          selector_MUX_189_reg_45_0_0_1 = 1'b1;
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          wrenable_reg_45 = 1'b1;
          _next_state = S_24;
        end
      S_24 :
        begin
          fuselector_BMEMORY_CTRLN_165_i0_LOAD = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_47 = 1'b1;
          _next_state = S_25;
        end
      S_25 :
        begin
          selector_MUX_192_reg_48_0_0_0 = 1'b1;
          wrenable_reg_48 = 1'b1;
          wrenable_reg_49 = 1'b1;
          wrenable_reg_55 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11139 == 1'b1)
            begin
              _next_state = S_44;
              wrenable_reg_55 = 1'b0;
            end
          else
            begin
              _next_state = S_45;
              selector_MUX_192_reg_48_0_0_0 = 1'b0;
              wrenable_reg_48 = 1'b0;
              wrenable_reg_49 = 1'b0;
            end
        end
      S_44 :
        begin
          selector_MUX_193_reg_49_0_0_0 = 1'b1;
          selector_MUX_195_reg_50_0_0_0 = 1'b1;
          wrenable_reg_49 = 1'b1;
          wrenable_reg_50 = 1'b1;
          wrenable_reg_51 = 1'b1;
          wrenable_reg_52 = 1'b1;
          _next_state = S_26;
        end
      S_26 :
        begin
          fuselector_BMEMORY_CTRLN_165_i1_LOAD = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1 = 1'b1;
          wrenable_reg_50 = 1'b1;
          wrenable_reg_53 = 1'b1;
          _next_state = S_27;
        end
      S_27 :
        begin
          wrenable_reg_54 = 1'b1;
          _next_state = S_28;
        end
      S_28 :
        begin
          _next_state = S_29;
        end
      S_29 :
        begin
          _next_state = S_30;
        end
      S_30 :
        begin
          _next_state = S_31;
        end
      S_31 :
        begin
          _next_state = S_32;
        end
      S_32 :
        begin
          _next_state = S_33;
        end
      S_33 :
        begin
          _next_state = S_34;
        end
      S_34 :
        begin
          _next_state = S_35;
        end
      S_35 :
        begin
          _next_state = S_36;
        end
      S_36 :
        begin
          _next_state = S_37;
        end
      S_37 :
        begin
          _next_state = S_38;
        end
      S_38 :
        begin
          _next_state = S_39;
        end
      S_39 :
        begin
          _next_state = S_40;
        end
      S_40 :
        begin
          _next_state = S_41;
        end
      S_41 :
        begin
          _next_state = S_42;
        end
      S_42 :
        begin
          wrenable_reg_48 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11266 == 1'b1)
            begin
              _next_state = S_26;
            end
          else
            begin
              _next_state = S_43;
            end
        end
      S_43 :
        begin
          selector_MUX_189_reg_45_0_0_0 = 1'b1;
          selector_MUX_200_reg_55_0_0_0 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_55 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11272 == 1'b1)
            begin
              _next_state = S_44;
              selector_MUX_200_reg_55_0_0_0 = 1'b0;
              wrenable_reg_55 = 1'b0;
            end
          else
            begin
              _next_state = S_45;
              selector_MUX_189_reg_45_0_0_0 = 1'b0;
              wrenable_reg_45 = 1'b0;
            end
        end
      S_45 :
        begin
          selector_IN_UNBOUNDED_cifar10_9853_11178 = 1'b1;
          selector_MUX_75___udivsi3_192_i0_0_0_1 = 1'b1;
          selector_MUX_76___udivsi3_192_i0_1_0_0 = 1'b1;
          wrenable_reg_39 = OUT_UNBOUNDED_cifar10_9853_11178;
          wrenable_reg_56 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11178 == 1'b0)
            begin
              _next_state = S_46;
            end
          else
            begin
              _next_state = S_47;
            end
        end
      S_46 :
        begin
          selector_MUX_75___udivsi3_192_i0_0_0_1 = 1'b1;
          selector_MUX_76___udivsi3_192_i0_1_0_0 = 1'b1;
          wrenable_reg_39 = OUT_UNBOUNDED_cifar10_9853_11178;
          if (OUT_UNBOUNDED_cifar10_9853_11178 == 1'b0)
            begin
              _next_state = S_46;
            end
          else
            begin
              _next_state = S_47;
            end
        end
      S_47 :
        begin
          fuselector_BMEMORY_CTRLN_165_i0_STORE = 1'b1;
          selector_MUX_187_reg_43_0_0_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3 = 1'b1;
          wrenable_reg_43 = 1'b1;
          wrenable_reg_45 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11280 == 1'b1)
            begin
              _next_state = S_24;
            end
          else
            begin
              _next_state = S_48;
              selector_MUX_187_reg_43_0_0_0 = 1'b0;
              wrenable_reg_43 = 1'b0;
              wrenable_reg_45 = 1'b0;
            end
        end
      S_48 :
        begin
          selector_MUX_161_reg_2_0_0_0 = 1'b1;
          selector_MUX_176_reg_33_0_0_0 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_33 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11282 == 1'b1)
            begin
              _next_state = S_49;
            end
          else
            begin
              _next_state = S_52;
              selector_MUX_161_reg_2_0_0_0 = 1'b0;
              selector_MUX_176_reg_33_0_0_0 = 1'b0;
              wrenable_reg_2 = 1'b0;
              wrenable_reg_33 = 1'b0;
            end
        end
      S_52 :
        begin
          selector_IN_UNBOUNDED_cifar10_9853_11218 = 1'b1;
          selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11218 == 1'b0)
            begin
              _next_state = S_53;
            end
          else
            begin
              _next_state = S_54;
            end
        end
      S_53 :
        begin
          selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11218 == 1'b0)
            begin
              _next_state = S_53;
            end
          else
            begin
              _next_state = S_54;
            end
        end
      S_54 :
        begin
          selector_IN_UNBOUNDED_cifar10_9853_11285 = 1'b1;
          selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0 = 1'b1;
          selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0 = 1'b1;
          selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11285 == 1'b0)
            begin
              _next_state = S_55;
            end
          else
            begin
              _next_state = S_56;
            end
        end
      S_55 :
        begin
          selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0 = 1'b1;
          selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0 = 1'b1;
          selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11285 == 1'b0)
            begin
              _next_state = S_55;
            end
          else
            begin
              _next_state = S_56;
            end
        end
      S_56 :
        begin
          selector_MUX_202_reg_57_0_0_0 = 1'b1;
          wrenable_reg_57 = 1'b1;
          wrenable_reg_58 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11286 == 1'b1)
            begin
              _next_state = S_77;
            end
          else
            begin
              _next_state = S_310;
              selector_MUX_202_reg_57_0_0_0 = 1'b0;
              wrenable_reg_57 = 1'b0;
              wrenable_reg_58 = 1'b0;
            end
        end
      S_310 :
        begin
          selector_IN_UNBOUNDED_cifar10_9853_11477 = 1'b1;
          selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0 = 1'b1;
          selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0 = 1'b1;
          selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0 = 1'b1;
          wrenable_reg_61 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11477 == 1'b0)
            begin
              _next_state = S_311;
              wrenable_reg_61 = 1'b0;
            end
          else
            begin
              _next_state = S_106;
            end
        end
      S_311 :
        begin
          selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0 = 1'b1;
          selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0 = 1'b1;
          selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0 = 1'b1;
          wrenable_reg_61 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11477 == 1'b0)
            begin
              _next_state = S_311;
              wrenable_reg_61 = 1'b0;
            end
          else
            begin
              _next_state = S_106;
            end
        end
      S_77 :
        begin
          selector_MUX_203_reg_58_0_0_0 = 1'b1;
          selector_MUX_204_reg_59_0_0_0 = 1'b1;
          wrenable_reg_57 = 1'b1;
          wrenable_reg_58 = 1'b1;
          wrenable_reg_59 = 1'b1;
          _next_state = S_57;
        end
      S_57 :
        begin
          fuselector_BMEMORY_CTRLN_165_i1_LOAD = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3 = 1'b1;
          wrenable_reg_59 = 1'b1;
          wrenable_reg_60 = 1'b1;
          _next_state = S_58;
        end
      S_58 :
        begin
          _next_state = S_59;
        end
      S_59 :
        begin
          _next_state = S_60;
        end
      S_60 :
        begin
          _next_state = S_61;
        end
      S_61 :
        begin
          _next_state = S_62;
        end
      S_62 :
        begin
          _next_state = S_63;
        end
      S_63 :
        begin
          _next_state = S_64;
        end
      S_64 :
        begin
          _next_state = S_65;
        end
      S_65 :
        begin
          _next_state = S_66;
        end
      S_66 :
        begin
          _next_state = S_67;
        end
      S_67 :
        begin
          _next_state = S_68;
        end
      S_68 :
        begin
          _next_state = S_69;
        end
      S_69 :
        begin
          _next_state = S_70;
        end
      S_70 :
        begin
          _next_state = S_71;
        end
      S_71 :
        begin
          _next_state = S_72;
        end
      S_72 :
        begin
          _next_state = S_73;
        end
      S_73 :
        begin
          if (OUT_CONDITION_cifar10_9853_11302 == 1'b1)
            begin
              _next_state = S_75;
            end
          else
            begin
              _next_state = S_74;
            end
        end
      S_74 :
        begin
          fuselector_BMEMORY_CTRLN_165_i1_STORE = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0 = 1'b1;
          _next_state = S_75;
        end
      S_75 :
        begin
          if (OUT_CONDITION_cifar10_9853_11335 == 1'b1)
            begin
              _next_state = S_57;
            end
          else
            begin
              _next_state = S_76;
            end
        end
      S_76 :
        begin
          if (OUT_CONDITION_cifar10_9853_11338 == 1'b1)
            begin
              _next_state = S_77;
            end
          else
            begin
              _next_state = S_308;
            end
        end
      S_308 :
        begin
          selector_IN_UNBOUNDED_cifar10_9853_11363 = 1'b1;
          selector_IN_UNBOUNDED_cifar10_9853_11396 = 1'b1;
          selector_MUX_207_reg_61_0_0_0 = 1'b1;
          selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0 = 1'b1;
          selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0 = 1'b1;
          selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0 = 1'b1;
          selector_MUX_75___udivsi3_192_i0_0_0_2 = 1'b1;
          selector_MUX_75___udivsi3_192_i0_0_1_1 = 1'b1;
          wrenable_reg_61 = OUT_UNBOUNDED_cifar10_9853_11396;
          wrenable_reg_62 = 1'b1;
          wrenable_reg_63 = 1'b1;
          if (OUT_mu_S_308_MULTI_UNBOUNDED_0 == 1'b0)
            begin
              _next_state = S_309;
              muenable_mu_S_308 = 1'b1;
              wrenable_reg_63 = 1'b0;
            end
          else
            begin
              _next_state = S_103;
              muenable_mu_S_308 = 1'b1;
            end
        end
      S_309 :
        begin
          selector_MUX_207_reg_61_0_0_0 = 1'b1;
          selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0 = 1'b1;
          selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0 = 1'b1;
          selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0 = 1'b1;
          selector_MUX_75___udivsi3_192_i0_0_0_2 = 1'b1;
          selector_MUX_75___udivsi3_192_i0_0_1_1 = 1'b1;
          wrenable_reg_61 = OUT_UNBOUNDED_cifar10_9853_11396;
          wrenable_reg_63 = 1'b1;
          if (OUT_mu_S_308_MULTI_UNBOUNDED_0 == 1'b0)
            begin
              _next_state = S_309;
              wrenable_reg_63 = 1'b0;
            end
          else
            begin
              _next_state = S_103;
            end
        end
      S_103 :
        begin
          selector_IN_UNBOUNDED_cifar10_9853_11387 = 1'b1;
          selector_MUX_75___udivsi3_192_i0_0_1_0 = 1'b1;
          wrenable_reg_39 = OUT_UNBOUNDED_cifar10_9853_11387;
          wrenable_reg_64 = 1'b1;
          wrenable_reg_65 = 1'b1;
          wrenable_reg_66 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11387 == 1'b0)
            begin
              _next_state = S_104;
            end
          else
            begin
              _next_state = S_105;
            end
        end
      S_104 :
        begin
          selector_MUX_75___udivsi3_192_i0_0_1_0 = 1'b1;
          wrenable_reg_39 = OUT_UNBOUNDED_cifar10_9853_11387;
          if (OUT_UNBOUNDED_cifar10_9853_11387 == 1'b0)
            begin
              _next_state = S_104;
            end
          else
            begin
              _next_state = S_105;
            end
        end
      S_105 :
        begin
          selector_MUX_215_reg_69_0_0_1 = 1'b1;
          wrenable_reg_67 = 1'b1;
          wrenable_reg_68 = 1'b1;
          wrenable_reg_69 = 1'b1;
          _next_state = S_78;
        end
      S_78 :
        begin
          fuselector_BMEMORY_CTRLN_165_i1_LOAD = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1 = 1'b1;
          wrenable_reg_70 = 1'b1;
          wrenable_reg_71 = 1'b1;
          _next_state = S_79;
        end
      S_79 :
        begin
          selector_MUX_219_reg_72_0_0_0 = 1'b1;
          wrenable_reg_72 = 1'b1;
          wrenable_reg_73 = 1'b1;
          wrenable_reg_78 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11350 == 1'b1)
            begin
              _next_state = S_98;
              wrenable_reg_78 = 1'b0;
            end
          else
            begin
              _next_state = S_99;
              selector_MUX_219_reg_72_0_0_0 = 1'b0;
              wrenable_reg_72 = 1'b0;
              wrenable_reg_73 = 1'b0;
            end
        end
      S_98 :
        begin
          selector_MUX_220_reg_73_0_0_0 = 1'b1;
          selector_MUX_221_reg_74_0_0_0 = 1'b1;
          wrenable_reg_73 = 1'b1;
          wrenable_reg_74 = 1'b1;
          wrenable_reg_75 = 1'b1;
          wrenable_reg_76 = 1'b1;
          _next_state = S_80;
        end
      S_80 :
        begin
          fuselector_BMEMORY_CTRLN_165_i1_LOAD = 1'b1;
          wrenable_reg_74 = 1'b1;
          wrenable_reg_77 = 1'b1;
          _next_state = S_81;
        end
      S_81 :
        begin
          selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0 = 1'b1;
          wrenable_reg_54 = 1'b1;
          _next_state = S_82;
        end
      S_82 :
        begin
          _next_state = S_83;
        end
      S_83 :
        begin
          _next_state = S_84;
        end
      S_84 :
        begin
          _next_state = S_85;
        end
      S_85 :
        begin
          _next_state = S_86;
        end
      S_86 :
        begin
          _next_state = S_87;
        end
      S_87 :
        begin
          _next_state = S_88;
        end
      S_88 :
        begin
          _next_state = S_89;
        end
      S_89 :
        begin
          _next_state = S_90;
        end
      S_90 :
        begin
          _next_state = S_91;
        end
      S_91 :
        begin
          _next_state = S_92;
        end
      S_92 :
        begin
          _next_state = S_93;
        end
      S_93 :
        begin
          _next_state = S_94;
        end
      S_94 :
        begin
          _next_state = S_95;
        end
      S_95 :
        begin
          _next_state = S_96;
        end
      S_96 :
        begin
          wrenable_reg_72 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11455 == 1'b1)
            begin
              _next_state = S_80;
            end
          else
            begin
              _next_state = S_97;
            end
        end
      S_97 :
        begin
          selector_MUX_215_reg_69_0_0_0 = 1'b1;
          selector_MUX_225_reg_78_0_0_0 = 1'b1;
          wrenable_reg_69 = 1'b1;
          wrenable_reg_78 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11461 == 1'b1)
            begin
              _next_state = S_98;
              selector_MUX_225_reg_78_0_0_0 = 1'b0;
              wrenable_reg_78 = 1'b0;
            end
          else
            begin
              _next_state = S_99;
              selector_MUX_215_reg_69_0_0_0 = 1'b0;
              wrenable_reg_69 = 1'b0;
            end
        end
      S_99 :
        begin
          selector_IN_UNBOUNDED_cifar10_9853_11381 = 1'b1;
          selector_MUX_75___udivsi3_192_i0_0_0_0 = 1'b1;
          selector_MUX_75___udivsi3_192_i0_0_1_0 = 1'b1;
          wrenable_reg_39 = OUT_UNBOUNDED_cifar10_9853_11381;
          wrenable_reg_79 = 1'b1;
          if (OUT_UNBOUNDED_cifar10_9853_11381 == 1'b0)
            begin
              _next_state = S_100;
            end
          else
            begin
              _next_state = S_101;
            end
        end
      S_100 :
        begin
          selector_MUX_75___udivsi3_192_i0_0_0_0 = 1'b1;
          selector_MUX_75___udivsi3_192_i0_0_1_0 = 1'b1;
          wrenable_reg_39 = OUT_UNBOUNDED_cifar10_9853_11381;
          if (OUT_UNBOUNDED_cifar10_9853_11381 == 1'b0)
            begin
              _next_state = S_100;
            end
          else
            begin
              _next_state = S_101;
            end
        end
      S_101 :
        begin
          fuselector_BMEMORY_CTRLN_165_i1_STORE = 1'b1;
          selector_MUX_213_reg_67_0_0_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1 = 1'b1;
          wrenable_reg_67 = 1'b1;
          wrenable_reg_69 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11468 == 1'b1)
            begin
              _next_state = S_78;
            end
          else
            begin
              _next_state = S_102;
              selector_MUX_213_reg_67_0_0_0 = 1'b0;
              wrenable_reg_67 = 1'b0;
              wrenable_reg_69 = 1'b0;
            end
        end
      S_102 :
        begin
          selector_MUX_183_reg_4_0_0_0 = 1'b1;
          selector_MUX_209_reg_63_0_0_0 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_63 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11470 == 1'b1)
            begin
              _next_state = S_103;
            end
          else
            begin
              _next_state = S_106;
              selector_MUX_183_reg_4_0_0_0 = 1'b0;
              selector_MUX_209_reg_63_0_0_0 = 1'b0;
              wrenable_reg_4 = 1'b0;
              wrenable_reg_63 = 1'b0;
            end
        end
      S_106 :
        begin
          if (OUT_CONDITION_cifar10_9853_11474 == 1'b1)
            begin
              _next_state = S_132;
            end
          else
            begin
              _next_state = S_107;
            end
        end
      S_132 :
        begin
          selector_MUX_228_reg_80_0_0_0 = 1'b1;
          wrenable_reg_80 = 1'b1;
          wrenable_reg_81 = 1'b1;
          wrenable_reg_82 = 1'b1;
          wrenable_reg_83 = 1'b1;
          _next_state = S_133;
        end
      S_133 :
        begin
          selector_MUX_233_reg_85_0_0_0 = 1'b1;
          selector_MUX_239_reg_90_0_0_0 = 1'b1;
          wrenable_reg_80 = 1'b1;
          wrenable_reg_84 = 1'b1;
          wrenable_reg_85 = 1'b1;
          wrenable_reg_86 = 1'b1;
          wrenable_reg_87 = 1'b1;
          wrenable_reg_88 = 1'b1;
          wrenable_reg_90 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11625 == 1'b1)
            begin
              _next_state = S_108;
              selector_MUX_239_reg_90_0_0_0 = 1'b0;
              wrenable_reg_90 = 1'b0;
            end
          else
            begin
              _next_state = S_131;
              selector_MUX_233_reg_85_0_0_0 = 1'b0;
              wrenable_reg_85 = 1'b0;
              wrenable_reg_86 = 1'b0;
              wrenable_reg_87 = 1'b0;
            end
        end
      S_108 :
        begin
          fuselector_BMEMORY_CTRLN_165_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_165_i1_LOAD = 1'b1;
          selector_MUX_235_reg_87_0_0_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1 = 1'b1;
          wrenable_reg_87 = 1'b1;
          wrenable_reg_89 = 1'b1;
          _next_state = S_109;
        end
      S_109 :
        begin
          _next_state = S_110;
        end
      S_110 :
        begin
          _next_state = S_111;
        end
      S_111 :
        begin
          _next_state = S_112;
        end
      S_112 :
        begin
          _next_state = S_113;
        end
      S_113 :
        begin
          _next_state = S_114;
        end
      S_114 :
        begin
          _next_state = S_115;
        end
      S_115 :
        begin
          _next_state = S_116;
        end
      S_116 :
        begin
          _next_state = S_117;
        end
      S_117 :
        begin
          _next_state = S_118;
        end
      S_118 :
        begin
          _next_state = S_119;
        end
      S_119 :
        begin
          _next_state = S_120;
        end
      S_120 :
        begin
          _next_state = S_121;
        end
      S_121 :
        begin
          _next_state = S_122;
        end
      S_122 :
        begin
          _next_state = S_123;
        end
      S_123 :
        begin
          _next_state = S_124;
        end
      S_124 :
        begin
          _next_state = S_125;
        end
      S_125 :
        begin
          _next_state = S_126;
        end
      S_126 :
        begin
          _next_state = S_127;
        end
      S_127 :
        begin
          _next_state = S_128;
        end
      S_128 :
        begin
          _next_state = S_129;
        end
      S_129 :
        begin
          _next_state = S_130;
        end
      S_130 :
        begin
          wrenable_reg_85 = 1'b1;
          wrenable_reg_90 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11612 == 1'b1)
            begin
              _next_state = S_108;
              wrenable_reg_90 = 1'b0;
            end
          else
            begin
              _next_state = S_131;
              wrenable_reg_85 = 1'b0;
            end
        end
      S_131 :
        begin
          fuselector_BMEMORY_CTRLN_165_i1_STORE = 1'b1;
          selector_MUX_216_reg_7_0_0_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0 = 1'b1;
          wrenable_reg_7 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11614 == 1'b1)
            begin
              _next_state = S_133;
            end
          else
            begin
              _next_state = S_134;
              selector_MUX_216_reg_7_0_0_0 = 1'b0;
              wrenable_reg_7 = 1'b0;
            end
        end
      S_134 :
        begin
          fuselector_BMEMORY_CTRLN_165_i1_LOAD = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0 = 1'b1;
          wrenable_reg_91 = 1'b1;
          wrenable_reg_92 = 1'b1;
          _next_state = S_135;
        end
      S_135 :
        begin
          _next_state = S_136;
        end
      S_136 :
        begin
          _next_state = S_137;
        end
      S_137 :
        begin
          _next_state = S_138;
        end
      S_138 :
        begin
          _next_state = S_139;
        end
      S_139 :
        begin
          _next_state = S_140;
        end
      S_140 :
        begin
          _next_state = S_141;
        end
      S_141 :
        begin
          _next_state = S_142;
        end
      S_142 :
        begin
          _next_state = S_143;
        end
      S_143 :
        begin
          _next_state = S_144;
        end
      S_144 :
        begin
          _next_state = S_145;
        end
      S_145 :
        begin
          _next_state = S_146;
        end
      S_146 :
        begin
          _next_state = S_147;
        end
      S_147 :
        begin
          _next_state = S_148;
        end
      S_148 :
        begin
          _next_state = S_149;
        end
      S_149 :
        begin
          _next_state = S_150;
        end
      S_150 :
        begin
          if (OUT_CONDITION_cifar10_9853_11628 == 1'b1)
            begin
              _next_state = S_152;
            end
          else
            begin
              _next_state = S_151;
            end
        end
      S_151 :
        begin
          fuselector_BMEMORY_CTRLN_165_i1_STORE = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0 = 1'b1;
          _next_state = S_152;
        end
      S_152 :
        begin
          selector_MUX_205_reg_6_0_0_0 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11633 == 1'b1)
            begin
              _next_state = S_134;
            end
          else
            begin
              _next_state = S_107;
              selector_MUX_205_reg_6_0_0_0 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
        end
      S_107 :
        begin
          selector_MUX_242_reg_93_0_0_0 = 1'b1;
          wrenable_reg_93 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11502 == 1'b1)
            begin
              _next_state = S_177;
            end
          else
            begin
              _next_state = S_316;
              done_port = 1'b1;
              selector_MUX_242_reg_93_0_0_0 = 1'b0;
              wrenable_reg_93 = 1'b0;
            end
        end
      S_316 :
        begin
          _next_state = S_0;
        end
      S_177 :
        begin
          selector_MUX_136_reg_100_0_0_0 = 1'b1;
          selector_MUX_244_reg_95_0_0_0 = 1'b1;
          wrenable_reg_100 = 1'b1;
          wrenable_reg_93 = 1'b1;
          wrenable_reg_94 = 1'b1;
          wrenable_reg_95 = 1'b1;
          wrenable_reg_96 = 1'b1;
          wrenable_reg_97 = 1'b1;
          wrenable_reg_98 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11711 == 1'b1)
            begin
              _next_state = S_153;
              selector_MUX_136_reg_100_0_0_0 = 1'b0;
              wrenable_reg_100 = 1'b0;
            end
          else
            begin
              _next_state = S_176;
              selector_MUX_244_reg_95_0_0_0 = 1'b0;
              wrenable_reg_94 = 1'b0;
              wrenable_reg_95 = 1'b0;
              wrenable_reg_96 = 1'b0;
            end
        end
      S_153 :
        begin
          fuselector_BMEMORY_CTRLN_165_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_165_i1_LOAD = 1'b1;
          selector_MUX_243_reg_94_0_0_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1 = 1'b1;
          wrenable_reg_94 = 1'b1;
          wrenable_reg_99 = 1'b1;
          _next_state = S_154;
        end
      S_154 :
        begin
          selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0 = 1'b1;
          selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1 = 1'b1;
          _next_state = S_155;
        end
      S_155 :
        begin
          _next_state = S_156;
        end
      S_156 :
        begin
          _next_state = S_157;
        end
      S_157 :
        begin
          _next_state = S_158;
        end
      S_158 :
        begin
          _next_state = S_159;
        end
      S_159 :
        begin
          _next_state = S_160;
        end
      S_160 :
        begin
          selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0 = 1'b1;
          _next_state = S_161;
        end
      S_161 :
        begin
          _next_state = S_162;
        end
      S_162 :
        begin
          _next_state = S_163;
        end
      S_163 :
        begin
          _next_state = S_164;
        end
      S_164 :
        begin
          _next_state = S_165;
        end
      S_165 :
        begin
          _next_state = S_166;
        end
      S_166 :
        begin
          _next_state = S_167;
        end
      S_167 :
        begin
          _next_state = S_168;
        end
      S_168 :
        begin
          _next_state = S_169;
        end
      S_169 :
        begin
          _next_state = S_170;
        end
      S_170 :
        begin
          _next_state = S_171;
        end
      S_171 :
        begin
          _next_state = S_172;
        end
      S_172 :
        begin
          _next_state = S_173;
        end
      S_173 :
        begin
          _next_state = S_174;
        end
      S_174 :
        begin
          _next_state = S_175;
        end
      S_175 :
        begin
          wrenable_reg_100 = 1'b1;
          wrenable_reg_95 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11646 == 1'b1)
            begin
              _next_state = S_153;
              wrenable_reg_100 = 1'b0;
            end
          else
            begin
              _next_state = S_176;
              wrenable_reg_95 = 1'b0;
            end
        end
      S_176 :
        begin
          fuselector_BMEMORY_CTRLN_165_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1 = 1'b1;
          selector_MUX_238_reg_9_0_0_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11700 == 1'b1)
            begin
              _next_state = S_177;
            end
          else
            begin
              _next_state = S_178;
              selector_MUX_238_reg_9_0_0_0 = 1'b0;
              wrenable_reg_9 = 1'b0;
            end
        end
      S_178 :
        begin
          fuselector_BMEMORY_CTRLN_165_i0_LOAD = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1 = 1'b1;
          wrenable_reg_101 = 1'b1;
          wrenable_reg_102 = 1'b1;
          _next_state = S_179;
        end
      S_179 :
        begin
          selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0 = 1'b1;
          _next_state = S_180;
        end
      S_180 :
        begin
          _next_state = S_181;
        end
      S_181 :
        begin
          _next_state = S_182;
        end
      S_182 :
        begin
          _next_state = S_183;
        end
      S_183 :
        begin
          _next_state = S_184;
        end
      S_184 :
        begin
          _next_state = S_185;
        end
      S_185 :
        begin
          _next_state = S_186;
        end
      S_186 :
        begin
          _next_state = S_187;
        end
      S_187 :
        begin
          _next_state = S_188;
        end
      S_188 :
        begin
          _next_state = S_189;
        end
      S_189 :
        begin
          _next_state = S_190;
        end
      S_190 :
        begin
          _next_state = S_191;
        end
      S_191 :
        begin
          _next_state = S_192;
        end
      S_192 :
        begin
          _next_state = S_193;
        end
      S_193 :
        begin
          _next_state = S_194;
        end
      S_194 :
        begin
          if (OUT_CONDITION_cifar10_9853_11717 == 1'b1)
            begin
              _next_state = S_196;
            end
          else
            begin
              _next_state = S_195;
            end
        end
      S_195 :
        begin
          fuselector_BMEMORY_CTRLN_165_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1 = 1'b1;
          _next_state = S_196;
        end
      S_196 :
        begin
          selector_MUX_135_reg_10_0_0_0 = 1'b1;
          selector_MUX_140_reg_104_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_103 = 1'b1;
          wrenable_reg_104 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11735 == 1'b1)
            begin
              _next_state = S_178;
              selector_MUX_140_reg_104_0_0_0 = 1'b0;
              wrenable_reg_103 = 1'b0;
              wrenable_reg_104 = 1'b0;
            end
          else
            begin
              _next_state = S_197;
              selector_MUX_135_reg_10_0_0_0 = 1'b0;
              wrenable_reg_10 = 1'b0;
            end
        end
      S_197 :
        begin
          fuselector_BMEMORY_CTRLN_165_i0_LOAD = 1'b1;
          selector_MUX_139_reg_103_0_0_0 = 1'b1;
          wrenable_reg_103 = 1'b1;
          wrenable_reg_105 = 1'b1;
          _next_state = S_198;
        end
      S_198 :
        begin
          selector_MUX_142_reg_106_0_0_0 = 1'b1;
          selector_MUX_143_reg_107_0_0_0 = 1'b1;
          selector_MUX_145_reg_109_0_0_0 = 1'b1;
          wrenable_reg_106 = 1'b1;
          wrenable_reg_107 = 1'b1;
          wrenable_reg_108 = 1'b1;
          wrenable_reg_109 = 1'b1;
          _next_state = S_199;
        end
      S_199 :
        begin
          wrenable_reg_109 = 1'b1;
          wrenable_reg_110 = 1'b1;
          _next_state = S_200;
        end
      S_200 :
        begin
          _next_state = S_201;
        end
      S_201 :
        begin
          _next_state = S_202;
        end
      S_202 :
        begin
          wrenable_reg_111 = 1'b1;
          _next_state = S_203;
        end
      S_203 :
        begin
          selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0 = 1'b1;
          selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0 = 1'b1;
          _next_state = S_204;
        end
      S_204 :
        begin
          _next_state = S_205;
        end
      S_205 :
        begin
          _next_state = S_206;
        end
      S_206 :
        begin
          _next_state = S_207;
        end
      S_207 :
        begin
          _next_state = S_208;
        end
      S_208 :
        begin
          _next_state = S_209;
        end
      S_209 :
        begin
          _next_state = S_210;
        end
      S_210 :
        begin
          _next_state = S_211;
        end
      S_211 :
        begin
          _next_state = S_212;
        end
      S_212 :
        begin
          _next_state = S_213;
        end
      S_213 :
        begin
          _next_state = S_214;
        end
      S_214 :
        begin
          _next_state = S_215;
        end
      S_215 :
        begin
          _next_state = S_216;
        end
      S_216 :
        begin
          _next_state = S_217;
        end
      S_217 :
        begin
          _next_state = S_218;
        end
      S_218 :
        begin
          _next_state = S_219;
        end
      S_219 :
        begin
          _next_state = S_220;
        end
      S_220 :
        begin
          _next_state = S_221;
        end
      S_221 :
        begin
          _next_state = S_222;
        end
      S_222 :
        begin
          _next_state = S_223;
        end
      S_223 :
        begin
          _next_state = S_224;
        end
      S_224 :
        begin
          _next_state = S_225;
        end
      S_225 :
        begin
          _next_state = S_226;
        end
      S_226 :
        begin
          _next_state = S_227;
        end
      S_227 :
        begin
          _next_state = S_228;
        end
      S_228 :
        begin
          _next_state = S_229;
        end
      S_229 :
        begin
          _next_state = S_230;
        end
      S_230 :
        begin
          _next_state = S_231;
        end
      S_231 :
        begin
          _next_state = S_232;
        end
      S_232 :
        begin
          _next_state = S_233;
        end
      S_233 :
        begin
          _next_state = S_234;
        end
      S_234 :
        begin
          selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1 = 1'b1;
          selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0 = 1'b1;
          _next_state = S_235;
        end
      S_235 :
        begin
          _next_state = S_236;
        end
      S_236 :
        begin
          _next_state = S_237;
        end
      S_237 :
        begin
          _next_state = S_238;
        end
      S_238 :
        begin
          _next_state = S_239;
        end
      S_239 :
        begin
          _next_state = S_240;
        end
      S_240 :
        begin
          selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1 = 1'b1;
          wrenable_reg_107 = 1'b1;
          _next_state = S_241;
        end
      S_241 :
        begin
          _next_state = S_242;
        end
      S_242 :
        begin
          _next_state = S_243;
        end
      S_243 :
        begin
          _next_state = S_244;
        end
      S_244 :
        begin
          _next_state = S_245;
        end
      S_245 :
        begin
          _next_state = S_246;
        end
      S_246 :
        begin
          _next_state = S_247;
        end
      S_247 :
        begin
          _next_state = S_248;
        end
      S_248 :
        begin
          _next_state = S_249;
        end
      S_249 :
        begin
          _next_state = S_250;
        end
      S_250 :
        begin
          _next_state = S_251;
        end
      S_251 :
        begin
          _next_state = S_252;
        end
      S_252 :
        begin
          _next_state = S_253;
        end
      S_253 :
        begin
          _next_state = S_254;
        end
      S_254 :
        begin
          _next_state = S_255;
        end
      S_255 :
        begin
          wrenable_reg_106 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11819 == 1'b1)
            begin
              _next_state = S_199;
            end
          else
            begin
              _next_state = S_256;
            end
        end
      S_256 :
        begin
          fuselector_BMEMORY_CTRLN_165_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0 = 1'b1;
          selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0 = 1'b1;
          selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1 = 1'b1;
          wrenable_reg_112 = 1'b1;
          _next_state = S_257;
        end
      S_257 :
        begin
          _next_state = S_258;
        end
      S_258 :
        begin
          _next_state = S_259;
        end
      S_259 :
        begin
          _next_state = S_260;
        end
      S_260 :
        begin
          _next_state = S_261;
        end
      S_261 :
        begin
          _next_state = S_262;
        end
      S_262 :
        begin
          _next_state = S_263;
        end
      S_263 :
        begin
          _next_state = S_264;
        end
      S_264 :
        begin
          _next_state = S_265;
        end
      S_265 :
        begin
          _next_state = S_266;
        end
      S_266 :
        begin
          _next_state = S_267;
        end
      S_267 :
        begin
          _next_state = S_268;
        end
      S_268 :
        begin
          _next_state = S_269;
        end
      S_269 :
        begin
          _next_state = S_270;
        end
      S_270 :
        begin
          _next_state = S_271;
        end
      S_271 :
        begin
          wrenable_reg_104 = 1'b1;
          wrenable_reg_113 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11821 == 1'b1)
            begin
              _next_state = S_197;
              wrenable_reg_113 = 1'b0;
            end
          else
            begin
              _next_state = S_272;
            end
        end
      S_272 :
        begin
          fuselector_BMEMORY_CTRLN_165_i0_LOAD = 1'b1;
          selector_MUX_150_reg_113_0_0_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1 = 1'b1;
          wrenable_reg_113 = 1'b1;
          wrenable_reg_114 = 1'b1;
          wrenable_reg_115 = 1'b1;
          _next_state = S_273;
        end
      S_273 :
        begin
          _next_state = S_274;
        end
      S_274 :
        begin
          _next_state = S_275;
        end
      S_275 :
        begin
          _next_state = S_276;
        end
      S_276 :
        begin
          _next_state = S_277;
        end
      S_277 :
        begin
          _next_state = S_278;
        end
      S_278 :
        begin
          _next_state = S_279;
        end
      S_279 :
        begin
          _next_state = S_280;
        end
      S_280 :
        begin
          _next_state = S_281;
        end
      S_281 :
        begin
          _next_state = S_282;
        end
      S_282 :
        begin
          _next_state = S_283;
        end
      S_283 :
        begin
          _next_state = S_284;
        end
      S_284 :
        begin
          _next_state = S_285;
        end
      S_285 :
        begin
          _next_state = S_286;
        end
      S_286 :
        begin
          _next_state = S_287;
        end
      S_287 :
        begin
          _next_state = S_288;
        end
      S_288 :
        begin
          _next_state = S_289;
        end
      S_289 :
        begin
          _next_state = S_290;
        end
      S_290 :
        begin
          _next_state = S_291;
        end
      S_291 :
        begin
          _next_state = S_292;
        end
      S_292 :
        begin
          _next_state = S_293;
        end
      S_293 :
        begin
          _next_state = S_294;
        end
      S_294 :
        begin
          _next_state = S_295;
        end
      S_295 :
        begin
          _next_state = S_296;
        end
      S_296 :
        begin
          _next_state = S_297;
        end
      S_297 :
        begin
          _next_state = S_298;
        end
      S_298 :
        begin
          _next_state = S_299;
        end
      S_299 :
        begin
          _next_state = S_300;
        end
      S_300 :
        begin
          _next_state = S_301;
        end
      S_301 :
        begin
          _next_state = S_302;
        end
      S_302 :
        begin
          _next_state = S_303;
        end
      S_303 :
        begin
          _next_state = S_304;
        end
      S_304 :
        begin
          fuselector_BMEMORY_CTRLN_165_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0 = 1'b1;
          if (OUT_CONDITION_cifar10_9853_11823 == 1'b1)
            begin
              _next_state = S_272;
            end
          else
            begin
              _next_state = S_317;
              done_port = 1'b1;
            end
        end
      S_317 :
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

// Top component for cifar10
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _cifar10(clock,
  reset,
  start_port,
  done_port,
  output_data,
  conv_1_output,
  pooling_1_output,
  conv_2_output,
  pooling_2_output,
  dense_layer_1_output,
  dense_layer_2_output,
  input_data,
  kernel_1_data,
  kernel_2_data,
  weights_1,
  weights_2,
  input_data_size,
  output_data_size,
  kernel_1_size,
  kernel_2_size,
  stride_1_size,
  stride_2_size,
  neurons_dense_1_size,
  neurons_dense_2_size,
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
  input [31:0] output_data;
  input [31:0] conv_1_output;
  input [31:0] pooling_1_output;
  input [31:0] conv_2_output;
  input [31:0] pooling_2_output;
  input [31:0] dense_layer_1_output;
  input [31:0] dense_layer_2_output;
  input [31:0] input_data;
  input [31:0] kernel_1_data;
  input [31:0] kernel_2_data;
  input [31:0] weights_1;
  input [31:0] weights_2;
  input [31:0] input_data_size;
  input [31:0] output_data_size;
  input [31:0] kernel_1_size;
  input [31:0] kernel_2_size;
  input [31:0] stride_1_size;
  input [31:0] stride_2_size;
  input [31:0] neurons_dense_1_size;
  input [31:0] neurons_dense_2_size;
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
  wire OUT_CONDITION_cifar10_9853_11058;
  wire OUT_CONDITION_cifar10_9853_11083;
  wire OUT_CONDITION_cifar10_9853_11120;
  wire OUT_CONDITION_cifar10_9853_11123;
  wire OUT_CONDITION_cifar10_9853_11139;
  wire OUT_CONDITION_cifar10_9853_11266;
  wire OUT_CONDITION_cifar10_9853_11272;
  wire OUT_CONDITION_cifar10_9853_11280;
  wire OUT_CONDITION_cifar10_9853_11282;
  wire OUT_CONDITION_cifar10_9853_11286;
  wire OUT_CONDITION_cifar10_9853_11302;
  wire OUT_CONDITION_cifar10_9853_11335;
  wire OUT_CONDITION_cifar10_9853_11338;
  wire OUT_CONDITION_cifar10_9853_11350;
  wire OUT_CONDITION_cifar10_9853_11455;
  wire OUT_CONDITION_cifar10_9853_11461;
  wire OUT_CONDITION_cifar10_9853_11468;
  wire OUT_CONDITION_cifar10_9853_11470;
  wire OUT_CONDITION_cifar10_9853_11474;
  wire OUT_CONDITION_cifar10_9853_11502;
  wire OUT_CONDITION_cifar10_9853_11612;
  wire OUT_CONDITION_cifar10_9853_11614;
  wire OUT_CONDITION_cifar10_9853_11625;
  wire OUT_CONDITION_cifar10_9853_11628;
  wire OUT_CONDITION_cifar10_9853_11633;
  wire OUT_CONDITION_cifar10_9853_11646;
  wire OUT_CONDITION_cifar10_9853_11700;
  wire OUT_CONDITION_cifar10_9853_11711;
  wire OUT_CONDITION_cifar10_9853_11717;
  wire OUT_CONDITION_cifar10_9853_11735;
  wire OUT_CONDITION_cifar10_9853_11819;
  wire OUT_CONDITION_cifar10_9853_11821;
  wire OUT_CONDITION_cifar10_9853_11823;
  wire OUT_UNBOUNDED_cifar10_9853_11057;
  wire OUT_UNBOUNDED_cifar10_9853_11178;
  wire OUT_UNBOUNDED_cifar10_9853_11184;
  wire OUT_UNBOUNDED_cifar10_9853_11194;
  wire OUT_UNBOUNDED_cifar10_9853_11218;
  wire OUT_UNBOUNDED_cifar10_9853_11285;
  wire OUT_UNBOUNDED_cifar10_9853_11363;
  wire OUT_UNBOUNDED_cifar10_9853_11381;
  wire OUT_UNBOUNDED_cifar10_9853_11387;
  wire OUT_UNBOUNDED_cifar10_9853_11396;
  wire OUT_UNBOUNDED_cifar10_9853_11477;
  wire OUT_UNBOUNDED_cifar10_9853_11484;
  wire OUT_UNBOUNDED_cifar10_9853_11494;
  wire OUT_mu_S_308_MULTI_UNBOUNDED_0;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_165_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_165_i0_STORE;
  wire fuselector_BMEMORY_CTRLN_165_i1_LOAD;
  wire fuselector_BMEMORY_CTRLN_165_i1_STORE;
  wire muenable_mu_S_308;
  wire selector_IN_UNBOUNDED_cifar10_9853_11057;
  wire selector_IN_UNBOUNDED_cifar10_9853_11178;
  wire selector_IN_UNBOUNDED_cifar10_9853_11184;
  wire selector_IN_UNBOUNDED_cifar10_9853_11194;
  wire selector_IN_UNBOUNDED_cifar10_9853_11218;
  wire selector_IN_UNBOUNDED_cifar10_9853_11285;
  wire selector_IN_UNBOUNDED_cifar10_9853_11363;
  wire selector_IN_UNBOUNDED_cifar10_9853_11381;
  wire selector_IN_UNBOUNDED_cifar10_9853_11387;
  wire selector_IN_UNBOUNDED_cifar10_9853_11396;
  wire selector_IN_UNBOUNDED_cifar10_9853_11477;
  wire selector_IN_UNBOUNDED_cifar10_9853_11484;
  wire selector_IN_UNBOUNDED_cifar10_9853_11494;
  wire selector_MUX_135_reg_10_0_0_0;
  wire selector_MUX_136_reg_100_0_0_0;
  wire selector_MUX_139_reg_103_0_0_0;
  wire selector_MUX_140_reg_104_0_0_0;
  wire selector_MUX_142_reg_106_0_0_0;
  wire selector_MUX_143_reg_107_0_0_0;
  wire selector_MUX_145_reg_109_0_0_0;
  wire selector_MUX_150_reg_113_0_0_0;
  wire selector_MUX_161_reg_2_0_0_0;
  wire selector_MUX_169_reg_27_0_0_0;
  wire selector_MUX_170_reg_28_0_0_0;
  wire selector_MUX_171_reg_29_0_0_0;
  wire selector_MUX_176_reg_33_0_0_0;
  wire selector_MUX_177_reg_34_0_0_0;
  wire selector_MUX_183_reg_4_0_0_0;
  wire selector_MUX_187_reg_43_0_0_0;
  wire selector_MUX_189_reg_45_0_0_0;
  wire selector_MUX_189_reg_45_0_0_1;
  wire selector_MUX_192_reg_48_0_0_0;
  wire selector_MUX_193_reg_49_0_0_0;
  wire selector_MUX_195_reg_50_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2;
  wire selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0;
  wire selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1;
  wire selector_MUX_200_reg_55_0_0_0;
  wire selector_MUX_202_reg_57_0_0_0;
  wire selector_MUX_203_reg_58_0_0_0;
  wire selector_MUX_204_reg_59_0_0_0;
  wire selector_MUX_205_reg_6_0_0_0;
  wire selector_MUX_207_reg_61_0_0_0;
  wire selector_MUX_209_reg_63_0_0_0;
  wire selector_MUX_213_reg_67_0_0_0;
  wire selector_MUX_215_reg_69_0_0_0;
  wire selector_MUX_215_reg_69_0_0_1;
  wire selector_MUX_216_reg_7_0_0_0;
  wire selector_MUX_219_reg_72_0_0_0;
  wire selector_MUX_220_reg_73_0_0_0;
  wire selector_MUX_221_reg_74_0_0_0;
  wire selector_MUX_225_reg_78_0_0_0;
  wire selector_MUX_228_reg_80_0_0_0;
  wire selector_MUX_233_reg_85_0_0_0;
  wire selector_MUX_235_reg_87_0_0_0;
  wire selector_MUX_238_reg_9_0_0_0;
  wire selector_MUX_239_reg_90_0_0_0;
  wire selector_MUX_242_reg_93_0_0_0;
  wire selector_MUX_243_reg_94_0_0_0;
  wire selector_MUX_244_reg_95_0_0_0;
  wire selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0;
  wire selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1;
  wire selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2;
  wire selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3;
  wire selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4;
  wire selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5;
  wire selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0;
  wire selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1;
  wire selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2;
  wire selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0;
  wire selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1;
  wire selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0;
  wire selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1;
  wire selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0;
  wire selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0;
  wire selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0;
  wire selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0;
  wire selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0;
  wire selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1;
  wire selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2;
  wire selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3;
  wire selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4;
  wire selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5;
  wire selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0;
  wire selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1;
  wire selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2;
  wire selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0;
  wire selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1;
  wire selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0;
  wire selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1;
  wire selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0;
  wire selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0;
  wire selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1;
  wire selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0;
  wire selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0;
  wire selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0;
  wire selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0;
  wire selector_MUX_75___udivsi3_192_i0_0_0_0;
  wire selector_MUX_75___udivsi3_192_i0_0_0_1;
  wire selector_MUX_75___udivsi3_192_i0_0_0_2;
  wire selector_MUX_75___udivsi3_192_i0_0_1_0;
  wire selector_MUX_75___udivsi3_192_i0_0_1_1;
  wire selector_MUX_76___udivsi3_192_i0_1_0_0;
  wire selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0;
  wire selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0;
  wire selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0;
  wire selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1;
  wire selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0;
  wire selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1;
  wire selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0;
  wire selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0;
  wire selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1;
  wire selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0;
  wire selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_100;
  wire wrenable_reg_101;
  wire wrenable_reg_102;
  wire wrenable_reg_103;
  wire wrenable_reg_104;
  wire wrenable_reg_105;
  wire wrenable_reg_106;
  wire wrenable_reg_107;
  wire wrenable_reg_108;
  wire wrenable_reg_109;
  wire wrenable_reg_11;
  wire wrenable_reg_110;
  wire wrenable_reg_111;
  wire wrenable_reg_112;
  wire wrenable_reg_113;
  wire wrenable_reg_114;
  wire wrenable_reg_115;
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
  wire wrenable_reg_49;
  wire wrenable_reg_5;
  wire wrenable_reg_50;
  wire wrenable_reg_51;
  wire wrenable_reg_52;
  wire wrenable_reg_53;
  wire wrenable_reg_54;
  wire wrenable_reg_55;
  wire wrenable_reg_56;
  wire wrenable_reg_57;
  wire wrenable_reg_58;
  wire wrenable_reg_59;
  wire wrenable_reg_6;
  wire wrenable_reg_60;
  wire wrenable_reg_61;
  wire wrenable_reg_62;
  wire wrenable_reg_63;
  wire wrenable_reg_64;
  wire wrenable_reg_65;
  wire wrenable_reg_66;
  wire wrenable_reg_67;
  wire wrenable_reg_68;
  wire wrenable_reg_69;
  wire wrenable_reg_7;
  wire wrenable_reg_70;
  wire wrenable_reg_71;
  wire wrenable_reg_72;
  wire wrenable_reg_73;
  wire wrenable_reg_74;
  wire wrenable_reg_75;
  wire wrenable_reg_76;
  wire wrenable_reg_77;
  wire wrenable_reg_78;
  wire wrenable_reg_79;
  wire wrenable_reg_8;
  wire wrenable_reg_80;
  wire wrenable_reg_81;
  wire wrenable_reg_82;
  wire wrenable_reg_83;
  wire wrenable_reg_84;
  wire wrenable_reg_85;
  wire wrenable_reg_86;
  wire wrenable_reg_87;
  wire wrenable_reg_88;
  wire wrenable_reg_89;
  wire wrenable_reg_9;
  wire wrenable_reg_90;
  wire wrenable_reg_91;
  wire wrenable_reg_92;
  wire wrenable_reg_93;
  wire wrenable_reg_94;
  wire wrenable_reg_95;
  wire wrenable_reg_96;
  wire wrenable_reg_97;
  wire wrenable_reg_98;
  wire wrenable_reg_99;
  
  controller_cifar10 Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_165_i0_LOAD(fuselector_BMEMORY_CTRLN_165_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_165_i0_STORE(fuselector_BMEMORY_CTRLN_165_i0_STORE),
    .fuselector_BMEMORY_CTRLN_165_i1_LOAD(fuselector_BMEMORY_CTRLN_165_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_165_i1_STORE(fuselector_BMEMORY_CTRLN_165_i1_STORE),
    .selector_IN_UNBOUNDED_cifar10_9853_11057(selector_IN_UNBOUNDED_cifar10_9853_11057),
    .selector_IN_UNBOUNDED_cifar10_9853_11178(selector_IN_UNBOUNDED_cifar10_9853_11178),
    .selector_IN_UNBOUNDED_cifar10_9853_11184(selector_IN_UNBOUNDED_cifar10_9853_11184),
    .selector_IN_UNBOUNDED_cifar10_9853_11194(selector_IN_UNBOUNDED_cifar10_9853_11194),
    .selector_IN_UNBOUNDED_cifar10_9853_11218(selector_IN_UNBOUNDED_cifar10_9853_11218),
    .selector_IN_UNBOUNDED_cifar10_9853_11285(selector_IN_UNBOUNDED_cifar10_9853_11285),
    .selector_IN_UNBOUNDED_cifar10_9853_11363(selector_IN_UNBOUNDED_cifar10_9853_11363),
    .selector_IN_UNBOUNDED_cifar10_9853_11381(selector_IN_UNBOUNDED_cifar10_9853_11381),
    .selector_IN_UNBOUNDED_cifar10_9853_11387(selector_IN_UNBOUNDED_cifar10_9853_11387),
    .selector_IN_UNBOUNDED_cifar10_9853_11396(selector_IN_UNBOUNDED_cifar10_9853_11396),
    .selector_IN_UNBOUNDED_cifar10_9853_11477(selector_IN_UNBOUNDED_cifar10_9853_11477),
    .selector_IN_UNBOUNDED_cifar10_9853_11484(selector_IN_UNBOUNDED_cifar10_9853_11484),
    .selector_IN_UNBOUNDED_cifar10_9853_11494(selector_IN_UNBOUNDED_cifar10_9853_11494),
    .selector_MUX_135_reg_10_0_0_0(selector_MUX_135_reg_10_0_0_0),
    .selector_MUX_136_reg_100_0_0_0(selector_MUX_136_reg_100_0_0_0),
    .selector_MUX_139_reg_103_0_0_0(selector_MUX_139_reg_103_0_0_0),
    .selector_MUX_140_reg_104_0_0_0(selector_MUX_140_reg_104_0_0_0),
    .selector_MUX_142_reg_106_0_0_0(selector_MUX_142_reg_106_0_0_0),
    .selector_MUX_143_reg_107_0_0_0(selector_MUX_143_reg_107_0_0_0),
    .selector_MUX_145_reg_109_0_0_0(selector_MUX_145_reg_109_0_0_0),
    .selector_MUX_150_reg_113_0_0_0(selector_MUX_150_reg_113_0_0_0),
    .selector_MUX_161_reg_2_0_0_0(selector_MUX_161_reg_2_0_0_0),
    .selector_MUX_169_reg_27_0_0_0(selector_MUX_169_reg_27_0_0_0),
    .selector_MUX_170_reg_28_0_0_0(selector_MUX_170_reg_28_0_0_0),
    .selector_MUX_171_reg_29_0_0_0(selector_MUX_171_reg_29_0_0_0),
    .selector_MUX_176_reg_33_0_0_0(selector_MUX_176_reg_33_0_0_0),
    .selector_MUX_177_reg_34_0_0_0(selector_MUX_177_reg_34_0_0_0),
    .selector_MUX_183_reg_4_0_0_0(selector_MUX_183_reg_4_0_0_0),
    .selector_MUX_187_reg_43_0_0_0(selector_MUX_187_reg_43_0_0_0),
    .selector_MUX_189_reg_45_0_0_0(selector_MUX_189_reg_45_0_0_0),
    .selector_MUX_189_reg_45_0_0_1(selector_MUX_189_reg_45_0_0_1),
    .selector_MUX_192_reg_48_0_0_0(selector_MUX_192_reg_48_0_0_0),
    .selector_MUX_193_reg_49_0_0_0(selector_MUX_193_reg_49_0_0_0),
    .selector_MUX_195_reg_50_0_0_0(selector_MUX_195_reg_50_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0),
    .selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1),
    .selector_MUX_200_reg_55_0_0_0(selector_MUX_200_reg_55_0_0_0),
    .selector_MUX_202_reg_57_0_0_0(selector_MUX_202_reg_57_0_0_0),
    .selector_MUX_203_reg_58_0_0_0(selector_MUX_203_reg_58_0_0_0),
    .selector_MUX_204_reg_59_0_0_0(selector_MUX_204_reg_59_0_0_0),
    .selector_MUX_205_reg_6_0_0_0(selector_MUX_205_reg_6_0_0_0),
    .selector_MUX_207_reg_61_0_0_0(selector_MUX_207_reg_61_0_0_0),
    .selector_MUX_209_reg_63_0_0_0(selector_MUX_209_reg_63_0_0_0),
    .selector_MUX_213_reg_67_0_0_0(selector_MUX_213_reg_67_0_0_0),
    .selector_MUX_215_reg_69_0_0_0(selector_MUX_215_reg_69_0_0_0),
    .selector_MUX_215_reg_69_0_0_1(selector_MUX_215_reg_69_0_0_1),
    .selector_MUX_216_reg_7_0_0_0(selector_MUX_216_reg_7_0_0_0),
    .selector_MUX_219_reg_72_0_0_0(selector_MUX_219_reg_72_0_0_0),
    .selector_MUX_220_reg_73_0_0_0(selector_MUX_220_reg_73_0_0_0),
    .selector_MUX_221_reg_74_0_0_0(selector_MUX_221_reg_74_0_0_0),
    .selector_MUX_225_reg_78_0_0_0(selector_MUX_225_reg_78_0_0_0),
    .selector_MUX_228_reg_80_0_0_0(selector_MUX_228_reg_80_0_0_0),
    .selector_MUX_233_reg_85_0_0_0(selector_MUX_233_reg_85_0_0_0),
    .selector_MUX_235_reg_87_0_0_0(selector_MUX_235_reg_87_0_0_0),
    .selector_MUX_238_reg_9_0_0_0(selector_MUX_238_reg_9_0_0_0),
    .selector_MUX_239_reg_90_0_0_0(selector_MUX_239_reg_90_0_0_0),
    .selector_MUX_242_reg_93_0_0_0(selector_MUX_242_reg_93_0_0_0),
    .selector_MUX_243_reg_94_0_0_0(selector_MUX_243_reg_94_0_0_0),
    .selector_MUX_244_reg_95_0_0_0(selector_MUX_244_reg_95_0_0_0),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1),
    .selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0(selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0),
    .selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1(selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1),
    .selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0(selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0),
    .selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0(selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0),
    .selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0(selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0),
    .selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0(selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1),
    .selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0(selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0),
    .selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1(selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1),
    .selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0(selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0),
    .selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0(selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0),
    .selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1(selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1),
    .selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0(selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0),
    .selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0(selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0),
    .selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0(selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0),
    .selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0(selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0),
    .selector_MUX_75___udivsi3_192_i0_0_0_0(selector_MUX_75___udivsi3_192_i0_0_0_0),
    .selector_MUX_75___udivsi3_192_i0_0_0_1(selector_MUX_75___udivsi3_192_i0_0_0_1),
    .selector_MUX_75___udivsi3_192_i0_0_0_2(selector_MUX_75___udivsi3_192_i0_0_0_2),
    .selector_MUX_75___udivsi3_192_i0_0_1_0(selector_MUX_75___udivsi3_192_i0_0_1_0),
    .selector_MUX_75___udivsi3_192_i0_0_1_1(selector_MUX_75___udivsi3_192_i0_0_1_1),
    .selector_MUX_76___udivsi3_192_i0_1_0_0(selector_MUX_76___udivsi3_192_i0_1_0_0),
    .selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0(selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0),
    .selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0(selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0),
    .selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0(selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0),
    .selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1(selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1),
    .selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0(selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0),
    .selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1(selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1),
    .selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0(selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0),
    .selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0(selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0),
    .selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1(selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1),
    .selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0(selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0),
    .selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0(selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0),
    .muenable_mu_S_308(muenable_mu_S_308),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_100(wrenable_reg_100),
    .wrenable_reg_101(wrenable_reg_101),
    .wrenable_reg_102(wrenable_reg_102),
    .wrenable_reg_103(wrenable_reg_103),
    .wrenable_reg_104(wrenable_reg_104),
    .wrenable_reg_105(wrenable_reg_105),
    .wrenable_reg_106(wrenable_reg_106),
    .wrenable_reg_107(wrenable_reg_107),
    .wrenable_reg_108(wrenable_reg_108),
    .wrenable_reg_109(wrenable_reg_109),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_110(wrenable_reg_110),
    .wrenable_reg_111(wrenable_reg_111),
    .wrenable_reg_112(wrenable_reg_112),
    .wrenable_reg_113(wrenable_reg_113),
    .wrenable_reg_114(wrenable_reg_114),
    .wrenable_reg_115(wrenable_reg_115),
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
    .wrenable_reg_49(wrenable_reg_49),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_50(wrenable_reg_50),
    .wrenable_reg_51(wrenable_reg_51),
    .wrenable_reg_52(wrenable_reg_52),
    .wrenable_reg_53(wrenable_reg_53),
    .wrenable_reg_54(wrenable_reg_54),
    .wrenable_reg_55(wrenable_reg_55),
    .wrenable_reg_56(wrenable_reg_56),
    .wrenable_reg_57(wrenable_reg_57),
    .wrenable_reg_58(wrenable_reg_58),
    .wrenable_reg_59(wrenable_reg_59),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_60(wrenable_reg_60),
    .wrenable_reg_61(wrenable_reg_61),
    .wrenable_reg_62(wrenable_reg_62),
    .wrenable_reg_63(wrenable_reg_63),
    .wrenable_reg_64(wrenable_reg_64),
    .wrenable_reg_65(wrenable_reg_65),
    .wrenable_reg_66(wrenable_reg_66),
    .wrenable_reg_67(wrenable_reg_67),
    .wrenable_reg_68(wrenable_reg_68),
    .wrenable_reg_69(wrenable_reg_69),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_70(wrenable_reg_70),
    .wrenable_reg_71(wrenable_reg_71),
    .wrenable_reg_72(wrenable_reg_72),
    .wrenable_reg_73(wrenable_reg_73),
    .wrenable_reg_74(wrenable_reg_74),
    .wrenable_reg_75(wrenable_reg_75),
    .wrenable_reg_76(wrenable_reg_76),
    .wrenable_reg_77(wrenable_reg_77),
    .wrenable_reg_78(wrenable_reg_78),
    .wrenable_reg_79(wrenable_reg_79),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_80(wrenable_reg_80),
    .wrenable_reg_81(wrenable_reg_81),
    .wrenable_reg_82(wrenable_reg_82),
    .wrenable_reg_83(wrenable_reg_83),
    .wrenable_reg_84(wrenable_reg_84),
    .wrenable_reg_85(wrenable_reg_85),
    .wrenable_reg_86(wrenable_reg_86),
    .wrenable_reg_87(wrenable_reg_87),
    .wrenable_reg_88(wrenable_reg_88),
    .wrenable_reg_89(wrenable_reg_89),
    .wrenable_reg_9(wrenable_reg_9),
    .wrenable_reg_90(wrenable_reg_90),
    .wrenable_reg_91(wrenable_reg_91),
    .wrenable_reg_92(wrenable_reg_92),
    .wrenable_reg_93(wrenable_reg_93),
    .wrenable_reg_94(wrenable_reg_94),
    .wrenable_reg_95(wrenable_reg_95),
    .wrenable_reg_96(wrenable_reg_96),
    .wrenable_reg_97(wrenable_reg_97),
    .wrenable_reg_98(wrenable_reg_98),
    .wrenable_reg_99(wrenable_reg_99),
    .OUT_CONDITION_cifar10_9853_11058(OUT_CONDITION_cifar10_9853_11058),
    .OUT_CONDITION_cifar10_9853_11083(OUT_CONDITION_cifar10_9853_11083),
    .OUT_CONDITION_cifar10_9853_11120(OUT_CONDITION_cifar10_9853_11120),
    .OUT_CONDITION_cifar10_9853_11123(OUT_CONDITION_cifar10_9853_11123),
    .OUT_CONDITION_cifar10_9853_11139(OUT_CONDITION_cifar10_9853_11139),
    .OUT_CONDITION_cifar10_9853_11266(OUT_CONDITION_cifar10_9853_11266),
    .OUT_CONDITION_cifar10_9853_11272(OUT_CONDITION_cifar10_9853_11272),
    .OUT_CONDITION_cifar10_9853_11280(OUT_CONDITION_cifar10_9853_11280),
    .OUT_CONDITION_cifar10_9853_11282(OUT_CONDITION_cifar10_9853_11282),
    .OUT_CONDITION_cifar10_9853_11286(OUT_CONDITION_cifar10_9853_11286),
    .OUT_CONDITION_cifar10_9853_11302(OUT_CONDITION_cifar10_9853_11302),
    .OUT_CONDITION_cifar10_9853_11335(OUT_CONDITION_cifar10_9853_11335),
    .OUT_CONDITION_cifar10_9853_11338(OUT_CONDITION_cifar10_9853_11338),
    .OUT_CONDITION_cifar10_9853_11350(OUT_CONDITION_cifar10_9853_11350),
    .OUT_CONDITION_cifar10_9853_11455(OUT_CONDITION_cifar10_9853_11455),
    .OUT_CONDITION_cifar10_9853_11461(OUT_CONDITION_cifar10_9853_11461),
    .OUT_CONDITION_cifar10_9853_11468(OUT_CONDITION_cifar10_9853_11468),
    .OUT_CONDITION_cifar10_9853_11470(OUT_CONDITION_cifar10_9853_11470),
    .OUT_CONDITION_cifar10_9853_11474(OUT_CONDITION_cifar10_9853_11474),
    .OUT_CONDITION_cifar10_9853_11502(OUT_CONDITION_cifar10_9853_11502),
    .OUT_CONDITION_cifar10_9853_11612(OUT_CONDITION_cifar10_9853_11612),
    .OUT_CONDITION_cifar10_9853_11614(OUT_CONDITION_cifar10_9853_11614),
    .OUT_CONDITION_cifar10_9853_11625(OUT_CONDITION_cifar10_9853_11625),
    .OUT_CONDITION_cifar10_9853_11628(OUT_CONDITION_cifar10_9853_11628),
    .OUT_CONDITION_cifar10_9853_11633(OUT_CONDITION_cifar10_9853_11633),
    .OUT_CONDITION_cifar10_9853_11646(OUT_CONDITION_cifar10_9853_11646),
    .OUT_CONDITION_cifar10_9853_11700(OUT_CONDITION_cifar10_9853_11700),
    .OUT_CONDITION_cifar10_9853_11711(OUT_CONDITION_cifar10_9853_11711),
    .OUT_CONDITION_cifar10_9853_11717(OUT_CONDITION_cifar10_9853_11717),
    .OUT_CONDITION_cifar10_9853_11735(OUT_CONDITION_cifar10_9853_11735),
    .OUT_CONDITION_cifar10_9853_11819(OUT_CONDITION_cifar10_9853_11819),
    .OUT_CONDITION_cifar10_9853_11821(OUT_CONDITION_cifar10_9853_11821),
    .OUT_CONDITION_cifar10_9853_11823(OUT_CONDITION_cifar10_9853_11823),
    .OUT_UNBOUNDED_cifar10_9853_11057(OUT_UNBOUNDED_cifar10_9853_11057),
    .OUT_UNBOUNDED_cifar10_9853_11178(OUT_UNBOUNDED_cifar10_9853_11178),
    .OUT_UNBOUNDED_cifar10_9853_11184(OUT_UNBOUNDED_cifar10_9853_11184),
    .OUT_UNBOUNDED_cifar10_9853_11194(OUT_UNBOUNDED_cifar10_9853_11194),
    .OUT_UNBOUNDED_cifar10_9853_11218(OUT_UNBOUNDED_cifar10_9853_11218),
    .OUT_UNBOUNDED_cifar10_9853_11285(OUT_UNBOUNDED_cifar10_9853_11285),
    .OUT_UNBOUNDED_cifar10_9853_11363(OUT_UNBOUNDED_cifar10_9853_11363),
    .OUT_UNBOUNDED_cifar10_9853_11381(OUT_UNBOUNDED_cifar10_9853_11381),
    .OUT_UNBOUNDED_cifar10_9853_11387(OUT_UNBOUNDED_cifar10_9853_11387),
    .OUT_UNBOUNDED_cifar10_9853_11396(OUT_UNBOUNDED_cifar10_9853_11396),
    .OUT_UNBOUNDED_cifar10_9853_11477(OUT_UNBOUNDED_cifar10_9853_11477),
    .OUT_UNBOUNDED_cifar10_9853_11484(OUT_UNBOUNDED_cifar10_9853_11484),
    .OUT_UNBOUNDED_cifar10_9853_11494(OUT_UNBOUNDED_cifar10_9853_11494),
    .OUT_mu_S_308_MULTI_UNBOUNDED_0(OUT_mu_S_308_MULTI_UNBOUNDED_0),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_cifar10 Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_cifar10_9853_11058(OUT_CONDITION_cifar10_9853_11058),
    .OUT_CONDITION_cifar10_9853_11083(OUT_CONDITION_cifar10_9853_11083),
    .OUT_CONDITION_cifar10_9853_11120(OUT_CONDITION_cifar10_9853_11120),
    .OUT_CONDITION_cifar10_9853_11123(OUT_CONDITION_cifar10_9853_11123),
    .OUT_CONDITION_cifar10_9853_11139(OUT_CONDITION_cifar10_9853_11139),
    .OUT_CONDITION_cifar10_9853_11266(OUT_CONDITION_cifar10_9853_11266),
    .OUT_CONDITION_cifar10_9853_11272(OUT_CONDITION_cifar10_9853_11272),
    .OUT_CONDITION_cifar10_9853_11280(OUT_CONDITION_cifar10_9853_11280),
    .OUT_CONDITION_cifar10_9853_11282(OUT_CONDITION_cifar10_9853_11282),
    .OUT_CONDITION_cifar10_9853_11286(OUT_CONDITION_cifar10_9853_11286),
    .OUT_CONDITION_cifar10_9853_11302(OUT_CONDITION_cifar10_9853_11302),
    .OUT_CONDITION_cifar10_9853_11335(OUT_CONDITION_cifar10_9853_11335),
    .OUT_CONDITION_cifar10_9853_11338(OUT_CONDITION_cifar10_9853_11338),
    .OUT_CONDITION_cifar10_9853_11350(OUT_CONDITION_cifar10_9853_11350),
    .OUT_CONDITION_cifar10_9853_11455(OUT_CONDITION_cifar10_9853_11455),
    .OUT_CONDITION_cifar10_9853_11461(OUT_CONDITION_cifar10_9853_11461),
    .OUT_CONDITION_cifar10_9853_11468(OUT_CONDITION_cifar10_9853_11468),
    .OUT_CONDITION_cifar10_9853_11470(OUT_CONDITION_cifar10_9853_11470),
    .OUT_CONDITION_cifar10_9853_11474(OUT_CONDITION_cifar10_9853_11474),
    .OUT_CONDITION_cifar10_9853_11502(OUT_CONDITION_cifar10_9853_11502),
    .OUT_CONDITION_cifar10_9853_11612(OUT_CONDITION_cifar10_9853_11612),
    .OUT_CONDITION_cifar10_9853_11614(OUT_CONDITION_cifar10_9853_11614),
    .OUT_CONDITION_cifar10_9853_11625(OUT_CONDITION_cifar10_9853_11625),
    .OUT_CONDITION_cifar10_9853_11628(OUT_CONDITION_cifar10_9853_11628),
    .OUT_CONDITION_cifar10_9853_11633(OUT_CONDITION_cifar10_9853_11633),
    .OUT_CONDITION_cifar10_9853_11646(OUT_CONDITION_cifar10_9853_11646),
    .OUT_CONDITION_cifar10_9853_11700(OUT_CONDITION_cifar10_9853_11700),
    .OUT_CONDITION_cifar10_9853_11711(OUT_CONDITION_cifar10_9853_11711),
    .OUT_CONDITION_cifar10_9853_11717(OUT_CONDITION_cifar10_9853_11717),
    .OUT_CONDITION_cifar10_9853_11735(OUT_CONDITION_cifar10_9853_11735),
    .OUT_CONDITION_cifar10_9853_11819(OUT_CONDITION_cifar10_9853_11819),
    .OUT_CONDITION_cifar10_9853_11821(OUT_CONDITION_cifar10_9853_11821),
    .OUT_CONDITION_cifar10_9853_11823(OUT_CONDITION_cifar10_9853_11823),
    .OUT_UNBOUNDED_cifar10_9853_11057(OUT_UNBOUNDED_cifar10_9853_11057),
    .OUT_UNBOUNDED_cifar10_9853_11178(OUT_UNBOUNDED_cifar10_9853_11178),
    .OUT_UNBOUNDED_cifar10_9853_11184(OUT_UNBOUNDED_cifar10_9853_11184),
    .OUT_UNBOUNDED_cifar10_9853_11194(OUT_UNBOUNDED_cifar10_9853_11194),
    .OUT_UNBOUNDED_cifar10_9853_11218(OUT_UNBOUNDED_cifar10_9853_11218),
    .OUT_UNBOUNDED_cifar10_9853_11285(OUT_UNBOUNDED_cifar10_9853_11285),
    .OUT_UNBOUNDED_cifar10_9853_11363(OUT_UNBOUNDED_cifar10_9853_11363),
    .OUT_UNBOUNDED_cifar10_9853_11381(OUT_UNBOUNDED_cifar10_9853_11381),
    .OUT_UNBOUNDED_cifar10_9853_11387(OUT_UNBOUNDED_cifar10_9853_11387),
    .OUT_UNBOUNDED_cifar10_9853_11396(OUT_UNBOUNDED_cifar10_9853_11396),
    .OUT_UNBOUNDED_cifar10_9853_11477(OUT_UNBOUNDED_cifar10_9853_11477),
    .OUT_UNBOUNDED_cifar10_9853_11484(OUT_UNBOUNDED_cifar10_9853_11484),
    .OUT_UNBOUNDED_cifar10_9853_11494(OUT_UNBOUNDED_cifar10_9853_11494),
    .OUT_mu_S_308_MULTI_UNBOUNDED_0(OUT_mu_S_308_MULTI_UNBOUNDED_0),
    .clock(clock),
    .reset(reset),
    .in_port_output_data(output_data),
    .in_port_conv_1_output(conv_1_output),
    .in_port_pooling_1_output(pooling_1_output),
    .in_port_conv_2_output(conv_2_output),
    .in_port_pooling_2_output(pooling_2_output),
    .in_port_dense_layer_1_output(dense_layer_1_output),
    .in_port_dense_layer_2_output(dense_layer_2_output),
    .in_port_input_data(input_data),
    .in_port_kernel_1_data(kernel_1_data),
    .in_port_kernel_2_data(kernel_2_data),
    .in_port_weights_1(weights_1),
    .in_port_weights_2(weights_2),
    .in_port_input_data_size(input_data_size),
    .in_port_output_data_size(output_data_size),
    .in_port_kernel_1_size(kernel_1_size),
    .in_port_kernel_2_size(kernel_2_size),
    .in_port_stride_1_size(stride_1_size),
    .in_port_stride_2_size(stride_2_size),
    .in_port_neurons_dense_1_size(neurons_dense_1_size),
    .in_port_neurons_dense_2_size(neurons_dense_2_size),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_165_i0_LOAD(fuselector_BMEMORY_CTRLN_165_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_165_i0_STORE(fuselector_BMEMORY_CTRLN_165_i0_STORE),
    .fuselector_BMEMORY_CTRLN_165_i1_LOAD(fuselector_BMEMORY_CTRLN_165_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_165_i1_STORE(fuselector_BMEMORY_CTRLN_165_i1_STORE),
    .selector_IN_UNBOUNDED_cifar10_9853_11057(selector_IN_UNBOUNDED_cifar10_9853_11057),
    .selector_IN_UNBOUNDED_cifar10_9853_11178(selector_IN_UNBOUNDED_cifar10_9853_11178),
    .selector_IN_UNBOUNDED_cifar10_9853_11184(selector_IN_UNBOUNDED_cifar10_9853_11184),
    .selector_IN_UNBOUNDED_cifar10_9853_11194(selector_IN_UNBOUNDED_cifar10_9853_11194),
    .selector_IN_UNBOUNDED_cifar10_9853_11218(selector_IN_UNBOUNDED_cifar10_9853_11218),
    .selector_IN_UNBOUNDED_cifar10_9853_11285(selector_IN_UNBOUNDED_cifar10_9853_11285),
    .selector_IN_UNBOUNDED_cifar10_9853_11363(selector_IN_UNBOUNDED_cifar10_9853_11363),
    .selector_IN_UNBOUNDED_cifar10_9853_11381(selector_IN_UNBOUNDED_cifar10_9853_11381),
    .selector_IN_UNBOUNDED_cifar10_9853_11387(selector_IN_UNBOUNDED_cifar10_9853_11387),
    .selector_IN_UNBOUNDED_cifar10_9853_11396(selector_IN_UNBOUNDED_cifar10_9853_11396),
    .selector_IN_UNBOUNDED_cifar10_9853_11477(selector_IN_UNBOUNDED_cifar10_9853_11477),
    .selector_IN_UNBOUNDED_cifar10_9853_11484(selector_IN_UNBOUNDED_cifar10_9853_11484),
    .selector_IN_UNBOUNDED_cifar10_9853_11494(selector_IN_UNBOUNDED_cifar10_9853_11494),
    .selector_MUX_135_reg_10_0_0_0(selector_MUX_135_reg_10_0_0_0),
    .selector_MUX_136_reg_100_0_0_0(selector_MUX_136_reg_100_0_0_0),
    .selector_MUX_139_reg_103_0_0_0(selector_MUX_139_reg_103_0_0_0),
    .selector_MUX_140_reg_104_0_0_0(selector_MUX_140_reg_104_0_0_0),
    .selector_MUX_142_reg_106_0_0_0(selector_MUX_142_reg_106_0_0_0),
    .selector_MUX_143_reg_107_0_0_0(selector_MUX_143_reg_107_0_0_0),
    .selector_MUX_145_reg_109_0_0_0(selector_MUX_145_reg_109_0_0_0),
    .selector_MUX_150_reg_113_0_0_0(selector_MUX_150_reg_113_0_0_0),
    .selector_MUX_161_reg_2_0_0_0(selector_MUX_161_reg_2_0_0_0),
    .selector_MUX_169_reg_27_0_0_0(selector_MUX_169_reg_27_0_0_0),
    .selector_MUX_170_reg_28_0_0_0(selector_MUX_170_reg_28_0_0_0),
    .selector_MUX_171_reg_29_0_0_0(selector_MUX_171_reg_29_0_0_0),
    .selector_MUX_176_reg_33_0_0_0(selector_MUX_176_reg_33_0_0_0),
    .selector_MUX_177_reg_34_0_0_0(selector_MUX_177_reg_34_0_0_0),
    .selector_MUX_183_reg_4_0_0_0(selector_MUX_183_reg_4_0_0_0),
    .selector_MUX_187_reg_43_0_0_0(selector_MUX_187_reg_43_0_0_0),
    .selector_MUX_189_reg_45_0_0_0(selector_MUX_189_reg_45_0_0_0),
    .selector_MUX_189_reg_45_0_0_1(selector_MUX_189_reg_45_0_0_1),
    .selector_MUX_192_reg_48_0_0_0(selector_MUX_192_reg_48_0_0_0),
    .selector_MUX_193_reg_49_0_0_0(selector_MUX_193_reg_49_0_0_0),
    .selector_MUX_195_reg_50_0_0_0(selector_MUX_195_reg_50_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_0),
    .selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1(selector_MUX_1_BMEMORY_CTRLN_165_i0_0_1_1),
    .selector_MUX_200_reg_55_0_0_0(selector_MUX_200_reg_55_0_0_0),
    .selector_MUX_202_reg_57_0_0_0(selector_MUX_202_reg_57_0_0_0),
    .selector_MUX_203_reg_58_0_0_0(selector_MUX_203_reg_58_0_0_0),
    .selector_MUX_204_reg_59_0_0_0(selector_MUX_204_reg_59_0_0_0),
    .selector_MUX_205_reg_6_0_0_0(selector_MUX_205_reg_6_0_0_0),
    .selector_MUX_207_reg_61_0_0_0(selector_MUX_207_reg_61_0_0_0),
    .selector_MUX_209_reg_63_0_0_0(selector_MUX_209_reg_63_0_0_0),
    .selector_MUX_213_reg_67_0_0_0(selector_MUX_213_reg_67_0_0_0),
    .selector_MUX_215_reg_69_0_0_0(selector_MUX_215_reg_69_0_0_0),
    .selector_MUX_215_reg_69_0_0_1(selector_MUX_215_reg_69_0_0_1),
    .selector_MUX_216_reg_7_0_0_0(selector_MUX_216_reg_7_0_0_0),
    .selector_MUX_219_reg_72_0_0_0(selector_MUX_219_reg_72_0_0_0),
    .selector_MUX_220_reg_73_0_0_0(selector_MUX_220_reg_73_0_0_0),
    .selector_MUX_221_reg_74_0_0_0(selector_MUX_221_reg_74_0_0_0),
    .selector_MUX_225_reg_78_0_0_0(selector_MUX_225_reg_78_0_0_0),
    .selector_MUX_228_reg_80_0_0_0(selector_MUX_228_reg_80_0_0_0),
    .selector_MUX_233_reg_85_0_0_0(selector_MUX_233_reg_85_0_0_0),
    .selector_MUX_235_reg_87_0_0_0(selector_MUX_235_reg_87_0_0_0),
    .selector_MUX_238_reg_9_0_0_0(selector_MUX_238_reg_9_0_0_0),
    .selector_MUX_239_reg_90_0_0_0(selector_MUX_239_reg_90_0_0_0),
    .selector_MUX_242_reg_93_0_0_0(selector_MUX_242_reg_93_0_0_0),
    .selector_MUX_243_reg_94_0_0_0(selector_MUX_243_reg_94_0_0_0),
    .selector_MUX_244_reg_95_0_0_0(selector_MUX_244_reg_95_0_0_0),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_0),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_1),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_2),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_3),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_4),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_0_5),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_0),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_1),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_1_2),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_0),
    .selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1(selector_MUX_2_BMEMORY_CTRLN_165_i0_1_2_1),
    .selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0(selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_0),
    .selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1(selector_MUX_5_BMEMORY_CTRLN_165_i1_0_0_1),
    .selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0(selector_MUX_5_BMEMORY_CTRLN_165_i1_0_1_0),
    .selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0(selector_MUX_67__Z11convolutionPKdPdS0_iiii_190_i0_0_0_0),
    .selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0(selector_MUX_68__Z11convolutionPKdPdS0_iiii_190_i0_1_0_0),
    .selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0(selector_MUX_69__Z11convolutionPKdPdS0_iiii_190_i0_2_0_0),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_0),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_1),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_2),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_3),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_4),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_0_5),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_0),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_1),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_1_2),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_0),
    .selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1(selector_MUX_6_BMEMORY_CTRLN_165_i1_1_2_1),
    .selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0(selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_0),
    .selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1(selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_0_1),
    .selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0(selector_MUX_70__Z11convolutionPKdPdS0_iiii_190_i0_3_1_0),
    .selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0(selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_0),
    .selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1(selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_0_1),
    .selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0(selector_MUX_71__Z11convolutionPKdPdS0_iiii_190_i0_4_1_0),
    .selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0(selector_MUX_72__Z3lrnPKdPdi_191_i0_0_0_0),
    .selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0(selector_MUX_73__Z3lrnPKdPdi_191_i0_1_0_0),
    .selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0(selector_MUX_74__Z3lrnPKdPdi_191_i0_2_0_0),
    .selector_MUX_75___udivsi3_192_i0_0_0_0(selector_MUX_75___udivsi3_192_i0_0_0_0),
    .selector_MUX_75___udivsi3_192_i0_0_0_1(selector_MUX_75___udivsi3_192_i0_0_0_1),
    .selector_MUX_75___udivsi3_192_i0_0_0_2(selector_MUX_75___udivsi3_192_i0_0_0_2),
    .selector_MUX_75___udivsi3_192_i0_0_1_0(selector_MUX_75___udivsi3_192_i0_0_1_0),
    .selector_MUX_75___udivsi3_192_i0_0_1_1(selector_MUX_75___udivsi3_192_i0_0_1_1),
    .selector_MUX_76___udivsi3_192_i0_1_0_0(selector_MUX_76___udivsi3_192_i0_1_0_0),
    .selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0(selector_MUX_84_fp_gt_expr_FU_64_64_64_500_168_i0_0_0_0),
    .selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0(selector_MUX_87_fp_lt_expr_FU_64_64_64_500_169_i0_1_0_0),
    .selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0(selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_0),
    .selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1(selector_MUX_88_fp_mult_expr_FU_64_64_64_500_170_i0_0_0_1),
    .selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0(selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_0),
    .selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1(selector_MUX_89_fp_mult_expr_FU_64_64_64_500_170_i0_1_0_1),
    .selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0(selector_MUX_90_fp_plus_expr_FU_64_64_64_500_171_i0_0_0_0),
    .selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0(selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_0),
    .selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1(selector_MUX_91_fp_plus_expr_FU_64_64_64_500_171_i0_1_0_1),
    .selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0(selector_MUX_92_fp_rdiv_expr_FU_64_64_64_400_172_i0_0_0_0),
    .selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0(selector_MUX_93_fp_rdiv_expr_FU_64_64_64_400_172_i0_1_0_0),
    .muenable_mu_S_308(muenable_mu_S_308),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_100(wrenable_reg_100),
    .wrenable_reg_101(wrenable_reg_101),
    .wrenable_reg_102(wrenable_reg_102),
    .wrenable_reg_103(wrenable_reg_103),
    .wrenable_reg_104(wrenable_reg_104),
    .wrenable_reg_105(wrenable_reg_105),
    .wrenable_reg_106(wrenable_reg_106),
    .wrenable_reg_107(wrenable_reg_107),
    .wrenable_reg_108(wrenable_reg_108),
    .wrenable_reg_109(wrenable_reg_109),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_110(wrenable_reg_110),
    .wrenable_reg_111(wrenable_reg_111),
    .wrenable_reg_112(wrenable_reg_112),
    .wrenable_reg_113(wrenable_reg_113),
    .wrenable_reg_114(wrenable_reg_114),
    .wrenable_reg_115(wrenable_reg_115),
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
    .wrenable_reg_49(wrenable_reg_49),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_50(wrenable_reg_50),
    .wrenable_reg_51(wrenable_reg_51),
    .wrenable_reg_52(wrenable_reg_52),
    .wrenable_reg_53(wrenable_reg_53),
    .wrenable_reg_54(wrenable_reg_54),
    .wrenable_reg_55(wrenable_reg_55),
    .wrenable_reg_56(wrenable_reg_56),
    .wrenable_reg_57(wrenable_reg_57),
    .wrenable_reg_58(wrenable_reg_58),
    .wrenable_reg_59(wrenable_reg_59),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_60(wrenable_reg_60),
    .wrenable_reg_61(wrenable_reg_61),
    .wrenable_reg_62(wrenable_reg_62),
    .wrenable_reg_63(wrenable_reg_63),
    .wrenable_reg_64(wrenable_reg_64),
    .wrenable_reg_65(wrenable_reg_65),
    .wrenable_reg_66(wrenable_reg_66),
    .wrenable_reg_67(wrenable_reg_67),
    .wrenable_reg_68(wrenable_reg_68),
    .wrenable_reg_69(wrenable_reg_69),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_70(wrenable_reg_70),
    .wrenable_reg_71(wrenable_reg_71),
    .wrenable_reg_72(wrenable_reg_72),
    .wrenable_reg_73(wrenable_reg_73),
    .wrenable_reg_74(wrenable_reg_74),
    .wrenable_reg_75(wrenable_reg_75),
    .wrenable_reg_76(wrenable_reg_76),
    .wrenable_reg_77(wrenable_reg_77),
    .wrenable_reg_78(wrenable_reg_78),
    .wrenable_reg_79(wrenable_reg_79),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_80(wrenable_reg_80),
    .wrenable_reg_81(wrenable_reg_81),
    .wrenable_reg_82(wrenable_reg_82),
    .wrenable_reg_83(wrenable_reg_83),
    .wrenable_reg_84(wrenable_reg_84),
    .wrenable_reg_85(wrenable_reg_85),
    .wrenable_reg_86(wrenable_reg_86),
    .wrenable_reg_87(wrenable_reg_87),
    .wrenable_reg_88(wrenable_reg_88),
    .wrenable_reg_89(wrenable_reg_89),
    .wrenable_reg_9(wrenable_reg_9),
    .wrenable_reg_90(wrenable_reg_90),
    .wrenable_reg_91(wrenable_reg_91),
    .wrenable_reg_92(wrenable_reg_92),
    .wrenable_reg_93(wrenable_reg_93),
    .wrenable_reg_94(wrenable_reg_94),
    .wrenable_reg_95(wrenable_reg_95),
    .wrenable_reg_96(wrenable_reg_96),
    .wrenable_reg_97(wrenable_reg_97),
    .wrenable_reg_98(wrenable_reg_98),
    .wrenable_reg_99(wrenable_reg_99));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// Minimal interface for function: cifar10
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module cifar10(clock,
  reset,
  start_port,
  output_data,
  conv_1_output,
  pooling_1_output,
  conv_2_output,
  pooling_2_output,
  dense_layer_1_output,
  dense_layer_2_output,
  input_data,
  kernel_1_data,
  kernel_2_data,
  weights_1,
  weights_2,
  input_data_size,
  output_data_size,
  kernel_1_size,
  kernel_2_size,
  stride_1_size,
  stride_2_size,
  neurons_dense_1_size,
  neurons_dense_2_size,
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
  input [31:0] output_data;
  input [31:0] conv_1_output;
  input [31:0] pooling_1_output;
  input [31:0] conv_2_output;
  input [31:0] pooling_2_output;
  input [31:0] dense_layer_1_output;
  input [31:0] dense_layer_2_output;
  input [31:0] input_data;
  input [31:0] kernel_1_data;
  input [31:0] kernel_2_data;
  input [31:0] weights_1;
  input [31:0] weights_2;
  input [31:0] input_data_size;
  input [31:0] output_data_size;
  input [31:0] kernel_1_size;
  input [31:0] kernel_2_size;
  input [31:0] stride_1_size;
  input [31:0] stride_2_size;
  input [31:0] neurons_dense_1_size;
  input [31:0] neurons_dense_2_size;
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
  
  _cifar10 _cifar10_i0 (.done_port(done_port),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .output_data(output_data),
    .conv_1_output(conv_1_output),
    .pooling_1_output(pooling_1_output),
    .conv_2_output(conv_2_output),
    .pooling_2_output(pooling_2_output),
    .dense_layer_1_output(dense_layer_1_output),
    .dense_layer_2_output(dense_layer_2_output),
    .input_data(input_data),
    .kernel_1_data(kernel_1_data),
    .kernel_2_data(kernel_2_data),
    .weights_1(weights_1),
    .weights_2(weights_2),
    .input_data_size(input_data_size),
    .output_data_size(output_data_size),
    .kernel_1_size(kernel_1_size),
    .kernel_2_size(kernel_2_size),
    .stride_1_size(stride_1_size),
    .stride_2_size(stride_2_size),
    .neurons_dense_1_size(neurons_dense_1_size),
    .neurons_dense_2_size(neurons_dense_2_size),
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


