// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2023.1 - Revision 04336c437a53bc96ae90b74052c455629946ec8b-main - Date 2024-04-18T13:31:36
// /tmp/.mount_bambu-L7k5uw/usr/bin/bambu executed with: /tmp/.mount_bambu-L7k5uw/usr/bin/bambu --top-fname=icrc --generate-tb=../test_icrc.xml --simulate --simulator=XSIM ../spec.c 
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
module ARRAY_1D_STD_DISTRAM_NN_SDS(clock,
  reset,
  in1,
  in2,
  in3,
  in4,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    MEMORY_INIT_file="array.mem",
    n_elements=1,
    data_size=32,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    PRIVATE_MEMORY=0,
    READ_ONLY_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    ALIGNMENT=32,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
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
  parameter n_byte_on_databus = ALIGNMENT/8;
  parameter nbit_addr = BITSIZE_in2 > BITSIZE_proxy_in2 ? BITSIZE_in2 : BITSIZE_proxy_in2;
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_read_addr = n_elements == 1 ? 1 : $clog2(n_elements);
    parameter nbits_byte_offset = n_byte_on_databus<=1 ? 0 : $clog2(n_byte_on_databus);
  `else
    parameter nbit_read_addr = n_elements == 1 ? 1 : log2(n_elements);
    parameter nbits_byte_offset = n_byte_on_databus<=1 ? 0 : log2(n_byte_on_databus);
  `endif
  parameter max_n_writes = PORTSIZE_sel_STORE;
  parameter max_n_reads = PORTSIZE_sel_LOAD;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  
  wire [max_n_writes-1:0] bram_write;
  
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_a;
  wire [nbit_read_addr-1:0] memory_addr_a_0;
  wire [nbit_read_addr-1:0] memory_addr_a_1;
  
  wire [data_size*max_n_writes-1:0] din_value_aggregated;
  wire [data_size*max_n_reads-1:0] dout_a;
  wire [nbit_addr*max_n_rw-1:0] tmp_addr;
  wire [nbit_addr*max_n_rw-1:0] relative_addr;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  integer index2;
  
  reg [data_size-1:0] memory [0:n_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    $readmemb(MEMORY_INIT_file, memory, 0, n_elements-1);
  end
  
  generate
  genvar ind2;
  for (ind2=0; ind2<max_n_rw; ind2=ind2+1)
    begin : Lind2
      assign tmp_addr[(ind2+1)*nbit_addr-1:ind2*nbit_addr] = (proxy_sel_LOAD[ind2]||proxy_sel_STORE[ind2]) ? proxy_in2[(ind2+1)*BITSIZE_proxy_in2-1:ind2*BITSIZE_proxy_in2] : in2[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2];
    end
  endgenerate
  
  generate
  genvar i6;
    for (i6=0; i6<max_n_rw; i6=i6+1)
    begin : L6
      if(USE_SPARSE_MEMORY==1)
        assign relative_addr[(i6)*nbit_addr+nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6)*nbit_addr+nbit_addr-1:i6*nbit_addr];
      else
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6+1)*nbit_addr-1:i6*nbit_addr]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i7;
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_A
      if (n_elements==1)
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr];
    end
  endgenerate
  
  generate
  genvar i14;
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14
      assign din_value_aggregated[(i14+1)*data_size-1:i14*data_size] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] : in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1];
    end
  endgenerate
  
  generate
  genvar i11;
    for (i11=0; i11<max_n_reads; i11=i11+1)
    begin : asynchronous_read
      assign dout_a[data_size*i11+:data_size] = memory[memory_addr_a[nbit_read_addr*i11+:nbit_read_addr]];
    end
  endgenerate
  
  assign memory_addr_a_0 = memory_addr_a[nbit_read_addr*0+:nbit_read_addr];
  assign memory_addr_a_1 = memory_addr_a[nbit_read_addr*1+:nbit_read_addr];
  
  generate if(READ_ONLY_MEMORY==0)
    always @(posedge clock)
    begin
      if(bram_write[0])
        memory[memory_addr_a_0] <= din_value_aggregated[data_size*0+:data_size];
      if(bram_write[1])
        memory[memory_addr_a_1] <= din_value_aggregated[data_size*1+:data_size];
    end
  endgenerate
  
  generate
  genvar i21;
    for (i21=0; i21<max_n_writes; i21=i21+1)
    begin : L21
        assign bram_write[i21] = int_sel_STORE[i21] || proxy_sel_STORE[i21];
    end
  endgenerate
  
  generate
  genvar i20;
    for (i20=0; i20<max_n_reads; i20=i20+1)
    begin : L20
      assign out1[(i20+1)*BITSIZE_out1-1:i20*BITSIZE_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
      assign proxy_out1[(i20+1)*BITSIZE_proxy_out1-1:i20*BITSIZE_proxy_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
    end
  endgenerate
  assign Sout_Rdata_ram =Sin_Rdata_ram;
  assign Sout_DataRdy = Sin_DataRdy;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  
  assign Sout_DataRdy = Sin_DataRdy;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_BRAM_NN_SDS_BASE(clock,
  reset,
  in1,
  in2,
  in3,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    MEMORY_INIT_file="array.mem",
    n_elements=1,
    data_size=32,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    PRIVATE_MEMORY=0,
    READ_ONLY_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    HIGH_LATENCY=0,
    ALIGNMENT=32,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  
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
  parameter n_byte_on_databus = ALIGNMENT/8;
  parameter nbit_addr = BITSIZE_in2 > BITSIZE_proxy_in2 ? BITSIZE_in2 : BITSIZE_proxy_in2;
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_read_addr = n_elements == 1 ? 1 : $clog2(n_elements);
    parameter nbits_byte_offset = n_byte_on_databus<=1 ? 0 : $clog2(n_byte_on_databus);
  `else
    parameter nbit_read_addr = n_elements == 1 ? 1 : log2(n_elements);
    parameter nbits_byte_offset = n_byte_on_databus<=1 ? 0 : log2(n_byte_on_databus);
  `endif
  parameter max_n_writes = PORTSIZE_sel_STORE;
  parameter max_n_reads = PORTSIZE_sel_LOAD;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  
  wire [max_n_writes-1:0] bram_write;
  wire [max_n_writes-1:0] bram_write_temp;
  
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_a;
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_a_temp;
  
  wire [data_size*max_n_writes-1:0] din_value_aggregated;
  wire [data_size*max_n_writes-1:0] din_value_aggregated_temp;
  reg [data_size*max_n_reads-1:0] dout_a =0;
  reg [data_size*max_n_reads-1:0] dout_a_registered =0;
  reg [data_size-1:0] dout_a_registered_0 =0;
  reg [data_size-1:0] dout_a_registered_1 =0;
  wire [nbit_addr*max_n_rw-1:0] tmp_addr;
  wire [nbit_addr*max_n_rw-1:0] relative_addr;
  integer index2;
  
  reg [data_size-1:0] memory [0:n_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    $readmemb(MEMORY_INIT_file, memory, 0, n_elements-1);
  end
  
  generate
    if(HIGH_LATENCY==2)
    begin
      (* syn_keep=1 *)reg [nbit_read_addr*max_n_rw-1:0] memory_addr_a_reg =0;
      (* syn_keep=1 *)reg [data_size*max_n_writes-1:0] din_value_aggregated_reg =0;
      (* syn_keep=1 *)reg [max_n_writes-1:0] bram_write_reg =0;
      always @ (posedge clock)
      begin
         memory_addr_a_reg <= memory_addr_a;
         bram_write_reg <= bram_write;
         din_value_aggregated_reg <= din_value_aggregated;
      end
      assign memory_addr_a_temp = memory_addr_a_reg;
      assign bram_write_temp = bram_write_reg;
      assign din_value_aggregated_temp = din_value_aggregated_reg;
    end
    else
    begin
      assign memory_addr_a_temp = memory_addr_a;
      assign bram_write_temp = bram_write;
      assign din_value_aggregated_temp = din_value_aggregated;
    end
  endgenerate
  
  generate
  genvar ind2;
  for (ind2=0; ind2<max_n_rw; ind2=ind2+1)
    begin : Lind2
      assign tmp_addr[(ind2+1)*nbit_addr-1:ind2*nbit_addr] = (proxy_sel_LOAD[ind2]||proxy_sel_STORE[ind2]) ? proxy_in2[(ind2+1)*BITSIZE_proxy_in2-1:ind2*BITSIZE_proxy_in2] : in2[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2];
    end
  endgenerate
  
  generate
  genvar i6;
    for (i6=0; i6<max_n_rw; i6=i6+1)
    begin : L6
      if(USE_SPARSE_MEMORY==1)
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6+1)*nbit_addr-1:i6*nbit_addr];
      else
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6+1)*nbit_addr-1:i6*nbit_addr]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i7;
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_A
      if (n_elements==1)
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr];
    end
  endgenerate
  
  generate
  genvar i14;
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14
      assign din_value_aggregated[(i14+1)*data_size-1:i14*data_size] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] : in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1];
    end
  endgenerate
  
  generate
  genvar i11, i12;
    if(n_elements==1)
    begin : single_element
      always @(posedge clock)
      begin
        for (index2=0; index2<max_n_reads; index2=index2+1)
        begin : L12_single_read
          if(HIGH_LATENCY==0)
          begin
            dout_a[data_size*index2+:data_size] <= memory[memory_addr_a_temp[nbit_read_addr*index2+:nbit_read_addr]];
          end
          else
          begin
            dout_a_registered[data_size*index2+:data_size] <= memory[memory_addr_a_temp[nbit_read_addr*index2+:nbit_read_addr]];
            dout_a[data_size*index2+:data_size] <= dout_a_registered[data_size*index2+:data_size];
          end
        end
        for (index2=0; index2<max_n_writes; index2=index2+1)
        begin : L12_single_write
          if(READ_ONLY_MEMORY==0)
          begin
            if(bram_write_temp[index2])
              memory[memory_addr_a_temp[nbit_read_addr*index2+:nbit_read_addr]] <= din_value_aggregated_temp[data_size*index2+:data_size];
          end
        end
      end
    end
    else
    begin : multiple_elements
      if(max_n_rw ==2)
      begin
        always @(posedge clock)
        begin
          if(READ_ONLY_MEMORY==0)
          begin
            if(bram_write_temp[0])
              memory[memory_addr_a_temp[nbit_read_addr*(0+1)-1:nbit_read_addr*0]] <= din_value_aggregated_temp[data_size*0+:data_size];
          end
          if(HIGH_LATENCY==0)
          begin
            dout_a[data_size*(0+1)-1:data_size*0] <= memory[memory_addr_a_temp[nbit_read_addr*(0+1)-1:nbit_read_addr*0]];
          end
          else
          begin
            dout_a_registered_0 <= memory[memory_addr_a_temp[nbit_read_addr*(0+1)-1:nbit_read_addr*0]];
            dout_a[data_size*(0+1)-1:data_size*0] <= dout_a_registered_0;
          end
        end
        always @(posedge clock)
        begin
          if(READ_ONLY_MEMORY==0)
          begin
            if(bram_write_temp[1])
              memory[memory_addr_a_temp[nbit_read_addr*(1+1)-1:nbit_read_addr*1]] <= din_value_aggregated_temp[data_size*1+:data_size];
          end
          if(HIGH_LATENCY==0)
          begin
            dout_a[data_size*(1+1)-1:data_size*1] <= memory[memory_addr_a_temp[nbit_read_addr*(1+1)-1:nbit_read_addr*1]];
          end
          else
          begin
            dout_a_registered_1 <= memory[memory_addr_a_temp[nbit_read_addr*(1+1)-1:nbit_read_addr*1]];
            dout_a[data_size*(1+1)-1:data_size*1] <= dout_a_registered_1;
          end
        end
      end
      else
      begin
        //not supported
      end
    end    
  endgenerate
  
  generate
  genvar i21;
    for (i21=0; i21<max_n_writes; i21=i21+1)
    begin : L21
        assign bram_write[i21] = sel_STORE[i21] || proxy_sel_STORE[i21];
    end
  endgenerate
  
  generate
  genvar i20;
    for (i20=0; i20<max_n_reads; i20=i20+1)
    begin : L20
      assign out1[(i20+1)*BITSIZE_out1-1:i20*BITSIZE_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
      assign proxy_out1[(i20+1)*BITSIZE_proxy_out1-1:i20*BITSIZE_proxy_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
    end
  endgenerate
  assign Sout_Rdata_ram =Sin_Rdata_ram;
  assign Sout_DataRdy = Sin_DataRdy;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_BRAM_NN_SDS(clock,
  reset,
  in1,
  in2,
  in3,
  in4,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    MEMORY_INIT_file="array.mem",
    n_elements=1,
    data_size=32,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    PRIVATE_MEMORY=0,
    READ_ONLY_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    ALIGNMENT=32,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  ARRAY_1D_STD_BRAM_NN_SDS_BASE #(.BITSIZE_in1(BITSIZE_in1), .PORTSIZE_in1(PORTSIZE_in1), .BITSIZE_in2(BITSIZE_in2), .PORTSIZE_in2(PORTSIZE_in2), .BITSIZE_in3(BITSIZE_in3), .PORTSIZE_in3(PORTSIZE_in3), .BITSIZE_sel_LOAD(BITSIZE_sel_LOAD), .PORTSIZE_sel_LOAD(PORTSIZE_sel_LOAD), .BITSIZE_sel_STORE(BITSIZE_sel_STORE), .PORTSIZE_sel_STORE(PORTSIZE_sel_STORE), .BITSIZE_S_oe_ram(BITSIZE_S_oe_ram), .PORTSIZE_S_oe_ram(PORTSIZE_S_oe_ram), .BITSIZE_S_we_ram(BITSIZE_S_we_ram), .PORTSIZE_S_we_ram(PORTSIZE_S_we_ram), .BITSIZE_out1(BITSIZE_out1), .PORTSIZE_out1(PORTSIZE_out1), .BITSIZE_S_addr_ram(BITSIZE_S_addr_ram), .PORTSIZE_S_addr_ram(PORTSIZE_S_addr_ram), .BITSIZE_S_Wdata_ram(BITSIZE_S_Wdata_ram), .PORTSIZE_S_Wdata_ram(PORTSIZE_S_Wdata_ram), .BITSIZE_Sin_Rdata_ram(BITSIZE_Sin_Rdata_ram), .PORTSIZE_Sin_Rdata_ram(PORTSIZE_Sin_Rdata_ram), .BITSIZE_Sout_Rdata_ram(BITSIZE_Sout_Rdata_ram), .PORTSIZE_Sout_Rdata_ram(PORTSIZE_Sout_Rdata_ram), .BITSIZE_S_data_ram_size(BITSIZE_S_data_ram_size), .PORTSIZE_S_data_ram_size(PORTSIZE_S_data_ram_size), .BITSIZE_Sin_DataRdy(BITSIZE_Sin_DataRdy), .PORTSIZE_Sin_DataRdy(PORTSIZE_Sin_DataRdy), .BITSIZE_Sout_DataRdy(BITSIZE_Sout_DataRdy), .PORTSIZE_Sout_DataRdy(PORTSIZE_Sout_DataRdy), .MEMORY_INIT_file(MEMORY_INIT_file), .n_elements(n_elements), .data_size(data_size), .address_space_begin(address_space_begin), .address_space_rangesize(address_space_rangesize), .BUS_PIPELINED(BUS_PIPELINED), .PRIVATE_MEMORY(PRIVATE_MEMORY), .READ_ONLY_MEMORY(READ_ONLY_MEMORY), .USE_SPARSE_MEMORY(USE_SPARSE_MEMORY), .HIGH_LATENCY(0), .ALIGNMENT(ALIGNMENT), .BITSIZE_proxy_in1(BITSIZE_proxy_in1), .PORTSIZE_proxy_in1(PORTSIZE_proxy_in1), .BITSIZE_proxy_in2(BITSIZE_proxy_in2), .PORTSIZE_proxy_in2(PORTSIZE_proxy_in2), .BITSIZE_proxy_in3(BITSIZE_proxy_in3), .PORTSIZE_proxy_in3(PORTSIZE_proxy_in3), .BITSIZE_proxy_sel_LOAD(BITSIZE_proxy_sel_LOAD), .PORTSIZE_proxy_sel_LOAD(PORTSIZE_proxy_sel_LOAD), .BITSIZE_proxy_sel_STORE(BITSIZE_proxy_sel_STORE), .PORTSIZE_proxy_sel_STORE(PORTSIZE_proxy_sel_STORE), .BITSIZE_proxy_out1(BITSIZE_proxy_out1), .PORTSIZE_proxy_out1(PORTSIZE_proxy_out1)) ARRAY_1D_STD_BRAM_NN_instance (.out1(out1), .Sout_Rdata_ram(Sout_Rdata_ram), .Sout_DataRdy(Sout_DataRdy), .proxy_out1(proxy_out1), .clock(clock), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .sel_LOAD(sel_LOAD & in4), .sel_STORE(sel_STORE & in4), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size ), .Sin_DataRdy(Sin_DataRdy), .proxy_in1(proxy_in1), .proxy_in2(proxy_in2), .proxy_in3(proxy_in3), .proxy_sel_LOAD(proxy_sel_LOAD), .proxy_sel_STORE(proxy_sel_STORE));
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module addr_expr_FU(in1,
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
// Copyright (C) 2020-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module extract_bit_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output out1;
  assign out1 = (in1 >>> in2)&1;
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
module IUconvert_expr_FU(in1,
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
// Copyright (C) 2016-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lut_expr_FU(in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7,
  in8,
  in9,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input in2;
  input in3;
  input in4;
  input in5;
  input in6;
  input in7;
  input in8;
  input in9;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg[7:0] cleaned_in0;
  wire [7:0] in0;
  wire[BITSIZE_in1-1:0] shifted_s;
  assign in0 = {in9, in8, in7, in6, in5, in4, in3, in2};
  generate
    genvar i0;
    for (i0=0; i0<8; i0=i0+1)
    begin : L0
          always @(*)
          begin
             if (in0[i0] == 1'b1)
                cleaned_in0[i0] = 1'b1;
             else
                cleaned_in0[i0] = 1'b0;
          end
    end
  endgenerate
  assign shifted_s = in1 >> cleaned_in0;
  assign out1[0] = shifted_s[0];
  generate
     if(BITSIZE_out1 > 1)
       assign out1[BITSIZE_out1-1:1] = 0;
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
module bit_xor_expr_FU(in1,
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
  assign out1 = in1 ^ in2;
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
module ui_ge_expr_FU(in1,
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
  assign out1 = in1 >= in2;
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

// Datapath RTL description for icrc
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_icrc(clock,
  reset,
  in_port_crc,
  in_port_lin,
  in_port_len,
  in_port_jinit,
  in_port_jrev,
  return_port,
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
  fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD,
  fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE,
  fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD,
  fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_STORE,
  fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD,
  fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE,
  fuselector_BMEMORY_CTRLN_118_i0_LOAD,
  fuselector_BMEMORY_CTRLN_118_i0_STORE,
  selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0,
  selector_MUX_134_gimple_return_FU_52_i0_0_0_0,
  selector_MUX_134_gimple_return_FU_52_i0_0_0_1,
  selector_MUX_185_reg_0_0_0_0,
  selector_MUX_185_reg_0_0_0_1,
  selector_MUX_196_reg_19_0_0_0,
  selector_MUX_198_reg_20_0_0_0,
  selector_MUX_199_reg_21_0_0_0,
  selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0,
  selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1,
  selector_MUX_200_reg_22_0_0_0,
  selector_MUX_206_reg_28_0_0_0,
  selector_MUX_207_reg_29_0_0_0,
  selector_MUX_213_reg_34_0_0_0,
  selector_MUX_214_reg_35_0_0_0,
  selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0,
  selector_MUX_220_reg_40_0_0_0,
  selector_MUX_220_reg_40_0_0_1,
  selector_MUX_220_reg_40_0_1_0,
  selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0,
  selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1,
  selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0,
  selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1,
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
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_icrc_33779_33825,
  OUT_CONDITION_icrc_33779_34027,
  OUT_CONDITION_icrc_33779_34036,
  OUT_CONDITION_icrc_33779_34083,
  OUT_CONDITION_icrc_33779_34136,
  OUT_CONDITION_icrc_33779_34201,
  OUT_CONDITION_icrc_33779_34245,
  OUT_MULTIIF_icrc_33779_34594);
  parameter MEM_var_33827_33779=512,
    MEM_var_33854_33779=512,
    MEM_var_33935_33779=512,
    MEM_var_33965_33779=512;
  // IN
  input clock;
  input reset;
  input [15:0] in_port_crc;
  input [31:0] in_port_lin;
  input [31:0] in_port_len;
  input signed [15:0] in_port_jinit;
  input signed [31:0] in_port_jrev;
  input [31:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [31:0] Min_Wdata_ram;
  input [9:0] Min_data_ram_size;
  input fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD;
  input fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE;
  input fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD;
  input fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_STORE;
  input fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD;
  input fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE;
  input fuselector_BMEMORY_CTRLN_118_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_118_i0_STORE;
  input selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0;
  input selector_MUX_134_gimple_return_FU_52_i0_0_0_0;
  input selector_MUX_134_gimple_return_FU_52_i0_0_0_1;
  input selector_MUX_185_reg_0_0_0_0;
  input selector_MUX_185_reg_0_0_0_1;
  input selector_MUX_196_reg_19_0_0_0;
  input selector_MUX_198_reg_20_0_0_0;
  input selector_MUX_199_reg_21_0_0_0;
  input selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0;
  input selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1;
  input selector_MUX_200_reg_22_0_0_0;
  input selector_MUX_206_reg_28_0_0_0;
  input selector_MUX_207_reg_29_0_0_0;
  input selector_MUX_213_reg_34_0_0_0;
  input selector_MUX_214_reg_35_0_0_0;
  input selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0;
  input selector_MUX_220_reg_40_0_0_0;
  input selector_MUX_220_reg_40_0_0_1;
  input selector_MUX_220_reg_40_0_1_0;
  input selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0;
  input selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1;
  input selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0;
  input selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1;
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
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [15:0] return_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [31:0] Mout_Wdata_ram;
  output [9:0] Mout_data_ram_size;
  output OUT_CONDITION_icrc_33779_33825;
  output OUT_CONDITION_icrc_33779_34027;
  output OUT_CONDITION_icrc_33779_34036;
  output OUT_CONDITION_icrc_33779_34083;
  output OUT_CONDITION_icrc_33779_34136;
  output OUT_CONDITION_icrc_33779_34201;
  output OUT_CONDITION_icrc_33779_34245;
  output [3:0] OUT_MULTIIF_icrc_33779_34594;
  // Component and signal declarations
  wire [7:0] null_out_signal_BMEMORY_CTRLN_118_i0_out1_1;
  wire null_out_signal_array_33827_0_Sout_DataRdy_0;
  wire null_out_signal_array_33827_0_Sout_DataRdy_1;
  wire [15:0] null_out_signal_array_33827_0_Sout_Rdata_ram_0;
  wire [15:0] null_out_signal_array_33827_0_Sout_Rdata_ram_1;
  wire [15:0] null_out_signal_array_33827_0_out1_1;
  wire [15:0] null_out_signal_array_33827_0_proxy_out1_0;
  wire [15:0] null_out_signal_array_33827_0_proxy_out1_1;
  wire null_out_signal_array_33854_0_Sout_DataRdy_0;
  wire null_out_signal_array_33854_0_Sout_DataRdy_1;
  wire [15:0] null_out_signal_array_33854_0_Sout_Rdata_ram_0;
  wire [15:0] null_out_signal_array_33854_0_Sout_Rdata_ram_1;
  wire [15:0] null_out_signal_array_33854_0_out1_1;
  wire [15:0] null_out_signal_array_33854_0_proxy_out1_0;
  wire [15:0] null_out_signal_array_33854_0_proxy_out1_1;
  wire null_out_signal_array_33935_0_Sout_DataRdy_0;
  wire null_out_signal_array_33935_0_Sout_DataRdy_1;
  wire [15:0] null_out_signal_array_33935_0_Sout_Rdata_ram_0;
  wire [15:0] null_out_signal_array_33935_0_Sout_Rdata_ram_1;
  wire [15:0] null_out_signal_array_33935_0_proxy_out1_0;
  wire [15:0] null_out_signal_array_33935_0_proxy_out1_1;
  wire null_out_signal_array_33965_0_Sout_DataRdy_0;
  wire null_out_signal_array_33965_0_Sout_DataRdy_1;
  wire [15:0] null_out_signal_array_33965_0_Sout_Rdata_ram_0;
  wire [15:0] null_out_signal_array_33965_0_Sout_Rdata_ram_1;
  wire [15:0] null_out_signal_array_33965_0_proxy_out1_0;
  wire [15:0] null_out_signal_array_33965_0_proxy_out1_1;
  wire [15:0] out_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_array_33854_0;
  wire [7:0] out_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_array_33935_0;
  wire [7:0] out_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_array_33935_0;
  wire [15:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_33827_0;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_array_33965_0;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_array_33965_0;
  wire [7:0] out_BMEMORY_CTRLN_118_i0_BMEMORY_CTRLN_118_i0;
  wire signed [15:0] out_IIconvert_expr_FU_103_i0_fu_icrc_33779_34196;
  wire signed [15:0] out_IIconvert_expr_FU_116_i0_fu_icrc_33779_34261;
  wire signed [15:0] out_IIconvert_expr_FU_27_i0_fu_icrc_33779_34042;
  wire signed [15:0] out_IIconvert_expr_FU_66_i0_fu_icrc_33779_33919;
  wire signed [7:0] out_IIconvert_expr_FU_71_i0_fu_icrc_33779_33951;
  wire signed [15:0] out_IIconvert_expr_FU_77_i0_fu_icrc_33779_34080;
  wire signed [15:0] out_IIconvert_expr_FU_89_i0_fu_icrc_33779_34131;
  wire [7:0] out_IUconvert_expr_FU_25_i0_fu_icrc_33779_34039;
  wire [15:0] out_IUdata_converter_FU_104_i0_fu_icrc_33779_34198;
  wire [7:0] out_IUdata_converter_FU_110_i0_fu_icrc_33779_34491;
  wire [7:0] out_IUdata_converter_FU_114_i0_fu_icrc_33779_34504;
  wire [15:0] out_IUdata_converter_FU_117_i0_fu_icrc_33779_34263;
  wire [7:0] out_IUdata_converter_FU_19_i0_fu_icrc_33779_34397;
  wire [7:0] out_IUdata_converter_FU_24_i0_fu_icrc_33779_34410;
  wire [15:0] out_IUdata_converter_FU_28_i0_fu_icrc_33779_34044;
  wire [3:0] out_IUdata_converter_FU_58_i0_fu_icrc_33779_34336;
  wire [11:0] out_IUdata_converter_FU_60_i0_fu_icrc_33779_34351;
  wire [15:0] out_IUdata_converter_FU_67_i0_fu_icrc_33779_33912;
  wire [7:0] out_IUdata_converter_FU_73_i0_fu_icrc_33779_33941;
  wire [15:0] out_IUdata_converter_FU_78_i0_fu_icrc_33779_34082;
  wire [7:0] out_IUdata_converter_FU_85_i0_fu_icrc_33779_34434;
  wire [15:0] out_IUdata_converter_FU_90_i0_fu_icrc_33779_34133;
  wire [7:0] out_IUdata_converter_FU_96_i0_fu_icrc_33779_34454;
  wire [7:0] out_IUdata_converter_FU_99_i0_fu_icrc_33779_34467;
  wire [31:0] out_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0;
  wire [15:0] out_MUX_134_gimple_return_FU_52_i0_0_0_0;
  wire [15:0] out_MUX_134_gimple_return_FU_52_i0_0_0_1;
  wire [15:0] out_MUX_185_reg_0_0_0_0;
  wire [15:0] out_MUX_185_reg_0_0_0_1;
  wire [15:0] out_MUX_196_reg_19_0_0_0;
  wire [31:0] out_MUX_198_reg_20_0_0_0;
  wire [15:0] out_MUX_199_reg_21_0_0_0;
  wire [31:0] out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0;
  wire [31:0] out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1;
  wire [31:0] out_MUX_200_reg_22_0_0_0;
  wire [15:0] out_MUX_206_reg_28_0_0_0;
  wire [15:0] out_MUX_207_reg_29_0_0_0;
  wire [15:0] out_MUX_213_reg_34_0_0_0;
  wire [15:0] out_MUX_214_reg_35_0_0_0;
  wire [31:0] out_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0;
  wire [15:0] out_MUX_220_reg_40_0_0_0;
  wire [15:0] out_MUX_220_reg_40_0_0_1;
  wire [15:0] out_MUX_220_reg_40_0_1_0;
  wire [31:0] out_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0;
  wire [31:0] out_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1;
  wire [31:0] out_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0;
  wire [31:0] out_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1;
  wire signed [15:0] out_UIdata_converter_FU_100_i0_fu_icrc_33779_34192;
  wire signed [8:0] out_UIdata_converter_FU_102_i0_fu_icrc_33779_34194;
  wire signed [8:0] out_UIdata_converter_FU_109_i0_fu_icrc_33779_34253;
  wire signed [8:0] out_UIdata_converter_FU_111_i0_fu_icrc_33779_34255;
  wire signed [8:0] out_UIdata_converter_FU_113_i0_fu_icrc_33779_34257;
  wire signed [8:0] out_UIdata_converter_FU_115_i0_fu_icrc_33779_34259;
  wire signed [8:0] out_UIdata_converter_FU_16_i0_fu_icrc_33779_34072;
  wire signed [8:0] out_UIdata_converter_FU_21_i0_fu_icrc_33779_34076;
  wire signed [8:0] out_UIdata_converter_FU_26_i0_fu_icrc_33779_34040;
  wire signed [4:0] out_UIdata_converter_FU_57_i0_fu_icrc_33779_34003;
  wire signed [12:0] out_UIdata_converter_FU_59_i0_fu_icrc_33779_34016;
  wire signed [15:0] out_UIdata_converter_FU_65_i0_fu_icrc_33779_33928;
  wire signed [7:0] out_UIdata_converter_FU_70_i0_fu_icrc_33779_33959;
  wire signed [7:0] out_UIdata_converter_FU_72_i0_fu_icrc_33779_34010;
  wire signed [8:0] out_UIdata_converter_FU_75_i0_fu_icrc_33779_34074;
  wire signed [8:0] out_UIdata_converter_FU_76_i0_fu_icrc_33779_34078;
  wire signed [8:0] out_UIdata_converter_FU_84_i0_fu_icrc_33779_34125;
  wire signed [15:0] out_UIdata_converter_FU_86_i0_fu_icrc_33779_34127;
  wire signed [8:0] out_UIdata_converter_FU_88_i0_fu_icrc_33779_34129;
  wire signed [8:0] out_UIdata_converter_FU_95_i0_fu_icrc_33779_34185;
  wire signed [8:0] out_UIdata_converter_FU_98_i0_fu_icrc_33779_34190;
  wire [7:0] out_UUconvert_expr_FU_101_i0_fu_icrc_33779_34193;
  wire [7:0] out_UUconvert_expr_FU_108_i0_fu_icrc_33779_34252;
  wire [7:0] out_UUconvert_expr_FU_112_i0_fu_icrc_33779_34256;
  wire [7:0] out_UUconvert_expr_FU_15_i0_fu_icrc_33779_34071;
  wire [7:0] out_UUconvert_expr_FU_20_i0_fu_icrc_33779_34075;
  wire [7:0] out_UUconvert_expr_FU_83_i0_fu_icrc_33779_34123;
  wire [7:0] out_UUconvert_expr_FU_87_i0_fu_icrc_33779_34128;
  wire [7:0] out_UUconvert_expr_FU_97_i0_fu_icrc_33779_34188;
  wire [15:0] out_UUdata_converter_FU_105_i0_fu_icrc_33779_34200;
  wire [31:0] out_UUdata_converter_FU_10_i0_fu_icrc_33779_34328;
  wire [31:0] out_UUdata_converter_FU_12_i0_fu_icrc_33779_34348;
  wire [31:0] out_UUdata_converter_FU_18_i0_fu_icrc_33779_34394;
  wire [31:0] out_UUdata_converter_FU_23_i0_fu_icrc_33779_34407;
  wire [31:0] out_UUdata_converter_FU_31_i0_fu_icrc_33779_34451;
  wire [31:0] out_UUdata_converter_FU_33_i0_fu_icrc_33779_34464;
  wire [31:0] out_UUdata_converter_FU_35_i0_fu_icrc_33779_34431;
  wire [31:0] out_UUdata_converter_FU_37_i0_fu_icrc_33779_34488;
  wire [31:0] out_UUdata_converter_FU_39_i0_fu_icrc_33779_34501;
  wire [15:0] out_UUdata_converter_FU_56_i0_fu_icrc_33779_33908;
  wire [15:0] out_UUdata_converter_FU_91_i0_fu_icrc_33779_34135;
  wire [31:0] out_addr_expr_FU_11_i0_fu_icrc_33779_34381;
  wire [31:0] out_addr_expr_FU_13_i0_fu_icrc_33779_34385;
  wire [31:0] out_addr_expr_FU_17_i0_fu_icrc_33779_34421;
  wire [31:0] out_addr_expr_FU_22_i0_fu_icrc_33779_34425;
  wire [31:0] out_addr_expr_FU_30_i0_fu_icrc_33779_34477;
  wire [31:0] out_addr_expr_FU_32_i0_fu_icrc_33779_34481;
  wire [31:0] out_addr_expr_FU_34_i0_fu_icrc_33779_34446;
  wire [31:0] out_addr_expr_FU_36_i0_fu_icrc_33779_34514;
  wire [31:0] out_addr_expr_FU_38_i0_fu_icrc_33779_34518;
  wire [31:0] out_addr_expr_FU_6_i0_fu_icrc_33779_34308;
  wire [31:0] out_addr_expr_FU_7_i0_fu_icrc_33779_34315;
  wire [31:0] out_addr_expr_FU_8_i0_fu_icrc_33779_34369;
  wire [31:0] out_addr_expr_FU_9_i0_fu_icrc_33779_34377;
  wire signed [8:0] out_bit_and_expr_FU_16_0_16_119_i0_fu_icrc_33779_34038;
  wire signed [15:0] out_bit_ior_expr_FU_0_16_16_120_i0_fu_icrc_33779_34043;
  wire signed [15:0] out_bit_ior_expr_FU_0_16_16_121_i0_fu_icrc_33779_34081;
  wire signed [15:0] out_bit_ior_expr_FU_0_16_16_122_i0_fu_icrc_33779_34262;
  wire signed [7:0] out_bit_ior_expr_FU_8_8_8_123_i0_fu_icrc_33779_33945;
  wire signed [15:0] out_bit_xor_expr_FU_16_0_16_124_i0_fu_icrc_33779_33915;
  wire signed [15:0] out_bit_xor_expr_FU_16_16_16_125_i0_fu_icrc_33779_34132;
  wire signed [15:0] out_bit_xor_expr_FU_16_16_16_125_i1_fu_icrc_33779_34197;
  wire out_const_0;
  wire [15:0] out_const_1;
  wire [2:0] out_const_10;
  wire [3:0] out_const_11;
  wire [7:0] out_const_12;
  wire [8:0] out_const_13;
  wire [28:0] out_const_14;
  wire [3:0] out_const_15;
  wire [4:0] out_const_16;
  wire [9:0] out_const_17;
  wire [9:0] out_const_18;
  wire [9:0] out_const_19;
  wire [1:0] out_const_2;
  wire [9:0] out_const_20;
  wire [3:0] out_const_3;
  wire [4:0] out_const_4;
  wire [5:0] out_const_5;
  wire [13:0] out_const_6;
  wire [8:0] out_const_7;
  wire out_const_8;
  wire [1:0] out_const_9;
  wire [31:0] out_conv_out_const_0_1_32;
  wire signed [31:0] out_conv_out_const_0_I_1_I_32;
  wire [31:0] out_conv_out_const_17_10_32;
  wire [31:0] out_conv_out_const_18_10_32;
  wire [31:0] out_conv_out_const_19_10_32;
  wire [31:0] out_conv_out_const_20_10_32;
  wire [4:0] out_conv_out_const_5_6_5;
  wire [15:0] out_conv_out_const_8_1_16;
  wire out_extract_bit_expr_FU_14_i0_fu_icrc_33779_34554;
  wire out_extract_bit_expr_FU_29_i0_fu_icrc_33779_34557;
  wire out_ge_expr_FU_16_0_16_126_i0_fu_icrc_33779_34312;
  wire out_ge_expr_FU_32_0_32_127_i0_fu_icrc_33779_34485;
  wire signed [31:0] out_ii_conv_conn_obj_2_IIdata_converter_FU_ii_conv_0;
  wire signed [15:0] out_lshift_expr_FU_16_0_16_128_i0_fu_icrc_33779_33922;
  wire signed [15:0] out_lshift_expr_FU_16_0_16_129_i0_fu_icrc_33779_34041;
  wire signed [15:0] out_lshift_expr_FU_16_0_16_129_i1_fu_icrc_33779_34079;
  wire signed [15:0] out_lshift_expr_FU_16_0_16_129_i2_fu_icrc_33779_34130;
  wire signed [15:0] out_lshift_expr_FU_16_0_16_129_i3_fu_icrc_33779_34195;
  wire signed [15:0] out_lshift_expr_FU_16_0_16_129_i4_fu_icrc_33779_34260;
  wire signed [7:0] out_lshift_expr_FU_8_0_8_130_i0_fu_icrc_33779_33954;
  wire out_lut_expr_FU_40_i0_fu_icrc_33779_34573;
  wire out_lut_expr_FU_41_i0_fu_icrc_33779_34593;
  wire out_lut_expr_FU_42_i0_fu_icrc_33779_34597;
  wire out_lut_expr_FU_43_i0_fu_icrc_33779_34603;
  wire out_lut_expr_FU_44_i0_fu_icrc_33779_34606;
  wire [3:0] out_multi_read_cond_FU_48_i0_fu_icrc_33779_34594;
  wire out_ne_expr_FU_32_0_32_131_i0_fu_icrc_33779_34525;
  wire signed [31:0] out_plus_expr_FU_32_0_32_132_i0_fu_icrc_33779_34026;
  wire out_read_cond_FU_106_i0_fu_icrc_33779_34201;
  wire out_read_cond_FU_107_i0_fu_icrc_33779_34245;
  wire out_read_cond_FU_45_i0_fu_icrc_33779_33825;
  wire out_read_cond_FU_69_i0_fu_icrc_33779_34027;
  wire out_read_cond_FU_74_i0_fu_icrc_33779_34036;
  wire out_read_cond_FU_79_i0_fu_icrc_33779_34083;
  wire out_read_cond_FU_92_i0_fu_icrc_33779_34136;
  wire [15:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire out_reg_14_reg_14;
  wire out_reg_15_reg_15;
  wire out_reg_16_reg_16;
  wire out_reg_17_reg_17;
  wire out_reg_18_reg_18;
  wire [15:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire [15:0] out_reg_21_reg_21;
  wire [31:0] out_reg_22_reg_22;
  wire [3:0] out_reg_23_reg_23;
  wire [11:0] out_reg_24_reg_24;
  wire [31:0] out_reg_25_reg_25;
  wire [31:0] out_reg_26_reg_26;
  wire out_reg_27_reg_27;
  wire [15:0] out_reg_28_reg_28;
  wire [15:0] out_reg_29_reg_29;
  wire [31:0] out_reg_2_reg_2;
  wire [7:0] out_reg_30_reg_30;
  wire [15:0] out_reg_31_reg_31;
  wire out_reg_32_reg_32;
  wire [31:0] out_reg_33_reg_33;
  wire [15:0] out_reg_34_reg_34;
  wire [15:0] out_reg_35_reg_35;
  wire [7:0] out_reg_36_reg_36;
  wire [15:0] out_reg_37_reg_37;
  wire out_reg_38_reg_38;
  wire [31:0] out_reg_39_reg_39;
  wire [31:0] out_reg_3_reg_3;
  wire [15:0] out_reg_40_reg_40;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire [31:0] out_reg_9_reg_9;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_133_i0_fu_icrc_33779_34007;
  wire [7:0] out_ui_bit_xor_expr_FU_8_8_8_134_i0_fu_icrc_33779_34124;
  wire [7:0] out_ui_bit_xor_expr_FU_8_8_8_134_i1_fu_icrc_33779_34189;
  wire [15:0] out_ui_cond_expr_FU_16_16_16_16_135_i0_fu_icrc_33779_33887;
  wire [15:0] out_ui_cond_expr_FU_16_16_16_16_135_i1_fu_icrc_33779_34613;
  wire out_ui_eq_expr_FU_16_0_16_136_i0_fu_icrc_33779_34523;
  wire out_ui_extract_bit_expr_FU_68_i0_fu_icrc_33779_34565;
  wire out_ui_ge_expr_FU_32_32_32_137_i0_fu_icrc_33779_34533;
  wire out_ui_le_expr_FU_32_32_32_138_i0_fu_icrc_33779_34535;
  wire [15:0] out_ui_lshift_expr_FU_16_0_16_139_i0_fu_icrc_33779_33902;
  wire [15:0] out_ui_lshift_expr_FU_16_0_16_140_i0_fu_icrc_33779_33931;
  wire [8:0] out_ui_lshift_expr_FU_16_0_16_141_i0_fu_icrc_33779_34438;
  wire [8:0] out_ui_lshift_expr_FU_16_0_16_141_i1_fu_icrc_33779_34470;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_142_i0_fu_icrc_33779_34366;
  wire out_ui_ne_expr_FU_32_0_32_143_i0_fu_icrc_33779_34527;
  wire out_ui_ne_expr_FU_32_0_32_144_i0_fu_icrc_33779_34529;
  wire out_ui_ne_expr_FU_32_0_32_144_i1_fu_icrc_33779_34531;
  wire out_ui_ne_expr_FU_32_0_32_144_i2_fu_icrc_33779_34537;
  wire [15:0] out_ui_plus_expr_FU_16_0_16_145_i0_fu_icrc_33779_34134;
  wire [15:0] out_ui_plus_expr_FU_16_0_16_145_i1_fu_icrc_33779_34199;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_146_i0_fu_icrc_33779_33872;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i0_fu_icrc_33779_34120;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i10_fu_icrc_33779_34473;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i11_fu_icrc_33779_34497;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i12_fu_icrc_33779_34510;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i1_fu_icrc_33779_34183;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i2_fu_icrc_33779_34343;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i3_fu_icrc_33779_34357;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i4_fu_icrc_33779_34372;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i5_fu_icrc_33779_34388;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i6_fu_icrc_33779_34403;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i7_fu_icrc_33779_34416;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i8_fu_icrc_33779_34441;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_147_i9_fu_icrc_33779_34460;
  wire [11:0] out_ui_rshift_expr_FU_16_0_16_148_i0_fu_icrc_33779_34019;
  wire [7:0] out_ui_rshift_expr_FU_16_0_16_149_i0_fu_icrc_33779_34070;
  wire [7:0] out_ui_rshift_expr_FU_16_0_16_149_i1_fu_icrc_33779_34122;
  wire [7:0] out_ui_rshift_expr_FU_16_0_16_149_i2_fu_icrc_33779_34187;
  wire [7:0] out_ui_rshift_expr_FU_16_0_16_149_i3_fu_icrc_33779_34251;
  wire [15:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1;
  wire [31:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_2;
  wire [15:0] out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3;
  wire [7:0] out_uu_conv_conn_obj_4_UUdata_converter_FU_uu_conv_4;
  wire [15:0] out_uu_conv_conn_obj_5_UUdata_converter_FU_uu_conv_5;
  
  BMEMORY_CTRLN #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(32),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(5),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(8),
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
    .BITSIZE_M_Rdata_ram(16),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(16),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(16),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(5),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(5),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_118_i0 (.out1({null_out_signal_BMEMORY_CTRLN_118_i0_out1_1,
      out_BMEMORY_CTRLN_118_i0_BMEMORY_CTRLN_118_i0}),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .in1({1'b0,
      1'b0}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0}),
    .in3({5'b00000,
      out_const_4}),
    .in4({1'b0,
      out_const_8}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_118_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_118_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  IIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IIdata_converter_FU_ii_conv_0 (.out1(out_ii_conv_conn_obj_2_IIdata_converter_FU_ii_conv_0),
    .in1(out_conv_out_const_0_I_1_I_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 (.out1(out_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0),
    .sel(selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0),
    .in1(out_reg_1_reg_1),
    .in2(out_addr_expr_FU_6_i0_fu_icrc_33779_34308));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_134_gimple_return_FU_52_i0_0_0_0 (.out1(out_MUX_134_gimple_return_FU_52_i0_0_0_0),
    .sel(selector_MUX_134_gimple_return_FU_52_i0_0_0_0),
    .in1(out_reg_40_reg_40),
    .in2(in_port_crc));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_134_gimple_return_FU_52_i0_0_0_1 (.out1(out_MUX_134_gimple_return_FU_52_i0_0_0_1),
    .sel(selector_MUX_134_gimple_return_FU_52_i0_0_0_1),
    .in1(out_IUdata_converter_FU_117_i0_fu_icrc_33779_34263),
    .in2(out_MUX_134_gimple_return_FU_52_i0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_185_reg_0_0_0_0 (.out1(out_MUX_185_reg_0_0_0_0),
    .sel(selector_MUX_185_reg_0_0_0_0),
    .in1(out_IUdata_converter_FU_104_i0_fu_icrc_33779_34198),
    .in2(out_IUdata_converter_FU_28_i0_fu_icrc_33779_34044));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_185_reg_0_0_0_1 (.out1(out_MUX_185_reg_0_0_0_1),
    .sel(selector_MUX_185_reg_0_0_0_1),
    .in1(out_IUdata_converter_FU_78_i0_fu_icrc_33779_34082),
    .in2(out_MUX_185_reg_0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_196_reg_19_0_0_0 (.out1(out_MUX_196_reg_19_0_0_0),
    .sel(selector_MUX_196_reg_19_0_0_0),
    .in1(out_IUdata_converter_FU_90_i0_fu_icrc_33779_34133),
    .in2(out_ui_cond_expr_FU_16_16_16_16_135_i1_fu_icrc_33779_34613));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_198_reg_20_0_0_0 (.out1(out_MUX_198_reg_20_0_0_0),
    .sel(selector_MUX_198_reg_20_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_146_i0_fu_icrc_33779_33872),
    .in2(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_2));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_199_reg_21_0_0_0 (.out1(out_MUX_199_reg_21_0_0_0),
    .sel(selector_MUX_199_reg_21_0_0_0),
    .in1(out_ui_cond_expr_FU_16_16_16_16_135_i0_fu_icrc_33779_33887),
    .in2(out_ui_lshift_expr_FU_16_0_16_139_i0_fu_icrc_33779_33902));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0 (.out1(out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0),
    .sel(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0),
    .in1(out_reg_33_reg_33),
    .in2(out_reg_25_reg_25));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1 (.out1(out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1),
    .sel(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_147_i10_fu_icrc_33779_34473),
    .in2(out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_200_reg_22_0_0_0 (.out1(out_MUX_200_reg_22_0_0_0),
    .sel(selector_MUX_200_reg_22_0_0_0),
    .in1(out_ii_conv_conn_obj_2_IIdata_converter_FU_ii_conv_0),
    .in2(out_plus_expr_FU_32_0_32_132_i0_fu_icrc_33779_34026));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_206_reg_28_0_0_0 (.out1(out_MUX_206_reg_28_0_0_0),
    .sel(selector_MUX_206_reg_28_0_0_0),
    .in1(out_ui_plus_expr_FU_16_0_16_145_i0_fu_icrc_33779_34134),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_207_reg_29_0_0_0 (.out1(out_MUX_207_reg_29_0_0_0),
    .sel(selector_MUX_207_reg_29_0_0_0),
    .in1(out_UUdata_converter_FU_91_i0_fu_icrc_33779_34135),
    .in2(out_uu_conv_conn_obj_5_UUdata_converter_FU_uu_conv_5));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_213_reg_34_0_0_0 (.out1(out_MUX_213_reg_34_0_0_0),
    .sel(selector_MUX_213_reg_34_0_0_0),
    .in1(out_ui_plus_expr_FU_16_0_16_145_i1_fu_icrc_33779_34199),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_214_reg_35_0_0_0 (.out1(out_MUX_214_reg_35_0_0_0),
    .sel(selector_MUX_214_reg_35_0_0_0),
    .in1(out_UUdata_converter_FU_105_i0_fu_icrc_33779_34200),
    .in2(out_uu_conv_conn_obj_5_UUdata_converter_FU_uu_conv_5));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_21_BMEMORY_CTRLN_118_i0_1_0_0 (.out1(out_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0),
    .sel(selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_147_i0_fu_icrc_33779_34120),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_147_i1_fu_icrc_33779_34183));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_220_reg_40_0_0_0 (.out1(out_MUX_220_reg_40_0_0_0),
    .sel(selector_MUX_220_reg_40_0_0_0),
    .in1(out_reg_0_reg_0),
    .in2(out_IUdata_converter_FU_104_i0_fu_icrc_33779_34198));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_220_reg_40_0_0_1 (.out1(out_MUX_220_reg_40_0_0_1),
    .sel(selector_MUX_220_reg_40_0_0_1),
    .in1(out_IUdata_converter_FU_78_i0_fu_icrc_33779_34082),
    .in2(out_IUdata_converter_FU_90_i0_fu_icrc_33779_34133));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_220_reg_40_0_1_0 (.out1(out_MUX_220_reg_40_0_1_0),
    .sel(selector_MUX_220_reg_40_0_1_0),
    .in1(out_MUX_220_reg_40_0_0_0),
    .in2(out_MUX_220_reg_40_0_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0 (.out1(out_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0),
    .sel(selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_39_reg_39));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1 (.out1(out_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1),
    .sel(selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_147_i11_fu_icrc_33779_34497),
    .in2(out_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0 (.out1(out_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0),
    .sel(selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0),
    .in1(out_reg_7_reg_7),
    .in2(out_reg_26_reg_26));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1 (.out1(out_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1),
    .sel(selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_147_i12_fu_icrc_33779_34510),
    .in2(out_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0));
  UUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1),
    .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_2),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) UUdata_converter_FU_uu_conv_3 (.out1(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3),
    .in1(out_reg_21_reg_21));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) UUdata_converter_FU_uu_conv_4 (.out1(out_uu_conv_conn_obj_4_UUdata_converter_FU_uu_conv_4),
    .in1(out_IUdata_converter_FU_73_i0_fu_icrc_33779_33941));
  UUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) UUdata_converter_FU_uu_conv_5 (.out1(out_uu_conv_conn_obj_5_UUdata_converter_FU_uu_conv_5),
    .in1(out_conv_out_const_8_1_16));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(16),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(32),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(5),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(16),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(32),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(16),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(16),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(16),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(5),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("/root/PandA-bambu-2023.1/examples/crc/tutorial/array_ref_33827.mem"),
    .n_elements(1),
    .data_size(16),
    .address_space_begin(MEM_var_33827_33779),
    .address_space_rangesize(512),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(16),
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(32),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) array_33827_0 (.out1({null_out_signal_array_33827_0_out1_1,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_33827_0}),
    .Sout_Rdata_ram({null_out_signal_array_33827_0_Sout_Rdata_ram_1,
      null_out_signal_array_33827_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_33827_0_Sout_DataRdy_1,
      null_out_signal_array_33827_0_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_33827_0_proxy_out1_1,
      null_out_signal_array_33827_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({16'b0000000000000000,
      out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0}),
    .in3({5'b00000,
      out_conv_out_const_5_6_5}),
    .in4({1'b0,
      out_const_8}),
    .sel_LOAD({1'b0,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .S_Wdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .Sin_Rdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .S_data_ram_size({5'b00000,
      5'b00000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({16'b0000000000000000,
      16'b0000000000000000}),
    .proxy_in2({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in3({5'b00000,
      5'b00000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN_SDS #(.BITSIZE_in1(16),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(32),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(5),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(16),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(32),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(16),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(16),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(16),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(5),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("/root/PandA-bambu-2023.1/examples/crc/tutorial/array_ref_33854.mem"),
    .n_elements(256),
    .data_size(16),
    .address_space_begin(MEM_var_33854_33779),
    .address_space_rangesize(512),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(16),
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(32),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) array_33854_0 (.out1({null_out_signal_array_33854_0_out1_1,
      out_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_array_33854_0}),
    .Sout_Rdata_ram({null_out_signal_array_33854_0_Sout_Rdata_ram_1,
      null_out_signal_array_33854_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_33854_0_Sout_DataRdy_1,
      null_out_signal_array_33854_0_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_33854_0_proxy_out1_1,
      null_out_signal_array_33854_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({16'b0000000000000000,
      out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_3}),
    .in2({32'b00000000000000000000000000000000,
      out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1}),
    .in3({5'b00000,
      out_conv_out_const_5_6_5}),
    .in4({1'b0,
      out_const_8}),
    .sel_LOAD({1'b0,
      fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .S_Wdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .Sin_Rdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .S_data_ram_size({5'b00000,
      5'b00000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({16'b0000000000000000,
      16'b0000000000000000}),
    .proxy_in2({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in3({5'b00000,
      5'b00000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_BRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(32),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(5),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(32),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(16),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(16),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(16),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(5),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("/root/PandA-bambu-2023.1/examples/crc/tutorial/array_ref_33935.mem"),
    .n_elements(256),
    .data_size(8),
    .address_space_begin(MEM_var_33935_33779),
    .address_space_rangesize(512),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(32),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) array_33935_0 (.out1({out_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_array_33935_0,
      out_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_array_33935_0}),
    .Sout_Rdata_ram({null_out_signal_array_33935_0_Sout_Rdata_ram_1,
      null_out_signal_array_33935_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_33935_0_Sout_DataRdy_1,
      null_out_signal_array_33935_0_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_33935_0_proxy_out1_1,
      null_out_signal_array_33935_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({out_uu_conv_conn_obj_4_UUdata_converter_FU_uu_conv_4,
      8'b00000000}),
    .in2({out_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1,
      out_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1}),
    .in3({out_const_4,
      out_const_4}),
    .in4({out_const_8,
      out_const_8}),
    .sel_LOAD({fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD,
      fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD}),
    .sel_STORE({fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE,
      fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .S_Wdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .Sin_Rdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .S_data_ram_size({5'b00000,
      5'b00000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({16'b0000000000000000,
      16'b0000000000000000}),
    .proxy_in2({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in3({5'b00000,
      5'b00000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(32),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(5),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(32),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(16),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(16),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(16),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(5),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("/root/PandA-bambu-2023.1/examples/crc/tutorial/array_ref_33965.mem"),
    .n_elements(16),
    .data_size(8),
    .address_space_begin(MEM_var_33965_33779),
    .address_space_rangesize(512),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(1),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(32),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) array_33965_0 (.out1({out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_array_33965_0,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_array_33965_0}),
    .Sout_Rdata_ram({null_out_signal_array_33965_0_Sout_Rdata_ram_1,
      null_out_signal_array_33965_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_33965_0_Sout_DataRdy_1,
      null_out_signal_array_33965_0_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_33965_0_proxy_out1_1,
      null_out_signal_array_33965_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({out_ui_pointer_plus_expr_FU_32_32_32_147_i3_fu_icrc_33779_34357,
      out_ui_pointer_plus_expr_FU_32_32_32_147_i2_fu_icrc_33779_34343}),
    .in3({out_const_4,
      out_const_4}),
    .in4({out_const_8,
      out_const_8}),
    .sel_LOAD({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD}),
    .sel_STORE({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .S_Wdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .Sin_Rdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .S_data_ram_size({5'b00000,
      5'b00000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({16'b0000000000000000,
      16'b0000000000000000}),
    .proxy_in2({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .proxy_in3({5'b00000,
      5'b00000}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b0000000000000001)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b10000000)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(9),
    .value(9'b100000000)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(29),
    .value(29'b10000000100001011101000010000)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(10),
    .value(MEM_var_33827_33779)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(10),
    .value(MEM_var_33854_33779)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(10),
    .value(MEM_var_33935_33779)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(10),
    .value(MEM_var_33965_33779)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(14),
    .value(14'b01000000100001)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(9),
    .value(9'b011111111)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  IIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_I_1_I_32 (.out1(out_conv_out_const_0_I_1_I_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(32)) conv_out_const_17_10_32 (.out1(out_conv_out_const_17_10_32),
    .in1(out_const_17));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(32)) conv_out_const_18_10_32 (.out1(out_conv_out_const_18_10_32),
    .in1(out_const_18));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(32)) conv_out_const_19_10_32 (.out1(out_conv_out_const_19_10_32),
    .in1(out_const_19));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(32)) conv_out_const_20_10_32 (.out1(out_conv_out_const_20_10_32),
    .in1(out_const_20));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(5)) conv_out_const_5_6_5 (.out1(out_conv_out_const_5_6_5),
    .in1(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(16)) conv_out_const_8_1_16 (.out1(out_conv_out_const_8_1_16),
    .in1(out_const_8));
  read_cond_FU #(.BITSIZE_in1(1)) fu_icrc_33779_33825 (.out1(out_read_cond_FU_45_i0_fu_icrc_33779_33825),
    .in1(out_ui_eq_expr_FU_16_0_16_136_i0_fu_icrc_33779_34523));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_icrc_33779_33872 (.out1(out_ui_plus_expr_FU_32_0_32_146_i0_fu_icrc_33779_33872),
    .in1(out_reg_20_reg_20),
    .in2(out_const_8));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(16),
    .BITSIZE_in3(16),
    .BITSIZE_out1(16)) fu_icrc_33779_33887 (.out1(out_ui_cond_expr_FU_16_16_16_16_135_i0_fu_icrc_33779_33887),
    .in1(out_ui_extract_bit_expr_FU_68_i0_fu_icrc_33779_34565),
    .in2(out_IUdata_converter_FU_67_i0_fu_icrc_33779_33912),
    .in3(out_ui_lshift_expr_FU_16_0_16_140_i0_fu_icrc_33779_33931));
  ui_lshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(4),
    .BITSIZE_out1(16),
    .PRECISION(16)) fu_icrc_33779_33902 (.out1(out_ui_lshift_expr_FU_16_0_16_139_i0_fu_icrc_33779_33902),
    .in1(out_UUdata_converter_FU_56_i0_fu_icrc_33779_33908),
    .in2(out_const_11));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(16)) fu_icrc_33779_33908 (.out1(out_UUdata_converter_FU_56_i0_fu_icrc_33779_33908),
    .in1(out_reg_20_reg_20));
  IUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_33912 (.out1(out_IUdata_converter_FU_67_i0_fu_icrc_33779_33912),
    .in1(out_bit_xor_expr_FU_16_0_16_124_i0_fu_icrc_33779_33915));
  bit_xor_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(14),
    .BITSIZE_out1(16)) fu_icrc_33779_33915 (.out1(out_bit_xor_expr_FU_16_0_16_124_i0_fu_icrc_33779_33915),
    .in1(out_IIconvert_expr_FU_66_i0_fu_icrc_33779_33919),
    .in2(out_const_6));
  IIconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_33919 (.out1(out_IIconvert_expr_FU_66_i0_fu_icrc_33779_33919),
    .in1(out_lshift_expr_FU_16_0_16_128_i0_fu_icrc_33779_33922));
  lshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(2),
    .BITSIZE_out1(16),
    .PRECISION(32)) fu_icrc_33779_33922 (.out1(out_lshift_expr_FU_16_0_16_128_i0_fu_icrc_33779_33922),
    .in1(out_UIdata_converter_FU_65_i0_fu_icrc_33779_33928),
    .in2(out_const_2));
  UIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_33928 (.out1(out_UIdata_converter_FU_65_i0_fu_icrc_33779_33928),
    .in1(out_reg_21_reg_21));
  ui_lshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(16),
    .PRECISION(16)) fu_icrc_33779_33931 (.out1(out_ui_lshift_expr_FU_16_0_16_140_i0_fu_icrc_33779_33931),
    .in1(out_reg_21_reg_21),
    .in2(out_const_8));
  IUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_icrc_33779_33941 (.out1(out_IUdata_converter_FU_73_i0_fu_icrc_33779_33941),
    .in1(out_bit_ior_expr_FU_8_8_8_123_i0_fu_icrc_33779_33945));
  bit_ior_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu_icrc_33779_33945 (.out1(out_bit_ior_expr_FU_8_8_8_123_i0_fu_icrc_33779_33945),
    .in1(out_IIconvert_expr_FU_71_i0_fu_icrc_33779_33951),
    .in2(out_UIdata_converter_FU_72_i0_fu_icrc_33779_34010));
  IIconvert_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_icrc_33779_33951 (.out1(out_IIconvert_expr_FU_71_i0_fu_icrc_33779_33951),
    .in1(out_lshift_expr_FU_8_0_8_130_i0_fu_icrc_33779_33954));
  lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(4),
    .BITSIZE_out1(8),
    .PRECISION(32)) fu_icrc_33779_33954 (.out1(out_lshift_expr_FU_8_0_8_130_i0_fu_icrc_33779_33954),
    .in1(out_UIdata_converter_FU_70_i0_fu_icrc_33779_33959),
    .in2(out_const_3));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_icrc_33779_33959 (.out1(out_UIdata_converter_FU_70_i0_fu_icrc_33779_33959),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_array_33965_0));
  UIdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(5)) fu_icrc_33779_34003 (.out1(out_UIdata_converter_FU_57_i0_fu_icrc_33779_34003),
    .in1(out_ui_bit_and_expr_FU_8_0_8_133_i0_fu_icrc_33779_34007));
  ui_bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_icrc_33779_34007 (.out1(out_ui_bit_and_expr_FU_8_0_8_133_i0_fu_icrc_33779_34007),
    .in1(out_UUdata_converter_FU_56_i0_fu_icrc_33779_33908),
    .in2(out_const_15));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_icrc_33779_34010 (.out1(out_UIdata_converter_FU_72_i0_fu_icrc_33779_34010),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_array_33965_0));
  UIdata_converter_FU #(.BITSIZE_in1(12),
    .BITSIZE_out1(13)) fu_icrc_33779_34016 (.out1(out_UIdata_converter_FU_59_i0_fu_icrc_33779_34016),
    .in1(out_ui_rshift_expr_FU_16_0_16_148_i0_fu_icrc_33779_34019));
  ui_rshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(4),
    .BITSIZE_out1(12),
    .PRECISION(16)) fu_icrc_33779_34019 (.out1(out_ui_rshift_expr_FU_16_0_16_148_i0_fu_icrc_33779_34019),
    .in1(out_UUdata_converter_FU_56_i0_fu_icrc_33779_33908),
    .in2(out_const_3));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_icrc_33779_34026 (.out1(out_plus_expr_FU_32_0_32_132_i0_fu_icrc_33779_34026),
    .in1(out_reg_22_reg_22),
    .in2(out_const_2));
  read_cond_FU #(.BITSIZE_in1(1)) fu_icrc_33779_34027 (.out1(out_read_cond_FU_69_i0_fu_icrc_33779_34027),
    .in1(out_ne_expr_FU_32_0_32_131_i0_fu_icrc_33779_34525));
  read_cond_FU #(.BITSIZE_in1(1)) fu_icrc_33779_34036 (.out1(out_read_cond_FU_74_i0_fu_icrc_33779_34036),
    .in1(out_reg_27_reg_27));
  bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(9),
    .BITSIZE_out1(9)) fu_icrc_33779_34038 (.out1(out_bit_and_expr_FU_16_0_16_119_i0_fu_icrc_33779_34038),
    .in1(in_port_jinit),
    .in2(out_const_7));
  IUconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(8)) fu_icrc_33779_34039 (.out1(out_IUconvert_expr_FU_25_i0_fu_icrc_33779_34039),
    .in1(in_port_jinit));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34040 (.out1(out_UIdata_converter_FU_26_i0_fu_icrc_33779_34040),
    .in1(out_IUconvert_expr_FU_25_i0_fu_icrc_33779_34039));
  lshift_expr_FU #(.BITSIZE_in1(9),
    .BITSIZE_in2(5),
    .BITSIZE_out1(16),
    .PRECISION(32)) fu_icrc_33779_34041 (.out1(out_lshift_expr_FU_16_0_16_129_i0_fu_icrc_33779_34041),
    .in1(out_UIdata_converter_FU_26_i0_fu_icrc_33779_34040),
    .in2(out_const_4));
  IIconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34042 (.out1(out_IIconvert_expr_FU_27_i0_fu_icrc_33779_34042),
    .in1(out_lshift_expr_FU_16_0_16_129_i0_fu_icrc_33779_34041));
  bit_ior_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(9),
    .BITSIZE_out1(16)) fu_icrc_33779_34043 (.out1(out_bit_ior_expr_FU_0_16_16_120_i0_fu_icrc_33779_34043),
    .in1(out_IIconvert_expr_FU_27_i0_fu_icrc_33779_34042),
    .in2(out_bit_and_expr_FU_16_0_16_119_i0_fu_icrc_33779_34038));
  IUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34044 (.out1(out_IUdata_converter_FU_28_i0_fu_icrc_33779_34044),
    .in1(out_bit_ior_expr_FU_0_16_16_120_i0_fu_icrc_33779_34043));
  ui_rshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8),
    .PRECISION(16)) fu_icrc_33779_34070 (.out1(out_ui_rshift_expr_FU_16_0_16_149_i0_fu_icrc_33779_34070),
    .in1(in_port_crc),
    .in2(out_const_4));
  UUconvert_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_icrc_33779_34071 (.out1(out_UUconvert_expr_FU_15_i0_fu_icrc_33779_34071),
    .in1(out_ui_rshift_expr_FU_16_0_16_149_i0_fu_icrc_33779_34070));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34072 (.out1(out_UIdata_converter_FU_16_i0_fu_icrc_33779_34072),
    .in1(out_UUconvert_expr_FU_15_i0_fu_icrc_33779_34071));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34074 (.out1(out_UIdata_converter_FU_75_i0_fu_icrc_33779_34074),
    .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_array_33935_0));
  UUconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(8)) fu_icrc_33779_34075 (.out1(out_UUconvert_expr_FU_20_i0_fu_icrc_33779_34075),
    .in1(in_port_crc));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34076 (.out1(out_UIdata_converter_FU_21_i0_fu_icrc_33779_34076),
    .in1(out_UUconvert_expr_FU_20_i0_fu_icrc_33779_34075));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34078 (.out1(out_UIdata_converter_FU_76_i0_fu_icrc_33779_34078),
    .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_array_33935_0));
  lshift_expr_FU #(.BITSIZE_in1(9),
    .BITSIZE_in2(5),
    .BITSIZE_out1(16),
    .PRECISION(32)) fu_icrc_33779_34079 (.out1(out_lshift_expr_FU_16_0_16_129_i1_fu_icrc_33779_34079),
    .in1(out_UIdata_converter_FU_76_i0_fu_icrc_33779_34078),
    .in2(out_const_4));
  IIconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34080 (.out1(out_IIconvert_expr_FU_77_i0_fu_icrc_33779_34080),
    .in1(out_lshift_expr_FU_16_0_16_129_i1_fu_icrc_33779_34079));
  bit_ior_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(9),
    .BITSIZE_out1(16)) fu_icrc_33779_34081 (.out1(out_bit_ior_expr_FU_0_16_16_121_i0_fu_icrc_33779_34081),
    .in1(out_IIconvert_expr_FU_77_i0_fu_icrc_33779_34080),
    .in2(out_UIdata_converter_FU_75_i0_fu_icrc_33779_34074));
  IUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34082 (.out1(out_IUdata_converter_FU_78_i0_fu_icrc_33779_34082),
    .in1(out_bit_ior_expr_FU_0_16_16_121_i0_fu_icrc_33779_34081));
  read_cond_FU #(.BITSIZE_in1(1)) fu_icrc_33779_34083 (.out1(out_read_cond_FU_79_i0_fu_icrc_33779_34083),
    .in1(out_reg_14_reg_14));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(16),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_icrc_33779_34120 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i0_fu_icrc_33779_34120),
    .in1(in_port_lin),
    .in2(out_reg_29_reg_29));
  ui_rshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8),
    .PRECISION(16)) fu_icrc_33779_34122 (.out1(out_ui_rshift_expr_FU_16_0_16_149_i1_fu_icrc_33779_34122),
    .in1(out_reg_19_reg_19),
    .in2(out_const_4));
  UUconvert_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_icrc_33779_34123 (.out1(out_UUconvert_expr_FU_83_i0_fu_icrc_33779_34123),
    .in1(out_ui_rshift_expr_FU_16_0_16_149_i1_fu_icrc_33779_34122));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu_icrc_33779_34124 (.out1(out_ui_bit_xor_expr_FU_8_8_8_134_i0_fu_icrc_33779_34124),
    .in1(out_reg_30_reg_30),
    .in2(out_BMEMORY_CTRLN_118_i0_BMEMORY_CTRLN_118_i0));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34125 (.out1(out_UIdata_converter_FU_84_i0_fu_icrc_33779_34125),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_134_i0_fu_icrc_33779_34124));
  UIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34127 (.out1(out_UIdata_converter_FU_86_i0_fu_icrc_33779_34127),
    .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_array_33854_0));
  UUconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(8)) fu_icrc_33779_34128 (.out1(out_UUconvert_expr_FU_87_i0_fu_icrc_33779_34128),
    .in1(out_reg_19_reg_19));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34129 (.out1(out_UIdata_converter_FU_88_i0_fu_icrc_33779_34129),
    .in1(out_UUconvert_expr_FU_87_i0_fu_icrc_33779_34128));
  lshift_expr_FU #(.BITSIZE_in1(9),
    .BITSIZE_in2(5),
    .BITSIZE_out1(16),
    .PRECISION(32)) fu_icrc_33779_34130 (.out1(out_lshift_expr_FU_16_0_16_129_i2_fu_icrc_33779_34130),
    .in1(out_UIdata_converter_FU_88_i0_fu_icrc_33779_34129),
    .in2(out_const_4));
  IIconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34131 (.out1(out_IIconvert_expr_FU_89_i0_fu_icrc_33779_34131),
    .in1(out_lshift_expr_FU_16_0_16_129_i2_fu_icrc_33779_34130));
  bit_xor_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34132 (.out1(out_bit_xor_expr_FU_16_16_16_125_i0_fu_icrc_33779_34132),
    .in1(out_UIdata_converter_FU_86_i0_fu_icrc_33779_34127),
    .in2(out_reg_31_reg_31));
  IUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34133 (.out1(out_IUdata_converter_FU_90_i0_fu_icrc_33779_34133),
    .in1(out_bit_xor_expr_FU_16_16_16_125_i0_fu_icrc_33779_34132));
  ui_plus_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(16)) fu_icrc_33779_34134 (.out1(out_ui_plus_expr_FU_16_0_16_145_i0_fu_icrc_33779_34134),
    .in1(out_reg_28_reg_28),
    .in2(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34135 (.out1(out_UUdata_converter_FU_91_i0_fu_icrc_33779_34135),
    .in1(out_ui_plus_expr_FU_16_0_16_145_i0_fu_icrc_33779_34134));
  read_cond_FU #(.BITSIZE_in1(1)) fu_icrc_33779_34136 (.out1(out_read_cond_FU_92_i0_fu_icrc_33779_34136),
    .in1(out_reg_32_reg_32));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(16),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_icrc_33779_34183 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i1_fu_icrc_33779_34183),
    .in1(in_port_lin),
    .in2(out_reg_35_reg_35));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34185 (.out1(out_UIdata_converter_FU_95_i0_fu_icrc_33779_34185),
    .in1(out_BMEMORY_CTRLN_118_i0_BMEMORY_CTRLN_118_i0));
  ui_rshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8),
    .PRECISION(16)) fu_icrc_33779_34187 (.out1(out_ui_rshift_expr_FU_16_0_16_149_i2_fu_icrc_33779_34187),
    .in1(out_reg_0_reg_0),
    .in2(out_const_4));
  UUconvert_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_icrc_33779_34188 (.out1(out_UUconvert_expr_FU_97_i0_fu_icrc_33779_34188),
    .in1(out_ui_rshift_expr_FU_16_0_16_149_i2_fu_icrc_33779_34187));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu_icrc_33779_34189 (.out1(out_ui_bit_xor_expr_FU_8_8_8_134_i1_fu_icrc_33779_34189),
    .in1(out_reg_36_reg_36),
    .in2(out_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_array_33935_0));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34190 (.out1(out_UIdata_converter_FU_98_i0_fu_icrc_33779_34190),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_134_i1_fu_icrc_33779_34189));
  UIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34192 (.out1(out_UIdata_converter_FU_100_i0_fu_icrc_33779_34192),
    .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_array_33854_0));
  UUconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(8)) fu_icrc_33779_34193 (.out1(out_UUconvert_expr_FU_101_i0_fu_icrc_33779_34193),
    .in1(out_reg_0_reg_0));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34194 (.out1(out_UIdata_converter_FU_102_i0_fu_icrc_33779_34194),
    .in1(out_UUconvert_expr_FU_101_i0_fu_icrc_33779_34193));
  lshift_expr_FU #(.BITSIZE_in1(9),
    .BITSIZE_in2(5),
    .BITSIZE_out1(16),
    .PRECISION(32)) fu_icrc_33779_34195 (.out1(out_lshift_expr_FU_16_0_16_129_i3_fu_icrc_33779_34195),
    .in1(out_UIdata_converter_FU_102_i0_fu_icrc_33779_34194),
    .in2(out_const_4));
  IIconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34196 (.out1(out_IIconvert_expr_FU_103_i0_fu_icrc_33779_34196),
    .in1(out_lshift_expr_FU_16_0_16_129_i3_fu_icrc_33779_34195));
  bit_xor_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34197 (.out1(out_bit_xor_expr_FU_16_16_16_125_i1_fu_icrc_33779_34197),
    .in1(out_UIdata_converter_FU_100_i0_fu_icrc_33779_34192),
    .in2(out_reg_37_reg_37));
  IUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34198 (.out1(out_IUdata_converter_FU_104_i0_fu_icrc_33779_34198),
    .in1(out_bit_xor_expr_FU_16_16_16_125_i1_fu_icrc_33779_34197));
  ui_plus_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(16)) fu_icrc_33779_34199 (.out1(out_ui_plus_expr_FU_16_0_16_145_i1_fu_icrc_33779_34199),
    .in1(out_reg_34_reg_34),
    .in2(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34200 (.out1(out_UUdata_converter_FU_105_i0_fu_icrc_33779_34200),
    .in1(out_ui_plus_expr_FU_16_0_16_145_i1_fu_icrc_33779_34199));
  read_cond_FU #(.BITSIZE_in1(1)) fu_icrc_33779_34201 (.out1(out_read_cond_FU_106_i0_fu_icrc_33779_34201),
    .in1(out_reg_38_reg_38));
  read_cond_FU #(.BITSIZE_in1(1)) fu_icrc_33779_34245 (.out1(out_read_cond_FU_107_i0_fu_icrc_33779_34245),
    .in1(out_reg_11_reg_11));
  ui_rshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8),
    .PRECISION(16)) fu_icrc_33779_34251 (.out1(out_ui_rshift_expr_FU_16_0_16_149_i3_fu_icrc_33779_34251),
    .in1(out_reg_40_reg_40),
    .in2(out_const_4));
  UUconvert_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_icrc_33779_34252 (.out1(out_UUconvert_expr_FU_108_i0_fu_icrc_33779_34252),
    .in1(out_ui_rshift_expr_FU_16_0_16_149_i3_fu_icrc_33779_34251));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34253 (.out1(out_UIdata_converter_FU_109_i0_fu_icrc_33779_34253),
    .in1(out_UUconvert_expr_FU_108_i0_fu_icrc_33779_34252));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34255 (.out1(out_UIdata_converter_FU_111_i0_fu_icrc_33779_34255),
    .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_array_33935_0));
  UUconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(8)) fu_icrc_33779_34256 (.out1(out_UUconvert_expr_FU_112_i0_fu_icrc_33779_34256),
    .in1(out_reg_40_reg_40));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34257 (.out1(out_UIdata_converter_FU_113_i0_fu_icrc_33779_34257),
    .in1(out_UUconvert_expr_FU_112_i0_fu_icrc_33779_34256));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_33779_34259 (.out1(out_UIdata_converter_FU_115_i0_fu_icrc_33779_34259),
    .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_array_33935_0));
  lshift_expr_FU #(.BITSIZE_in1(9),
    .BITSIZE_in2(5),
    .BITSIZE_out1(16),
    .PRECISION(32)) fu_icrc_33779_34260 (.out1(out_lshift_expr_FU_16_0_16_129_i4_fu_icrc_33779_34260),
    .in1(out_UIdata_converter_FU_115_i0_fu_icrc_33779_34259),
    .in2(out_const_4));
  IIconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34261 (.out1(out_IIconvert_expr_FU_116_i0_fu_icrc_33779_34261),
    .in1(out_lshift_expr_FU_16_0_16_129_i4_fu_icrc_33779_34260));
  bit_ior_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(9),
    .BITSIZE_out1(16)) fu_icrc_33779_34262 (.out1(out_bit_ior_expr_FU_0_16_16_122_i0_fu_icrc_33779_34262),
    .in1(out_IIconvert_expr_FU_116_i0_fu_icrc_33779_34261),
    .in2(out_UIdata_converter_FU_111_i0_fu_icrc_33779_34255));
  IUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34263 (.out1(out_IUdata_converter_FU_117_i0_fu_icrc_33779_34263),
    .in1(out_bit_ior_expr_FU_0_16_16_122_i0_fu_icrc_33779_34262));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34308 (.out1(out_addr_expr_FU_6_i0_fu_icrc_33779_34308),
    .in1(out_conv_out_const_17_10_32));
  ge_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_icrc_33779_34312 (.out1(out_ge_expr_FU_16_0_16_126_i0_fu_icrc_33779_34312),
    .in1(in_port_jinit),
    .in2(out_const_0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34315 (.out1(out_addr_expr_FU_7_i0_fu_icrc_33779_34315),
    .in1(out_conv_out_const_17_10_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34328 (.out1(out_UUdata_converter_FU_10_i0_fu_icrc_33779_34328),
    .in1(out_addr_expr_FU_9_i0_fu_icrc_33779_34377));
  IUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(4)) fu_icrc_33779_34336 (.out1(out_IUdata_converter_FU_58_i0_fu_icrc_33779_34336),
    .in1(out_UIdata_converter_FU_57_i0_fu_icrc_33779_34003));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_icrc_33779_34343 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i2_fu_icrc_33779_34343),
    .in1(out_reg_2_reg_2),
    .in2(out_reg_23_reg_23));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34348 (.out1(out_UUdata_converter_FU_12_i0_fu_icrc_33779_34348),
    .in1(out_addr_expr_FU_11_i0_fu_icrc_33779_34381));
  IUdata_converter_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(12)) fu_icrc_33779_34351 (.out1(out_IUdata_converter_FU_60_i0_fu_icrc_33779_34351),
    .in1(out_UIdata_converter_FU_59_i0_fu_icrc_33779_34016));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(12),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_icrc_33779_34357 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i3_fu_icrc_33779_34357),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_24_reg_24));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_icrc_33779_34366 (.out1(out_ui_lshift_expr_FU_32_0_32_142_i0_fu_icrc_33779_34366),
    .in1(out_reg_20_reg_20),
    .in2(out_const_8));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34369 (.out1(out_addr_expr_FU_8_i0_fu_icrc_33779_34369),
    .in1(out_conv_out_const_18_10_32));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(1)) fu_icrc_33779_34372 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i4_fu_icrc_33779_34372),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_lshift_expr_FU_32_0_32_142_i0_fu_icrc_33779_34366));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34377 (.out1(out_addr_expr_FU_9_i0_fu_icrc_33779_34377),
    .in1(out_conv_out_const_20_10_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34381 (.out1(out_addr_expr_FU_11_i0_fu_icrc_33779_34381),
    .in1(out_conv_out_const_20_10_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34385 (.out1(out_addr_expr_FU_13_i0_fu_icrc_33779_34385),
    .in1(out_conv_out_const_19_10_32));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_icrc_33779_34388 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i5_fu_icrc_33779_34388),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_20_reg_20));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34394 (.out1(out_UUdata_converter_FU_18_i0_fu_icrc_33779_34394),
    .in1(out_addr_expr_FU_17_i0_fu_icrc_33779_34421));
  IUdata_converter_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(8)) fu_icrc_33779_34397 (.out1(out_IUdata_converter_FU_19_i0_fu_icrc_33779_34397),
    .in1(out_UIdata_converter_FU_16_i0_fu_icrc_33779_34072));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_icrc_33779_34403 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i6_fu_icrc_33779_34403),
    .in1(out_UUdata_converter_FU_18_i0_fu_icrc_33779_34394),
    .in2(out_IUdata_converter_FU_19_i0_fu_icrc_33779_34397));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34407 (.out1(out_UUdata_converter_FU_23_i0_fu_icrc_33779_34407),
    .in1(out_addr_expr_FU_22_i0_fu_icrc_33779_34425));
  IUdata_converter_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(8)) fu_icrc_33779_34410 (.out1(out_IUdata_converter_FU_24_i0_fu_icrc_33779_34410),
    .in1(out_UIdata_converter_FU_21_i0_fu_icrc_33779_34076));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_icrc_33779_34416 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i7_fu_icrc_33779_34416),
    .in1(out_UUdata_converter_FU_23_i0_fu_icrc_33779_34407),
    .in2(out_IUdata_converter_FU_24_i0_fu_icrc_33779_34410));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34421 (.out1(out_addr_expr_FU_17_i0_fu_icrc_33779_34421),
    .in1(out_conv_out_const_19_10_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34425 (.out1(out_addr_expr_FU_22_i0_fu_icrc_33779_34425),
    .in1(out_conv_out_const_19_10_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34431 (.out1(out_UUdata_converter_FU_35_i0_fu_icrc_33779_34431),
    .in1(out_addr_expr_FU_34_i0_fu_icrc_33779_34446));
  IUdata_converter_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(8)) fu_icrc_33779_34434 (.out1(out_IUdata_converter_FU_85_i0_fu_icrc_33779_34434),
    .in1(out_UIdata_converter_FU_84_i0_fu_icrc_33779_34125));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_out1(9),
    .PRECISION(64)) fu_icrc_33779_34438 (.out1(out_ui_lshift_expr_FU_16_0_16_141_i0_fu_icrc_33779_34438),
    .in1(out_IUdata_converter_FU_85_i0_fu_icrc_33779_34434),
    .in2(out_const_8));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(9),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(1)) fu_icrc_33779_34441 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i8_fu_icrc_33779_34441),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_lshift_expr_FU_16_0_16_141_i0_fu_icrc_33779_34438));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34446 (.out1(out_addr_expr_FU_34_i0_fu_icrc_33779_34446),
    .in1(out_conv_out_const_18_10_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34451 (.out1(out_UUdata_converter_FU_31_i0_fu_icrc_33779_34451),
    .in1(out_addr_expr_FU_30_i0_fu_icrc_33779_34477));
  IUdata_converter_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(8)) fu_icrc_33779_34454 (.out1(out_IUdata_converter_FU_96_i0_fu_icrc_33779_34454),
    .in1(out_UIdata_converter_FU_95_i0_fu_icrc_33779_34185));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_icrc_33779_34460 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i9_fu_icrc_33779_34460),
    .in1(out_reg_9_reg_9),
    .in2(out_IUdata_converter_FU_96_i0_fu_icrc_33779_34454));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34464 (.out1(out_UUdata_converter_FU_33_i0_fu_icrc_33779_34464),
    .in1(out_addr_expr_FU_32_i0_fu_icrc_33779_34481));
  IUdata_converter_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(8)) fu_icrc_33779_34467 (.out1(out_IUdata_converter_FU_99_i0_fu_icrc_33779_34467),
    .in1(out_UIdata_converter_FU_98_i0_fu_icrc_33779_34190));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_out1(9),
    .PRECISION(64)) fu_icrc_33779_34470 (.out1(out_ui_lshift_expr_FU_16_0_16_141_i1_fu_icrc_33779_34470),
    .in1(out_IUdata_converter_FU_99_i0_fu_icrc_33779_34467),
    .in2(out_const_8));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(9),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(1)) fu_icrc_33779_34473 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i10_fu_icrc_33779_34473),
    .in1(out_reg_10_reg_10),
    .in2(out_ui_lshift_expr_FU_16_0_16_141_i1_fu_icrc_33779_34470));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34477 (.out1(out_addr_expr_FU_30_i0_fu_icrc_33779_34477),
    .in1(out_conv_out_const_19_10_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34481 (.out1(out_addr_expr_FU_32_i0_fu_icrc_33779_34481),
    .in1(out_conv_out_const_18_10_32));
  ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_icrc_33779_34485 (.out1(out_ge_expr_FU_32_0_32_127_i0_fu_icrc_33779_34485),
    .in1(in_port_jrev),
    .in2(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34488 (.out1(out_UUdata_converter_FU_37_i0_fu_icrc_33779_34488),
    .in1(out_addr_expr_FU_36_i0_fu_icrc_33779_34514));
  IUdata_converter_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(8)) fu_icrc_33779_34491 (.out1(out_IUdata_converter_FU_110_i0_fu_icrc_33779_34491),
    .in1(out_UIdata_converter_FU_109_i0_fu_icrc_33779_34253));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_icrc_33779_34497 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i11_fu_icrc_33779_34497),
    .in1(out_reg_12_reg_12),
    .in2(out_IUdata_converter_FU_110_i0_fu_icrc_33779_34491));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34501 (.out1(out_UUdata_converter_FU_39_i0_fu_icrc_33779_34501),
    .in1(out_addr_expr_FU_38_i0_fu_icrc_33779_34518));
  IUdata_converter_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(8)) fu_icrc_33779_34504 (.out1(out_IUdata_converter_FU_114_i0_fu_icrc_33779_34504),
    .in1(out_UIdata_converter_FU_113_i0_fu_icrc_33779_34257));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_icrc_33779_34510 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_147_i12_fu_icrc_33779_34510),
    .in1(out_reg_13_reg_13),
    .in2(out_IUdata_converter_FU_114_i0_fu_icrc_33779_34504));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34514 (.out1(out_addr_expr_FU_36_i0_fu_icrc_33779_34514),
    .in1(out_conv_out_const_19_10_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_icrc_33779_34518 (.out1(out_addr_expr_FU_38_i0_fu_icrc_33779_34518),
    .in1(out_conv_out_const_19_10_32));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_icrc_33779_34523 (.out1(out_ui_eq_expr_FU_16_0_16_136_i0_fu_icrc_33779_34523),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_33827_0),
    .in2(out_const_0));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(1)) fu_icrc_33779_34525 (.out1(out_ne_expr_FU_32_0_32_131_i0_fu_icrc_33779_34525),
    .in1(out_plus_expr_FU_32_0_32_132_i0_fu_icrc_33779_34026),
    .in2(out_const_4));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(9),
    .BITSIZE_out1(1)) fu_icrc_33779_34527 (.out1(out_ui_ne_expr_FU_32_0_32_143_i0_fu_icrc_33779_34527),
    .in1(out_ui_plus_expr_FU_32_0_32_146_i0_fu_icrc_33779_33872),
    .in2(out_const_13));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_icrc_33779_34529 (.out1(out_ui_ne_expr_FU_32_0_32_144_i0_fu_icrc_33779_34529),
    .in1(in_port_len),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_icrc_33779_34531 (.out1(out_ui_ne_expr_FU_32_0_32_144_i1_fu_icrc_33779_34531),
    .in1(in_port_len),
    .in2(out_const_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(16),
    .BITSIZE_out1(1)) fu_icrc_33779_34533 (.out1(out_ui_ge_expr_FU_32_32_32_137_i0_fu_icrc_33779_34533),
    .in1(in_port_len),
    .in2(out_UUdata_converter_FU_91_i0_fu_icrc_33779_34135));
  ui_le_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_icrc_33779_34535 (.out1(out_ui_le_expr_FU_32_32_32_138_i0_fu_icrc_33779_34535),
    .in1(out_UUdata_converter_FU_105_i0_fu_icrc_33779_34200),
    .in2(in_port_len));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_icrc_33779_34537 (.out1(out_ui_ne_expr_FU_32_0_32_144_i2_fu_icrc_33779_34537),
    .in1(in_port_len),
    .in2(out_const_0));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_icrc_33779_34554 (.out1(out_extract_bit_expr_FU_14_i0_fu_icrc_33779_34554),
    .in1(in_port_jrev),
    .in2(out_const_16));
  extract_bit_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5)) fu_icrc_33779_34557 (.out1(out_extract_bit_expr_FU_29_i0_fu_icrc_33779_34557),
    .in1(in_port_jrev),
    .in2(out_const_16));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(4)) fu_icrc_33779_34565 (.out1(out_ui_extract_bit_expr_FU_68_i0_fu_icrc_33779_34565),
    .in1(out_reg_21_reg_21),
    .in2(out_const_15));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu_icrc_33779_34573 (.out1(out_lut_expr_FU_40_i0_fu_icrc_33779_34573),
    .in1(out_const_10),
    .in2(out_ge_expr_FU_16_0_16_126_i0_fu_icrc_33779_34312),
    .in3(out_extract_bit_expr_FU_14_i0_fu_icrc_33779_34554),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu_icrc_33779_34593 (.out1(out_lut_expr_FU_41_i0_fu_icrc_33779_34593),
    .in1(out_const_9),
    .in2(out_ge_expr_FU_16_0_16_126_i0_fu_icrc_33779_34312),
    .in3(out_ui_ne_expr_FU_32_0_32_144_i0_fu_icrc_33779_34529),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(4),
    .BITSIZE_out1(4)) fu_icrc_33779_34594 (.out1(out_multi_read_cond_FU_48_i0_fu_icrc_33779_34594),
    .in1({out_reg_17_reg_17,
      out_reg_18_reg_18,
      out_reg_16_reg_16,
      out_reg_15_reg_15}));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu_icrc_33779_34597 (.out1(out_lut_expr_FU_42_i0_fu_icrc_33779_34597),
    .in1(out_const_12),
    .in2(out_ge_expr_FU_16_0_16_126_i0_fu_icrc_33779_34312),
    .in3(out_ui_ne_expr_FU_32_0_32_144_i0_fu_icrc_33779_34529),
    .in4(out_extract_bit_expr_FU_29_i0_fu_icrc_33779_34557),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_icrc_33779_34603 (.out1(out_lut_expr_FU_43_i0_fu_icrc_33779_34603),
    .in1(out_const_11),
    .in2(out_ge_expr_FU_16_0_16_126_i0_fu_icrc_33779_34312),
    .in3(out_ui_ne_expr_FU_32_0_32_144_i0_fu_icrc_33779_34529),
    .in4(out_extract_bit_expr_FU_29_i0_fu_icrc_33779_34557),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_out1(1)) fu_icrc_33779_34606 (.out1(out_lut_expr_FU_44_i0_fu_icrc_33779_34606),
    .in1(out_const_14),
    .in2(out_ge_expr_FU_16_0_16_126_i0_fu_icrc_33779_34312),
    .in3(out_extract_bit_expr_FU_14_i0_fu_icrc_33779_34554),
    .in4(out_ui_ne_expr_FU_32_0_32_144_i2_fu_icrc_33779_34537),
    .in5(out_ui_ne_expr_FU_32_0_32_144_i0_fu_icrc_33779_34529),
    .in6(out_extract_bit_expr_FU_29_i0_fu_icrc_33779_34557),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(16),
    .BITSIZE_in3(16),
    .BITSIZE_out1(16)) fu_icrc_33779_34613 (.out1(out_ui_cond_expr_FU_16_16_16_16_135_i1_fu_icrc_33779_34613),
    .in1(out_lut_expr_FU_43_i0_fu_icrc_33779_34603),
    .in2(out_IUdata_converter_FU_28_i0_fu_icrc_33779_34044),
    .in3(in_port_crc));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_185_reg_0_0_0_1),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_7_i0_fu_icrc_33779_34315),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_33_i0_fu_icrc_33779_34464),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ge_expr_FU_32_0_32_127_i0_fu_icrc_33779_34485),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_37_i0_fu_icrc_33779_34488),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_39_i0_fu_icrc_33779_34501),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_144_i1_fu_icrc_33779_34531),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_40_i0_fu_icrc_33779_34573),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_41_i0_fu_icrc_33779_34593),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_42_i0_fu_icrc_33779_34597),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_44_i0_fu_icrc_33779_34606),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_196_reg_19_0_0_0),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_10_i0_fu_icrc_33779_34328),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_198_reg_20_0_0_0),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_199_reg_21_0_0_0),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_200_reg_22_0_0_0),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_58_i0_fu_icrc_33779_34336),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(12),
    .BITSIZE_out1(12)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_60_i0_fu_icrc_33779_34351),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_147_i4_fu_icrc_33779_34372),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_147_i5_fu_icrc_33779_34388),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_143_i0_fu_icrc_33779_34527),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_206_reg_28_0_0_0),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_207_reg_29_0_0_0),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_12_i0_fu_icrc_33779_34348),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_UUconvert_expr_FU_83_i0_fu_icrc_33779_34123),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_IIconvert_expr_FU_89_i0_fu_icrc_33779_34131),
    .wenable(wrenable_reg_31));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ge_expr_FU_32_32_32_137_i0_fu_icrc_33779_34533),
    .wenable(wrenable_reg_32));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_147_i8_fu_icrc_33779_34441),
    .wenable(wrenable_reg_33));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_213_reg_34_0_0_0),
    .wenable(wrenable_reg_34));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_214_reg_35_0_0_0),
    .wenable(wrenable_reg_35));
  register_SE #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_UUconvert_expr_FU_97_i0_fu_icrc_33779_34188),
    .wenable(wrenable_reg_36));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_IIconvert_expr_FU_103_i0_fu_icrc_33779_34196),
    .wenable(wrenable_reg_37));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_le_expr_FU_32_32_32_138_i0_fu_icrc_33779_34535),
    .wenable(wrenable_reg_38));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_147_i9_fu_icrc_33779_34460),
    .wenable(wrenable_reg_39));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_8_i0_fu_icrc_33779_34369),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_220_reg_40_0_1_0),
    .wenable(wrenable_reg_40));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_13_i0_fu_icrc_33779_34385),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_147_i6_fu_icrc_33779_34403),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_147_i7_fu_icrc_33779_34416),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_35_i0_fu_icrc_33779_34431),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_31_i0_fu_icrc_33779_34451),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_MUX_134_gimple_return_FU_52_i0_0_0_1;
  assign OUT_CONDITION_icrc_33779_33825 = out_read_cond_FU_45_i0_fu_icrc_33779_33825;
  assign OUT_CONDITION_icrc_33779_34027 = out_read_cond_FU_69_i0_fu_icrc_33779_34027;
  assign OUT_CONDITION_icrc_33779_34036 = out_read_cond_FU_74_i0_fu_icrc_33779_34036;
  assign OUT_CONDITION_icrc_33779_34083 = out_read_cond_FU_79_i0_fu_icrc_33779_34083;
  assign OUT_CONDITION_icrc_33779_34136 = out_read_cond_FU_92_i0_fu_icrc_33779_34136;
  assign OUT_CONDITION_icrc_33779_34201 = out_read_cond_FU_106_i0_fu_icrc_33779_34201;
  assign OUT_CONDITION_icrc_33779_34245 = out_read_cond_FU_107_i0_fu_icrc_33779_34245;
  assign OUT_MULTIIF_icrc_33779_34594 = out_multi_read_cond_FU_48_i0_fu_icrc_33779_34594;

endmodule

// FSM based controller description for icrc
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_icrc(done_port,
  fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD,
  fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE,
  fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD,
  fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_STORE,
  fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD,
  fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE,
  fuselector_BMEMORY_CTRLN_118_i0_LOAD,
  fuselector_BMEMORY_CTRLN_118_i0_STORE,
  selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0,
  selector_MUX_134_gimple_return_FU_52_i0_0_0_0,
  selector_MUX_134_gimple_return_FU_52_i0_0_0_1,
  selector_MUX_185_reg_0_0_0_0,
  selector_MUX_185_reg_0_0_0_1,
  selector_MUX_196_reg_19_0_0_0,
  selector_MUX_198_reg_20_0_0_0,
  selector_MUX_199_reg_21_0_0_0,
  selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0,
  selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1,
  selector_MUX_200_reg_22_0_0_0,
  selector_MUX_206_reg_28_0_0_0,
  selector_MUX_207_reg_29_0_0_0,
  selector_MUX_213_reg_34_0_0_0,
  selector_MUX_214_reg_35_0_0_0,
  selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0,
  selector_MUX_220_reg_40_0_0_0,
  selector_MUX_220_reg_40_0_0_1,
  selector_MUX_220_reg_40_0_1_0,
  selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0,
  selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1,
  selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0,
  selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1,
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
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_icrc_33779_33825,
  OUT_CONDITION_icrc_33779_34027,
  OUT_CONDITION_icrc_33779_34036,
  OUT_CONDITION_icrc_33779_34083,
  OUT_CONDITION_icrc_33779_34136,
  OUT_CONDITION_icrc_33779_34201,
  OUT_CONDITION_icrc_33779_34245,
  OUT_MULTIIF_icrc_33779_34594,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_icrc_33779_33825;
  input OUT_CONDITION_icrc_33779_34027;
  input OUT_CONDITION_icrc_33779_34036;
  input OUT_CONDITION_icrc_33779_34083;
  input OUT_CONDITION_icrc_33779_34136;
  input OUT_CONDITION_icrc_33779_34201;
  input OUT_CONDITION_icrc_33779_34245;
  input [3:0] OUT_MULTIIF_icrc_33779_34594;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD;
  output fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE;
  output fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD;
  output fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_STORE;
  output fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD;
  output fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE;
  output fuselector_BMEMORY_CTRLN_118_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_118_i0_STORE;
  output selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0;
  output selector_MUX_134_gimple_return_FU_52_i0_0_0_0;
  output selector_MUX_134_gimple_return_FU_52_i0_0_0_1;
  output selector_MUX_185_reg_0_0_0_0;
  output selector_MUX_185_reg_0_0_0_1;
  output selector_MUX_196_reg_19_0_0_0;
  output selector_MUX_198_reg_20_0_0_0;
  output selector_MUX_199_reg_21_0_0_0;
  output selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0;
  output selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1;
  output selector_MUX_200_reg_22_0_0_0;
  output selector_MUX_206_reg_28_0_0_0;
  output selector_MUX_207_reg_29_0_0_0;
  output selector_MUX_213_reg_34_0_0_0;
  output selector_MUX_214_reg_35_0_0_0;
  output selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0;
  output selector_MUX_220_reg_40_0_0_0;
  output selector_MUX_220_reg_40_0_0_1;
  output selector_MUX_220_reg_40_0_1_0;
  output selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0;
  output selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1;
  output selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0;
  output selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1;
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
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [21:0] S_0 = 22'b0000000000000000000001,
    S_2 = 22'b0000000000000000000100,
    S_3 = 22'b0000000000000000001000,
    S_4 = 22'b0000000000000000010000,
    S_5 = 22'b0000000000000000100000,
    S_1 = 22'b0000000000000000000010,
    S_21 = 22'b1000000000000000000000,
    S_8 = 22'b0000000000000100000000,
    S_9 = 22'b0000000000001000000000,
    S_10 = 22'b0000000000010000000000,
    S_11 = 22'b0000000000100000000000,
    S_6 = 22'b0000000000000001000000,
    S_7 = 22'b0000000000000010000000,
    S_12 = 22'b0000000001000000000000,
    S_13 = 22'b0000000010000000000000,
    S_14 = 22'b0000000100000000000000,
    S_15 = 22'b0000001000000000000000,
    S_16 = 22'b0000010000000000000000,
    S_17 = 22'b0000100000000000000000,
    S_20 = 22'b0100000000000000000000,
    S_18 = 22'b0001000000000000000000,
    S_19 = 22'b0010000000000000000000;
  reg [21:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_STORE;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE;
  reg fuselector_BMEMORY_CTRLN_118_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_118_i0_STORE;
  reg selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0;
  reg selector_MUX_134_gimple_return_FU_52_i0_0_0_0;
  reg selector_MUX_134_gimple_return_FU_52_i0_0_0_1;
  reg selector_MUX_185_reg_0_0_0_0;
  reg selector_MUX_185_reg_0_0_0_1;
  reg selector_MUX_196_reg_19_0_0_0;
  reg selector_MUX_198_reg_20_0_0_0;
  reg selector_MUX_199_reg_21_0_0_0;
  reg selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0;
  reg selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1;
  reg selector_MUX_200_reg_22_0_0_0;
  reg selector_MUX_206_reg_28_0_0_0;
  reg selector_MUX_207_reg_29_0_0_0;
  reg selector_MUX_213_reg_34_0_0_0;
  reg selector_MUX_214_reg_35_0_0_0;
  reg selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0;
  reg selector_MUX_220_reg_40_0_0_0;
  reg selector_MUX_220_reg_40_0_0_1;
  reg selector_MUX_220_reg_40_0_1_0;
  reg selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0;
  reg selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1;
  reg selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0;
  reg selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1;
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
    fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE = 1'b0;
    fuselector_BMEMORY_CTRLN_118_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_118_i0_STORE = 1'b0;
    selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 = 1'b0;
    selector_MUX_134_gimple_return_FU_52_i0_0_0_0 = 1'b0;
    selector_MUX_134_gimple_return_FU_52_i0_0_0_1 = 1'b0;
    selector_MUX_185_reg_0_0_0_0 = 1'b0;
    selector_MUX_185_reg_0_0_0_1 = 1'b0;
    selector_MUX_196_reg_19_0_0_0 = 1'b0;
    selector_MUX_198_reg_20_0_0_0 = 1'b0;
    selector_MUX_199_reg_21_0_0_0 = 1'b0;
    selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0 = 1'b0;
    selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1 = 1'b0;
    selector_MUX_200_reg_22_0_0_0 = 1'b0;
    selector_MUX_206_reg_28_0_0_0 = 1'b0;
    selector_MUX_207_reg_29_0_0_0 = 1'b0;
    selector_MUX_213_reg_34_0_0_0 = 1'b0;
    selector_MUX_214_reg_35_0_0_0 = 1'b0;
    selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0 = 1'b0;
    selector_MUX_220_reg_40_0_0_0 = 1'b0;
    selector_MUX_220_reg_40_0_0_1 = 1'b0;
    selector_MUX_220_reg_40_0_1_0 = 1'b0;
    selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0 = 1'b0;
    selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1 = 1'b0;
    selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0 = 1'b0;
    selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1 = 1'b0;
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
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD = 1'b1;
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
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION_icrc_33779_33825 == 1'b1)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_1;
              wrenable_reg_1 = 1'b0;
              wrenable_reg_2 = 1'b0;
              wrenable_reg_3 = 1'b0;
              wrenable_reg_4 = 1'b0;
              wrenable_reg_5 = 1'b0;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_2 :
        begin
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 1'b1;
          selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 = 1'b1;
          wrenable_reg_20 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          selector_MUX_198_reg_20_0_0_0 = 1'b1;
          selector_MUX_200_reg_22_0_0_0 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          selector_MUX_199_reg_21_0_0_0 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          if (OUT_CONDITION_icrc_33779_34027 == 1'b1)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_5;
              wrenable_reg_22 = 1'b0;
            end
        end
      S_5 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE = 1'b1;
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD = 1'b1;
          if (OUT_CONDITION_icrc_33779_34036 == 1'b1)
            begin
              _next_state = S_3;
            end
          else
            begin
              _next_state = S_1;
            end
        end
      S_1 :
        begin
          selector_MUX_220_reg_40_0_0_0 = 1'b1;
          selector_MUX_220_reg_40_0_1_0 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_40 = 1'b1;
          casez (OUT_MULTIIF_icrc_33779_34594)
            4'b???1 :
              begin
                _next_state = S_6;
                selector_MUX_220_reg_40_0_0_0 = 1'b0;
                selector_MUX_220_reg_40_0_1_0 = 1'b0;
                wrenable_reg_28 = 1'b0;
                wrenable_reg_29 = 1'b0;
                wrenable_reg_34 = 1'b0;
                wrenable_reg_35 = 1'b0;
                wrenable_reg_40 = 1'b0;
              end
            4'b?100 :
              begin
                _next_state = S_8;
                selector_MUX_220_reg_40_0_0_0 = 1'b0;
                selector_MUX_220_reg_40_0_1_0 = 1'b0;
                wrenable_reg_34 = 1'b0;
                wrenable_reg_35 = 1'b0;
                wrenable_reg_40 = 1'b0;
              end
            4'b??10 :
              begin
                _next_state = S_17;
                wrenable_reg_28 = 1'b0;
                wrenable_reg_29 = 1'b0;
                wrenable_reg_34 = 1'b0;
                wrenable_reg_35 = 1'b0;
              end
            4'b1000 :
              begin
                _next_state = S_12;
                selector_MUX_220_reg_40_0_0_0 = 1'b0;
                selector_MUX_220_reg_40_0_1_0 = 1'b0;
                wrenable_reg_28 = 1'b0;
                wrenable_reg_29 = 1'b0;
                wrenable_reg_40 = 1'b0;
              end
            default:
              begin
                _next_state = S_21;
                done_port = 1'b1;
                selector_MUX_220_reg_40_0_0_0 = 1'b0;
                selector_MUX_220_reg_40_0_1_0 = 1'b0;
                wrenable_reg_28 = 1'b0;
                wrenable_reg_29 = 1'b0;
                wrenable_reg_34 = 1'b0;
                wrenable_reg_35 = 1'b0;
                wrenable_reg_40 = 1'b0;
              end
          endcase
        end
      S_21 :
        begin
          _next_state = S_0;
        end
      S_8 :
        begin
          fuselector_BMEMORY_CTRLN_118_i0_LOAD = 1'b1;
          selector_MUX_206_reg_28_0_0_0 = 1'b1;
          selector_MUX_207_reg_29_0_0_0 = 1'b1;
          selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          wrenable_reg_33 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD = 1'b1;
          selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          selector_MUX_196_reg_19_0_0_0 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_40 = 1'b1;
          if (OUT_CONDITION_icrc_33779_34136 == 1'b1)
            begin
              _next_state = S_8;
              wrenable_reg_40 = 1'b0;
            end
          else
            begin
              _next_state = S_17;
              selector_MUX_196_reg_19_0_0_0 = 1'b0;
              wrenable_reg_19 = 1'b0;
            end
        end
      S_6 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD = 1'b1;
          selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0 = 1'b1;
          selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0 = 1'b1;
          _next_state = S_7;
        end
      S_7 :
        begin
          selector_MUX_185_reg_0_0_0_1 = 1'b1;
          selector_MUX_220_reg_40_0_0_1 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_40 = 1'b1;
          if (OUT_CONDITION_icrc_33779_34083 == 1'b0)
            begin
              _next_state = S_18;
              selector_MUX_185_reg_0_0_0_1 = 1'b0;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_34 = 1'b0;
              wrenable_reg_35 = 1'b0;
            end
          else
            begin
              _next_state = S_12;
              selector_MUX_220_reg_40_0_0_1 = 1'b0;
              wrenable_reg_40 = 1'b0;
            end
        end
      S_12 :
        begin
          fuselector_BMEMORY_CTRLN_118_i0_LOAD = 1'b1;
          selector_MUX_213_reg_34_0_0_0 = 1'b1;
          selector_MUX_214_reg_35_0_0_0 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          wrenable_reg_39 = 1'b1;
          _next_state = S_14;
        end
      S_14 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD = 1'b1;
          selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1 = 1'b1;
          _next_state = S_16;
        end
      S_16 :
        begin
          selector_MUX_185_reg_0_0_0_0 = 1'b1;
          selector_MUX_220_reg_40_0_1_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_40 = 1'b1;
          if (OUT_CONDITION_icrc_33779_34201 == 1'b1)
            begin
              _next_state = S_12;
              selector_MUX_220_reg_40_0_1_0 = 1'b0;
              wrenable_reg_40 = 1'b0;
            end
          else
            begin
              _next_state = S_17;
              selector_MUX_185_reg_0_0_0_0 = 1'b0;
              wrenable_reg_0 = 1'b0;
            end
        end
      S_17 :
        begin
          if (OUT_CONDITION_icrc_33779_34245 == 1'b0)
            begin
              _next_state = S_18;
            end
          else
            begin
              _next_state = S_20;
              done_port = 1'b1;
            end
        end
      S_20 :
        begin
          selector_MUX_134_gimple_return_FU_52_i0_0_0_0 = 1'b1;
          _next_state = S_0;
        end
      S_18 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD = 1'b1;
          selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1 = 1'b1;
          selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1 = 1'b1;
          _next_state = S_19;
          done_port = 1'b1;
        end
      S_19 :
        begin
          selector_MUX_134_gimple_return_FU_52_i0_0_0_1 = 1'b1;
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

// Top component for icrc
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _icrc(clock,
  reset,
  start_port,
  done_port,
  crc,
  lin,
  len,
  jinit,
  jrev,
  return_port,
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
  input [15:0] crc;
  input [31:0] lin;
  input [31:0] len;
  input signed [15:0] jinit;
  input signed [31:0] jrev;
  input [31:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [31:0] Min_Wdata_ram;
  input [9:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [15:0] return_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [31:0] Mout_Wdata_ram;
  output [9:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION_icrc_33779_33825;
  wire OUT_CONDITION_icrc_33779_34027;
  wire OUT_CONDITION_icrc_33779_34036;
  wire OUT_CONDITION_icrc_33779_34083;
  wire OUT_CONDITION_icrc_33779_34136;
  wire OUT_CONDITION_icrc_33779_34201;
  wire OUT_CONDITION_icrc_33779_34245;
  wire [3:0] OUT_MULTIIF_icrc_33779_34594;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_STORE;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE;
  wire fuselector_BMEMORY_CTRLN_118_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_118_i0_STORE;
  wire selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0;
  wire selector_MUX_134_gimple_return_FU_52_i0_0_0_0;
  wire selector_MUX_134_gimple_return_FU_52_i0_0_0_1;
  wire selector_MUX_185_reg_0_0_0_0;
  wire selector_MUX_185_reg_0_0_0_1;
  wire selector_MUX_196_reg_19_0_0_0;
  wire selector_MUX_198_reg_20_0_0_0;
  wire selector_MUX_199_reg_21_0_0_0;
  wire selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0;
  wire selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1;
  wire selector_MUX_200_reg_22_0_0_0;
  wire selector_MUX_206_reg_28_0_0_0;
  wire selector_MUX_207_reg_29_0_0_0;
  wire selector_MUX_213_reg_34_0_0_0;
  wire selector_MUX_214_reg_35_0_0_0;
  wire selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0;
  wire selector_MUX_220_reg_40_0_0_0;
  wire selector_MUX_220_reg_40_0_0_1;
  wire selector_MUX_220_reg_40_0_1_0;
  wire selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0;
  wire selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1;
  wire selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0;
  wire selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1;
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
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_icrc Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD),
    .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE),
    .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD),
    .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_STORE),
    .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD),
    .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE),
    .fuselector_BMEMORY_CTRLN_118_i0_LOAD(fuselector_BMEMORY_CTRLN_118_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_118_i0_STORE(fuselector_BMEMORY_CTRLN_118_i0_STORE),
    .selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0(selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0),
    .selector_MUX_134_gimple_return_FU_52_i0_0_0_0(selector_MUX_134_gimple_return_FU_52_i0_0_0_0),
    .selector_MUX_134_gimple_return_FU_52_i0_0_0_1(selector_MUX_134_gimple_return_FU_52_i0_0_0_1),
    .selector_MUX_185_reg_0_0_0_0(selector_MUX_185_reg_0_0_0_0),
    .selector_MUX_185_reg_0_0_0_1(selector_MUX_185_reg_0_0_0_1),
    .selector_MUX_196_reg_19_0_0_0(selector_MUX_196_reg_19_0_0_0),
    .selector_MUX_198_reg_20_0_0_0(selector_MUX_198_reg_20_0_0_0),
    .selector_MUX_199_reg_21_0_0_0(selector_MUX_199_reg_21_0_0_0),
    .selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0),
    .selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1),
    .selector_MUX_200_reg_22_0_0_0(selector_MUX_200_reg_22_0_0_0),
    .selector_MUX_206_reg_28_0_0_0(selector_MUX_206_reg_28_0_0_0),
    .selector_MUX_207_reg_29_0_0_0(selector_MUX_207_reg_29_0_0_0),
    .selector_MUX_213_reg_34_0_0_0(selector_MUX_213_reg_34_0_0_0),
    .selector_MUX_214_reg_35_0_0_0(selector_MUX_214_reg_35_0_0_0),
    .selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0(selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0),
    .selector_MUX_220_reg_40_0_0_0(selector_MUX_220_reg_40_0_0_0),
    .selector_MUX_220_reg_40_0_0_1(selector_MUX_220_reg_40_0_0_1),
    .selector_MUX_220_reg_40_0_1_0(selector_MUX_220_reg_40_0_1_0),
    .selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0(selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0),
    .selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1(selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1),
    .selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0(selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0),
    .selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1(selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1),
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
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_icrc_33779_33825(OUT_CONDITION_icrc_33779_33825),
    .OUT_CONDITION_icrc_33779_34027(OUT_CONDITION_icrc_33779_34027),
    .OUT_CONDITION_icrc_33779_34036(OUT_CONDITION_icrc_33779_34036),
    .OUT_CONDITION_icrc_33779_34083(OUT_CONDITION_icrc_33779_34083),
    .OUT_CONDITION_icrc_33779_34136(OUT_CONDITION_icrc_33779_34136),
    .OUT_CONDITION_icrc_33779_34201(OUT_CONDITION_icrc_33779_34201),
    .OUT_CONDITION_icrc_33779_34245(OUT_CONDITION_icrc_33779_34245),
    .OUT_MULTIIF_icrc_33779_34594(OUT_MULTIIF_icrc_33779_34594),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_icrc #(.MEM_var_33827_33779(512),
    .MEM_var_33854_33779(512),
    .MEM_var_33935_33779(512),
    .MEM_var_33965_33779(512)) Datapath_i (.return_port(return_port),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_icrc_33779_33825(OUT_CONDITION_icrc_33779_33825),
    .OUT_CONDITION_icrc_33779_34027(OUT_CONDITION_icrc_33779_34027),
    .OUT_CONDITION_icrc_33779_34036(OUT_CONDITION_icrc_33779_34036),
    .OUT_CONDITION_icrc_33779_34083(OUT_CONDITION_icrc_33779_34083),
    .OUT_CONDITION_icrc_33779_34136(OUT_CONDITION_icrc_33779_34136),
    .OUT_CONDITION_icrc_33779_34201(OUT_CONDITION_icrc_33779_34201),
    .OUT_CONDITION_icrc_33779_34245(OUT_CONDITION_icrc_33779_34245),
    .OUT_MULTIIF_icrc_33779_34594(OUT_MULTIIF_icrc_33779_34594),
    .clock(clock),
    .reset(reset),
    .in_port_crc(crc),
    .in_port_lin(lin),
    .in_port_len(len),
    .in_port_jinit(jinit),
    .in_port_jrev(jrev),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_LOAD),
    .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_STORE),
    .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_LOAD),
    .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_STORE),
    .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_LOAD),
    .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i0_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_3_i1_STORE),
    .fuselector_BMEMORY_CTRLN_118_i0_LOAD(fuselector_BMEMORY_CTRLN_118_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_118_i0_STORE(fuselector_BMEMORY_CTRLN_118_i0_STORE),
    .selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0(selector_MUX_12_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0),
    .selector_MUX_134_gimple_return_FU_52_i0_0_0_0(selector_MUX_134_gimple_return_FU_52_i0_0_0_0),
    .selector_MUX_134_gimple_return_FU_52_i0_0_0_1(selector_MUX_134_gimple_return_FU_52_i0_0_0_1),
    .selector_MUX_185_reg_0_0_0_0(selector_MUX_185_reg_0_0_0_0),
    .selector_MUX_185_reg_0_0_0_1(selector_MUX_185_reg_0_0_0_1),
    .selector_MUX_196_reg_19_0_0_0(selector_MUX_196_reg_19_0_0_0),
    .selector_MUX_198_reg_20_0_0_0(selector_MUX_198_reg_20_0_0_0),
    .selector_MUX_199_reg_21_0_0_0(selector_MUX_199_reg_21_0_0_0),
    .selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_0),
    .selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_1_i0_1_0_1),
    .selector_MUX_200_reg_22_0_0_0(selector_MUX_200_reg_22_0_0_0),
    .selector_MUX_206_reg_28_0_0_0(selector_MUX_206_reg_28_0_0_0),
    .selector_MUX_207_reg_29_0_0_0(selector_MUX_207_reg_29_0_0_0),
    .selector_MUX_213_reg_34_0_0_0(selector_MUX_213_reg_34_0_0_0),
    .selector_MUX_214_reg_35_0_0_0(selector_MUX_214_reg_35_0_0_0),
    .selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0(selector_MUX_21_BMEMORY_CTRLN_118_i0_1_0_0),
    .selector_MUX_220_reg_40_0_0_0(selector_MUX_220_reg_40_0_0_0),
    .selector_MUX_220_reg_40_0_0_1(selector_MUX_220_reg_40_0_0_1),
    .selector_MUX_220_reg_40_0_1_0(selector_MUX_220_reg_40_0_1_0),
    .selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0(selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_0),
    .selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1(selector_MUX_4_ARRAY_1D_STD_BRAM_NN_SDS_2_i0_1_0_1),
    .selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0(selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_0),
    .selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1(selector_MUX_8_ARRAY_1D_STD_BRAM_NN_SDS_2_i1_1_0_1),
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
module ui_view_convert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// Minimal interface for function: icrc
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module icrc(clock,
  reset,
  start_port,
  crc,
  lin,
  len,
  jinit,
  jrev,
  M_Rdata_ram,
  M_DataRdy,
  done_port,
  return_port,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [15:0] crc;
  input [31:0] lin;
  input [31:0] len;
  input [15:0] jinit;
  input [31:0] jrev;
  input [31:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  // OUT
  output done_port;
  output [15:0] return_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [31:0] Mout_Wdata_ram;
  output [9:0] Mout_data_ram_size;
  // Component and signal declarations
  wire [15:0] out_return_port_ui_view_convert_expr_FU;
  
  _icrc _icrc_i0 (.done_port(done_port),
    .return_port(out_return_port_ui_view_convert_expr_FU),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .crc(crc),
    .lin(lin),
    .len(len),
    .jinit(jinit),
    .jrev(jrev),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram({1'b0,
      1'b0}),
    .Min_we_ram({1'b0,
      1'b0}),
    .Min_addr_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Min_Wdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .Min_data_ram_size({5'b00000,
      5'b00000}));
  ui_view_convert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) return_port_ui_view_convert_expr_FU (.out1(return_port),
    .in1(out_return_port_ui_view_convert_expr_FU));

endmodule


