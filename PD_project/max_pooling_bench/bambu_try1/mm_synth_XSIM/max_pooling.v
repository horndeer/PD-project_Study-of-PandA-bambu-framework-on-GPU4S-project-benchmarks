// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2023.1 - Revision 04336c437a53bc96ae90b74052c455629946ec8b-main - Date 2024-05-16T17:25:37
// /tmp/.mount_bambu-xvjhk3/usr/bin/bambu executed with: /tmp/.mount_bambu-xvjhk3/usr/bin/bambu --top-fname=max_pooling --simulate --evaluation --device-name=asap7-BC --simulator=XSIM --experimental-setup=BAMBU-PERFORMANCE-MP /root/Desktop/Projects/PD_project/max_pooling_bench/bambu/../cpu_functions/cpu_functions.cpp 
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
  wire [30:0] out_MUX_16_reg_5_0_0_0;
  wire [31:0] out_MUX_17_reg_6_0_0_0;
  wire signed [32:0] out_UIdata_converter_FU_2_i0_fu___udivsi3_6917_9303;
  wire [28:0] out_UUconvert_expr_FU_17_i0_fu___udivsi3_6917_9464;
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
  wire [31:0] out_conv_out_UUconvert_expr_FU_17_i0_fu___udivsi3_6917_9464_29_32;
  wire [30:0] out_conv_out_const_0_1_31;
  wire [31:0] out_conv_out_const_0_1_32;
  wire out_read_cond_FU_16_i0_fu___udivsi3_6917_9374;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_1_reg_1;
  wire out_reg_2_reg_2;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [30:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire out_truth_and_expr_FU_1_0_1_20_i0_fu___udivsi3_6917_37397;
  wire out_truth_and_expr_FU_1_0_1_21_i0_fu___udivsi3_6917_9341;
  wire out_truth_and_expr_FU_1_0_1_21_i1_fu___udivsi3_6917_9362;
  wire out_truth_not_expr_FU_1_1_22_i0_fu___udivsi3_6917_37386;
  wire out_truth_not_expr_FU_1_1_22_i1_fu___udivsi3_6917_9337;
  wire out_truth_not_expr_FU_1_1_22_i2_fu___udivsi3_6917_9369;
  wire out_truth_or_expr_FU_1_1_1_23_i0_fu___udivsi3_6917_37419;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_24_i0_fu___udivsi3_6917_9359;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_24_i1_fu___udivsi3_6917_9360;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_25_i0_fu___udivsi3_6917_9308;
  wire [30:0] out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___udivsi3_6917_9372;
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
  wire out_ui_extract_bit_expr_FU_11_i0_fu___udivsi3_6917_37424;
  wire out_ui_extract_bit_expr_FU_13_i0_fu___udivsi3_6917_37428;
  wire out_ui_extract_bit_expr_FU_14_i0_fu___udivsi3_6917_37431;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_34_i0_fu___udivsi3_6917_37409;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_34_i1_fu___udivsi3_6917_37416;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_35_i0_fu___udivsi3_6917_9342;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_35_i1_fu___udivsi3_6917_9346;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_35_i2_fu___udivsi3_6917_9368;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_36_i0_fu___udivsi3_6917_9365;
  wire out_ui_ne_expr_FU_32_0_32_37_i0_fu___udivsi3_6917_37093;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_38_i0_fu___udivsi3_6917_9373;
  wire [30:0] out_ui_rshift_expr_FU_32_0_32_39_i0_fu___udivsi3_6917_37402;
  wire [30:0] out_ui_rshift_expr_FU_32_0_32_39_i1_fu___udivsi3_6917_37412;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_40_i0_fu___udivsi3_6917_9344;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_40_i1_fu___udivsi3_6917_9353;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_40_i2_fu___udivsi3_6917_9354;
  wire [0:0] out_ui_rshift_expr_FU_32_0_32_40_i3_fu___udivsi3_6917_9355;
  wire [31:0] out_ui_ternary_plus_expr_FU_32_32_32_32_41_i0_fu___udivsi3_6917_9352;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [30:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire [31:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2;
  
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
    .in2(out_ui_lshift_expr_FU_32_0_32_34_i1_fu___udivsi3_6917_37416));
  MUX_GATE #(.BITSIZE_in1(31),
    .BITSIZE_in2(31),
    .BITSIZE_out1(31)) MUX_16_reg_5_0_0_0 (.out1(out_MUX_16_reg_5_0_0_0),
    .sel(selector_MUX_16_reg_5_0_0_0),
    .in1(out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___udivsi3_6917_9372),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_17_reg_6_0_0_0 (.out1(out_MUX_17_reg_6_0_0_0),
    .sel(selector_MUX_17_reg_6_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_38_i0_fu___udivsi3_6917_9373),
    .in2(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_2));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(31)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_conv_out_const_0_1_31));
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
  UUdata_converter_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(32)) conv_out_UUconvert_expr_FU_17_i0_fu___udivsi3_6917_9464_29_32 (.out1(out_conv_out_UUconvert_expr_FU_17_i0_fu___udivsi3_6917_9464_29_32),
    .in1(out_UUconvert_expr_FU_17_i0_fu___udivsi3_6917_9464));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(31)) conv_out_const_0_1_31 (.out1(out_conv_out_const_0_1_31),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu___udivsi3_6917_37093 (.out1(out_ui_ne_expr_FU_32_0_32_37_i0_fu___udivsi3_6917_37093),
    .in1(out_ui_plus_expr_FU_32_0_32_38_i0_fu___udivsi3_6917_9373),
    .in2(out_const_4));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_37386 (.out1(out_truth_not_expr_FU_1_1_22_i0_fu___udivsi3_6917_37386),
    .in1(out_reg_2_reg_2));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_37397 (.out1(out_truth_and_expr_FU_1_0_1_20_i0_fu___udivsi3_6917_37397),
    .in1(out_ui_extract_bit_expr_FU_11_i0_fu___udivsi3_6917_37424),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___udivsi3_6917_37402 (.out1(out_ui_rshift_expr_FU_32_0_32_39_i0_fu___udivsi3_6917_37402),
    .in1(out_ui_lshift_expr_FU_32_0_32_35_i0_fu___udivsi3_6917_9342),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___udivsi3_6917_37409 (.out1(out_ui_lshift_expr_FU_32_0_32_34_i0_fu___udivsi3_6917_37409),
    .in1(out_ui_bit_and_expr_FU_32_0_32_26_i0_fu___udivsi3_6917_9343),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(31),
    .PRECISION(64)) fu___udivsi3_6917_37412 (.out1(out_ui_rshift_expr_FU_32_0_32_39_i1_fu___udivsi3_6917_37412),
    .in1(out_ui_lshift_expr_FU_32_0_32_35_i1_fu___udivsi3_6917_9346),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___udivsi3_6917_37416 (.out1(out_ui_lshift_expr_FU_32_0_32_34_i1_fu___udivsi3_6917_37416),
    .in1(out_ui_bit_and_expr_FU_32_0_32_26_i1_fu___udivsi3_6917_9347),
    .in2(out_const_3));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_37419 (.out1(out_truth_or_expr_FU_1_1_1_23_i0_fu___udivsi3_6917_37419),
    .in1(out_ui_extract_bit_expr_FU_13_i0_fu___udivsi3_6917_37428),
    .in2(out_ui_extract_bit_expr_FU_14_i0_fu___udivsi3_6917_37431));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu___udivsi3_6917_37424 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu___udivsi3_6917_37424),
    .in1(out_reg_3_reg_3),
    .in2(out_const_5));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___udivsi3_6917_37428 (.out1(out_ui_extract_bit_expr_FU_13_i0_fu___udivsi3_6917_37428),
    .in1(out_ui_bit_and_expr_FU_1_1_1_24_i0_fu___udivsi3_6917_9359),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu___udivsi3_6917_37431 (.out1(out_ui_extract_bit_expr_FU_14_i0_fu___udivsi3_6917_37431),
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
    .in1(out_truth_and_expr_FU_1_0_1_20_i0_fu___udivsi3_6917_37397),
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
    .in1(out_ui_rshift_expr_FU_32_0_32_39_i0_fu___udivsi3_6917_37402),
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
    .in1(out_ui_lshift_expr_FU_32_0_32_34_i0_fu___udivsi3_6917_37409),
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
    .in1(out_ui_rshift_expr_FU_32_0_32_39_i1_fu___udivsi3_6917_37412),
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
    .in1(out_truth_or_expr_FU_1_1_1_23_i0_fu___udivsi3_6917_37419),
    .in2(out_const_3));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___udivsi3_6917_9363 (.out1(out_ui_bit_xor_expr_FU_1_1_1_32_i2_fu___udivsi3_6917_9363),
    .in1(out_truth_and_expr_FU_1_0_1_21_i0_fu___udivsi3_6917_9341),
    .in2(out_truth_not_expr_FU_1_1_22_i0_fu___udivsi3_6917_37386));
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
    .in1(out_reg_5_reg_5),
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
    .BITSIZE_out1(31)) fu___udivsi3_6917_9372 (.out1(out_ui_bit_and_expr_FU_32_0_32_25_i1_fu___udivsi3_6917_9372),
    .in1(out_ui_bit_ior_expr_FU_0_32_32_30_i0_fu___udivsi3_6917_9371),
    .in2(out_const_7));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu___udivsi3_6917_9373 (.out1(out_ui_plus_expr_FU_32_0_32_38_i0_fu___udivsi3_6917_9373),
    .in1(out_reg_6_reg_6),
    .in2(out_const_3));
  read_cond_FU #(.BITSIZE_in1(1)) fu___udivsi3_6917_9374 (.out1(out_read_cond_FU_16_i0_fu___udivsi3_6917_9374),
    .in1(out_ui_ne_expr_FU_32_0_32_37_i0_fu___udivsi3_6917_37093));
  UUconvert_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(29)) fu___udivsi3_6917_9464 (.out1(out_UUconvert_expr_FU_17_i0_fu___udivsi3_6917_9464),
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
  register_SE #(.BITSIZE_in1(31),
    .BITSIZE_out1(31)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_16_reg_5_0_0_0),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_17_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  // io-signal post fix
  assign return_port = out_conv_out_UUconvert_expr_FU_17_i0_fu___udivsi3_6917_9464_29_32;
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

// Datapath RTL description for max_pooling
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_max_pooling(clock,
  reset,
  in_port_A,
  in_port_B,
  in_port_size,
  in_port_stride,
  in_port_lateral_stride,
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
  selector_IN_UNBOUNDED_max_pooling_33985_34717,
  selector_IN_UNBOUNDED_max_pooling_33985_34723,
  selector_MUX_17___udivsi3_67_i0_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1,
  selector_MUX_27_reg_0_0_0_0,
  selector_MUX_32_reg_13_0_0_0,
  selector_MUX_34_reg_15_0_0_0,
  selector_MUX_34_reg_15_0_0_1,
  selector_MUX_37_reg_18_0_0_0,
  selector_MUX_38_reg_19_0_0_0,
  selector_MUX_40_reg_20_0_0_0,
  selector_MUX_49_reg_29_0_0_0,
  selector_MUX_55_reg_7_0_0_0,
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
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_max_pooling_33985_34675,
  OUT_CONDITION_max_pooling_33985_34684,
  OUT_CONDITION_max_pooling_33985_34807,
  OUT_CONDITION_max_pooling_33985_34813,
  OUT_CONDITION_max_pooling_33985_34821,
  OUT_CONDITION_max_pooling_33985_34823,
  OUT_UNBOUNDED_max_pooling_33985_34717,
  OUT_UNBOUNDED_max_pooling_33985_34723);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [31:0] in_port_B;
  input [31:0] in_port_size;
  input [31:0] in_port_stride;
  input [31:0] in_port_lateral_stride;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_30_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_30_i0_STORE;
  input selector_IN_UNBOUNDED_max_pooling_33985_34717;
  input selector_IN_UNBOUNDED_max_pooling_33985_34723;
  input selector_MUX_17___udivsi3_67_i0_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1;
  input selector_MUX_27_reg_0_0_0_0;
  input selector_MUX_32_reg_13_0_0_0;
  input selector_MUX_34_reg_15_0_0_0;
  input selector_MUX_34_reg_15_0_0_1;
  input selector_MUX_37_reg_18_0_0_0;
  input selector_MUX_38_reg_19_0_0_0;
  input selector_MUX_40_reg_20_0_0_0;
  input selector_MUX_49_reg_29_0_0_0;
  input selector_MUX_55_reg_7_0_0_0;
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
  output OUT_CONDITION_max_pooling_33985_34675;
  output OUT_CONDITION_max_pooling_33985_34684;
  output OUT_CONDITION_max_pooling_33985_34807;
  output OUT_CONDITION_max_pooling_33985_34813;
  output OUT_CONDITION_max_pooling_33985_34821;
  output OUT_CONDITION_max_pooling_33985_34823;
  output OUT_UNBOUNDED_max_pooling_33985_34717;
  output OUT_UNBOUNDED_max_pooling_33985_34723;
  // Component and signal declarations
  wire [63:0] null_out_signal_BMEMORY_CTRLN_30_i0_out1_1;
  wire [63:0] out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0;
  wire [31:0] out_MUX_17___udivsi3_67_i0_0_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1;
  wire [31:0] out_MUX_27_reg_0_0_0_0;
  wire [31:0] out_MUX_32_reg_13_0_0_0;
  wire [31:0] out_MUX_34_reg_15_0_0_0;
  wire [31:0] out_MUX_34_reg_15_0_0_1;
  wire [63:0] out_MUX_37_reg_18_0_0_0;
  wire [31:0] out_MUX_38_reg_19_0_0_0;
  wire [31:0] out_MUX_40_reg_20_0_0_0;
  wire [63:0] out_MUX_49_reg_29_0_0_0;
  wire [31:0] out_MUX_55_reg_7_0_0_0;
  wire signed [1:0] out_UIconvert_expr_FU_17_i0_fu_max_pooling_33985_37685;
  wire signed [1:0] out_UIdata_converter_FU_18_i0_fu_max_pooling_33985_37697;
  wire [31:0] out_UUdata_converter_FU_16_i0_fu_max_pooling_33985_34753;
  wire [31:0] out_UUdata_converter_FU_29_i0_fu_max_pooling_33985_34682;
  wire [31:0] out_UUdata_converter_FU_2_i0_fu_max_pooling_33985_37301;
  wire [31:0] out_UUdata_converter_FU_3_i0_fu_max_pooling_33985_37298;
  wire [31:0] out_UUdata_converter_FU_4_i0_fu_max_pooling_33985_34785;
  wire [31:0] out___udivsi3_67_i0___udivsi3_67_i0;
  wire out_const_0;
  wire [7:0] out_const_1;
  wire [63:0] out_const_10;
  wire [6:0] out_const_2;
  wire [6:0] out_const_3;
  wire out_const_4;
  wire [1:0] out_const_5;
  wire [2:0] out_const_6;
  wire [10:0] out_const_7;
  wire [51:0] out_const_8;
  wire [62:0] out_const_9;
  wire [28:0] out_conv_in_port_lateral_stride_32_29;
  wire [28:0] out_conv_out___udivsi3_67_i0___udivsi3_67_i0_32_29;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [6:0] out_conv_out_const_1_8_7;
  wire out_ne_expr_FU_8_8_8_31_i0_fu_max_pooling_33985_37700;
  wire out_read_cond_FU_10_i0_fu_max_pooling_33985_34684;
  wire out_read_cond_FU_19_i0_fu_max_pooling_33985_34807;
  wire out_read_cond_FU_20_i0_fu_max_pooling_33985_34813;
  wire out_read_cond_FU_25_i0_fu_max_pooling_33985_34821;
  wire out_read_cond_FU_26_i0_fu_max_pooling_33985_34823;
  wire out_read_cond_FU_5_i0_fu_max_pooling_33985_34675;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [28:0] out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire [31:0] out_reg_16_reg_16;
  wire [31:0] out_reg_17_reg_17;
  wire [63:0] out_reg_18_reg_18;
  wire [31:0] out_reg_19_reg_19;
  wire out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire [31:0] out_reg_22_reg_22;
  wire out_reg_23_reg_23;
  wire out_reg_24_reg_24;
  wire [1:0] out_reg_25_reg_25;
  wire [63:0] out_reg_26_reg_26;
  wire out_reg_27_reg_27;
  wire out_reg_28_reg_28;
  wire [63:0] out_reg_29_reg_29;
  wire [31:0] out_reg_2_reg_2;
  wire out_reg_30_reg_30;
  wire [28:0] out_reg_3_reg_3;
  wire [28:0] out_reg_4_reg_4;
  wire [28:0] out_reg_5_reg_5;
  wire [28:0] out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire [28:0] out_reg_8_reg_8;
  wire [28:0] out_reg_9_reg_9;
  wire out_truth_and_expr_FU_1_1_1_32_i0_fu_max_pooling_33985_37673;
  wire out_truth_and_expr_FU_1_1_1_32_i1_fu_max_pooling_33985_37712;
  wire out_truth_and_expr_FU_1_1_1_32_i2_fu_max_pooling_33985_37715;
  wire out_truth_and_expr_FU_1_1_1_32_i3_fu_max_pooling_33985_37721;
  wire out_truth_and_expr_FU_1_1_1_32_i4_fu_max_pooling_33985_37724;
  wire out_truth_and_expr_FU_1_1_1_32_i5_fu_max_pooling_33985_37727;
  wire out_truth_and_expr_FU_1_1_1_32_i6_fu_max_pooling_33985_37733;
  wire out_truth_not_expr_FU_1_1_33_i0_fu_max_pooling_33985_37670;
  wire out_truth_not_expr_FU_1_1_33_i1_fu_max_pooling_33985_37718;
  wire out_truth_not_expr_FU_1_1_33_i2_fu_max_pooling_33985_37730;
  wire out_truth_or_expr_FU_1_1_1_34_i0_fu_max_pooling_33985_37736;
  wire out_truth_or_expr_FU_1_1_1_34_i1_fu_max_pooling_33985_37742;
  wire [10:0] out_ui_bit_and_expr_FU_0_16_16_35_i0_fu_max_pooling_33985_37626;
  wire [51:0] out_ui_bit_and_expr_FU_0_64_64_36_i0_fu_max_pooling_33985_37632;
  wire [51:0] out_ui_bit_and_expr_FU_0_64_64_36_i1_fu_max_pooling_33985_37649;
  wire [63:0] out_ui_bit_and_expr_FU_0_64_64_37_i0_fu_max_pooling_33985_37679;
  wire [63:0] out_ui_bit_and_expr_FU_0_64_64_37_i1_fu_max_pooling_33985_37688;
  wire [63:0] out_ui_bit_and_expr_FU_0_64_64_37_i2_fu_max_pooling_33985_37691;
  wire [62:0] out_ui_bit_and_expr_FU_0_64_64_38_i0_fu_max_pooling_33985_37706;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_39_i0_fu_max_pooling_33985_37643;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_40_i0_fu_max_pooling_33985_37448;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_40_i1_fu_max_pooling_33985_37466;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_40_i2_fu_max_pooling_33985_37481;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_40_i3_fu_max_pooling_33985_37496;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_40_i4_fu_max_pooling_33985_37511;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_41_i0_fu_max_pooling_33985_34770;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_41_i1_fu_max_pooling_33985_34775;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_41_i2_fu_max_pooling_33985_34789;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_41_i3_fu_max_pooling_33985_34794;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_41_i4_fu_max_pooling_33985_34810;
  wire [62:0] out_ui_bit_ior_expr_FU_64_64_64_42_i0_fu_max_pooling_33985_37703;
  wire [63:0] out_ui_bit_xor_expr_FU_64_64_64_43_i0_fu_max_pooling_33985_37676;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_44_i0_fu_max_pooling_33985_37739;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_44_i1_fu_max_pooling_33985_37745;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_44_i2_fu_max_pooling_33985_37748;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_44_i3_fu_max_pooling_33985_37751;
  wire [0:0] out_ui_cond_expr_FU_1_1_1_1_44_i4_fu_max_pooling_33985_37754;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_45_i0_fu_max_pooling_33985_34740;
  wire out_ui_eq_expr_FU_0_16_16_46_i0_fu_max_pooling_33985_37629;
  wire out_ui_eq_expr_FU_0_16_16_46_i1_fu_max_pooling_33985_37646;
  wire out_ui_gt_expr_FU_32_32_32_47_i0_fu_max_pooling_33985_37084;
  wire out_ui_gt_expr_FU_32_32_32_47_i1_fu_max_pooling_33985_37086;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_48_i0_fu_max_pooling_33985_34709;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_48_i1_fu_max_pooling_33985_34773;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_48_i2_fu_max_pooling_33985_34797;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_48_i3_fu_max_pooling_33985_37519;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_49_i0_fu_max_pooling_33985_37057;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_50_i0_fu_max_pooling_33985_37444;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_50_i1_fu_max_pooling_33985_37463;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_50_i2_fu_max_pooling_33985_37478;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_50_i3_fu_max_pooling_33985_37493;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_50_i4_fu_max_pooling_33985_37508;
  wire out_ui_lt_expr_FU_64_64_64_51_i0_fu_max_pooling_33985_37694;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_52_i0_fu_max_pooling_33985_34719;
  wire [28:0] out_ui_mult_expr_FU_32_32_32_0_52_i1_fu_max_pooling_33985_34792;
  wire out_ui_ne_expr_FU_1_0_1_53_i0_fu_max_pooling_33985_37658;
  wire out_ui_ne_expr_FU_1_0_1_53_i1_fu_max_pooling_33985_37664;
  wire out_ui_ne_expr_FU_1_1_1_54_i0_fu_max_pooling_33985_37667;
  wire out_ui_ne_expr_FU_32_0_32_55_i0_fu_max_pooling_33985_37076;
  wire out_ui_ne_expr_FU_32_0_32_55_i1_fu_max_pooling_33985_37078;
  wire out_ui_ne_expr_FU_32_32_32_56_i0_fu_max_pooling_33985_37080;
  wire out_ui_ne_expr_FU_32_32_32_56_i1_fu_max_pooling_33985_37082;
  wire out_ui_ne_expr_FU_64_0_64_57_i0_fu_max_pooling_33985_37635;
  wire out_ui_ne_expr_FU_64_0_64_57_i1_fu_max_pooling_33985_37652;
  wire out_ui_ne_expr_FU_64_0_64_58_i0_fu_max_pooling_33985_37682;
  wire out_ui_ne_expr_FU_64_0_64_58_i1_fu_max_pooling_33985_37709;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_59_i0_fu_max_pooling_33985_34812;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_60_i0_fu_max_pooling_33985_37441;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_61_i0_fu_max_pooling_33985_34689;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_61_i1_fu_max_pooling_33985_34713;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_61_i2_fu_max_pooling_33985_34730;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_61_i3_fu_max_pooling_33985_37460;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_61_i4_fu_max_pooling_33985_37475;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_61_i5_fu_max_pooling_33985_37490;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_61_i6_fu_max_pooling_33985_37505;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_62_i0_fu_max_pooling_33985_34704;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_62_i1_fu_max_pooling_33985_37060;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_63_i0_fu_max_pooling_33985_37436;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_63_i1_fu_max_pooling_33985_37453;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_63_i2_fu_max_pooling_33985_37458;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_63_i3_fu_max_pooling_33985_37470;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_63_i4_fu_max_pooling_33985_37473;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_63_i5_fu_max_pooling_33985_37485;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_63_i6_fu_max_pooling_33985_37488;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_63_i7_fu_max_pooling_33985_37500;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_63_i8_fu_max_pooling_33985_37503;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_64_i0_fu_max_pooling_33985_37515;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_65_i0_fu_max_pooling_33985_37621;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_65_i1_fu_max_pooling_33985_37638;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_66_i0_fu_max_pooling_33985_37655;
  wire [0:0] out_ui_rshift_expr_FU_64_0_64_66_i1_fu_max_pooling_33985_37661;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  wire [63:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1;
  wire s___udivsi3_67_i00;
  wire s_done___udivsi3_67_i0;
  
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
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_30_i0 (.out1({null_out_signal_BMEMORY_CTRLN_30_i0_out1_1,
      out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({64'b0000000000000000000000000000000000000000000000000000000000000000,
      out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1}),
    .in3({7'b0000000,
      out_conv_out_const_1_8_7}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_30_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_30_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_17___udivsi3_67_i0_0_0_0 (.out1(out_MUX_17___udivsi3_67_i0_0_0_0),
    .sel(selector_MUX_17___udivsi3_67_i0_0_0_0),
    .in1(out_reg_7_reg_7),
    .in2(out_reg_13_reg_13));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_30_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0),
    .in1(out_UUdata_converter_FU_16_i0_fu_max_pooling_33985_34753),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_62_i0_fu_max_pooling_33985_34704));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_30_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_62_i1_fu_max_pooling_33985_37060),
    .in2(out_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_27_reg_0_0_0_0 (.out1(out_MUX_27_reg_0_0_0_0),
    .sel(selector_MUX_27_reg_0_0_0_0),
    .in1(out_reg_11_reg_11),
    .in2(out_UUdata_converter_FU_4_i0_fu_max_pooling_33985_34785));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_32_reg_13_0_0_0 (.out1(out_MUX_32_reg_13_0_0_0),
    .sel(selector_MUX_32_reg_13_0_0_0),
    .in1(out_reg_16_reg_16),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_34_reg_15_0_0_0 (.out1(out_MUX_34_reg_15_0_0_0),
    .sel(selector_MUX_34_reg_15_0_0_0),
    .in1(out_reg_21_reg_21),
    .in2(out_reg_17_reg_17));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_34_reg_15_0_0_1 (.out1(out_MUX_34_reg_15_0_0_1),
    .sel(selector_MUX_34_reg_15_0_0_1),
    .in1(out_reg_0_reg_0),
    .in2(out_MUX_34_reg_15_0_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_37_reg_18_0_0_0 (.out1(out_MUX_37_reg_18_0_0_0),
    .sel(selector_MUX_37_reg_18_0_0_0),
    .in1(out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0),
    .in2(out_ui_cond_expr_FU_64_64_64_64_45_i0_fu_max_pooling_33985_34740));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_38_reg_19_0_0_0 (.out1(out_MUX_38_reg_19_0_0_0),
    .sel(selector_MUX_38_reg_19_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_59_i0_fu_max_pooling_33985_34812),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_40_reg_20_0_0_0 (.out1(out_MUX_40_reg_20_0_0_0),
    .sel(selector_MUX_40_reg_20_0_0_0),
    .in1(out_reg_15_reg_15),
    .in2(out_ui_bit_ior_concat_expr_FU_41_i1_fu_max_pooling_33985_34775));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_49_reg_29_0_0_0 (.out1(out_MUX_49_reg_29_0_0_0),
    .sel(selector_MUX_49_reg_29_0_0_0),
    .in1(out_reg_18_reg_18),
    .in2(out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_55_reg_7_0_0_0 (.out1(out_MUX_55_reg_7_0_0_0),
    .sel(selector_MUX_55_reg_7_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_1),
    .in1(out_reg_29_reg_29));
  __udivsi3 __udivsi3_67_i0 (.done_port(s_done___udivsi3_67_i0),
    .return_port(out___udivsi3_67_i0___udivsi3_67_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___udivsi3_67_i00),
    .u(out_MUX_17___udivsi3_67_i0_0_0_0),
    .v(in_port_stride));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b01000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110100)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111111)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111111111111111111111111111111111111111111111111111)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111111111111111111111111111111111111111111111111111111111)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) conv_in_port_lateral_stride_32_29 (.out1(out_conv_in_port_lateral_stride_32_29),
    .in1(in_port_lateral_stride));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(29)) conv_out___udivsi3_67_i0___udivsi3_67_i0_32_29 (.out1(out_conv_out___udivsi3_67_i0___udivsi3_67_i0_32_29),
    .in1(out___udivsi3_67_i0___udivsi3_67_i0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(7)) conv_out_const_1_8_7 (.out1(out_conv_out_const_1_8_7),
    .in1(out_const_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_max_pooling_33985_34675 (.out1(out_read_cond_FU_5_i0_fu_max_pooling_33985_34675),
    .in1(out_ui_ne_expr_FU_32_0_32_55_i0_fu_max_pooling_33985_37076));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_max_pooling_33985_34682 (.out1(out_UUdata_converter_FU_29_i0_fu_max_pooling_33985_34682),
    .in1(out_reg_0_reg_0));
  read_cond_FU #(.BITSIZE_in1(1)) fu_max_pooling_33985_34684 (.out1(out_read_cond_FU_10_i0_fu_max_pooling_33985_34684),
    .in1(out_reg_1_reg_1));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_max_pooling_33985_34689 (.out1(out_ui_plus_expr_FU_32_32_32_61_i0_fu_max_pooling_33985_34689),
    .in1(out_reg_13_reg_13),
    .in2(in_port_stride));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_max_pooling_33985_34704 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_62_i0_fu_max_pooling_33985_34704),
    .in1(out_reg_2_reg_2),
    .in2(out_ui_lshift_expr_FU_32_0_32_48_i0_fu_max_pooling_33985_34709));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_max_pooling_33985_34709 (.out1(out_ui_lshift_expr_FU_32_0_32_48_i0_fu_max_pooling_33985_34709),
    .in1(out_ui_plus_expr_FU_32_32_32_61_i1_fu_max_pooling_33985_34713),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_max_pooling_33985_34713 (.out1(out_ui_plus_expr_FU_32_32_32_61_i1_fu_max_pooling_33985_34713),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_14_reg_14));
  ui_mult_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu_max_pooling_33985_34719 (.out1(out_ui_mult_expr_FU_32_32_32_0_52_i0_fu_max_pooling_33985_34719),
    .clock(clock),
    .in1(out_reg_9_reg_9),
    .in2(out_conv_in_port_lateral_stride_32_29));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_max_pooling_33985_34730 (.out1(out_ui_plus_expr_FU_32_32_32_61_i2_fu_max_pooling_33985_34730),
    .in1(out_reg_7_reg_7),
    .in2(in_port_stride));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu_max_pooling_33985_34740 (.out1(out_ui_cond_expr_FU_64_64_64_64_45_i0_fu_max_pooling_33985_34740),
    .in1(out_ui_cond_expr_FU_1_1_1_1_44_i4_fu_max_pooling_33985_37754),
    .in2(out_reg_18_reg_18),
    .in3(out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_max_pooling_33985_34753 (.out1(out_UUdata_converter_FU_16_i0_fu_max_pooling_33985_34753),
    .in1(out_reg_20_reg_20));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_max_pooling_33985_34770 (.out1(out_ui_bit_ior_concat_expr_FU_41_i0_fu_max_pooling_33985_34770),
    .in1(out_ui_lshift_expr_FU_32_0_32_50_i1_fu_max_pooling_33985_37463),
    .in2(out_ui_bit_and_expr_FU_8_0_8_40_i1_fu_max_pooling_33985_37466),
    .in3(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_max_pooling_33985_34773 (.out1(out_ui_lshift_expr_FU_32_0_32_48_i1_fu_max_pooling_33985_34773),
    .in1(in_port_size),
    .in2(out_const_5));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_max_pooling_33985_34775 (.out1(out_ui_bit_ior_concat_expr_FU_41_i1_fu_max_pooling_33985_34775),
    .in1(out_ui_lshift_expr_FU_32_0_32_50_i0_fu_max_pooling_33985_37444),
    .in2(out_ui_bit_and_expr_FU_8_0_8_40_i0_fu_max_pooling_33985_37448),
    .in3(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_max_pooling_33985_34785 (.out1(out_UUdata_converter_FU_4_i0_fu_max_pooling_33985_34785),
    .in1(out_UUdata_converter_FU_3_i0_fu_max_pooling_33985_37298));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_max_pooling_33985_34789 (.out1(out_ui_bit_ior_concat_expr_FU_41_i2_fu_max_pooling_33985_34789),
    .in1(out_ui_lshift_expr_FU_32_0_32_50_i4_fu_max_pooling_33985_37508),
    .in2(out_ui_bit_and_expr_FU_8_0_8_40_i4_fu_max_pooling_33985_37511),
    .in3(out_const_5));
  ui_mult_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(32),
    .BITSIZE_out1(29),
    .PIPE_PARAMETER(0)) fu_max_pooling_33985_34792 (.out1(out_ui_mult_expr_FU_32_32_32_0_52_i1_fu_max_pooling_33985_34792),
    .clock(clock),
    .in1(out_reg_6_reg_6),
    .in2(in_port_stride));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_max_pooling_33985_34794 (.out1(out_ui_bit_ior_concat_expr_FU_41_i3_fu_max_pooling_33985_34794),
    .in1(out_ui_lshift_expr_FU_32_0_32_50_i3_fu_max_pooling_33985_37493),
    .in2(out_ui_bit_and_expr_FU_8_0_8_40_i3_fu_max_pooling_33985_37496),
    .in3(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_max_pooling_33985_34797 (.out1(out_ui_lshift_expr_FU_32_0_32_48_i2_fu_max_pooling_33985_34797),
    .in1(in_port_stride),
    .in2(out_const_5));
  read_cond_FU #(.BITSIZE_in1(1)) fu_max_pooling_33985_34807 (.out1(out_read_cond_FU_19_i0_fu_max_pooling_33985_34807),
    .in1(out_reg_23_reg_23));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_max_pooling_33985_34810 (.out1(out_ui_bit_ior_concat_expr_FU_41_i4_fu_max_pooling_33985_34810),
    .in1(out_ui_lshift_expr_FU_32_0_32_50_i2_fu_max_pooling_33985_37478),
    .in2(out_ui_bit_and_expr_FU_8_0_8_40_i2_fu_max_pooling_33985_37481),
    .in3(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_max_pooling_33985_34812 (.out1(out_ui_plus_expr_FU_32_0_32_59_i0_fu_max_pooling_33985_34812),
    .in1(out_reg_19_reg_19),
    .in2(out_const_4));
  read_cond_FU #(.BITSIZE_in1(1)) fu_max_pooling_33985_34813 (.out1(out_read_cond_FU_20_i0_fu_max_pooling_33985_34813),
    .in1(out_ui_ne_expr_FU_32_32_32_56_i1_fu_max_pooling_33985_37082));
  read_cond_FU #(.BITSIZE_in1(1)) fu_max_pooling_33985_34821 (.out1(out_read_cond_FU_25_i0_fu_max_pooling_33985_34821),
    .in1(out_reg_30_reg_30));
  read_cond_FU #(.BITSIZE_in1(1)) fu_max_pooling_33985_34823 (.out1(out_read_cond_FU_26_i0_fu_max_pooling_33985_34823),
    .in1(out_ui_gt_expr_FU_32_32_32_47_i1_fu_max_pooling_33985_37086));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_max_pooling_33985_37057 (.out1(out_ui_lshift_expr_FU_32_0_32_49_i0_fu_max_pooling_33985_37057),
    .in1(out_reg_13_reg_13),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_max_pooling_33985_37060 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_62_i1_fu_max_pooling_33985_37060),
    .in1(out_reg_12_reg_12),
    .in2(out_ui_lshift_expr_FU_32_0_32_49_i0_fu_max_pooling_33985_37057));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37076 (.out1(out_ui_ne_expr_FU_32_0_32_55_i0_fu_max_pooling_33985_37076),
    .in1(in_port_size),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37078 (.out1(out_ui_ne_expr_FU_32_0_32_55_i1_fu_max_pooling_33985_37078),
    .in1(in_port_stride),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37080 (.out1(out_ui_ne_expr_FU_32_32_32_56_i0_fu_max_pooling_33985_37080),
    .in1(out_reg_22_reg_22),
    .in2(out_ui_bit_ior_concat_expr_FU_41_i1_fu_max_pooling_33985_34775));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37082 (.out1(out_ui_ne_expr_FU_32_32_32_56_i1_fu_max_pooling_33985_37082),
    .in1(out_reg_19_reg_19),
    .in2(in_port_stride));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37084 (.out1(out_ui_gt_expr_FU_32_32_32_47_i0_fu_max_pooling_33985_37084),
    .in1(in_port_size),
    .in2(out_reg_16_reg_16));
  ui_gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37086 (.out1(out_ui_gt_expr_FU_32_32_32_47_i1_fu_max_pooling_33985_37086),
    .in1(in_port_size),
    .in2(out_reg_10_reg_10));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_max_pooling_33985_37298 (.out1(out_UUdata_converter_FU_3_i0_fu_max_pooling_33985_37298),
    .in1(in_port_A));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_max_pooling_33985_37301 (.out1(out_UUdata_converter_FU_2_i0_fu_max_pooling_33985_37301),
    .in1(in_port_B));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_max_pooling_33985_37436 (.out1(out_ui_rshift_expr_FU_32_0_32_63_i0_fu_max_pooling_33985_37436),
    .in1(out_reg_20_reg_20),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_max_pooling_33985_37441 (.out1(out_ui_plus_expr_FU_32_0_32_60_i0_fu_max_pooling_33985_37441),
    .in1(out_ui_rshift_expr_FU_32_0_32_63_i0_fu_max_pooling_33985_37436),
    .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_max_pooling_33985_37444 (.out1(out_ui_lshift_expr_FU_32_0_32_50_i0_fu_max_pooling_33985_37444),
    .in1(out_ui_plus_expr_FU_32_0_32_60_i0_fu_max_pooling_33985_37441),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_max_pooling_33985_37448 (.out1(out_ui_bit_and_expr_FU_8_0_8_40_i0_fu_max_pooling_33985_37448),
    .in1(out_reg_20_reg_20),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_max_pooling_33985_37453 (.out1(out_ui_rshift_expr_FU_32_0_32_63_i1_fu_max_pooling_33985_37453),
    .in1(out_ui_lshift_expr_FU_32_0_32_48_i1_fu_max_pooling_33985_34773),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_max_pooling_33985_37458 (.out1(out_ui_rshift_expr_FU_32_0_32_63_i2_fu_max_pooling_33985_37458),
    .in1(out_reg_15_reg_15),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_max_pooling_33985_37460 (.out1(out_ui_plus_expr_FU_32_32_32_61_i3_fu_max_pooling_33985_37460),
    .in1(out_reg_3_reg_3),
    .in2(out_ui_rshift_expr_FU_32_0_32_63_i2_fu_max_pooling_33985_37458));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_max_pooling_33985_37463 (.out1(out_ui_lshift_expr_FU_32_0_32_50_i1_fu_max_pooling_33985_37463),
    .in1(out_ui_plus_expr_FU_32_32_32_61_i3_fu_max_pooling_33985_37460),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_max_pooling_33985_37466 (.out1(out_ui_bit_and_expr_FU_8_0_8_40_i1_fu_max_pooling_33985_37466),
    .in1(out_reg_15_reg_15),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_max_pooling_33985_37470 (.out1(out_ui_rshift_expr_FU_32_0_32_63_i3_fu_max_pooling_33985_37470),
    .in1(out_reg_15_reg_15),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_max_pooling_33985_37473 (.out1(out_ui_rshift_expr_FU_32_0_32_63_i4_fu_max_pooling_33985_37473),
    .in1(out_ui_lshift_expr_FU_32_0_32_48_i2_fu_max_pooling_33985_34797),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_max_pooling_33985_37475 (.out1(out_ui_plus_expr_FU_32_32_32_61_i4_fu_max_pooling_33985_37475),
    .in1(out_ui_rshift_expr_FU_32_0_32_63_i3_fu_max_pooling_33985_37470),
    .in2(out_reg_4_reg_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_max_pooling_33985_37478 (.out1(out_ui_lshift_expr_FU_32_0_32_50_i2_fu_max_pooling_33985_37478),
    .in1(out_ui_plus_expr_FU_32_32_32_61_i4_fu_max_pooling_33985_37475),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_max_pooling_33985_37481 (.out1(out_ui_bit_and_expr_FU_8_0_8_40_i2_fu_max_pooling_33985_37481),
    .in1(out_reg_15_reg_15),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_max_pooling_33985_37485 (.out1(out_ui_rshift_expr_FU_32_0_32_63_i5_fu_max_pooling_33985_37485),
    .in1(out_reg_15_reg_15),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_max_pooling_33985_37488 (.out1(out_ui_rshift_expr_FU_32_0_32_63_i6_fu_max_pooling_33985_37488),
    .in1(out_ui_lshift_expr_FU_32_0_32_48_i2_fu_max_pooling_33985_34797),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_max_pooling_33985_37490 (.out1(out_ui_plus_expr_FU_32_32_32_61_i5_fu_max_pooling_33985_37490),
    .in1(out_ui_rshift_expr_FU_32_0_32_63_i5_fu_max_pooling_33985_37485),
    .in2(out_reg_5_reg_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_max_pooling_33985_37493 (.out1(out_ui_lshift_expr_FU_32_0_32_50_i3_fu_max_pooling_33985_37493),
    .in1(out_ui_plus_expr_FU_32_32_32_61_i5_fu_max_pooling_33985_37490),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_max_pooling_33985_37496 (.out1(out_ui_bit_and_expr_FU_8_0_8_40_i3_fu_max_pooling_33985_37496),
    .in1(out_reg_15_reg_15),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_max_pooling_33985_37500 (.out1(out_ui_rshift_expr_FU_32_0_32_63_i7_fu_max_pooling_33985_37500),
    .in1(out_reg_0_reg_0),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_max_pooling_33985_37503 (.out1(out_ui_rshift_expr_FU_32_0_32_63_i8_fu_max_pooling_33985_37503),
    .in1(out_ui_lshift_expr_FU_32_0_32_48_i3_fu_max_pooling_33985_37519),
    .in2(out_const_5));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu_max_pooling_33985_37505 (.out1(out_ui_plus_expr_FU_32_32_32_61_i6_fu_max_pooling_33985_37505),
    .in1(out_ui_rshift_expr_FU_32_0_32_63_i7_fu_max_pooling_33985_37500),
    .in2(out_reg_8_reg_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_max_pooling_33985_37508 (.out1(out_ui_lshift_expr_FU_32_0_32_50_i4_fu_max_pooling_33985_37508),
    .in1(out_ui_plus_expr_FU_32_32_32_61_i6_fu_max_pooling_33985_37505),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_max_pooling_33985_37511 (.out1(out_ui_bit_and_expr_FU_8_0_8_40_i4_fu_max_pooling_33985_37511),
    .in1(out_reg_0_reg_0),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_max_pooling_33985_37515 (.out1(out_ui_rshift_expr_FU_32_0_32_64_i0_fu_max_pooling_33985_37515),
    .in1(out_ui_lshift_expr_FU_32_0_32_48_i1_fu_max_pooling_33985_34773),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_max_pooling_33985_37519 (.out1(out_ui_lshift_expr_FU_32_0_32_48_i3_fu_max_pooling_33985_37519),
    .in1(out_ui_mult_expr_FU_32_32_32_0_52_i1_fu_max_pooling_33985_34792),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_max_pooling_33985_37621 (.out1(out_ui_rshift_expr_FU_64_0_64_65_i0_fu_max_pooling_33985_37621),
    .in1(out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_max_pooling_33985_37626 (.out1(out_ui_bit_and_expr_FU_0_16_16_35_i0_fu_max_pooling_33985_37626),
    .in1(out_const_7),
    .in2(out_ui_rshift_expr_FU_64_0_64_65_i0_fu_max_pooling_33985_37621));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37629 (.out1(out_ui_eq_expr_FU_0_16_16_46_i0_fu_max_pooling_33985_37629),
    .in1(out_const_7),
    .in2(out_ui_bit_and_expr_FU_0_16_16_35_i0_fu_max_pooling_33985_37626));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(52)) fu_max_pooling_33985_37632 (.out1(out_ui_bit_and_expr_FU_0_64_64_36_i0_fu_max_pooling_33985_37632),
    .in1(out_const_8),
    .in2(out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37635 (.out1(out_ui_ne_expr_FU_64_0_64_57_i0_fu_max_pooling_33985_37635),
    .in1(out_ui_bit_and_expr_FU_0_64_64_36_i0_fu_max_pooling_33985_37632),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_max_pooling_33985_37638 (.out1(out_ui_rshift_expr_FU_64_0_64_65_i1_fu_max_pooling_33985_37638),
    .in1(out_reg_18_reg_18),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_max_pooling_33985_37643 (.out1(out_ui_bit_and_expr_FU_16_0_16_39_i0_fu_max_pooling_33985_37643),
    .in1(out_ui_rshift_expr_FU_64_0_64_65_i1_fu_max_pooling_33985_37638),
    .in2(out_const_7));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37646 (.out1(out_ui_eq_expr_FU_0_16_16_46_i1_fu_max_pooling_33985_37646),
    .in1(out_const_7),
    .in2(out_ui_bit_and_expr_FU_16_0_16_39_i0_fu_max_pooling_33985_37643));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(52)) fu_max_pooling_33985_37649 (.out1(out_ui_bit_and_expr_FU_0_64_64_36_i1_fu_max_pooling_33985_37649),
    .in1(out_const_8),
    .in2(out_reg_18_reg_18));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37652 (.out1(out_ui_ne_expr_FU_64_0_64_57_i1_fu_max_pooling_33985_37652),
    .in1(out_ui_bit_and_expr_FU_0_64_64_36_i1_fu_max_pooling_33985_37649),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu_max_pooling_33985_37655 (.out1(out_ui_rshift_expr_FU_64_0_64_66_i0_fu_max_pooling_33985_37655),
    .in1(out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0),
    .in2(out_const_3));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37658 (.out1(out_ui_ne_expr_FU_1_0_1_53_i0_fu_max_pooling_33985_37658),
    .in1(out_ui_rshift_expr_FU_64_0_64_66_i0_fu_max_pooling_33985_37655),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu_max_pooling_33985_37661 (.out1(out_ui_rshift_expr_FU_64_0_64_66_i1_fu_max_pooling_33985_37661),
    .in1(out_reg_18_reg_18),
    .in2(out_const_3));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37664 (.out1(out_ui_ne_expr_FU_1_0_1_53_i1_fu_max_pooling_33985_37664),
    .in1(out_ui_rshift_expr_FU_64_0_64_66_i1_fu_max_pooling_33985_37661),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37667 (.out1(out_ui_ne_expr_FU_1_1_1_54_i0_fu_max_pooling_33985_37667),
    .in1(out_ui_ne_expr_FU_1_0_1_53_i0_fu_max_pooling_33985_37658),
    .in2(out_reg_24_reg_24));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37670 (.out1(out_truth_not_expr_FU_1_1_33_i0_fu_max_pooling_33985_37670),
    .in1(out_ui_ne_expr_FU_1_1_1_54_i0_fu_max_pooling_33985_37667));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37673 (.out1(out_truth_and_expr_FU_1_1_1_32_i0_fu_max_pooling_33985_37673),
    .in1(out_ui_ne_expr_FU_1_1_1_54_i0_fu_max_pooling_33985_37667),
    .in2(out_ui_ne_expr_FU_1_0_1_53_i0_fu_max_pooling_33985_37658));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_max_pooling_33985_37676 (.out1(out_ui_bit_xor_expr_FU_64_64_64_43_i0_fu_max_pooling_33985_37676),
    .in1(out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0),
    .in2(out_reg_18_reg_18));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_max_pooling_33985_37679 (.out1(out_ui_bit_and_expr_FU_0_64_64_37_i0_fu_max_pooling_33985_37679),
    .in1(out_const_10),
    .in2(out_ui_bit_xor_expr_FU_64_64_64_43_i0_fu_max_pooling_33985_37676));
  ui_ne_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37682 (.out1(out_ui_ne_expr_FU_64_0_64_58_i0_fu_max_pooling_33985_37682),
    .in1(out_ui_bit_and_expr_FU_0_64_64_37_i0_fu_max_pooling_33985_37679),
    .in2(out_const_0));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_max_pooling_33985_37685 (.out1(out_UIconvert_expr_FU_17_i0_fu_max_pooling_33985_37685),
    .in1(out_ui_ne_expr_FU_1_0_1_53_i1_fu_max_pooling_33985_37664));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_max_pooling_33985_37688 (.out1(out_ui_bit_and_expr_FU_0_64_64_37_i1_fu_max_pooling_33985_37688),
    .in1(out_const_10),
    .in2(out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_max_pooling_33985_37691 (.out1(out_ui_bit_and_expr_FU_0_64_64_37_i2_fu_max_pooling_33985_37691),
    .in1(out_const_10),
    .in2(out_reg_18_reg_18));
  ui_lt_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37694 (.out1(out_ui_lt_expr_FU_64_64_64_51_i0_fu_max_pooling_33985_37694),
    .in1(out_ui_bit_and_expr_FU_0_64_64_37_i1_fu_max_pooling_33985_37688),
    .in2(out_reg_26_reg_26));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_max_pooling_33985_37697 (.out1(out_UIdata_converter_FU_18_i0_fu_max_pooling_33985_37697),
    .in1(out_ui_lt_expr_FU_64_64_64_51_i0_fu_max_pooling_33985_37694));
  ne_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37700 (.out1(out_ne_expr_FU_8_8_8_31_i0_fu_max_pooling_33985_37700),
    .in1(out_reg_25_reg_25),
    .in2(out_UIdata_converter_FU_18_i0_fu_max_pooling_33985_37697));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu_max_pooling_33985_37703 (.out1(out_ui_bit_ior_expr_FU_64_64_64_42_i0_fu_max_pooling_33985_37703),
    .in1(out_BMEMORY_CTRLN_30_i0_BMEMORY_CTRLN_30_i0),
    .in2(out_reg_18_reg_18));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu_max_pooling_33985_37706 (.out1(out_ui_bit_and_expr_FU_0_64_64_38_i0_fu_max_pooling_33985_37706),
    .in1(out_const_9),
    .in2(out_ui_bit_ior_expr_FU_64_64_64_42_i0_fu_max_pooling_33985_37703));
  ui_ne_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37709 (.out1(out_ui_ne_expr_FU_64_0_64_58_i1_fu_max_pooling_33985_37709),
    .in1(out_ui_bit_and_expr_FU_0_64_64_38_i0_fu_max_pooling_33985_37706),
    .in2(out_const_0));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37712 (.out1(out_truth_and_expr_FU_1_1_1_32_i1_fu_max_pooling_33985_37712),
    .in1(out_ui_eq_expr_FU_0_16_16_46_i0_fu_max_pooling_33985_37629),
    .in2(out_ui_ne_expr_FU_64_0_64_57_i0_fu_max_pooling_33985_37635));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37715 (.out1(out_truth_and_expr_FU_1_1_1_32_i2_fu_max_pooling_33985_37715),
    .in1(out_ui_eq_expr_FU_0_16_16_46_i1_fu_max_pooling_33985_37646),
    .in2(out_ui_ne_expr_FU_64_0_64_57_i1_fu_max_pooling_33985_37652));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37718 (.out1(out_truth_not_expr_FU_1_1_33_i1_fu_max_pooling_33985_37718),
    .in1(out_truth_and_expr_FU_1_1_1_32_i2_fu_max_pooling_33985_37715));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37721 (.out1(out_truth_and_expr_FU_1_1_1_32_i3_fu_max_pooling_33985_37721),
    .in1(out_truth_not_expr_FU_1_1_33_i0_fu_max_pooling_33985_37670),
    .in2(out_reg_28_reg_28));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37724 (.out1(out_truth_and_expr_FU_1_1_1_32_i4_fu_max_pooling_33985_37724),
    .in1(out_truth_and_expr_FU_1_1_1_32_i0_fu_max_pooling_33985_37673),
    .in2(out_reg_28_reg_28));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37727 (.out1(out_truth_and_expr_FU_1_1_1_32_i5_fu_max_pooling_33985_37727),
    .in1(out_truth_and_expr_FU_1_1_1_32_i3_fu_max_pooling_33985_37721),
    .in2(out_ui_ne_expr_FU_64_0_64_58_i0_fu_max_pooling_33985_37682));
  truth_not_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37730 (.out1(out_truth_not_expr_FU_1_1_33_i2_fu_max_pooling_33985_37730),
    .in1(out_ui_ne_expr_FU_64_0_64_58_i0_fu_max_pooling_33985_37682));
  truth_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37733 (.out1(out_truth_and_expr_FU_1_1_1_32_i6_fu_max_pooling_33985_37733),
    .in1(out_truth_and_expr_FU_1_1_1_32_i3_fu_max_pooling_33985_37721),
    .in2(out_truth_not_expr_FU_1_1_33_i2_fu_max_pooling_33985_37730));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37736 (.out1(out_truth_or_expr_FU_1_1_1_34_i0_fu_max_pooling_33985_37736),
    .in1(out_reg_27_reg_27),
    .in2(out_truth_and_expr_FU_1_1_1_32_i4_fu_max_pooling_33985_37724));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37739 (.out1(out_ui_cond_expr_FU_1_1_1_1_44_i0_fu_max_pooling_33985_37739),
    .in1(out_reg_27_reg_27),
    .in2(out_const_0),
    .in3(out_ui_ne_expr_FU_64_0_64_58_i1_fu_max_pooling_33985_37709));
  truth_or_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37742 (.out1(out_truth_or_expr_FU_1_1_1_34_i1_fu_max_pooling_33985_37742),
    .in1(out_truth_and_expr_FU_1_1_1_32_i5_fu_max_pooling_33985_37727),
    .in2(out_truth_or_expr_FU_1_1_1_34_i0_fu_max_pooling_33985_37736));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37745 (.out1(out_ui_cond_expr_FU_1_1_1_1_44_i1_fu_max_pooling_33985_37745),
    .in1(out_truth_and_expr_FU_1_1_1_32_i5_fu_max_pooling_33985_37727),
    .in2(out_ne_expr_FU_8_8_8_31_i0_fu_max_pooling_33985_37700),
    .in3(out_ui_cond_expr_FU_1_1_1_1_44_i0_fu_max_pooling_33985_37739));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37748 (.out1(out_ui_cond_expr_FU_1_1_1_1_44_i2_fu_max_pooling_33985_37748),
    .in1(out_truth_or_expr_FU_1_1_1_34_i1_fu_max_pooling_33985_37742),
    .in2(out_ui_cond_expr_FU_1_1_1_1_44_i1_fu_max_pooling_33985_37745),
    .in3(out_ui_ne_expr_FU_1_0_1_53_i0_fu_max_pooling_33985_37658));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37751 (.out1(out_ui_cond_expr_FU_1_1_1_1_44_i3_fu_max_pooling_33985_37751),
    .in1(out_truth_and_expr_FU_1_1_1_32_i6_fu_max_pooling_33985_37733),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_1_1_1_1_44_i2_fu_max_pooling_33985_37748));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(1),
    .BITSIZE_out1(1)) fu_max_pooling_33985_37754 (.out1(out_ui_cond_expr_FU_1_1_1_1_44_i4_fu_max_pooling_33985_37754),
    .in1(out_truth_and_expr_FU_1_1_1_32_i1_fu_max_pooling_33985_37712),
    .in2(out_const_0),
    .in3(out_ui_cond_expr_FU_1_1_1_1_44_i3_fu_max_pooling_33985_37751));
  or or_or___udivsi3_67_i00( s___udivsi3_67_i00, selector_IN_UNBOUNDED_max_pooling_33985_34717, selector_IN_UNBOUNDED_max_pooling_33985_34723);
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_27_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_55_i1_fu_max_pooling_33985_37078),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_61_i2_fu_max_pooling_33985_34730),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_41_i2_fu_max_pooling_33985_34789),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_29_i0_fu_max_pooling_33985_34682),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_32_reg_13_0_0_0),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_52_i0_fu_max_pooling_33985_34719),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_34_reg_15_0_0_1),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_32_32_61_i0_fu_max_pooling_33985_34689),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_41_i3_fu_max_pooling_33985_34794),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_37_reg_18_0_0_0),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_38_reg_19_0_0_0),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_2_i0_fu_max_pooling_33985_37301),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_40_reg_20_0_0_0),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_41_i0_fu_max_pooling_33985_34770),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_41_i4_fu_max_pooling_33985_34810),
    .wenable(wrenable_reg_22));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_56_i0_fu_max_pooling_33985_37080),
    .wenable(wrenable_reg_23));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_1_0_1_53_i1_fu_max_pooling_33985_37664),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_UIconvert_expr_FU_17_i0_fu_max_pooling_33985_37685),
    .wenable(wrenable_reg_25));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_0_64_64_37_i2_fu_max_pooling_33985_37691),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_truth_and_expr_FU_1_1_1_32_i2_fu_max_pooling_33985_37715),
    .wenable(wrenable_reg_27));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_truth_not_expr_FU_1_1_33_i1_fu_max_pooling_33985_37718),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_49_reg_29_0_0_0),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_63_i1_fu_max_pooling_33985_37453),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_gt_expr_FU_32_32_32_47_i0_fu_max_pooling_33985_37084),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_63_i4_fu_max_pooling_33985_37473),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_63_i6_fu_max_pooling_33985_37488),
    .wenable(wrenable_reg_5));
  register_STD #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_64_i0_fu_max_pooling_33985_37515),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_55_reg_7_0_0_0),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_63_i8_fu_max_pooling_33985_37503),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(29),
    .BITSIZE_out1(29)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_conv_out___udivsi3_67_i0___udivsi3_67_i0_32_29),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign OUT_CONDITION_max_pooling_33985_34675 = out_read_cond_FU_5_i0_fu_max_pooling_33985_34675;
  assign OUT_CONDITION_max_pooling_33985_34684 = out_read_cond_FU_10_i0_fu_max_pooling_33985_34684;
  assign OUT_CONDITION_max_pooling_33985_34807 = out_read_cond_FU_19_i0_fu_max_pooling_33985_34807;
  assign OUT_CONDITION_max_pooling_33985_34813 = out_read_cond_FU_20_i0_fu_max_pooling_33985_34813;
  assign OUT_CONDITION_max_pooling_33985_34821 = out_read_cond_FU_25_i0_fu_max_pooling_33985_34821;
  assign OUT_CONDITION_max_pooling_33985_34823 = out_read_cond_FU_26_i0_fu_max_pooling_33985_34823;
  assign OUT_UNBOUNDED_max_pooling_33985_34717 = s_done___udivsi3_67_i0;
  assign OUT_UNBOUNDED_max_pooling_33985_34723 = s_done___udivsi3_67_i0;

endmodule

// FSM based controller description for max_pooling
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_max_pooling(done_port,
  fuselector_BMEMORY_CTRLN_30_i0_LOAD,
  fuselector_BMEMORY_CTRLN_30_i0_STORE,
  selector_IN_UNBOUNDED_max_pooling_33985_34717,
  selector_IN_UNBOUNDED_max_pooling_33985_34723,
  selector_MUX_17___udivsi3_67_i0_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1,
  selector_MUX_27_reg_0_0_0_0,
  selector_MUX_32_reg_13_0_0_0,
  selector_MUX_34_reg_15_0_0_0,
  selector_MUX_34_reg_15_0_0_1,
  selector_MUX_37_reg_18_0_0_0,
  selector_MUX_38_reg_19_0_0_0,
  selector_MUX_40_reg_20_0_0_0,
  selector_MUX_49_reg_29_0_0_0,
  selector_MUX_55_reg_7_0_0_0,
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
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_max_pooling_33985_34675,
  OUT_CONDITION_max_pooling_33985_34684,
  OUT_CONDITION_max_pooling_33985_34807,
  OUT_CONDITION_max_pooling_33985_34813,
  OUT_CONDITION_max_pooling_33985_34821,
  OUT_CONDITION_max_pooling_33985_34823,
  OUT_UNBOUNDED_max_pooling_33985_34717,
  OUT_UNBOUNDED_max_pooling_33985_34723,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_max_pooling_33985_34675;
  input OUT_CONDITION_max_pooling_33985_34684;
  input OUT_CONDITION_max_pooling_33985_34807;
  input OUT_CONDITION_max_pooling_33985_34813;
  input OUT_CONDITION_max_pooling_33985_34821;
  input OUT_CONDITION_max_pooling_33985_34823;
  input OUT_UNBOUNDED_max_pooling_33985_34717;
  input OUT_UNBOUNDED_max_pooling_33985_34723;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_30_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_30_i0_STORE;
  output selector_IN_UNBOUNDED_max_pooling_33985_34717;
  output selector_IN_UNBOUNDED_max_pooling_33985_34723;
  output selector_MUX_17___udivsi3_67_i0_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1;
  output selector_MUX_27_reg_0_0_0_0;
  output selector_MUX_32_reg_13_0_0_0;
  output selector_MUX_34_reg_15_0_0_0;
  output selector_MUX_34_reg_15_0_0_1;
  output selector_MUX_37_reg_18_0_0_0;
  output selector_MUX_38_reg_19_0_0_0;
  output selector_MUX_40_reg_20_0_0_0;
  output selector_MUX_49_reg_29_0_0_0;
  output selector_MUX_55_reg_7_0_0_0;
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
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [4:0] S_0 = 5'd0,
    S_15 = 5'd15,
    S_11 = 5'd11,
    S_12 = 5'd12,
    S_13 = 5'd13,
    S_14 = 5'd14,
    S_1 = 5'd1,
    S_2 = 5'd2,
    S_6 = 5'd6,
    S_3 = 5'd3,
    S_4 = 5'd4,
    S_5 = 5'd5,
    S_7 = 5'd7,
    S_8 = 5'd8,
    S_9 = 5'd9,
    S_10 = 5'd10,
    S_16 = 5'd16;
  reg [4:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_30_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_30_i0_STORE;
  reg selector_IN_UNBOUNDED_max_pooling_33985_34717;
  reg selector_IN_UNBOUNDED_max_pooling_33985_34723;
  reg selector_MUX_17___udivsi3_67_i0_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1;
  reg selector_MUX_27_reg_0_0_0_0;
  reg selector_MUX_32_reg_13_0_0_0;
  reg selector_MUX_34_reg_15_0_0_0;
  reg selector_MUX_34_reg_15_0_0_1;
  reg selector_MUX_37_reg_18_0_0_0;
  reg selector_MUX_38_reg_19_0_0_0;
  reg selector_MUX_40_reg_20_0_0_0;
  reg selector_MUX_49_reg_29_0_0_0;
  reg selector_MUX_55_reg_7_0_0_0;
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
    selector_IN_UNBOUNDED_max_pooling_33985_34717 = 1'b0;
    selector_IN_UNBOUNDED_max_pooling_33985_34723 = 1'b0;
    selector_MUX_17___udivsi3_67_i0_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1 = 1'b0;
    selector_MUX_27_reg_0_0_0_0 = 1'b0;
    selector_MUX_32_reg_13_0_0_0 = 1'b0;
    selector_MUX_34_reg_15_0_0_0 = 1'b0;
    selector_MUX_34_reg_15_0_0_1 = 1'b0;
    selector_MUX_37_reg_18_0_0_0 = 1'b0;
    selector_MUX_38_reg_19_0_0_0 = 1'b0;
    selector_MUX_40_reg_20_0_0_0 = 1'b0;
    selector_MUX_49_reg_29_0_0_0 = 1'b0;
    selector_MUX_55_reg_7_0_0_0 = 1'b0;
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
          if (OUT_CONDITION_max_pooling_33985_34675 == 1'b1)
            begin
              _next_state = S_11;
            end
          else
            begin
              _next_state = S_15;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
              wrenable_reg_2 = 1'b0;
              wrenable_reg_3 = 1'b0;
              wrenable_reg_4 = 1'b0;
              wrenable_reg_5 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_15 :
        begin
          _next_state = S_0;
        end
      S_11 :
        begin
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          selector_IN_UNBOUNDED_max_pooling_33985_34723 = 1'b1;
          selector_MUX_17___udivsi3_67_i0_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_9 = OUT_UNBOUNDED_max_pooling_33985_34723;
          if (OUT_UNBOUNDED_max_pooling_33985_34723 == 1'b0)
            begin
              _next_state = S_13;
            end
          else
            begin
              _next_state = S_14;
            end
        end
      S_13 :
        begin
          selector_MUX_17___udivsi3_67_i0_0_0_0 = 1'b1;
          wrenable_reg_9 = OUT_UNBOUNDED_max_pooling_33985_34723;
          if (OUT_UNBOUNDED_max_pooling_33985_34723 == 1'b0)
            begin
              _next_state = S_13;
            end
          else
            begin
              _next_state = S_14;
            end
        end
      S_14 :
        begin
          selector_MUX_34_reg_15_0_0_1 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          _next_state = S_1;
        end
      S_1 :
        begin
          fuselector_BMEMORY_CTRLN_30_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          selector_MUX_37_reg_18_0_0_0 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_29 = 1'b1;
          if (OUT_CONDITION_max_pooling_33985_34684 == 1'b1)
            begin
              _next_state = S_6;
              wrenable_reg_29 = 1'b0;
            end
          else
            begin
              _next_state = S_7;
              selector_MUX_37_reg_18_0_0_0 = 1'b0;
              wrenable_reg_18 = 1'b0;
              wrenable_reg_19 = 1'b0;
            end
        end
      S_6 :
        begin
          selector_MUX_38_reg_19_0_0_0 = 1'b1;
          selector_MUX_40_reg_20_0_0_0 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          fuselector_BMEMORY_CTRLN_30_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          wrenable_reg_18 = 1'b1;
          if (OUT_CONDITION_max_pooling_33985_34807 == 1'b1)
            begin
              _next_state = S_3;
            end
          else
            begin
              _next_state = S_5;
            end
        end
      S_5 :
        begin
          selector_MUX_34_reg_15_0_0_0 = 1'b1;
          selector_MUX_49_reg_29_0_0_0 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_29 = 1'b1;
          if (OUT_CONDITION_max_pooling_33985_34813 == 1'b1)
            begin
              _next_state = S_6;
              selector_MUX_49_reg_29_0_0_0 = 1'b0;
              wrenable_reg_29 = 1'b0;
            end
          else
            begin
              _next_state = S_7;
              selector_MUX_34_reg_15_0_0_0 = 1'b0;
              wrenable_reg_15 = 1'b0;
            end
        end
      S_7 :
        begin
          selector_IN_UNBOUNDED_max_pooling_33985_34717 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_9 = OUT_UNBOUNDED_max_pooling_33985_34717;
          if (OUT_UNBOUNDED_max_pooling_33985_34717 == 1'b0)
            begin
              _next_state = S_8;
            end
          else
            begin
              _next_state = S_9;
            end
        end
      S_8 :
        begin
          wrenable_reg_9 = OUT_UNBOUNDED_max_pooling_33985_34717;
          if (OUT_UNBOUNDED_max_pooling_33985_34717 == 1'b0)
            begin
              _next_state = S_8;
            end
          else
            begin
              _next_state = S_9;
            end
        end
      S_9 :
        begin
          fuselector_BMEMORY_CTRLN_30_i0_STORE = 1'b1;
          selector_MUX_32_reg_13_0_0_0 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_15 = 1'b1;
          if (OUT_CONDITION_max_pooling_33985_34821 == 1'b1)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_10;
              selector_MUX_32_reg_13_0_0_0 = 1'b0;
              wrenable_reg_13 = 1'b0;
              wrenable_reg_15 = 1'b0;
            end
        end
      S_10 :
        begin
          selector_MUX_27_reg_0_0_0_0 = 1'b1;
          selector_MUX_55_reg_7_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_7 = 1'b1;
          if (OUT_CONDITION_max_pooling_33985_34823 == 1'b1)
            begin
              _next_state = S_12;
            end
          else
            begin
              _next_state = S_16;
              done_port = 1'b1;
              selector_MUX_27_reg_0_0_0_0 = 1'b0;
              selector_MUX_55_reg_7_0_0_0 = 1'b0;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_7 = 1'b0;
            end
        end
      S_16 :
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

// Top component for max_pooling
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _max_pooling(clock,
  reset,
  start_port,
  done_port,
  A,
  B,
  size,
  stride,
  lateral_stride,
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
  input [31:0] stride;
  input [31:0] lateral_stride;
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
  wire OUT_CONDITION_max_pooling_33985_34675;
  wire OUT_CONDITION_max_pooling_33985_34684;
  wire OUT_CONDITION_max_pooling_33985_34807;
  wire OUT_CONDITION_max_pooling_33985_34813;
  wire OUT_CONDITION_max_pooling_33985_34821;
  wire OUT_CONDITION_max_pooling_33985_34823;
  wire OUT_UNBOUNDED_max_pooling_33985_34717;
  wire OUT_UNBOUNDED_max_pooling_33985_34723;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_30_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_30_i0_STORE;
  wire selector_IN_UNBOUNDED_max_pooling_33985_34717;
  wire selector_IN_UNBOUNDED_max_pooling_33985_34723;
  wire selector_MUX_17___udivsi3_67_i0_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1;
  wire selector_MUX_27_reg_0_0_0_0;
  wire selector_MUX_32_reg_13_0_0_0;
  wire selector_MUX_34_reg_15_0_0_0;
  wire selector_MUX_34_reg_15_0_0_1;
  wire selector_MUX_37_reg_18_0_0_0;
  wire selector_MUX_38_reg_19_0_0_0;
  wire selector_MUX_40_reg_20_0_0_0;
  wire selector_MUX_49_reg_29_0_0_0;
  wire selector_MUX_55_reg_7_0_0_0;
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
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_max_pooling Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_30_i0_LOAD(fuselector_BMEMORY_CTRLN_30_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_30_i0_STORE(fuselector_BMEMORY_CTRLN_30_i0_STORE),
    .selector_IN_UNBOUNDED_max_pooling_33985_34717(selector_IN_UNBOUNDED_max_pooling_33985_34717),
    .selector_IN_UNBOUNDED_max_pooling_33985_34723(selector_IN_UNBOUNDED_max_pooling_33985_34723),
    .selector_MUX_17___udivsi3_67_i0_0_0_0(selector_MUX_17___udivsi3_67_i0_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1),
    .selector_MUX_27_reg_0_0_0_0(selector_MUX_27_reg_0_0_0_0),
    .selector_MUX_32_reg_13_0_0_0(selector_MUX_32_reg_13_0_0_0),
    .selector_MUX_34_reg_15_0_0_0(selector_MUX_34_reg_15_0_0_0),
    .selector_MUX_34_reg_15_0_0_1(selector_MUX_34_reg_15_0_0_1),
    .selector_MUX_37_reg_18_0_0_0(selector_MUX_37_reg_18_0_0_0),
    .selector_MUX_38_reg_19_0_0_0(selector_MUX_38_reg_19_0_0_0),
    .selector_MUX_40_reg_20_0_0_0(selector_MUX_40_reg_20_0_0_0),
    .selector_MUX_49_reg_29_0_0_0(selector_MUX_49_reg_29_0_0_0),
    .selector_MUX_55_reg_7_0_0_0(selector_MUX_55_reg_7_0_0_0),
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
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_max_pooling_33985_34675(OUT_CONDITION_max_pooling_33985_34675),
    .OUT_CONDITION_max_pooling_33985_34684(OUT_CONDITION_max_pooling_33985_34684),
    .OUT_CONDITION_max_pooling_33985_34807(OUT_CONDITION_max_pooling_33985_34807),
    .OUT_CONDITION_max_pooling_33985_34813(OUT_CONDITION_max_pooling_33985_34813),
    .OUT_CONDITION_max_pooling_33985_34821(OUT_CONDITION_max_pooling_33985_34821),
    .OUT_CONDITION_max_pooling_33985_34823(OUT_CONDITION_max_pooling_33985_34823),
    .OUT_UNBOUNDED_max_pooling_33985_34717(OUT_UNBOUNDED_max_pooling_33985_34717),
    .OUT_UNBOUNDED_max_pooling_33985_34723(OUT_UNBOUNDED_max_pooling_33985_34723),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_max_pooling Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_max_pooling_33985_34675(OUT_CONDITION_max_pooling_33985_34675),
    .OUT_CONDITION_max_pooling_33985_34684(OUT_CONDITION_max_pooling_33985_34684),
    .OUT_CONDITION_max_pooling_33985_34807(OUT_CONDITION_max_pooling_33985_34807),
    .OUT_CONDITION_max_pooling_33985_34813(OUT_CONDITION_max_pooling_33985_34813),
    .OUT_CONDITION_max_pooling_33985_34821(OUT_CONDITION_max_pooling_33985_34821),
    .OUT_CONDITION_max_pooling_33985_34823(OUT_CONDITION_max_pooling_33985_34823),
    .OUT_UNBOUNDED_max_pooling_33985_34717(OUT_UNBOUNDED_max_pooling_33985_34717),
    .OUT_UNBOUNDED_max_pooling_33985_34723(OUT_UNBOUNDED_max_pooling_33985_34723),
    .clock(clock),
    .reset(reset),
    .in_port_A(A),
    .in_port_B(B),
    .in_port_size(size),
    .in_port_stride(stride),
    .in_port_lateral_stride(lateral_stride),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_30_i0_LOAD(fuselector_BMEMORY_CTRLN_30_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_30_i0_STORE(fuselector_BMEMORY_CTRLN_30_i0_STORE),
    .selector_IN_UNBOUNDED_max_pooling_33985_34717(selector_IN_UNBOUNDED_max_pooling_33985_34717),
    .selector_IN_UNBOUNDED_max_pooling_33985_34723(selector_IN_UNBOUNDED_max_pooling_33985_34723),
    .selector_MUX_17___udivsi3_67_i0_0_0_0(selector_MUX_17___udivsi3_67_i0_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_30_i0_1_0_1),
    .selector_MUX_27_reg_0_0_0_0(selector_MUX_27_reg_0_0_0_0),
    .selector_MUX_32_reg_13_0_0_0(selector_MUX_32_reg_13_0_0_0),
    .selector_MUX_34_reg_15_0_0_0(selector_MUX_34_reg_15_0_0_0),
    .selector_MUX_34_reg_15_0_0_1(selector_MUX_34_reg_15_0_0_1),
    .selector_MUX_37_reg_18_0_0_0(selector_MUX_37_reg_18_0_0_0),
    .selector_MUX_38_reg_19_0_0_0(selector_MUX_38_reg_19_0_0_0),
    .selector_MUX_40_reg_20_0_0_0(selector_MUX_40_reg_20_0_0_0),
    .selector_MUX_49_reg_29_0_0_0(selector_MUX_49_reg_29_0_0_0),
    .selector_MUX_55_reg_7_0_0_0(selector_MUX_55_reg_7_0_0_0),
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

// Minimal interface for function: max_pooling
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module max_pooling(clock,
  reset,
  start_port,
  A,
  B,
  size,
  stride,
  lateral_stride,
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
  input [31:0] stride;
  input [31:0] lateral_stride;
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
  
  _max_pooling _max_pooling_i0 (.done_port(done_port),
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
    .stride(stride),
    .lateral_stride(lateral_stride),
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


