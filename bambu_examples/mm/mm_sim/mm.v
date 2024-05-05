// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2023.1 - Revision 04336c437a53bc96ae90b74052c455629946ec8b-main - Date 2024-05-05T15:03:13
// /tmp/.mount_bambu-ZViI1N/usr/bin/bambu executed with: /tmp/.mount_bambu-ZViI1N/usr/bin/bambu -O3 --simulate --generate-tb=/root/PandA-bambu-2023.1/examples/mm/test.xml --simulator=ICARUS --pretty-print=a.c --channels-type=MEM_ACC_NN --device-name=EP2C70F896C6-R --memory-allocation-policy=EXT_PIPELINED_BRAM --experimental-setup=BAMBU --flopoco --top-fname=mm /root/PandA-bambu-2023.1/examples/mm/module.c 
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

// Datapath RTL description for mm
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_mm(clock,
  reset,
  in_port_in_a,
  in_port_in_b,
  in_port_out_c,
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
  fuselector_BMEMORY_CTRLN_18_i1_LOAD,
  fuselector_BMEMORY_CTRLN_18_i1_STORE,
  selector_MUX_107_reg_5_0_0_0,
  selector_MUX_118_reg_6_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0,
  selector_MUX_74_reg_2_0_0_0,
  selector_MUX_85_reg_3_0_0_0,
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
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_mm_9642_9770,
  OUT_CONDITION_mm_9642_9980);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_in_a;
  input [31:0] in_port_in_b;
  input [31:0] in_port_out_c;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_18_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_18_i0_STORE;
  input fuselector_BMEMORY_CTRLN_18_i1_LOAD;
  input fuselector_BMEMORY_CTRLN_18_i1_STORE;
  input selector_MUX_107_reg_5_0_0_0;
  input selector_MUX_118_reg_6_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1;
  input selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1;
  input selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0;
  input selector_MUX_74_reg_2_0_0_0;
  input selector_MUX_85_reg_3_0_0_0;
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
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_CONDITION_mm_9642_9770;
  output OUT_CONDITION_mm_9642_9980;
  // Component and signal declarations
  wire [31:0] out_BMEMORY_CTRLN_18_i0_BMEMORY_CTRLN_18_i0;
  wire [31:0] out_BMEMORY_CTRLN_18_i1_BMEMORY_CTRLN_18_i0;
  wire [31:0] out_MUX_107_reg_5_0_0_0;
  wire [31:0] out_MUX_118_reg_6_0_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0;
  wire [31:0] out_MUX_74_reg_2_0_0_0;
  wire [31:0] out_MUX_85_reg_3_0_0_0;
  wire [31:0] out_UUdata_converter_FU_11_i0_fu_mm_9642_9703;
  wire [31:0] out_UUdata_converter_FU_12_i0_fu_mm_9642_9766;
  wire [31:0] out_UUdata_converter_FU_17_i0_fu_mm_9642_9701;
  wire [31:0] out_UUdata_converter_FU_2_i0_fu_mm_9642_9675;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu_mm_9642_9676;
  wire [31:0] out_UUdata_converter_FU_4_i0_fu_mm_9642_9678;
  wire [31:0] out_UUdata_converter_FU_5_i0_fu_mm_9642_9782;
  wire [31:0] out_UUdata_converter_FU_6_i0_fu_mm_9642_9974;
  wire [6:0] out_const_0;
  wire out_const_1;
  wire [9:0] out_const_10;
  wire [10:0] out_const_11;
  wire [5:0] out_const_12;
  wire [9:0] out_const_13;
  wire [4:0] out_const_14;
  wire [5:0] out_const_15;
  wire [8:0] out_const_16;
  wire [9:0] out_const_17;
  wire [5:0] out_const_18;
  wire [9:0] out_const_19;
  wire [1:0] out_const_2;
  wire [1:0] out_const_20;
  wire [2:0] out_const_21;
  wire [3:0] out_const_22;
  wire [4:0] out_const_23;
  wire [5:0] out_const_24;
  wire [7:0] out_const_25;
  wire [8:0] out_const_26;
  wire [9:0] out_const_27;
  wire [5:0] out_const_28;
  wire [9:0] out_const_29;
  wire [2:0] out_const_3;
  wire [4:0] out_const_30;
  wire [5:0] out_const_31;
  wire [8:0] out_const_32;
  wire [9:0] out_const_33;
  wire [5:0] out_const_34;
  wire [9:0] out_const_35;
  wire [5:0] out_const_36;
  wire [3:0] out_const_4;
  wire [4:0] out_const_5;
  wire [5:0] out_const_6;
  wire [6:0] out_const_7;
  wire [7:0] out_const_8;
  wire [8:0] out_const_9;
  wire [5:0] out_conv_out_const_0_7_6;
  wire [31:0] out_iu_conv_conn_obj_0_IUdata_converter_FU_iu_conv_0;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i0_fu_mm_9642_9705;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i10_fu_mm_9642_9743;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i11_fu_mm_9642_9746;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i12_fu_mm_9642_9751;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i13_fu_mm_9642_9754;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i14_fu_mm_9642_9758;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i15_fu_mm_9642_9761;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i1_fu_mm_9642_9708;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i2_fu_mm_9642_9712;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i3_fu_mm_9642_9715;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i4_fu_mm_9642_9720;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i5_fu_mm_9642_9723;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i6_fu_mm_9642_9727;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i7_fu_mm_9642_9730;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i8_fu_mm_9642_9736;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_19_i9_fu_mm_9642_9739;
  wire signed [31:0] out_plus_expr_FU_32_32_32_20_i0_fu_mm_9642_9716;
  wire signed [31:0] out_plus_expr_FU_32_32_32_20_i1_fu_mm_9642_9731;
  wire signed [31:0] out_plus_expr_FU_32_32_32_20_i2_fu_mm_9642_9747;
  wire signed [31:0] out_plus_expr_FU_32_32_32_20_i3_fu_mm_9642_9762;
  wire signed [31:0] out_plus_expr_FU_32_32_32_20_i4_fu_mm_9642_9764;
  wire out_read_cond_FU_13_i0_fu_mm_9642_9770;
  wire out_read_cond_FU_14_i0_fu_mm_9642_9980;
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
  wire [31:0] out_reg_21_reg_21;
  wire [31:0] out_reg_22_reg_22;
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
  wire [31:0] out_reg_36_reg_36;
  wire [31:0] out_reg_37_reg_37;
  wire [31:0] out_reg_38_reg_38;
  wire [31:0] out_reg_39_reg_39;
  wire [31:0] out_reg_3_reg_3;
  wire out_reg_40_reg_40;
  wire [31:0] out_reg_41_reg_41;
  wire [31:0] out_reg_42_reg_42;
  wire [31:0] out_reg_43_reg_43;
  wire [31:0] out_reg_44_reg_44;
  wire [31:0] out_reg_45_reg_45;
  wire [31:0] out_reg_46_reg_46;
  wire [31:0] out_reg_47_reg_47;
  wire [31:0] out_reg_48_reg_48;
  wire [31:0] out_reg_49_reg_49;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_50_reg_50;
  wire [31:0] out_reg_51_reg_51;
  wire [31:0] out_reg_52_reg_52;
  wire [31:0] out_reg_53_reg_53;
  wire [31:0] out_reg_54_reg_54;
  wire [31:0] out_reg_55_reg_55;
  wire [31:0] out_reg_56_reg_56;
  wire [31:0] out_reg_57_reg_57;
  wire [31:0] out_reg_58_reg_58;
  wire [31:0] out_reg_59_reg_59;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_60_reg_60;
  wire [31:0] out_reg_61_reg_61;
  wire [31:0] out_reg_62_reg_62;
  wire [31:0] out_reg_63_reg_63;
  wire [31:0] out_reg_64_reg_64;
  wire [31:0] out_reg_65_reg_65;
  wire [31:0] out_reg_66_reg_66;
  wire [31:0] out_reg_67_reg_67;
  wire [31:0] out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire [31:0] out_reg_9_reg_9;
  wire signed [31:0] out_ternary_plus_expr_FU_32_32_32_32_21_i0_fu_mm_9642_9717;
  wire signed [31:0] out_ternary_plus_expr_FU_32_32_32_32_21_i1_fu_mm_9642_9732;
  wire signed [31:0] out_ternary_plus_expr_FU_32_32_32_32_21_i2_fu_mm_9642_9748;
  wire signed [31:0] out_ternary_plus_expr_FU_32_32_32_32_21_i3_fu_mm_9642_9763;
  wire signed [31:0] out_ternary_plus_expr_FU_32_32_32_32_21_i4_fu_mm_9642_9765;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_22_i0_fu_mm_9642_10395;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_22_i1_fu_mm_9642_10408;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_23_i0_fu_mm_9642_10423;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_23_i1_fu_mm_9642_10436;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_24_i0_fu_mm_9642_9768;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_24_i1_fu_mm_9642_9769;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_25_i0_fu_mm_9642_9792;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_25_i1_fu_mm_9642_9801;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_26_i0_fu_mm_9642_10391;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_26_i1_fu_mm_9642_10405;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_27_i0_fu_mm_9642_10419;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_27_i1_fu_mm_9642_10433;
  wire out_ui_ne_expr_FU_32_32_32_28_i0_fu_mm_9642_10344;
  wire out_ui_ne_expr_FU_32_32_32_28_i1_fu_mm_9642_10346;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_29_i0_fu_mm_9642_10388;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_29_i1_fu_mm_9642_10402;
  wire [25:0] out_ui_plus_expr_FU_32_0_32_29_i2_fu_mm_9642_10416;
  wire [25:0] out_ui_plus_expr_FU_32_0_32_29_i3_fu_mm_9642_10430;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_30_i0_fu_mm_9642_10135;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_31_i0_fu_mm_9642_10142;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_32_i0_fu_mm_9642_10149;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_33_i0_fu_mm_9642_10156;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_34_i0_fu_mm_9642_10163;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_35_i0_fu_mm_9642_10170;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_36_i0_fu_mm_9642_10177;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_37_i0_fu_mm_9642_10184;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_38_i0_fu_mm_9642_10191;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_39_i0_fu_mm_9642_10198;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_40_i0_fu_mm_9642_10205;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_41_i0_fu_mm_9642_10212;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_42_i0_fu_mm_9642_10219;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_43_i0_fu_mm_9642_10226;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_44_i0_fu_mm_9642_10233;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_45_i0_fu_mm_9642_10240;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_46_i0_fu_mm_9642_10247;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_47_i0_fu_mm_9642_10254;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu_mm_9642_10261;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu_mm_9642_10268;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_50_i0_fu_mm_9642_10275;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_51_i0_fu_mm_9642_10282;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_52_i0_fu_mm_9642_10289;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_53_i0_fu_mm_9642_10296;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_54_i0_fu_mm_9642_10303;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_55_i0_fu_mm_9642_10310;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_56_i0_fu_mm_9642_10317;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_57_i0_fu_mm_9642_10324;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_58_i0_fu_mm_9642_10331;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_59_i0_fu_mm_9642_10338;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_60_i0_fu_mm_9642_9677;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_61_i0_fu_mm_9642_9977;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_62_i0_fu_mm_9642_10383;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_62_i1_fu_mm_9642_10400;
  wire [25:0] out_ui_rshift_expr_FU_32_0_32_63_i0_fu_mm_9642_10413;
  wire [25:0] out_ui_rshift_expr_FU_32_0_32_63_i1_fu_mm_9642_10428;
  
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_18_i0 (.out1({out_BMEMORY_CTRLN_18_i1_BMEMORY_CTRLN_18_i0,
      out_BMEMORY_CTRLN_18_i0_BMEMORY_CTRLN_18_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({32'b00000000000000000000000000000000,
      out_iu_conv_conn_obj_0_IUdata_converter_FU_iu_conv_0}),
    .in2({out_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0,
      out_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0}),
    .in3({out_conv_out_const_0_7_6,
      out_conv_out_const_0_7_6}),
    .in4({out_const_1,
      out_const_1}),
    .sel_LOAD({fuselector_BMEMORY_CTRLN_18_i1_LOAD,
      fuselector_BMEMORY_CTRLN_18_i0_LOAD}),
    .sel_STORE({fuselector_BMEMORY_CTRLN_18_i1_STORE,
      fuselector_BMEMORY_CTRLN_18_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_0 (.out1(out_iu_conv_conn_obj_0_IUdata_converter_FU_iu_conv_0),
    .in1(out_reg_67_reg_67));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_107_reg_5_0_0_0 (.out1(out_MUX_107_reg_5_0_0_0),
    .sel(selector_MUX_107_reg_5_0_0_0),
    .in1(out_reg_1_reg_1),
    .in2(out_ui_bit_ior_concat_expr_FU_24_i0_fu_mm_9642_9768));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_118_reg_6_0_0_0 (.out1(out_MUX_118_reg_6_0_0_0),
    .sel(selector_MUX_118_reg_6_0_0_0),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_bit_ior_concat_expr_FU_24_i1_fu_mm_9642_9769));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0),
    .in1(out_reg_38_reg_38),
    .in2(out_reg_37_reg_37));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1),
    .in1(out_reg_36_reg_36),
    .in2(out_reg_35_reg_35));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_0_2 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2),
    .in1(out_reg_33_reg_33),
    .in2(out_reg_32_reg_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_0_3 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3),
    .in1(out_reg_31_reg_31),
    .in2(out_reg_30_reg_30));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_0_4 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4),
    .in1(out_reg_29_reg_29),
    .in2(out_reg_28_reg_28));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_0_5 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5),
    .in1(out_reg_27_reg_27),
    .in2(out_reg_26_reg_26));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_0_6 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6),
    .in1(out_reg_25_reg_25),
    .in2(out_reg_24_reg_24));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_0_7 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7),
    .in1(out_reg_23_reg_23),
    .in2(out_reg_22_reg_22));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_0_8 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8),
    .in1(out_reg_18_reg_18),
    .in2(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1),
    .in2(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_1_1 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1),
    .in1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3),
    .in2(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_1_2 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2),
    .in1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5),
    .in2(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_1_3 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3),
    .in1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7),
    .in2(out_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_2_0 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_2_1 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1),
    .in1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2),
    .in2(out_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_18_i0_1_3_0 (.out1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_0_0 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_8_reg_8));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_0_1 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1),
    .in1(out_reg_7_reg_7),
    .in2(out_reg_39_reg_39));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_0_2 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2),
    .in1(out_reg_34_reg_34),
    .in2(out_reg_21_reg_21));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_0_3 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3),
    .in1(out_reg_20_reg_20),
    .in2(out_reg_19_reg_19));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_0_4 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4),
    .in1(out_reg_17_reg_17),
    .in2(out_reg_16_reg_16));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_0_5 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5),
    .in1(out_reg_15_reg_15),
    .in2(out_reg_14_reg_14));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_0_6 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6),
    .in1(out_reg_13_reg_13),
    .in2(out_reg_12_reg_12));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_0_7 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7),
    .in1(out_reg_11_reg_11),
    .in2(out_reg_10_reg_10));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_1_0 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0),
    .in1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0),
    .in2(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_1_1 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1),
    .in1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2),
    .in2(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_1_2 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2),
    .in1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4),
    .in2(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_1_3 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3),
    .in1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6),
    .in2(out_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_2_0 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0),
    .in1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0),
    .in2(out_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_2_1 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1),
    .in1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2),
    .in2(out_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_18_i1_1_3_0 (.out1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0),
    .in1(out_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0),
    .in2(out_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_74_reg_2_0_0_0 (.out1(out_MUX_74_reg_2_0_0_0),
    .sel(selector_MUX_74_reg_2_0_0_0),
    .in1(out_UUdata_converter_FU_2_i0_fu_mm_9642_9675),
    .in2(out_ui_bit_ior_concat_expr_FU_25_i0_fu_mm_9642_9792));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_85_reg_3_0_0_0 (.out1(out_MUX_85_reg_3_0_0_0),
    .sel(selector_MUX_85_reg_3_0_0_0),
    .in1(out_UUdata_converter_FU_3_i0_fu_mm_9642_9676),
    .in2(out_ui_bit_ior_concat_expr_FU_25_i1_fu_mm_9642_9801));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1000000000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b10000000000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100100)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1001000000)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10100)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101000)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(9),
    .value(9'b101000000)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1010000000)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101100)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1011000000)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b110)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1100)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11000)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110000)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11000000)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(9),
    .value(9'b110000000)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1100000000)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110100)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1101000000)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11100)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111000)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(9),
    .value(9'b111000000)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1110000000)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111100)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1111000000)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_36 (.out1(out_const_36));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1000000)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b10000000)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(9),
    .value(9'b100000000)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_0_7_6 (.out1(out_conv_out_const_0_7_6),
    .in1(out_const_0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10135 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_30_i0_fu_mm_9642_10135),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_3));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(7),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10142 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_31_i0_fu_mm_9642_10142),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10149 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_32_i0_fu_mm_9642_10149),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_4));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10156 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_33_i0_fu_mm_9642_10156),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_8));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10163 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_34_i0_fu_mm_9642_10163),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_22));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10170 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_35_i0_fu_mm_9642_10170),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_25));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10177 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_36_i0_fu_mm_9642_10177),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(9),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10184 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_37_i0_fu_mm_9642_10184),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_9));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10191 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_38_i0_fu_mm_9642_10191),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_14));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(9),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10198 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_39_i0_fu_mm_9642_10198),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_16));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10205 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_40_i0_fu_mm_9642_10205),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_23));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(9),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10212 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_41_i0_fu_mm_9642_10212),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_26));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10219 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_42_i0_fu_mm_9642_10219),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_30));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(9),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10226 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_43_i0_fu_mm_9642_10226),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_32));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10233 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_44_i0_fu_mm_9642_10233),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(10),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10240 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_45_i0_fu_mm_9642_10240),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_10));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10247 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_46_i0_fu_mm_9642_10247),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_12));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(10),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10254 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_47_i0_fu_mm_9642_10254),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_13));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10261 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu_mm_9642_10261),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_15));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(10),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10268 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu_mm_9642_10268),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_17));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10275 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_50_i0_fu_mm_9642_10275),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_18));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(10),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10282 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_51_i0_fu_mm_9642_10282),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_19));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10289 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_52_i0_fu_mm_9642_10289),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_24));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(10),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10296 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_53_i0_fu_mm_9642_10296),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_27));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10303 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_54_i0_fu_mm_9642_10303),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_28));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(10),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10310 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_55_i0_fu_mm_9642_10310),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_29));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10317 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_56_i0_fu_mm_9642_10317),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_31));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(10),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10324 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_57_i0_fu_mm_9642_10324),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_33));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10331 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_58_i0_fu_mm_9642_10331),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in2(out_const_34));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(10),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_10338 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_59_i0_fu_mm_9642_10338),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in2(out_const_35));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_mm_9642_10344 (.out1(out_ui_ne_expr_FU_32_32_32_28_i0_fu_mm_9642_10344),
    .in1(out_ui_bit_ior_concat_expr_FU_24_i0_fu_mm_9642_9768),
    .in2(out_reg_4_reg_4));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_mm_9642_10346 (.out1(out_ui_ne_expr_FU_32_32_32_28_i1_fu_mm_9642_10346),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_0_reg_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_mm_9642_10383 (.out1(out_ui_rshift_expr_FU_32_0_32_62_i0_fu_mm_9642_10383),
    .in1(out_reg_5_reg_5),
    .in2(out_const_2));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(1),
    .BITSIZE_out1(30)) fu_mm_9642_10388 (.out1(out_ui_plus_expr_FU_32_0_32_29_i0_fu_mm_9642_10388),
    .in1(out_ui_rshift_expr_FU_32_0_32_62_i0_fu_mm_9642_10383),
    .in2(out_const_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_mm_9642_10391 (.out1(out_ui_lshift_expr_FU_32_0_32_26_i0_fu_mm_9642_10391),
    .in1(out_ui_plus_expr_FU_32_0_32_29_i0_fu_mm_9642_10388),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_mm_9642_10395 (.out1(out_ui_bit_and_expr_FU_8_0_8_22_i0_fu_mm_9642_10395),
    .in1(out_reg_5_reg_5),
    .in2(out_const_20));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_mm_9642_10400 (.out1(out_ui_rshift_expr_FU_32_0_32_62_i1_fu_mm_9642_10400),
    .in1(out_reg_6_reg_6),
    .in2(out_const_2));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(1),
    .BITSIZE_out1(30)) fu_mm_9642_10402 (.out1(out_ui_plus_expr_FU_32_0_32_29_i1_fu_mm_9642_10402),
    .in1(out_ui_rshift_expr_FU_32_0_32_62_i1_fu_mm_9642_10400),
    .in2(out_const_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_mm_9642_10405 (.out1(out_ui_lshift_expr_FU_32_0_32_26_i1_fu_mm_9642_10405),
    .in1(out_ui_plus_expr_FU_32_0_32_29_i1_fu_mm_9642_10402),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_mm_9642_10408 (.out1(out_ui_bit_and_expr_FU_8_0_8_22_i1_fu_mm_9642_10408),
    .in1(out_reg_6_reg_6),
    .in2(out_const_20));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(32)) fu_mm_9642_10413 (.out1(out_ui_rshift_expr_FU_32_0_32_63_i0_fu_mm_9642_10413),
    .in1(out_reg_2_reg_2),
    .in2(out_const_21));
  ui_plus_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(1),
    .BITSIZE_out1(26)) fu_mm_9642_10416 (.out1(out_ui_plus_expr_FU_32_0_32_29_i2_fu_mm_9642_10416),
    .in1(out_ui_rshift_expr_FU_32_0_32_63_i0_fu_mm_9642_10413),
    .in2(out_const_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_mm_9642_10419 (.out1(out_ui_lshift_expr_FU_32_0_32_27_i0_fu_mm_9642_10419),
    .in1(out_ui_plus_expr_FU_32_0_32_29_i2_fu_mm_9642_10416),
    .in2(out_const_21));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu_mm_9642_10423 (.out1(out_ui_bit_and_expr_FU_8_0_8_23_i0_fu_mm_9642_10423),
    .in1(out_reg_2_reg_2),
    .in2(out_const_36));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(26),
    .PRECISION(32)) fu_mm_9642_10428 (.out1(out_ui_rshift_expr_FU_32_0_32_63_i1_fu_mm_9642_10428),
    .in1(out_reg_3_reg_3),
    .in2(out_const_21));
  ui_plus_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(1),
    .BITSIZE_out1(26)) fu_mm_9642_10430 (.out1(out_ui_plus_expr_FU_32_0_32_29_i3_fu_mm_9642_10430),
    .in1(out_ui_rshift_expr_FU_32_0_32_63_i1_fu_mm_9642_10428),
    .in2(out_const_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(26),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_mm_9642_10433 (.out1(out_ui_lshift_expr_FU_32_0_32_27_i1_fu_mm_9642_10433),
    .in1(out_ui_plus_expr_FU_32_0_32_29_i3_fu_mm_9642_10430),
    .in2(out_const_21));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu_mm_9642_10436 (.out1(out_ui_bit_and_expr_FU_8_0_8_23_i1_fu_mm_9642_10436),
    .in1(out_reg_3_reg_3),
    .in2(out_const_36));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_mm_9642_9675 (.out1(out_UUdata_converter_FU_2_i0_fu_mm_9642_9675),
    .in1(in_port_out_c));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_mm_9642_9676 (.out1(out_UUdata_converter_FU_3_i0_fu_mm_9642_9676),
    .in1(in_port_in_a));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(11),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_9677 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_60_i0_fu_mm_9642_9677),
    .in1(in_port_in_a),
    .in2(out_const_11));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_mm_9642_9678 (.out1(out_UUdata_converter_FU_4_i0_fu_mm_9642_9678),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_60_i0_fu_mm_9642_9677));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_mm_9642_9701 (.out1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .in1(out_reg_3_reg_3));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_mm_9642_9703 (.out1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .in1(out_reg_5_reg_5));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9705 (.out1(out_mult_expr_FU_32_32_32_0_19_i0_fu_mm_9642_9705),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9708 (.out1(out_mult_expr_FU_32_32_32_0_19_i1_fu_mm_9642_9708),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9712 (.out1(out_mult_expr_FU_32_32_32_0_19_i2_fu_mm_9642_9712),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9715 (.out1(out_mult_expr_FU_32_32_32_0_19_i3_fu_mm_9642_9715),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_mm_9642_9716 (.out1(out_plus_expr_FU_32_32_32_20_i0_fu_mm_9642_9716),
    .in1(out_reg_54_reg_54),
    .in2(out_reg_53_reg_53));
  ternary_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_mm_9642_9717 (.out1(out_ternary_plus_expr_FU_32_32_32_32_21_i0_fu_mm_9642_9717),
    .in1(out_reg_52_reg_52),
    .in2(out_reg_50_reg_50),
    .in3(out_plus_expr_FU_32_32_32_20_i0_fu_mm_9642_9716));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9720 (.out1(out_mult_expr_FU_32_32_32_0_19_i4_fu_mm_9642_9720),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9723 (.out1(out_mult_expr_FU_32_32_32_0_19_i5_fu_mm_9642_9723),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9727 (.out1(out_mult_expr_FU_32_32_32_0_19_i6_fu_mm_9642_9727),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9730 (.out1(out_mult_expr_FU_32_32_32_0_19_i7_fu_mm_9642_9730),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_mm_9642_9731 (.out1(out_plus_expr_FU_32_32_32_20_i1_fu_mm_9642_9731),
    .in1(out_reg_59_reg_59),
    .in2(out_reg_58_reg_58));
  ternary_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_mm_9642_9732 (.out1(out_ternary_plus_expr_FU_32_32_32_32_21_i1_fu_mm_9642_9732),
    .in1(out_reg_57_reg_57),
    .in2(out_reg_56_reg_56),
    .in3(out_plus_expr_FU_32_32_32_20_i1_fu_mm_9642_9731));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9736 (.out1(out_mult_expr_FU_32_32_32_0_19_i8_fu_mm_9642_9736),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9739 (.out1(out_mult_expr_FU_32_32_32_0_19_i9_fu_mm_9642_9739),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9743 (.out1(out_mult_expr_FU_32_32_32_0_19_i10_fu_mm_9642_9743),
    .clock(clock),
    .in1(out_reg_41_reg_41),
    .in2(out_reg_45_reg_45));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9746 (.out1(out_mult_expr_FU_32_32_32_0_19_i11_fu_mm_9642_9746),
    .clock(clock),
    .in1(out_reg_42_reg_42),
    .in2(out_reg_46_reg_46));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_mm_9642_9747 (.out1(out_plus_expr_FU_32_32_32_20_i2_fu_mm_9642_9747),
    .in1(out_reg_44_reg_44),
    .in2(out_reg_43_reg_43));
  ternary_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_mm_9642_9748 (.out1(out_ternary_plus_expr_FU_32_32_32_32_21_i2_fu_mm_9642_9748),
    .in1(out_reg_62_reg_62),
    .in2(out_reg_61_reg_61),
    .in3(out_reg_47_reg_47));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9751 (.out1(out_mult_expr_FU_32_32_32_0_19_i12_fu_mm_9642_9751),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9754 (.out1(out_mult_expr_FU_32_32_32_0_19_i13_fu_mm_9642_9754),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9758 (.out1(out_mult_expr_FU_32_32_32_0_19_i14_fu_mm_9642_9758),
    .clock(clock),
    .in1(out_reg_46_reg_46),
    .in2(out_reg_45_reg_45));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_mm_9642_9761 (.out1(out_mult_expr_FU_32_32_32_0_19_i15_fu_mm_9642_9761),
    .clock(clock),
    .in1(out_reg_45_reg_45),
    .in2(out_reg_46_reg_46));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_mm_9642_9762 (.out1(out_plus_expr_FU_32_32_32_20_i3_fu_mm_9642_9762),
    .in1(out_reg_49_reg_49),
    .in2(out_reg_48_reg_48));
  ternary_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_mm_9642_9763 (.out1(out_ternary_plus_expr_FU_32_32_32_32_21_i3_fu_mm_9642_9763),
    .in1(out_reg_65_reg_65),
    .in2(out_reg_64_reg_64),
    .in3(out_reg_51_reg_51));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_mm_9642_9764 (.out1(out_plus_expr_FU_32_32_32_20_i4_fu_mm_9642_9764),
    .in1(out_reg_63_reg_63),
    .in2(out_ternary_plus_expr_FU_32_32_32_32_21_i3_fu_mm_9642_9763));
  ternary_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_mm_9642_9765 (.out1(out_ternary_plus_expr_FU_32_32_32_32_21_i4_fu_mm_9642_9765),
    .in1(out_reg_55_reg_55),
    .in2(out_reg_60_reg_60),
    .in3(out_reg_66_reg_66));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_mm_9642_9766 (.out1(out_UUdata_converter_FU_12_i0_fu_mm_9642_9766),
    .in1(out_reg_6_reg_6));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_mm_9642_9768 (.out1(out_ui_bit_ior_concat_expr_FU_24_i0_fu_mm_9642_9768),
    .in1(out_ui_lshift_expr_FU_32_0_32_26_i0_fu_mm_9642_10391),
    .in2(out_ui_bit_and_expr_FU_8_0_8_22_i0_fu_mm_9642_10395),
    .in3(out_const_2));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(2)) fu_mm_9642_9769 (.out1(out_ui_bit_ior_concat_expr_FU_24_i1_fu_mm_9642_9769),
    .in1(out_ui_lshift_expr_FU_32_0_32_26_i1_fu_mm_9642_10405),
    .in2(out_ui_bit_and_expr_FU_8_0_8_22_i1_fu_mm_9642_10408),
    .in3(out_const_2));
  read_cond_FU #(.BITSIZE_in1(1)) fu_mm_9642_9770 (.out1(out_read_cond_FU_13_i0_fu_mm_9642_9770),
    .in1(out_reg_40_reg_40));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_mm_9642_9782 (.out1(out_UUdata_converter_FU_5_i0_fu_mm_9642_9782),
    .in1(in_port_in_b));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_in3(3),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(6)) fu_mm_9642_9792 (.out1(out_ui_bit_ior_concat_expr_FU_25_i0_fu_mm_9642_9792),
    .in1(out_ui_lshift_expr_FU_32_0_32_27_i0_fu_mm_9642_10419),
    .in2(out_ui_bit_and_expr_FU_8_0_8_23_i0_fu_mm_9642_10423),
    .in3(out_const_21));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_in3(3),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(6)) fu_mm_9642_9801 (.out1(out_ui_bit_ior_concat_expr_FU_25_i1_fu_mm_9642_9801),
    .in1(out_ui_lshift_expr_FU_32_0_32_27_i1_fu_mm_9642_10433),
    .in2(out_ui_bit_and_expr_FU_8_0_8_23_i1_fu_mm_9642_10436),
    .in3(out_const_21));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_mm_9642_9974 (.out1(out_UUdata_converter_FU_6_i0_fu_mm_9642_9974),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_61_i0_fu_mm_9642_9977));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(7),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_mm_9642_9977 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_61_i0_fu_mm_9642_9977),
    .in1(in_port_in_b),
    .in2(out_const_7));
  read_cond_FU #(.BITSIZE_in1(1)) fu_mm_9642_9980 (.out1(out_read_cond_FU_14_i0_fu_mm_9642_9980),
    .in1(out_ui_ne_expr_FU_32_32_32_28_i1_fu_mm_9642_10346));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_4_i0_fu_mm_9642_9678),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_5_i0_fu_mm_9642_9782),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_34_i0_fu_mm_9642_10163),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_36_i0_fu_mm_9642_10177),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_38_i0_fu_mm_9642_10191),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_40_i0_fu_mm_9642_10205),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_42_i0_fu_mm_9642_10219),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_44_i0_fu_mm_9642_10233),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_46_i0_fu_mm_9642_10247),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu_mm_9642_10261),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_50_i0_fu_mm_9642_10275),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_52_i0_fu_mm_9642_10289),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_74_reg_2_0_0_0),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_54_i0_fu_mm_9642_10303),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_56_i0_fu_mm_9642_10317),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_58_i0_fu_mm_9642_10331),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_11_i0_fu_mm_9642_9703),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_12_i0_fu_mm_9642_9766),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_31_i0_fu_mm_9642_10142),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_33_i0_fu_mm_9642_10156),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_35_i0_fu_mm_9642_10170),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_37_i0_fu_mm_9642_10184),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_39_i0_fu_mm_9642_10198),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_85_reg_3_0_0_0),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_41_i0_fu_mm_9642_10212),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_43_i0_fu_mm_9642_10226),
    .wenable(wrenable_reg_31));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_45_i0_fu_mm_9642_10240),
    .wenable(wrenable_reg_32));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_47_i0_fu_mm_9642_10254),
    .wenable(wrenable_reg_33));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu_mm_9642_10268),
    .wenable(wrenable_reg_34));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_51_i0_fu_mm_9642_10282),
    .wenable(wrenable_reg_35));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_53_i0_fu_mm_9642_10296),
    .wenable(wrenable_reg_36));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_55_i0_fu_mm_9642_10310),
    .wenable(wrenable_reg_37));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_57_i0_fu_mm_9642_10324),
    .wenable(wrenable_reg_38));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_59_i0_fu_mm_9642_10338),
    .wenable(wrenable_reg_39));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_6_i0_fu_mm_9642_9974),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_28_i0_fu_mm_9642_10344),
    .wenable(wrenable_reg_40));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_41 (.out1(out_reg_41_reg_41),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_18_i1_BMEMORY_CTRLN_18_i0),
    .wenable(wrenable_reg_41));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_42 (.out1(out_reg_42_reg_42),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_18_i0_BMEMORY_CTRLN_18_i0),
    .wenable(wrenable_reg_42));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_43 (.out1(out_reg_43_reg_43),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i10_fu_mm_9642_9743),
    .wenable(wrenable_reg_43));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_44 (.out1(out_reg_44_reg_44),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i11_fu_mm_9642_9746),
    .wenable(wrenable_reg_44));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_45 (.out1(out_reg_45_reg_45),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_18_i1_BMEMORY_CTRLN_18_i0),
    .wenable(wrenable_reg_45));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_46 (.out1(out_reg_46_reg_46),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_18_i0_BMEMORY_CTRLN_18_i0),
    .wenable(wrenable_reg_46));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_47 (.out1(out_reg_47_reg_47),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_20_i2_fu_mm_9642_9747),
    .wenable(wrenable_reg_47));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_48 (.out1(out_reg_48_reg_48),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i14_fu_mm_9642_9758),
    .wenable(wrenable_reg_48));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_49 (.out1(out_reg_49_reg_49),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i15_fu_mm_9642_9761),
    .wenable(wrenable_reg_49));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_107_reg_5_0_0_0),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_50 (.out1(out_reg_50_reg_50),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i0_fu_mm_9642_9705),
    .wenable(wrenable_reg_50));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_51 (.out1(out_reg_51_reg_51),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_20_i3_fu_mm_9642_9762),
    .wenable(wrenable_reg_51));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_52 (.out1(out_reg_52_reg_52),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i1_fu_mm_9642_9708),
    .wenable(wrenable_reg_52));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_53 (.out1(out_reg_53_reg_53),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i2_fu_mm_9642_9712),
    .wenable(wrenable_reg_53));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_54 (.out1(out_reg_54_reg_54),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i3_fu_mm_9642_9715),
    .wenable(wrenable_reg_54));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_55 (.out1(out_reg_55_reg_55),
    .clock(clock),
    .reset(reset),
    .in1(out_ternary_plus_expr_FU_32_32_32_32_21_i0_fu_mm_9642_9717),
    .wenable(wrenable_reg_55));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_56 (.out1(out_reg_56_reg_56),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i4_fu_mm_9642_9720),
    .wenable(wrenable_reg_56));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_57 (.out1(out_reg_57_reg_57),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i5_fu_mm_9642_9723),
    .wenable(wrenable_reg_57));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_58 (.out1(out_reg_58_reg_58),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i6_fu_mm_9642_9727),
    .wenable(wrenable_reg_58));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_59 (.out1(out_reg_59_reg_59),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i7_fu_mm_9642_9730),
    .wenable(wrenable_reg_59));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_118_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_60 (.out1(out_reg_60_reg_60),
    .clock(clock),
    .reset(reset),
    .in1(out_ternary_plus_expr_FU_32_32_32_32_21_i1_fu_mm_9642_9732),
    .wenable(wrenable_reg_60));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_61 (.out1(out_reg_61_reg_61),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i8_fu_mm_9642_9736),
    .wenable(wrenable_reg_61));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_62 (.out1(out_reg_62_reg_62),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i9_fu_mm_9642_9739),
    .wenable(wrenable_reg_62));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_63 (.out1(out_reg_63_reg_63),
    .clock(clock),
    .reset(reset),
    .in1(out_ternary_plus_expr_FU_32_32_32_32_21_i2_fu_mm_9642_9748),
    .wenable(wrenable_reg_63));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_64 (.out1(out_reg_64_reg_64),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i12_fu_mm_9642_9751),
    .wenable(wrenable_reg_64));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_65 (.out1(out_reg_65_reg_65),
    .clock(clock),
    .reset(reset),
    .in1(out_mult_expr_FU_32_32_32_0_19_i13_fu_mm_9642_9754),
    .wenable(wrenable_reg_65));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_66 (.out1(out_reg_66_reg_66),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_32_32_20_i4_fu_mm_9642_9764),
    .wenable(wrenable_reg_66));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_67 (.out1(out_reg_67_reg_67),
    .clock(clock),
    .reset(reset),
    .in1(out_ternary_plus_expr_FU_32_32_32_32_21_i4_fu_mm_9642_9765),
    .wenable(wrenable_reg_67));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_17_i0_fu_mm_9642_9701),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_30_i0_fu_mm_9642_10135),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_32_i0_fu_mm_9642_10149),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION_mm_9642_9770 = out_read_cond_FU_13_i0_fu_mm_9642_9770;
  assign OUT_CONDITION_mm_9642_9980 = out_read_cond_FU_14_i0_fu_mm_9642_9980;

endmodule

// FSM based controller description for mm
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_mm(done_port,
  fuselector_BMEMORY_CTRLN_18_i0_LOAD,
  fuselector_BMEMORY_CTRLN_18_i0_STORE,
  fuselector_BMEMORY_CTRLN_18_i1_LOAD,
  fuselector_BMEMORY_CTRLN_18_i1_STORE,
  selector_MUX_107_reg_5_0_0_0,
  selector_MUX_118_reg_6_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1,
  selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1,
  selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0,
  selector_MUX_74_reg_2_0_0_0,
  selector_MUX_85_reg_3_0_0_0,
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
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_mm_9642_9770,
  OUT_CONDITION_mm_9642_9980,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_mm_9642_9770;
  input OUT_CONDITION_mm_9642_9980;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_18_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_18_i0_STORE;
  output fuselector_BMEMORY_CTRLN_18_i1_LOAD;
  output fuselector_BMEMORY_CTRLN_18_i1_STORE;
  output selector_MUX_107_reg_5_0_0_0;
  output selector_MUX_118_reg_6_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1;
  output selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1;
  output selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0;
  output selector_MUX_74_reg_2_0_0_0;
  output selector_MUX_85_reg_3_0_0_0;
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
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [4:0] S_0 = 5'd0,
    S_23 = 5'd23,
    S_1 = 5'd1,
    S_2 = 5'd2,
    S_3 = 5'd3,
    S_4 = 5'd4,
    S_5 = 5'd5,
    S_6 = 5'd6,
    S_7 = 5'd7,
    S_8 = 5'd8,
    S_9 = 5'd9,
    S_10 = 5'd10,
    S_11 = 5'd11,
    S_12 = 5'd12,
    S_13 = 5'd13,
    S_14 = 5'd14,
    S_15 = 5'd15,
    S_16 = 5'd16,
    S_17 = 5'd17,
    S_18 = 5'd18,
    S_19 = 5'd19,
    S_20 = 5'd20,
    S_21 = 5'd21,
    S_22 = 5'd22,
    S_24 = 5'd24;
  reg [4:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_18_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_18_i0_STORE;
  reg fuselector_BMEMORY_CTRLN_18_i1_LOAD;
  reg fuselector_BMEMORY_CTRLN_18_i1_STORE;
  reg selector_MUX_107_reg_5_0_0_0;
  reg selector_MUX_118_reg_6_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1;
  reg selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1;
  reg selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0;
  reg selector_MUX_74_reg_2_0_0_0;
  reg selector_MUX_85_reg_3_0_0_0;
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
    fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_18_i1_STORE = 1'b0;
    selector_MUX_107_reg_5_0_0_0 = 1'b0;
    selector_MUX_118_reg_6_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0 = 1'b0;
    selector_MUX_74_reg_2_0_0_0 = 1'b0;
    selector_MUX_85_reg_3_0_0_0 = 1'b0;
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
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_MUX_74_reg_2_0_0_0 = 1'b1;
          selector_MUX_85_reg_3_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          _next_state = S_23;
        end
        else
        begin
          _next_state = S_0;
        end
      S_23 :
        begin
          selector_MUX_107_reg_5_0_0_0 = 1'b1;
          selector_MUX_118_reg_6_0_0_0 = 1'b1;
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
          wrenable_reg_3 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_1;
        end
      S_1 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          wrenable_reg_39 = 1'b1;
          wrenable_reg_40 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0 = 1'b1;
          wrenable_reg_41 = 1'b1;
          wrenable_reg_42 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0 = 1'b1;
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          _next_state = S_5;
        end
      S_5 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_47 = 1'b1;
          wrenable_reg_48 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_49 = 1'b1;
          _next_state = S_7;
        end
      S_7 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_50 = 1'b1;
          wrenable_reg_51 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_52 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_53 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_54 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_55 = 1'b1;
          wrenable_reg_56 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_57 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_58 = 1'b1;
          _next_state = S_14;
        end
      S_14 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_59 = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_60 = 1'b1;
          wrenable_reg_61 = 1'b1;
          _next_state = S_16;
        end
      S_16 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_18_i1_LOAD = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_62 = 1'b1;
          _next_state = S_17;
        end
      S_17 :
        begin
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_63 = 1'b1;
          wrenable_reg_64 = 1'b1;
          _next_state = S_18;
        end
      S_18 :
        begin
          wrenable_reg_65 = 1'b1;
          _next_state = S_19;
        end
      S_19 :
        begin
          wrenable_reg_66 = 1'b1;
          _next_state = S_20;
        end
      S_20 :
        begin
          wrenable_reg_67 = 1'b1;
          _next_state = S_21;
        end
      S_21 :
        begin
          fuselector_BMEMORY_CTRLN_18_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1 = 1'b1;
          if (OUT_CONDITION_mm_9642_9770 == 1'b1)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_22;
            end
        end
      S_22 :
        begin
          if (OUT_CONDITION_mm_9642_9980 == 1'b1)
            begin
              _next_state = S_23;
            end
          else
            begin
              _next_state = S_24;
              done_port = 1'b1;
            end
        end
      S_24 :
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

// Top component for mm
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _mm(clock,
  reset,
  start_port,
  done_port,
  in_a,
  in_b,
  out_c,
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
  input [31:0] in_a;
  input [31:0] in_b;
  input [31:0] out_c;
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
  wire OUT_CONDITION_mm_9642_9770;
  wire OUT_CONDITION_mm_9642_9980;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_18_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_18_i0_STORE;
  wire fuselector_BMEMORY_CTRLN_18_i1_LOAD;
  wire fuselector_BMEMORY_CTRLN_18_i1_STORE;
  wire selector_MUX_107_reg_5_0_0_0;
  wire selector_MUX_118_reg_6_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1;
  wire selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1;
  wire selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0;
  wire selector_MUX_74_reg_2_0_0_0;
  wire selector_MUX_85_reg_3_0_0_0;
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
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_mm Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_18_i0_LOAD(fuselector_BMEMORY_CTRLN_18_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_18_i0_STORE(fuselector_BMEMORY_CTRLN_18_i0_STORE),
    .fuselector_BMEMORY_CTRLN_18_i1_LOAD(fuselector_BMEMORY_CTRLN_18_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_18_i1_STORE(fuselector_BMEMORY_CTRLN_18_i1_STORE),
    .selector_MUX_107_reg_5_0_0_0(selector_MUX_107_reg_5_0_0_0),
    .selector_MUX_118_reg_6_0_0_0(selector_MUX_118_reg_6_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0),
    .selector_MUX_74_reg_2_0_0_0(selector_MUX_74_reg_2_0_0_0),
    .selector_MUX_85_reg_3_0_0_0(selector_MUX_85_reg_3_0_0_0),
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
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_mm_9642_9770(OUT_CONDITION_mm_9642_9770),
    .OUT_CONDITION_mm_9642_9980(OUT_CONDITION_mm_9642_9980),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_mm Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_mm_9642_9770(OUT_CONDITION_mm_9642_9770),
    .OUT_CONDITION_mm_9642_9980(OUT_CONDITION_mm_9642_9980),
    .clock(clock),
    .reset(reset),
    .in_port_in_a(in_a),
    .in_port_in_b(in_b),
    .in_port_out_c(out_c),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_18_i0_LOAD(fuselector_BMEMORY_CTRLN_18_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_18_i0_STORE(fuselector_BMEMORY_CTRLN_18_i0_STORE),
    .fuselector_BMEMORY_CTRLN_18_i1_LOAD(fuselector_BMEMORY_CTRLN_18_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_18_i1_STORE(fuselector_BMEMORY_CTRLN_18_i1_STORE),
    .selector_MUX_107_reg_5_0_0_0(selector_MUX_107_reg_5_0_0_0),
    .selector_MUX_118_reg_6_0_0_0(selector_MUX_118_reg_6_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_3),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_4),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_5),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_6),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_7),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_0_8),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_0),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_1),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_2),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_1_3),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_0),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_2_1),
    .selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0(selector_MUX_1_BMEMORY_CTRLN_18_i0_1_3_0),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_0),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_1),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_2),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_3),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_4),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_5),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_6),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_0_7),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_0),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_1),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_2),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_1_3),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_0),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_2_1),
    .selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0(selector_MUX_4_BMEMORY_CTRLN_18_i1_1_3_0),
    .selector_MUX_74_reg_2_0_0_0(selector_MUX_74_reg_2_0_0_0),
    .selector_MUX_85_reg_3_0_0_0(selector_MUX_85_reg_3_0_0_0),
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

// Minimal interface for function: mm
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module mm(clock,
  reset,
  start_port,
  in_a,
  in_b,
  out_c,
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
  input [31:0] in_a;
  input [31:0] in_b;
  input [31:0] out_c;
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
  
  _mm _mm_i0 (.done_port(done_port),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .in_a(in_a),
    .in_b(in_b),
    .out_c(out_c),
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


