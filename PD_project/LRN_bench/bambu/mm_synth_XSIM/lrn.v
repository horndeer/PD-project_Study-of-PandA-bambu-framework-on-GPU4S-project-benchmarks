// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2023.1 - Revision 04336c437a53bc96ae90b74052c455629946ec8b-main - Date 2024-06-10T15:24:10
// /tmp/.mount_bambu-hnWpS0/usr/bin/bambu executed with: /tmp/.mount_bambu-hnWpS0/usr/bin/bambu --top-fname=lrn --soft-float --flopoco --hls-div --simulate --evaluation --device-name=asap7-BC --simulator=XSIM --experimental-setup=BAMBU-PERFORMANCE-MP /home/gaetan/PD_project/PD_project/LRN_bench/bambu/../cpu_functions/cpu_functions.cpp 
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

// Datapath RTL description for lrn
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_lrn(clock,
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
  fuselector_BMEMORY_CTRLN_32_i0_LOAD,
  fuselector_BMEMORY_CTRLN_32_i0_STORE,
  selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0,
  selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0,
  selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0,
  selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0,
  selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1,
  selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0,
  selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0,
  selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0,
  selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1,
  selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0,
  selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1,
  selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0,
  selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1,
  selector_MUX_52_reg_0_0_0_0,
  selector_MUX_53_reg_1_0_0_0,
  selector_MUX_55_reg_11_0_0_0,
  selector_MUX_56_reg_12_0_0_0,
  selector_MUX_57_reg_13_0_0_0,
  selector_MUX_65_reg_20_0_0_0,
  selector_MUX_66_reg_21_0_0_0,
  selector_MUX_67_reg_22_0_0_0,
  selector_MUX_68_reg_23_0_0_0,
  selector_MUX_71_reg_26_0_0_0,
  selector_MUX_74_reg_3_0_0_0,
  selector_MUX_80_reg_9_0_0_0,
  selector_MUX_80_reg_9_0_0_1,
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
  OUT_CONDITION_lrn_14451_15135,
  OUT_CONDITION_lrn_14451_15147,
  OUT_CONDITION_lrn_14451_15320,
  OUT_CONDITION_lrn_14451_15345,
  OUT_CONDITION_lrn_14451_15347,
  OUT_CONDITION_lrn_14451_15349,
  OUT_CONDITION_lrn_14451_15352,
  OUT_MULTIIF_lrn_14451_17663);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_B;
  input [31:0] in_port_size;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_32_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_32_i0_STORE;
  input selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0;
  input selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0;
  input selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0;
  input selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0;
  input selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1;
  input selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0;
  input selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0;
  input selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1;
  input selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2;
  input selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0;
  input selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0;
  input selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0;
  input selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1;
  input selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0;
  input selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1;
  input selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0;
  input selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1;
  input selector_MUX_52_reg_0_0_0_0;
  input selector_MUX_53_reg_1_0_0_0;
  input selector_MUX_55_reg_11_0_0_0;
  input selector_MUX_56_reg_12_0_0_0;
  input selector_MUX_57_reg_13_0_0_0;
  input selector_MUX_65_reg_20_0_0_0;
  input selector_MUX_66_reg_21_0_0_0;
  input selector_MUX_67_reg_22_0_0_0;
  input selector_MUX_68_reg_23_0_0_0;
  input selector_MUX_71_reg_26_0_0_0;
  input selector_MUX_74_reg_3_0_0_0;
  input selector_MUX_80_reg_9_0_0_0;
  input selector_MUX_80_reg_9_0_0_1;
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
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_CONDITION_lrn_14451_15135;
  output OUT_CONDITION_lrn_14451_15147;
  output OUT_CONDITION_lrn_14451_15320;
  output OUT_CONDITION_lrn_14451_15345;
  output OUT_CONDITION_lrn_14451_15347;
  output OUT_CONDITION_lrn_14451_15349;
  output OUT_CONDITION_lrn_14451_15352;
  output [1:0] OUT_MULTIIF_lrn_14451_17663;
  // Component and signal declarations
  wire [31:0] null_out_signal_BMEMORY_CTRLN_32_i0_out1_1;
  wire [31:0] out_BMEMORY_CTRLN_32_i0_BMEMORY_CTRLN_32_i0;
  wire [0:0] out_IUdata_converter_FU_20_i0_fu_lrn_14451_15332;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0;
  wire [63:0] out_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0;
  wire [63:0] out_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0;
  wire [63:0] out_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0;
  wire [63:0] out_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1;
  wire [63:0] out_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0;
  wire [63:0] out_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0;
  wire [63:0] out_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1;
  wire [63:0] out_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2;
  wire [63:0] out_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0;
  wire [63:0] out_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0;
  wire [63:0] out_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0;
  wire [63:0] out_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1;
  wire [63:0] out_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0;
  wire [63:0] out_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1;
  wire [63:0] out_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0;
  wire [63:0] out_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1;
  wire [31:0] out_MUX_52_reg_0_0_0_0;
  wire [31:0] out_MUX_53_reg_1_0_0_0;
  wire [31:0] out_MUX_55_reg_11_0_0_0;
  wire [63:0] out_MUX_56_reg_12_0_0_0;
  wire [31:0] out_MUX_57_reg_13_0_0_0;
  wire [63:0] out_MUX_65_reg_20_0_0_0;
  wire [63:0] out_MUX_66_reg_21_0_0_0;
  wire [63:0] out_MUX_67_reg_22_0_0_0;
  wire [31:0] out_MUX_68_reg_23_0_0_0;
  wire [63:0] out_MUX_71_reg_26_0_0_0;
  wire [31:0] out_MUX_74_reg_3_0_0_0;
  wire [63:0] out_MUX_80_reg_9_0_0_0;
  wire [63:0] out_MUX_80_reg_9_0_0_1;
  wire out_const_0;
  wire [63:0] out_const_1;
  wire [1:0] out_const_10;
  wire [63:0] out_const_2;
  wire [63:0] out_const_3;
  wire [63:0] out_const_4;
  wire [1:0] out_const_5;
  wire [6:0] out_const_6;
  wire [63:0] out_const_7;
  wire [5:0] out_const_8;
  wire out_const_9;
  wire [31:0] out_conv_out_const_0_1_32;
  wire signed [31:0] out_conv_out_const_5_I_2_I_32;
  wire [5:0] out_conv_out_const_6_7_6;
  wire out_fp_eq_expr_FU_64_0_64_33_i0_fu_lrn_14451_17611;
  wire signed [31:0] out_fp_fix_trunc_expr_64_32_FU_64_32_500_34_i0_fu_lrn_14451_15185;
  wire [63:0] out_fp_float_expr_32_64_FU_32_64_500_35_i0_fu_lrn_14451_15143;
  wire [63:0] out_fp_float_expr_32_64_FU_32_64_500_35_i1_fu_lrn_14451_15270;
  wire [63:0] out_fp_float_expr_32_64_FU_32_64_500_35_i2_fu_lrn_14451_15288;
  wire out_fp_le_expr_FU_64_64_64_500_36_i0_fu_lrn_14451_17613;
  wire [63:0] out_fp_minus_expr_FU_64_64_64_500_37_i0_fp_minus_expr_FU_64_64_64_500_37_i0;
  wire [63:0] out_fp_mult_expr_FU_64_64_64_500_38_i0_fp_mult_expr_FU_64_64_64_500_38_i0;
  wire [63:0] out_fp_plus_expr_FU_64_64_64_500_39_i0_fp_plus_expr_FU_64_64_64_500_39_i0;
  wire [63:0] out_fp_rdiv_expr_FU_64_64_64_400_40_i0_fp_rdiv_expr_FU_64_64_64_400_40_i0;
  wire out_ge_expr_FU_32_32_32_41_i0_fu_lrn_14451_17615;
  wire signed [31:0] out_ii_conv_conn_obj_1_IIdata_converter_FU_ii_conv_0;
  wire [31:0] out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1;
  wire [1:0] out_multi_read_cond_FU_15_i0_fu_lrn_14451_17663;
  wire out_ne_expr_FU_32_0_32_42_i0_fu_lrn_14451_17619;
  wire out_ne_expr_FU_32_0_32_42_i1_fu_lrn_14451_17621;
  wire signed [31:0] out_plus_expr_FU_32_0_32_43_i0_fu_lrn_14451_15280;
  wire signed [31:0] out_plus_expr_FU_32_0_32_43_i1_fu_lrn_14451_15296;
  wire signed [31:0] out_plus_expr_FU_32_0_32_43_i2_fu_lrn_14451_15330;
  wire out_read_cond_FU_17_i0_fu_lrn_14451_15345;
  wire out_read_cond_FU_27_i0_fu_lrn_14451_15347;
  wire out_read_cond_FU_29_i0_fu_lrn_14451_15349;
  wire out_read_cond_FU_2_i0_fu_lrn_14451_15135;
  wire out_read_cond_FU_30_i0_fu_lrn_14451_15352;
  wire out_read_cond_FU_7_i0_fu_lrn_14451_15147;
  wire out_read_cond_FU_9_i0_fu_lrn_14451_15320;
  wire [31:0] out_reg_0_reg_0;
  wire [63:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [63:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [31:0] out_reg_14_reg_14;
  wire out_reg_15_reg_15;
  wire out_reg_16_reg_16;
  wire out_reg_17_reg_17;
  wire out_reg_18_reg_18;
  wire [63:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [63:0] out_reg_20_reg_20;
  wire [63:0] out_reg_21_reg_21;
  wire [63:0] out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire out_reg_24_reg_24;
  wire [63:0] out_reg_25_reg_25;
  wire [63:0] out_reg_26_reg_26;
  wire out_reg_27_reg_27;
  wire [63:0] out_reg_28_reg_28;
  wire [29:0] out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [63:0] out_reg_7_reg_7;
  wire [63:0] out_reg_8_reg_8;
  wire [63:0] out_reg_9_reg_9;
  wire out_truth_and_expr_FU_1_1_1_44_i0_fu_lrn_14451_17669;
  wire out_truth_not_expr_FU_1_1_45_i0_fu_lrn_14451_17666;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_46_i0_fu_lrn_14451_15333;
  wire out_ui_eq_expr_FU_1_0_1_47_i0_fu_lrn_14451_17617;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_48_i0_fu_lrn_14451_15182;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_48_i1_fu_lrn_14451_17587;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_48_i2_fu_lrn_14451_17600;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_48_i3_fu_lrn_14451_17662;
  wire out_ui_ne_expr_FU_32_0_32_49_i0_fu_lrn_14451_17609;
  wire out_ui_ne_expr_FU_32_32_32_50_i0_fu_lrn_14451_17623;
  wire out_ui_ne_expr_FU_32_32_32_50_i1_fu_lrn_14451_17625;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_51_i0_fu_lrn_14451_15152;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_51_i1_fu_lrn_14451_15351;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_52_i0_fu_lrn_14451_17659;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_53_i0_fu_lrn_14451_15141;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_53_i1_fu_lrn_14451_15167;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_53_i2_fu_lrn_14451_17590;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_53_i3_fu_lrn_14451_17603;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_54_i0_fu_lrn_14451_17652;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_54_i1_fu_lrn_14451_17657;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_2;
  wire [31:0] out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3;
  
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_32_i0 (.out1({null_out_signal_BMEMORY_CTRLN_32_i0_out1_1,
      out_BMEMORY_CTRLN_32_i0_BMEMORY_CTRLN_32_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({32'b00000000000000000000000000000000,
      out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0}),
    .in3({6'b000000,
      out_conv_out_const_6_7_6}),
    .in4({1'b0,
      out_const_9}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_32_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_32_i0_STORE}),
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
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_1 (.out1(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1),
    .in1(out_fp_fix_trunc_expr_64_32_FU_64_32_500_34_i0_fu_lrn_14451_15185));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_32_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_53_i2_fu_lrn_14451_17590));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0 (.out1(out_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0),
    .sel(selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_8_reg_8));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0 (.out1(out_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0),
    .sel(selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0),
    .in1(out_reg_12_reg_12),
    .in2(out_const_4));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0 (.out1(out_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0),
    .sel(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_7_reg_7));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1 (.out1(out_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1),
    .sel(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1),
    .in1(out_fp_mult_expr_FU_64_64_64_500_38_i0_fp_mult_expr_FU_64_64_64_500_38_i0),
    .in2(out_fp_rdiv_expr_FU_64_64_64_400_40_i0_fp_rdiv_expr_FU_64_64_64_400_40_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0 (.out1(out_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0),
    .sel(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0),
    .in1(out_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0),
    .in2(out_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0 (.out1(out_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0),
    .sel(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0),
    .in1(out_reg_7_reg_7),
    .in2(out_reg_22_reg_22));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1 (.out1(out_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1),
    .sel(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1),
    .in1(out_reg_12_reg_12),
    .in2(out_const_2));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2 (.out1(out_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2),
    .sel(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2),
    .in1(out_const_3),
    .in2(out_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0 (.out1(out_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0),
    .sel(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0),
    .in1(out_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1),
    .in2(out_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0 (.out1(out_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0),
    .sel(selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_fp_mult_expr_FU_64_64_64_500_38_i0_fp_mult_expr_FU_64_64_64_500_38_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0 (.out1(out_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0),
    .sel(selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0),
    .in1(out_reg_21_reg_21),
    .in2(out_reg_12_reg_12));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1 (.out1(out_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1),
    .sel(selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1),
    .in1(out_const_7),
    .in2(out_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0 (.out1(out_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0),
    .sel(selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0),
    .in1(out_reg_7_reg_7),
    .in2(out_reg_20_reg_20));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1 (.out1(out_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1),
    .sel(selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1),
    .in1(out_reg_10_reg_10),
    .in2(out_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0 (.out1(out_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0),
    .sel(selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0),
    .in1(out_reg_26_reg_26),
    .in2(out_reg_25_reg_25));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1 (.out1(out_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1),
    .sel(selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1),
    .in1(out_reg_19_reg_19),
    .in2(out_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_52_reg_0_0_0_0 (.out1(out_MUX_52_reg_0_0_0_0),
    .sel(selector_MUX_52_reg_0_0_0_0),
    .in1(out_ui_lshift_expr_FU_32_0_32_48_i3_fu_lrn_14451_17662),
    .in2(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_53_reg_1_0_0_0 (.out1(out_MUX_53_reg_1_0_0_0),
    .sel(selector_MUX_53_reg_1_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_51_i1_fu_lrn_14451_15351),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_2));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_55_reg_11_0_0_0 (.out1(out_MUX_55_reg_11_0_0_0),
    .sel(selector_MUX_55_reg_11_0_0_0),
    .in1(out_reg_14_reg_14),
    .in2(out_ii_conv_conn_obj_1_IIdata_converter_FU_ii_conv_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_56_reg_12_0_0_0 (.out1(out_MUX_56_reg_12_0_0_0),
    .sel(selector_MUX_56_reg_12_0_0_0),
    .in1(out_const_4),
    .in2(out_fp_mult_expr_FU_64_64_64_500_38_i0_fp_mult_expr_FU_64_64_64_500_38_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_57_reg_13_0_0_0 (.out1(out_MUX_57_reg_13_0_0_0),
    .sel(selector_MUX_57_reg_13_0_0_0),
    .in1(out_ii_conv_conn_obj_1_IIdata_converter_FU_ii_conv_0),
    .in2(out_plus_expr_FU_32_0_32_43_i0_fu_lrn_14451_15280));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_65_reg_20_0_0_0 (.out1(out_MUX_65_reg_20_0_0_0),
    .sel(selector_MUX_65_reg_20_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_mult_expr_FU_64_64_64_500_38_i0_fp_mult_expr_FU_64_64_64_500_38_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_66_reg_21_0_0_0 (.out1(out_MUX_66_reg_21_0_0_0),
    .sel(selector_MUX_66_reg_21_0_0_0),
    .in1(out_const_4),
    .in2(out_fp_plus_expr_FU_64_64_64_500_39_i0_fp_plus_expr_FU_64_64_64_500_39_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_67_reg_22_0_0_0 (.out1(out_MUX_67_reg_22_0_0_0),
    .sel(selector_MUX_67_reg_22_0_0_0),
    .in1(out_const_4),
    .in2(out_fp_mult_expr_FU_64_64_64_500_38_i0_fp_mult_expr_FU_64_64_64_500_38_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_68_reg_23_0_0_0 (.out1(out_MUX_68_reg_23_0_0_0),
    .sel(selector_MUX_68_reg_23_0_0_0),
    .in1(out_ii_conv_conn_obj_1_IIdata_converter_FU_ii_conv_0),
    .in2(out_plus_expr_FU_32_0_32_43_i1_fu_lrn_14451_15296));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_71_reg_26_0_0_0 (.out1(out_MUX_71_reg_26_0_0_0),
    .sel(selector_MUX_71_reg_26_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_plus_expr_FU_64_64_64_500_39_i0_fp_plus_expr_FU_64_64_64_500_39_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_74_reg_3_0_0_0 (.out1(out_MUX_74_reg_3_0_0_0),
    .sel(selector_MUX_74_reg_3_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_51_i0_fu_lrn_14451_15152),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_2));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_80_reg_9_0_0_0 (.out1(out_MUX_80_reg_9_0_0_0),
    .sel(selector_MUX_80_reg_9_0_0_0),
    .in1(out_const_1),
    .in2(out_fp_minus_expr_FU_64_64_64_500_37_i0_fp_minus_expr_FU_64_64_64_500_37_i0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_80_reg_9_0_0_1 (.out1(out_MUX_80_reg_9_0_0_1),
    .sel(selector_MUX_80_reg_9_0_0_1),
    .in1(out_fp_plus_expr_FU_64_64_64_500_39_i0_fp_plus_expr_FU_64_64_64_500_39_i0),
    .in2(out_MUX_80_reg_9_0_0_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_2),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_3 (.out1(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3),
    .in1(out_conv_out_const_0_1_32));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0000000000000000000000000000000000000000000000000000000000000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0011111101010000011000100100110111010010111100011010100111111100)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0011111111101000000000000000000000000000000000000000000000000000)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0011111111110000000000000000000000000000000000000000000000000000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_6 (.out1(out_const_6));
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
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_6_7_6 (.out1(out_conv_out_const_6_7_6),
    .in1(out_const_6));
  fp_minus_expr_FU_64_64_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fp_minus_expr_FU_64_64_64_500_37_i0 (.R(out_fp_minus_expr_FU_64_64_64_500_37_i0_fp_minus_expr_FU_64_64_64_500_37_i0),
    .clock(clock),
    .reset(reset),
    .X(out_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0),
    .Y(out_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0));
  fp_mult_expr_FU_64_64_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fp_mult_expr_FU_64_64_64_500_38_i0 (.R(out_fp_mult_expr_FU_64_64_64_500_38_i0_fp_mult_expr_FU_64_64_64_500_38_i0),
    .clock(clock),
    .reset(reset),
    .X(out_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0),
    .Y(out_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0));
  fp_plus_expr_FU_64_64_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fp_plus_expr_FU_64_64_64_500_39_i0 (.R(out_fp_plus_expr_FU_64_64_64_500_39_i0_fp_plus_expr_FU_64_64_64_500_39_i0),
    .clock(clock),
    .reset(reset),
    .X(out_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0),
    .Y(out_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1));
  fp_rdiv_expr_FU_64_64_400 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(64)) fp_rdiv_expr_FU_64_64_64_400_40_i0 (.R(out_fp_rdiv_expr_FU_64_64_64_400_40_i0_fp_rdiv_expr_FU_64_64_64_400_40_i0),
    .clock(clock),
    .reset(reset),
    .X(out_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1),
    .Y(out_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_lrn_14451_15135 (.out1(out_read_cond_FU_2_i0_fu_lrn_14451_15135),
    .in1(out_ui_ne_expr_FU_32_0_32_49_i0_fu_lrn_14451_17609));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_lrn_14451_15141 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_53_i0_fu_lrn_14451_15141),
    .in1(in_port_A),
    .in2(out_reg_0_reg_0));
  fp_float_expr_32_64_FU_32_64_500 #(.BITSIZE_I(32),
    .BITSIZE_O(64)) fu_lrn_14451_15143 (.O(out_fp_float_expr_32_64_FU_32_64_500_35_i0_fu_lrn_14451_15143),
    .clock(clock),
    .reset(reset),
    .I(out_BMEMORY_CTRLN_32_i0_BMEMORY_CTRLN_32_i0));
  read_cond_FU #(.BITSIZE_in1(1)) fu_lrn_14451_15147 (.out1(out_read_cond_FU_7_i0_fu_lrn_14451_15147),
    .in1(out_fp_eq_expr_FU_64_0_64_33_i0_fu_lrn_14451_17611));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_lrn_14451_15152 (.out1(out_ui_plus_expr_FU_32_0_32_51_i0_fu_lrn_14451_15152),
    .in1(out_reg_3_reg_3),
    .in2(out_const_9));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_lrn_14451_15167 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_53_i1_fu_lrn_14451_15167),
    .in1(in_port_B),
    .in2(out_reg_0_reg_0));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_lrn_14451_15182 (.out1(out_ui_lshift_expr_FU_32_0_32_48_i0_fu_lrn_14451_15182),
    .in1(in_port_size),
    .in2(out_const_10));
  fp_fix_trunc_expr_64_32_FU_64_32_500 #(.BITSIZE_I(64),
    .BITSIZE_O(32)) fu_lrn_14451_15185 (.O(out_fp_fix_trunc_expr_64_32_FU_64_32_500_34_i0_fu_lrn_14451_15185),
    .clock(clock),
    .reset(reset),
    .I(out_reg_28_reg_28));
  fp_float_expr_32_64_FU_32_64_500 #(.BITSIZE_I(32),
    .BITSIZE_O(64)) fu_lrn_14451_15270 (.O(out_fp_float_expr_32_64_FU_32_64_500_35_i1_fu_lrn_14451_15270),
    .clock(clock),
    .reset(reset),
    .I(out_reg_13_reg_13));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_lrn_14451_15280 (.out1(out_plus_expr_FU_32_0_32_43_i0_fu_lrn_14451_15280),
    .in1(out_reg_13_reg_13),
    .in2(out_const_5));
  fp_float_expr_32_64_FU_32_64_500 #(.BITSIZE_I(32),
    .BITSIZE_O(64)) fu_lrn_14451_15288 (.O(out_fp_float_expr_32_64_FU_32_64_500_35_i2_fu_lrn_14451_15288),
    .clock(clock),
    .reset(reset),
    .I(out_reg_23_reg_23));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_lrn_14451_15296 (.out1(out_plus_expr_FU_32_0_32_43_i1_fu_lrn_14451_15296),
    .in1(out_reg_23_reg_23),
    .in2(out_const_5));
  read_cond_FU #(.BITSIZE_in1(1)) fu_lrn_14451_15320 (.out1(out_read_cond_FU_9_i0_fu_lrn_14451_15320),
    .in1(out_fp_le_expr_FU_64_64_64_500_36_i0_fu_lrn_14451_17613));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_lrn_14451_15330 (.out1(out_plus_expr_FU_32_0_32_43_i2_fu_lrn_14451_15330),
    .in1(out_reg_11_reg_11),
    .in2(out_const_5));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_lrn_14451_15332 (.out1(out_IUdata_converter_FU_20_i0_fu_lrn_14451_15332),
    .in1(out_reg_11_reg_11));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_lrn_14451_15333 (.out1(out_ui_bit_and_expr_FU_1_0_1_46_i0_fu_lrn_14451_15333),
    .in1(out_IUdata_converter_FU_20_i0_fu_lrn_14451_15332),
    .in2(out_const_9));
  read_cond_FU #(.BITSIZE_in1(1)) fu_lrn_14451_15345 (.out1(out_read_cond_FU_17_i0_fu_lrn_14451_15345),
    .in1(out_reg_16_reg_16));
  read_cond_FU #(.BITSIZE_in1(1)) fu_lrn_14451_15347 (.out1(out_read_cond_FU_27_i0_fu_lrn_14451_15347),
    .in1(out_reg_24_reg_24));
  read_cond_FU #(.BITSIZE_in1(1)) fu_lrn_14451_15349 (.out1(out_read_cond_FU_29_i0_fu_lrn_14451_15349),
    .in1(out_reg_27_reg_27));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_lrn_14451_15351 (.out1(out_ui_plus_expr_FU_32_0_32_51_i1_fu_lrn_14451_15351),
    .in1(out_reg_1_reg_1),
    .in2(out_const_9));
  read_cond_FU #(.BITSIZE_in1(1)) fu_lrn_14451_15352 (.out1(out_read_cond_FU_30_i0_fu_lrn_14451_15352),
    .in1(out_ui_ne_expr_FU_32_32_32_50_i1_fu_lrn_14451_17625));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_lrn_14451_17587 (.out1(out_ui_lshift_expr_FU_32_0_32_48_i1_fu_lrn_14451_17587),
    .in1(out_reg_3_reg_3),
    .in2(out_const_10));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_lrn_14451_17590 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_53_i2_fu_lrn_14451_17590),
    .in1(out_reg_5_reg_5),
    .in2(out_ui_lshift_expr_FU_32_0_32_48_i1_fu_lrn_14451_17587));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_lrn_14451_17600 (.out1(out_ui_lshift_expr_FU_32_0_32_48_i2_fu_lrn_14451_17600),
    .in1(out_reg_3_reg_3),
    .in2(out_const_10));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_lrn_14451_17603 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_53_i3_fu_lrn_14451_17603),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_lshift_expr_FU_32_0_32_48_i2_fu_lrn_14451_17600));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_lrn_14451_17609 (.out1(out_ui_ne_expr_FU_32_0_32_49_i0_fu_lrn_14451_17609),
    .in1(in_port_size),
    .in2(out_const_0));
  fp_eq_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(1)) fu_lrn_14451_17611 (.out1(out_fp_eq_expr_FU_64_0_64_33_i0_fu_lrn_14451_17611),
    .in1(out_fp_plus_expr_FU_64_64_64_500_39_i0_fp_plus_expr_FU_64_64_64_500_39_i0),
    .in2(out_const_1));
  fp_le_expr_FU_64_1_500 #(.BITSIZE_X(64),
    .BITSIZE_Y(64),
    .BITSIZE_R(1)) fu_lrn_14451_17613 (.R(out_fp_le_expr_FU_64_64_64_500_36_i0_fu_lrn_14451_17613),
    .clock(clock),
    .reset(reset),
    .X(out_reg_8_reg_8),
    .Y(out_const_1));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_lrn_14451_17615 (.out1(out_ge_expr_FU_32_32_32_41_i0_fu_lrn_14451_17615),
    .in1(out_reg_11_reg_11),
    .in2(out_plus_expr_FU_32_0_32_43_i0_fu_lrn_14451_15280));
  ui_eq_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_lrn_14451_17617 (.out1(out_ui_eq_expr_FU_1_0_1_47_i0_fu_lrn_14451_17617),
    .in1(out_ui_bit_and_expr_FU_1_0_1_46_i0_fu_lrn_14451_15333),
    .in2(out_const_0));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu_lrn_14451_17619 (.out1(out_ne_expr_FU_32_0_32_42_i0_fu_lrn_14451_17619),
    .in1(out_plus_expr_FU_32_0_32_43_i2_fu_lrn_14451_15330),
    .in2(out_const_8));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu_lrn_14451_17621 (.out1(out_ne_expr_FU_32_0_32_42_i1_fu_lrn_14451_17621),
    .in1(out_plus_expr_FU_32_0_32_43_i1_fu_lrn_14451_15296),
    .in2(out_const_8));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_lrn_14451_17623 (.out1(out_ui_ne_expr_FU_32_32_32_50_i0_fu_lrn_14451_17623),
    .in1(out_reg_3_reg_3),
    .in2(in_port_size));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_lrn_14451_17625 (.out1(out_ui_ne_expr_FU_32_32_32_50_i1_fu_lrn_14451_17625),
    .in1(out_reg_1_reg_1),
    .in2(in_port_size));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_lrn_14451_17652 (.out1(out_ui_rshift_expr_FU_32_0_32_54_i0_fu_lrn_14451_17652),
    .in1(out_reg_0_reg_0),
    .in2(out_const_10));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(30),
    .PRECISION(32)) fu_lrn_14451_17657 (.out1(out_ui_rshift_expr_FU_32_0_32_54_i1_fu_lrn_14451_17657),
    .in1(out_ui_lshift_expr_FU_32_0_32_48_i0_fu_lrn_14451_15182),
    .in2(out_const_10));
  ui_plus_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(30),
    .BITSIZE_out1(30)) fu_lrn_14451_17659 (.out1(out_ui_plus_expr_FU_32_32_32_52_i0_fu_lrn_14451_17659),
    .in1(out_ui_rshift_expr_FU_32_0_32_54_i0_fu_lrn_14451_17652),
    .in2(out_reg_2_reg_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_lrn_14451_17662 (.out1(out_ui_lshift_expr_FU_32_0_32_48_i3_fu_lrn_14451_17662),
    .in1(out_ui_plus_expr_FU_32_32_32_52_i0_fu_lrn_14451_17659),
    .in2(out_const_10));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_lrn_14451_17663 (.out1(out_multi_read_cond_FU_15_i0_fu_lrn_14451_17663),
    .in1({out_reg_18_reg_18,
      out_reg_17_reg_17}));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_lrn_14451_17666 (.out1(out_truth_not_expr_FU_1_1_45_i0_fu_lrn_14451_17666),
    .in1(out_ge_expr_FU_32_32_32_41_i0_fu_lrn_14451_17615));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_lrn_14451_17669 (.out1(out_truth_and_expr_FU_1_1_1_44_i0_fu_lrn_14451_17669),
    .in1(out_reg_15_reg_15),
    .in2(out_truth_not_expr_FU_1_1_45_i0_fu_lrn_14451_17666));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_52_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_53_reg_1_0_0_0),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_fp_minus_expr_FU_64_64_64_500_37_i0_fp_minus_expr_FU_64_64_64_500_37_i0),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_55_reg_11_0_0_0),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_56_reg_12_0_0_0),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_57_reg_13_0_0_0),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_43_i2_fu_lrn_14451_15330),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_1_0_1_47_i0_fu_lrn_14451_17617),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_0_32_42_i0_fu_lrn_14451_17619),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_32_32_41_i0_fu_lrn_14451_17615),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_truth_and_expr_FU_1_1_1_44_i0_fu_lrn_14451_17669),
    .wenable(wrenable_reg_18));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_fp_float_expr_32_64_FU_32_64_500_35_i1_fu_lrn_14451_15270),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(30),
    .BITSIZE_out1(30)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_54_i1_fu_lrn_14451_17657),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_65_reg_20_0_0_0),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_66_reg_21_0_0_0),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_67_reg_22_0_0_0),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_68_reg_23_0_0_0),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_0_32_42_i1_fu_lrn_14451_17621),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_fp_float_expr_32_64_FU_32_64_500_35_i2_fu_lrn_14451_15288),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_71_reg_26_0_0_0),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_50_i0_fu_lrn_14451_17623),
    .wenable(wrenable_reg_27));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_fp_rdiv_expr_FU_64_64_64_400_40_i0_fp_rdiv_expr_FU_64_64_64_400_40_i0),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_74_reg_3_0_0_0),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_53_i1_fu_lrn_14451_15167),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_53_i0_fu_lrn_14451_15141),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_53_i3_fu_lrn_14451_17603),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_fp_float_expr_32_64_FU_32_64_500_35_i0_fu_lrn_14451_15143),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_fp_plus_expr_FU_64_64_64_500_39_i0_fp_plus_expr_FU_64_64_64_500_39_i0),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_80_reg_9_0_0_1),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION_lrn_14451_15135 = out_read_cond_FU_2_i0_fu_lrn_14451_15135;
  assign OUT_CONDITION_lrn_14451_15147 = out_read_cond_FU_7_i0_fu_lrn_14451_15147;
  assign OUT_CONDITION_lrn_14451_15320 = out_read_cond_FU_9_i0_fu_lrn_14451_15320;
  assign OUT_CONDITION_lrn_14451_15345 = out_read_cond_FU_17_i0_fu_lrn_14451_15345;
  assign OUT_CONDITION_lrn_14451_15347 = out_read_cond_FU_27_i0_fu_lrn_14451_15347;
  assign OUT_CONDITION_lrn_14451_15349 = out_read_cond_FU_29_i0_fu_lrn_14451_15349;
  assign OUT_CONDITION_lrn_14451_15352 = out_read_cond_FU_30_i0_fu_lrn_14451_15352;
  assign OUT_MULTIIF_lrn_14451_17663 = out_multi_read_cond_FU_15_i0_fu_lrn_14451_17663;

endmodule

// FSM based controller description for lrn
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_lrn(done_port,
  fuselector_BMEMORY_CTRLN_32_i0_LOAD,
  fuselector_BMEMORY_CTRLN_32_i0_STORE,
  selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0,
  selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0,
  selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0,
  selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0,
  selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1,
  selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2,
  selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0,
  selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0,
  selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0,
  selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1,
  selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0,
  selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1,
  selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0,
  selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1,
  selector_MUX_52_reg_0_0_0_0,
  selector_MUX_53_reg_1_0_0_0,
  selector_MUX_55_reg_11_0_0_0,
  selector_MUX_56_reg_12_0_0_0,
  selector_MUX_57_reg_13_0_0_0,
  selector_MUX_65_reg_20_0_0_0,
  selector_MUX_66_reg_21_0_0_0,
  selector_MUX_67_reg_22_0_0_0,
  selector_MUX_68_reg_23_0_0_0,
  selector_MUX_71_reg_26_0_0_0,
  selector_MUX_74_reg_3_0_0_0,
  selector_MUX_80_reg_9_0_0_0,
  selector_MUX_80_reg_9_0_0_1,
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
  OUT_CONDITION_lrn_14451_15135,
  OUT_CONDITION_lrn_14451_15147,
  OUT_CONDITION_lrn_14451_15320,
  OUT_CONDITION_lrn_14451_15345,
  OUT_CONDITION_lrn_14451_15347,
  OUT_CONDITION_lrn_14451_15349,
  OUT_CONDITION_lrn_14451_15352,
  OUT_MULTIIF_lrn_14451_17663,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_lrn_14451_15135;
  input OUT_CONDITION_lrn_14451_15147;
  input OUT_CONDITION_lrn_14451_15320;
  input OUT_CONDITION_lrn_14451_15345;
  input OUT_CONDITION_lrn_14451_15347;
  input OUT_CONDITION_lrn_14451_15349;
  input OUT_CONDITION_lrn_14451_15352;
  input [1:0] OUT_MULTIIF_lrn_14451_17663;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_32_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_32_i0_STORE;
  output selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0;
  output selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0;
  output selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0;
  output selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0;
  output selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1;
  output selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0;
  output selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0;
  output selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1;
  output selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2;
  output selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0;
  output selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0;
  output selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0;
  output selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1;
  output selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0;
  output selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1;
  output selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0;
  output selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1;
  output selector_MUX_52_reg_0_0_0_0;
  output selector_MUX_53_reg_1_0_0_0;
  output selector_MUX_55_reg_11_0_0_0;
  output selector_MUX_56_reg_12_0_0_0;
  output selector_MUX_57_reg_13_0_0_0;
  output selector_MUX_65_reg_20_0_0_0;
  output selector_MUX_66_reg_21_0_0_0;
  output selector_MUX_67_reg_22_0_0_0;
  output selector_MUX_68_reg_23_0_0_0;
  output selector_MUX_71_reg_26_0_0_0;
  output selector_MUX_74_reg_3_0_0_0;
  output selector_MUX_80_reg_9_0_0_0;
  output selector_MUX_80_reg_9_0_0_1;
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
    S_250 = 8'd250,
    S_249 = 8'd249,
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
    S_62 = 8'd62,
    S_63 = 8'd63,
    S_64 = 8'd64,
    S_65 = 8'd65,
    S_141 = 8'd141,
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
    S_104 = 8'd104,
    S_105 = 8'd105,
    S_106 = 8'd106,
    S_107 = 8'd107,
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
    S_136 = 8'd136,
    S_137 = 8'd137,
    S_138 = 8'd138,
    S_139 = 8'd139,
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
    S_120 = 8'd120,
    S_121 = 8'd121,
    S_122 = 8'd122,
    S_123 = 8'd123,
    S_140 = 8'd140,
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
    S_236 = 8'd236,
    S_237 = 8'd237,
    S_238 = 8'd238,
    S_239 = 8'd239,
    S_240 = 8'd240,
    S_241 = 8'd241,
    S_242 = 8'd242,
    S_243 = 8'd243,
    S_244 = 8'd244,
    S_245 = 8'd245,
    S_246 = 8'd246,
    S_247 = 8'd247,
    S_248 = 8'd248,
    S_251 = 8'd251;
  reg [7:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_32_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_32_i0_STORE;
  reg selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0;
  reg selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0;
  reg selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0;
  reg selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0;
  reg selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1;
  reg selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0;
  reg selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0;
  reg selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1;
  reg selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2;
  reg selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0;
  reg selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0;
  reg selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0;
  reg selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1;
  reg selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0;
  reg selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1;
  reg selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0;
  reg selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1;
  reg selector_MUX_52_reg_0_0_0_0;
  reg selector_MUX_53_reg_1_0_0_0;
  reg selector_MUX_55_reg_11_0_0_0;
  reg selector_MUX_56_reg_12_0_0_0;
  reg selector_MUX_57_reg_13_0_0_0;
  reg selector_MUX_65_reg_20_0_0_0;
  reg selector_MUX_66_reg_21_0_0_0;
  reg selector_MUX_67_reg_22_0_0_0;
  reg selector_MUX_68_reg_23_0_0_0;
  reg selector_MUX_71_reg_26_0_0_0;
  reg selector_MUX_74_reg_3_0_0_0;
  reg selector_MUX_80_reg_9_0_0_0;
  reg selector_MUX_80_reg_9_0_0_1;
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
    fuselector_BMEMORY_CTRLN_32_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_32_i0_STORE = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0 = 1'b0;
    selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0 = 1'b0;
    selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0 = 1'b0;
    selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0 = 1'b0;
    selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1 = 1'b0;
    selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0 = 1'b0;
    selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0 = 1'b0;
    selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1 = 1'b0;
    selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2 = 1'b0;
    selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0 = 1'b0;
    selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0 = 1'b0;
    selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0 = 1'b0;
    selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1 = 1'b0;
    selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0 = 1'b0;
    selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1 = 1'b0;
    selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0 = 1'b0;
    selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1 = 1'b0;
    selector_MUX_52_reg_0_0_0_0 = 1'b0;
    selector_MUX_53_reg_1_0_0_0 = 1'b0;
    selector_MUX_55_reg_11_0_0_0 = 1'b0;
    selector_MUX_56_reg_12_0_0_0 = 1'b0;
    selector_MUX_57_reg_13_0_0_0 = 1'b0;
    selector_MUX_65_reg_20_0_0_0 = 1'b0;
    selector_MUX_66_reg_21_0_0_0 = 1'b0;
    selector_MUX_67_reg_22_0_0_0 = 1'b0;
    selector_MUX_68_reg_23_0_0_0 = 1'b0;
    selector_MUX_71_reg_26_0_0_0 = 1'b0;
    selector_MUX_74_reg_3_0_0_0 = 1'b0;
    selector_MUX_80_reg_9_0_0_0 = 1'b0;
    selector_MUX_80_reg_9_0_0_1 = 1'b0;
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
          if (OUT_CONDITION_lrn_14451_15135 == 1'b1)
            begin
              _next_state = S_249;
            end
          else
            begin
              _next_state = S_250;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
              wrenable_reg_2 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_250 :
        begin
          _next_state = S_0;
        end
      S_249 :
        begin
          selector_MUX_52_reg_0_0_0_0 = 1'b1;
          selector_MUX_53_reg_1_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          _next_state = S_1;
        end
      S_1 :
        begin
          fuselector_BMEMORY_CTRLN_32_i0_LOAD = 1'b1;
          selector_MUX_74_reg_3_0_0_0 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_6 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
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
          wrenable_reg_7 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0 = 1'b1;
          selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0 = 1'b1;
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
          selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1 = 1'b1;
          selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0 = 1'b1;
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
          selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1 = 1'b1;
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
          selector_MUX_71_reg_26_0_0_0 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_8 = 1'b1;
          if (OUT_CONDITION_lrn_14451_15147 == 1'b1)
            begin
              _next_state = S_207;
              wrenable_reg_8 = 1'b0;
            end
          else
            begin
              _next_state = S_34;
              selector_MUX_71_reg_26_0_0_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
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
          _next_state = S_46;
        end
      S_46 :
        begin
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
          selector_MUX_65_reg_20_0_0_0 = 1'b1;
          wrenable_reg_20 = 1'b1;
          if (OUT_CONDITION_lrn_14451_15320 == 1'b1)
            begin
              _next_state = S_149;
            end
          else
            begin
              _next_state = S_50;
              selector_MUX_65_reg_20_0_0_0 = 1'b0;
              wrenable_reg_20 = 1'b0;
            end
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
          selector_MUX_80_reg_9_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_141;
        end
      S_141 :
        begin
          selector_MUX_56_reg_12_0_0_0 = 1'b1;
          selector_MUX_57_reg_13_0_0_0 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          _next_state = S_66;
        end
      S_66 :
        begin
          wrenable_reg_13 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
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
          wrenable_reg_19 = 1'b1;
          _next_state = S_70;
        end
      S_70 :
        begin
          selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1 = 1'b1;
          selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1 = 1'b1;
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
          selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1 = 1'b1;
          selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0 = 1'b1;
          _next_state = S_102;
        end
      S_102 :
        begin
          _next_state = S_103;
        end
      S_103 :
        begin
          _next_state = S_104;
        end
      S_104 :
        begin
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
          wrenable_reg_12 = 1'b1;
          casez (OUT_MULTIIF_lrn_14451_17663)
            2'b01 :
              begin
                _next_state = S_66;
              end
            2'b10 :
              begin
                _next_state = S_108;
              end
            default:
              begin
                _next_state = S_124;
              end
          endcase
        end
      S_124 :
        begin
          selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0 = 1'b1;
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
          selector_MUX_80_reg_9_0_0_1 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_140;
        end
      S_108 :
        begin
          selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0 = 1'b1;
          selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0 = 1'b1;
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
          wrenable_reg_9 = 1'b1;
          _next_state = S_140;
        end
      S_140 :
        begin
          selector_MUX_55_reg_11_0_0_0 = 1'b1;
          wrenable_reg_11 = 1'b1;
          if (OUT_CONDITION_lrn_14451_15345 == 1'b1)
            begin
              _next_state = S_141;
            end
          else
            begin
              _next_state = S_142;
              selector_MUX_55_reg_11_0_0_0 = 1'b0;
              wrenable_reg_11 = 1'b0;
            end
        end
      S_142 :
        begin
          selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0 = 1'b1;
          selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0 = 1'b1;
          selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2 = 1'b1;
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
          wrenable_reg_20 = 1'b1;
          _next_state = S_149;
        end
      S_149 :
        begin
          selector_MUX_66_reg_21_0_0_0 = 1'b1;
          selector_MUX_67_reg_22_0_0_0 = 1'b1;
          selector_MUX_68_reg_23_0_0_0 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          _next_state = S_150;
        end
      S_150 :
        begin
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
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
          wrenable_reg_25 = 1'b1;
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
          selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0 = 1'b1;
          wrenable_reg_22 = 1'b1;
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
          _next_state = S_203;
        end
      S_203 :
        begin
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
          wrenable_reg_21 = 1'b1;
          wrenable_reg_26 = 1'b1;
          if (OUT_CONDITION_lrn_14451_15347 == 1'b1)
            begin
              _next_state = S_150;
              wrenable_reg_26 = 1'b0;
            end
          else
            begin
              _next_state = S_207;
              wrenable_reg_21 = 1'b0;
            end
        end
      S_207 :
        begin
          selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0 = 1'b1;
          selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0 = 1'b1;
          wrenable_reg_27 = 1'b1;
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
          wrenable_reg_28 = 1'b1;
          _next_state = S_239;
        end
      S_239 :
        begin
          _next_state = S_240;
        end
      S_240 :
        begin
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
          fuselector_BMEMORY_CTRLN_32_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0 = 1'b1;
          if (OUT_CONDITION_lrn_14451_15349 == 1'b1)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_248;
            end
        end
      S_248 :
        begin
          if (OUT_CONDITION_lrn_14451_15352 == 1'b1)
            begin
              _next_state = S_249;
            end
          else
            begin
              _next_state = S_251;
              done_port = 1'b1;
            end
        end
      S_251 :
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

// Top component for lrn
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _lrn(clock,
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
  wire OUT_CONDITION_lrn_14451_15135;
  wire OUT_CONDITION_lrn_14451_15147;
  wire OUT_CONDITION_lrn_14451_15320;
  wire OUT_CONDITION_lrn_14451_15345;
  wire OUT_CONDITION_lrn_14451_15347;
  wire OUT_CONDITION_lrn_14451_15349;
  wire OUT_CONDITION_lrn_14451_15352;
  wire [1:0] OUT_MULTIIF_lrn_14451_17663;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_32_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_32_i0_STORE;
  wire selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0;
  wire selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0;
  wire selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0;
  wire selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0;
  wire selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1;
  wire selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0;
  wire selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0;
  wire selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1;
  wire selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2;
  wire selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0;
  wire selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0;
  wire selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0;
  wire selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1;
  wire selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0;
  wire selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1;
  wire selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0;
  wire selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1;
  wire selector_MUX_52_reg_0_0_0_0;
  wire selector_MUX_53_reg_1_0_0_0;
  wire selector_MUX_55_reg_11_0_0_0;
  wire selector_MUX_56_reg_12_0_0_0;
  wire selector_MUX_57_reg_13_0_0_0;
  wire selector_MUX_65_reg_20_0_0_0;
  wire selector_MUX_66_reg_21_0_0_0;
  wire selector_MUX_67_reg_22_0_0_0;
  wire selector_MUX_68_reg_23_0_0_0;
  wire selector_MUX_71_reg_26_0_0_0;
  wire selector_MUX_74_reg_3_0_0_0;
  wire selector_MUX_80_reg_9_0_0_0;
  wire selector_MUX_80_reg_9_0_0_1;
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
  
  controller_lrn Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_32_i0_LOAD(fuselector_BMEMORY_CTRLN_32_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_32_i0_STORE(fuselector_BMEMORY_CTRLN_32_i0_STORE),
    .selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0),
    .selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0(selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0),
    .selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0(selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0),
    .selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0),
    .selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1),
    .selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0),
    .selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0(selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0),
    .selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0(selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0),
    .selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1(selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1),
    .selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0(selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0),
    .selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1(selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1),
    .selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0(selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0),
    .selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1(selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1),
    .selector_MUX_52_reg_0_0_0_0(selector_MUX_52_reg_0_0_0_0),
    .selector_MUX_53_reg_1_0_0_0(selector_MUX_53_reg_1_0_0_0),
    .selector_MUX_55_reg_11_0_0_0(selector_MUX_55_reg_11_0_0_0),
    .selector_MUX_56_reg_12_0_0_0(selector_MUX_56_reg_12_0_0_0),
    .selector_MUX_57_reg_13_0_0_0(selector_MUX_57_reg_13_0_0_0),
    .selector_MUX_65_reg_20_0_0_0(selector_MUX_65_reg_20_0_0_0),
    .selector_MUX_66_reg_21_0_0_0(selector_MUX_66_reg_21_0_0_0),
    .selector_MUX_67_reg_22_0_0_0(selector_MUX_67_reg_22_0_0_0),
    .selector_MUX_68_reg_23_0_0_0(selector_MUX_68_reg_23_0_0_0),
    .selector_MUX_71_reg_26_0_0_0(selector_MUX_71_reg_26_0_0_0),
    .selector_MUX_74_reg_3_0_0_0(selector_MUX_74_reg_3_0_0_0),
    .selector_MUX_80_reg_9_0_0_0(selector_MUX_80_reg_9_0_0_0),
    .selector_MUX_80_reg_9_0_0_1(selector_MUX_80_reg_9_0_0_1),
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
    .OUT_CONDITION_lrn_14451_15135(OUT_CONDITION_lrn_14451_15135),
    .OUT_CONDITION_lrn_14451_15147(OUT_CONDITION_lrn_14451_15147),
    .OUT_CONDITION_lrn_14451_15320(OUT_CONDITION_lrn_14451_15320),
    .OUT_CONDITION_lrn_14451_15345(OUT_CONDITION_lrn_14451_15345),
    .OUT_CONDITION_lrn_14451_15347(OUT_CONDITION_lrn_14451_15347),
    .OUT_CONDITION_lrn_14451_15349(OUT_CONDITION_lrn_14451_15349),
    .OUT_CONDITION_lrn_14451_15352(OUT_CONDITION_lrn_14451_15352),
    .OUT_MULTIIF_lrn_14451_17663(OUT_MULTIIF_lrn_14451_17663),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_lrn Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_lrn_14451_15135(OUT_CONDITION_lrn_14451_15135),
    .OUT_CONDITION_lrn_14451_15147(OUT_CONDITION_lrn_14451_15147),
    .OUT_CONDITION_lrn_14451_15320(OUT_CONDITION_lrn_14451_15320),
    .OUT_CONDITION_lrn_14451_15345(OUT_CONDITION_lrn_14451_15345),
    .OUT_CONDITION_lrn_14451_15347(OUT_CONDITION_lrn_14451_15347),
    .OUT_CONDITION_lrn_14451_15349(OUT_CONDITION_lrn_14451_15349),
    .OUT_CONDITION_lrn_14451_15352(OUT_CONDITION_lrn_14451_15352),
    .OUT_MULTIIF_lrn_14451_17663(OUT_MULTIIF_lrn_14451_17663),
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
    .fuselector_BMEMORY_CTRLN_32_i0_LOAD(fuselector_BMEMORY_CTRLN_32_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_32_i0_STORE(fuselector_BMEMORY_CTRLN_32_i0_STORE),
    .selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_32_i0_1_0_0),
    .selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0(selector_MUX_21_fp_minus_expr_FU_64_64_64_500_37_i0_0_0_0),
    .selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0(selector_MUX_22_fp_minus_expr_FU_64_64_64_500_37_i0_1_0_0),
    .selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_0),
    .selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_0_1),
    .selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0(selector_MUX_23_fp_mult_expr_FU_64_64_64_500_38_i0_0_1_0),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_0),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_1),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_0_2),
    .selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0(selector_MUX_24_fp_mult_expr_FU_64_64_64_500_38_i0_1_1_0),
    .selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0(selector_MUX_25_fp_plus_expr_FU_64_64_64_500_39_i0_0_0_0),
    .selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0(selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_0),
    .selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1(selector_MUX_26_fp_plus_expr_FU_64_64_64_500_39_i0_1_0_1),
    .selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0(selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_0),
    .selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1(selector_MUX_27_fp_rdiv_expr_FU_64_64_64_400_40_i0_0_0_1),
    .selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0(selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_0),
    .selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1(selector_MUX_28_fp_rdiv_expr_FU_64_64_64_400_40_i0_1_0_1),
    .selector_MUX_52_reg_0_0_0_0(selector_MUX_52_reg_0_0_0_0),
    .selector_MUX_53_reg_1_0_0_0(selector_MUX_53_reg_1_0_0_0),
    .selector_MUX_55_reg_11_0_0_0(selector_MUX_55_reg_11_0_0_0),
    .selector_MUX_56_reg_12_0_0_0(selector_MUX_56_reg_12_0_0_0),
    .selector_MUX_57_reg_13_0_0_0(selector_MUX_57_reg_13_0_0_0),
    .selector_MUX_65_reg_20_0_0_0(selector_MUX_65_reg_20_0_0_0),
    .selector_MUX_66_reg_21_0_0_0(selector_MUX_66_reg_21_0_0_0),
    .selector_MUX_67_reg_22_0_0_0(selector_MUX_67_reg_22_0_0_0),
    .selector_MUX_68_reg_23_0_0_0(selector_MUX_68_reg_23_0_0_0),
    .selector_MUX_71_reg_26_0_0_0(selector_MUX_71_reg_26_0_0_0),
    .selector_MUX_74_reg_3_0_0_0(selector_MUX_74_reg_3_0_0_0),
    .selector_MUX_80_reg_9_0_0_0(selector_MUX_80_reg_9_0_0_0),
    .selector_MUX_80_reg_9_0_0_1(selector_MUX_80_reg_9_0_0_1),
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

// Minimal interface for function: lrn
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module lrn(clock,
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
  
  _lrn _lrn_i0 (.done_port(done_port),
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
    .Min_Wdata_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Min_data_ram_size({6'b000000,
      6'b000000}));

endmodule


