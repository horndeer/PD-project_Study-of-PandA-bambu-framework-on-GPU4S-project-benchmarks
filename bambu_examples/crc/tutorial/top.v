// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2023.1 - Revision 04336c437a53bc96ae90b74052c455629946ec8b-main - Date 2024-04-17T17:29:42
// /tmp/.mount_bambu-olMLYC/usr/bin/bambu executed with: /tmp/.mount_bambu-olMLYC/usr/bin/bambu --simulate --simulator=XSIM ../spec.c 
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
// Copyright (C) 2013-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module DPROXY_CTRLN(in1,
  in2,
  in3,
  in4,
  sel_LOAD,
  sel_STORE,
  out1,
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
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  output [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  output [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  output [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  output [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  generate
  genvar i0;
  for (i0=0; i0<PORTSIZE_out1; i0=i0+1)
    begin : L0
      assign out1[(i0+1)*BITSIZE_out1-1:i0*BITSIZE_out1] = proxy_out1[(i0+1)*BITSIZE_proxy_out1-1:i0*BITSIZE_proxy_out1];
    end
  endgenerate
  generate
  genvar i1;
  for (i1=0; i1<PORTSIZE_in1; i1=i1+1)
    begin : L1
      assign proxy_in1[(i1+1)*BITSIZE_proxy_in1-1:i1*BITSIZE_proxy_in1] = int_sel_STORE[i1] ? in1[(i1+1)*BITSIZE_in1-1:i1*BITSIZE_in1] : 0;
    end
  endgenerate
  generate
  genvar i2;
  for (i2=0; i2<PORTSIZE_in2; i2=i2+1)
    begin : L2
      assign proxy_in2[(i2+1)*BITSIZE_proxy_in2-1:i2*BITSIZE_proxy_in2] = int_sel_LOAD[i2]|int_sel_STORE[i2] ? in2[(i2+1)*BITSIZE_in2-1:i2*BITSIZE_in2] : 0;
    end
  endgenerate
  generate
  genvar i3;
  for (i3=0; i3<PORTSIZE_in3; i3=i3+1)
    begin : L3
      assign proxy_in3[(i3+1)*BITSIZE_proxy_in3-1:i3*BITSIZE_proxy_in3] = int_sel_LOAD[i3]|int_sel_STORE[i3] ? in3[(i3+1)*BITSIZE_in3-1:i3*BITSIZE_in3] : 0;
    end
  endgenerate
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  assign proxy_sel_LOAD = int_sel_LOAD;
  assign proxy_sel_STORE = int_sel_STORE;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2013-2023 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module PROXY_CTRLN(in1,
  in2,
  in3,
  in4,
  sel_LOAD,
  sel_STORE,
  out1,
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
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  output [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  output [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  output [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  output [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  assign int_sel_STORE = sel_STORE & in4;
  assign int_sel_LOAD = sel_LOAD & in4;
  generate
  genvar i0;
  for (i0=0; i0<PORTSIZE_out1; i0=i0+1)
    begin : L0
      assign out1[(i0+1)*BITSIZE_out1-1:i0*BITSIZE_out1] = proxy_out1[(i0+1)*BITSIZE_proxy_out1-1:i0*BITSIZE_proxy_out1];
    end
  endgenerate
  generate
  genvar i1;
  for (i1=0; i1<PORTSIZE_in1; i1=i1+1)
    begin : L1
      assign proxy_in1[(i1+1)*BITSIZE_proxy_in1-1:i1*BITSIZE_proxy_in1] = int_sel_STORE[i1] ? in1[(i1+1)*BITSIZE_in1-1:i1*BITSIZE_in1] : 0;
    end
  endgenerate
  generate
  genvar i2;
  for (i2=0; i2<PORTSIZE_in2; i2=i2+1)
    begin : L2
      assign proxy_in2[(i2+1)*BITSIZE_proxy_in2-1:i2*BITSIZE_proxy_in2] = int_sel_LOAD[i2]|int_sel_STORE[i2] ? in2[(i2+1)*BITSIZE_in2-1:i2*BITSIZE_in2] : 0;
    end
  endgenerate
  generate
  genvar i3;
  for (i3=0; i3<PORTSIZE_in3; i3=i3+1)
    begin : L3
      assign proxy_in3[(i3+1)*BITSIZE_proxy_in3-1:i3*BITSIZE_proxy_in3] = int_sel_LOAD[i3]|int_sel_STORE[i3] ? in3[(i3+1)*BITSIZE_in3-1:i3*BITSIZE_in3] : 0;
    end
  endgenerate
  assign proxy_sel_LOAD = int_sel_LOAD;
  assign proxy_sel_STORE = int_sel_STORE;

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

// Datapath RTL description for icrc_constprop_0
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_icrc_constprop_0(clock,
  reset,
  in_port_crc,
  in_port_len,
  in_port_jinit,
  return_port,
  proxy_out1_33838,
  proxy_in1_33838,
  proxy_in2_33838,
  proxy_in3_33838,
  proxy_sel_LOAD_33838,
  proxy_sel_STORE_33838,
  proxy_out1_33865,
  proxy_in1_33865,
  proxy_in2_33865,
  proxy_in3_33865,
  proxy_sel_LOAD_33865,
  proxy_sel_STORE_33865,
  proxy_out1_33948,
  proxy_in1_33948,
  proxy_in2_33948,
  proxy_in3_33948,
  proxy_sel_LOAD_33948,
  proxy_sel_STORE_33948,
  proxy_out1_34115,
  proxy_in1_34115,
  proxy_in2_34115,
  proxy_in3_34115,
  proxy_sel_LOAD_34115,
  proxy_sel_STORE_34115,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE,
  fuselector_DPROXY_CTRLN_1_i0_LOAD,
  fuselector_DPROXY_CTRLN_1_i0_STORE,
  selector_MUX_103_reg_8_0_0_0,
  selector_MUX_104_reg_9_0_0_0,
  selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0,
  selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0,
  selector_MUX_83_reg_0_0_0_0,
  selector_MUX_85_reg_10_0_0_0,
  selector_MUX_91_reg_16_0_0_0,
  selector_MUX_91_reg_16_0_0_1,
  selector_MUX_92_reg_17_0_0_0,
  fuselector_PROXY_CTRLN_2_i0_LOAD,
  fuselector_PROXY_CTRLN_2_i0_STORE,
  fuselector_PROXY_CTRLN_3_i0_LOAD,
  fuselector_PROXY_CTRLN_3_i0_STORE,
  fuselector_PROXY_CTRLN_4_i0_LOAD,
  fuselector_PROXY_CTRLN_4_i0_STORE,
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
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_icrc_constprop_0_33779_33836,
  OUT_CONDITION_icrc_constprop_0_33779_34040,
  OUT_CONDITION_icrc_constprop_0_33779_34049,
  OUT_CONDITION_icrc_constprop_0_33779_34104);
  parameter MEM_var_33838_33781=512,
    MEM_var_33865_33781=512,
    MEM_var_33948_33781=512,
    MEM_var_33978_33779=512,
    MEM_var_34115_33781=512;
  // IN
  input clock;
  input reset;
  input [15:0] in_port_crc;
  input [31:0] in_port_len;
  input signed [15:0] in_port_jinit;
  input [31:0] proxy_out1_33838;
  input [31:0] proxy_out1_33865;
  input [31:0] proxy_out1_33948;
  input [31:0] proxy_out1_34115;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE;
  input fuselector_DPROXY_CTRLN_1_i0_LOAD;
  input fuselector_DPROXY_CTRLN_1_i0_STORE;
  input selector_MUX_103_reg_8_0_0_0;
  input selector_MUX_104_reg_9_0_0_0;
  input selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0;
  input selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0;
  input selector_MUX_83_reg_0_0_0_0;
  input selector_MUX_85_reg_10_0_0_0;
  input selector_MUX_91_reg_16_0_0_0;
  input selector_MUX_91_reg_16_0_0_1;
  input selector_MUX_92_reg_17_0_0_0;
  input fuselector_PROXY_CTRLN_2_i0_LOAD;
  input fuselector_PROXY_CTRLN_2_i0_STORE;
  input fuselector_PROXY_CTRLN_3_i0_LOAD;
  input fuselector_PROXY_CTRLN_3_i0_STORE;
  input fuselector_PROXY_CTRLN_4_i0_LOAD;
  input fuselector_PROXY_CTRLN_4_i0_STORE;
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
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [15:0] return_port;
  output [31:0] proxy_in1_33838;
  output [21:0] proxy_in2_33838;
  output [9:0] proxy_in3_33838;
  output [1:0] proxy_sel_LOAD_33838;
  output [1:0] proxy_sel_STORE_33838;
  output [31:0] proxy_in1_33865;
  output [21:0] proxy_in2_33865;
  output [9:0] proxy_in3_33865;
  output [1:0] proxy_sel_LOAD_33865;
  output [1:0] proxy_sel_STORE_33865;
  output [31:0] proxy_in1_33948;
  output [21:0] proxy_in2_33948;
  output [9:0] proxy_in3_33948;
  output [1:0] proxy_sel_LOAD_33948;
  output [1:0] proxy_sel_STORE_33948;
  output [31:0] proxy_in1_34115;
  output [21:0] proxy_in2_34115;
  output [9:0] proxy_in3_34115;
  output [1:0] proxy_sel_LOAD_34115;
  output [1:0] proxy_sel_STORE_34115;
  output OUT_CONDITION_icrc_constprop_0_33779_33836;
  output OUT_CONDITION_icrc_constprop_0_33779_34040;
  output OUT_CONDITION_icrc_constprop_0_33779_34049;
  output OUT_CONDITION_icrc_constprop_0_33779_34104;
  // Component and signal declarations
  wire [15:0] null_out_signal_DPROXY_CTRLN_1_i0_out1_1;
  wire [15:0] null_out_signal_PROXY_CTRLN_2_i0_out1_1;
  wire [7:0] null_out_signal_PROXY_CTRLN_3_i0_out1_0;
  wire [7:0] null_out_signal_PROXY_CTRLN_3_i0_out1_1;
  wire [7:0] null_out_signal_PROXY_CTRLN_4_i0_out1_1;
  wire null_out_signal_array_33978_0_Sout_DataRdy_0;
  wire null_out_signal_array_33978_0_Sout_DataRdy_1;
  wire [15:0] null_out_signal_array_33978_0_Sout_Rdata_ram_0;
  wire [15:0] null_out_signal_array_33978_0_Sout_Rdata_ram_1;
  wire [15:0] null_out_signal_array_33978_0_proxy_out1_0;
  wire [15:0] null_out_signal_array_33978_0_proxy_out1_1;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_33978_0;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_33978_0;
  wire [15:0] out_DPROXY_CTRLN_1_i0_DPROXY_CTRLN_1_i0;
  wire signed [15:0] out_IIconvert_expr_FU_33_i0_fu_icrc_constprop_0_33779_33932;
  wire signed [7:0] out_IIconvert_expr_FU_38_i0_fu_icrc_constprop_0_33779_33964;
  wire signed [15:0] out_IIconvert_expr_FU_51_i0_fu_icrc_constprop_0_33779_34099;
  wire [3:0] out_IUdata_converter_FU_26_i0_fu_icrc_constprop_0_33779_34232;
  wire [9:0] out_IUdata_converter_FU_28_i0_fu_icrc_constprop_0_33779_34247;
  wire [15:0] out_IUdata_converter_FU_34_i0_fu_icrc_constprop_0_33779_33925;
  wire [7:0] out_IUdata_converter_FU_40_i0_fu_icrc_constprop_0_33779_33954;
  wire [7:0] out_IUdata_converter_FU_47_i0_fu_icrc_constprop_0_33779_34294;
  wire [15:0] out_IUdata_converter_FU_52_i0_fu_icrc_constprop_0_33779_34101;
  wire [31:0] out_MUX_103_reg_8_0_0_0;
  wire [15:0] out_MUX_104_reg_9_0_0_0;
  wire [10:0] out_MUX_24_PROXY_CTRLN_2_i0_1_0_0;
  wire [10:0] out_MUX_7_DPROXY_CTRLN_1_i0_1_0_0;
  wire [15:0] out_MUX_83_reg_0_0_0_0;
  wire [31:0] out_MUX_85_reg_10_0_0_0;
  wire [15:0] out_MUX_91_reg_16_0_0_0;
  wire [15:0] out_MUX_91_reg_16_0_0_1;
  wire [15:0] out_MUX_92_reg_17_0_0_0;
  wire [15:0] out_PROXY_CTRLN_2_i0_PROXY_CTRLN_2_i0;
  wire [7:0] out_PROXY_CTRLN_4_i0_PROXY_CTRLN_4_i0;
  wire signed [4:0] out_UIdata_converter_FU_25_i0_fu_icrc_constprop_0_33779_34016;
  wire signed [12:0] out_UIdata_converter_FU_27_i0_fu_icrc_constprop_0_33779_34029;
  wire signed [15:0] out_UIdata_converter_FU_32_i0_fu_icrc_constprop_0_33779_33941;
  wire signed [4:0] out_UIdata_converter_FU_37_i0_fu_icrc_constprop_0_33779_33972;
  wire signed [4:0] out_UIdata_converter_FU_39_i0_fu_icrc_constprop_0_33779_34023;
  wire signed [8:0] out_UIdata_converter_FU_46_i0_fu_icrc_constprop_0_33779_34093;
  wire signed [15:0] out_UIdata_converter_FU_48_i0_fu_icrc_constprop_0_33779_34095;
  wire signed [8:0] out_UIdata_converter_FU_50_i0_fu_icrc_constprop_0_33779_34097;
  wire [7:0] out_UUconvert_expr_FU_45_i0_fu_icrc_constprop_0_33779_34091;
  wire [7:0] out_UUconvert_expr_FU_49_i0_fu_icrc_constprop_0_33779_34096;
  wire [9:0] out_UUdata_converter_FU_11_i0_fu_icrc_constprop_0_33779_34224;
  wire [9:0] out_UUdata_converter_FU_13_i0_fu_icrc_constprop_0_33779_34244;
  wire [9:0] out_UUdata_converter_FU_19_i0_fu_icrc_constprop_0_33779_34291;
  wire [15:0] out_UUdata_converter_FU_24_i0_fu_icrc_constprop_0_33779_33920;
  wire [15:0] out_UUdata_converter_FU_53_i0_fu_icrc_constprop_0_33779_34103;
  wire [9:0] out_addr_expr_FU_10_i0_fu_icrc_constprop_0_33779_34273;
  wire [9:0] out_addr_expr_FU_12_i0_fu_icrc_constprop_0_33779_34277;
  wire [9:0] out_addr_expr_FU_14_i0_fu_icrc_constprop_0_33779_34281;
  wire [9:0] out_addr_expr_FU_17_i0_fu_icrc_constprop_0_33779_34288;
  wire [9:0] out_addr_expr_FU_18_i0_fu_icrc_constprop_0_33779_34306;
  wire [9:0] out_addr_expr_FU_7_i0_fu_icrc_constprop_0_33779_34204;
  wire [9:0] out_addr_expr_FU_8_i0_fu_icrc_constprop_0_33779_34211;
  wire [9:0] out_addr_expr_FU_9_i0_fu_icrc_constprop_0_33779_34265;
  wire signed [7:0] out_bit_ior_expr_FU_0_8_8_56_i0_fu_icrc_constprop_0_33779_33958;
  wire signed [15:0] out_bit_xor_expr_FU_16_0_16_57_i0_fu_icrc_constprop_0_33779_33928;
  wire signed [15:0] out_bit_xor_expr_FU_16_16_16_58_i0_fu_icrc_constprop_0_33779_34100;
  wire out_const_0;
  wire [15:0] out_const_1;
  wire [3:0] out_const_10;
  wire [9:0] out_const_11;
  wire [9:0] out_const_12;
  wire [9:0] out_const_13;
  wire [9:0] out_const_14;
  wire [10:0] out_const_15;
  wire [1:0] out_const_2;
  wire [3:0] out_const_3;
  wire [4:0] out_const_4;
  wire [5:0] out_const_5;
  wire [13:0] out_const_6;
  wire out_const_7;
  wire [3:0] out_const_8;
  wire [8:0] out_const_9;
  wire signed [0:0] out_conv_in_port_jinit_I_16_I_1;
  wire [5:0] out_conv_in_port_len_32_6;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_33978_0_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_33978_0_8_4;
  wire out_conv_out_DPROXY_CTRLN_1_i0_DPROXY_CTRLN_1_i0_16_1;
  wire [10:0] out_conv_out_addr_expr_FU_7_i0_fu_icrc_constprop_0_33779_34204_10_11;
  wire [31:0] out_conv_out_const_0_1_32;
  wire signed [31:0] out_conv_out_const_0_I_1_I_32;
  wire [31:0] out_conv_out_const_11_10_32;
  wire [31:0] out_conv_out_const_12_10_32;
  wire [31:0] out_conv_out_const_13_10_32;
  wire [31:0] out_conv_out_const_14_10_32;
  wire [31:0] out_conv_out_const_15_11_32;
  wire [4:0] out_conv_out_const_5_6_5;
  wire [9:0] out_conv_out_const_7_1_10;
  wire [10:0] out_conv_out_reg_13_reg_13_10_11;
  wire [10:0] out_conv_out_reg_14_reg_14_10_11;
  wire [9:0] out_conv_out_reg_16_reg_16_16_10;
  wire [10:0] out_conv_out_reg_1_reg_1_10_11;
  wire [10:0] out_conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i0_fu_icrc_constprop_0_33779_34088_10_11;
  wire [10:0] out_conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i1_fu_icrc_constprop_0_33779_34239_10_11;
  wire [10:0] out_conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i2_fu_icrc_constprop_0_33779_34253_10_11;
  wire [10:0] out_conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i5_fu_icrc_constprop_0_33779_34301_10_11;
  wire [15:0] out_conv_out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_2_10_16;
  wire [15:0] out_conv_out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_3_10_16;
  wire out_extract_bit_expr_FU_15_i0_fu_icrc_constprop_0_33779_34372;
  wire signed [31:0] out_ii_conv_conn_obj_4_IIdata_converter_FU_ii_conv_0;
  wire signed [15:0] out_lshift_expr_FU_16_0_16_59_i0_fu_icrc_constprop_0_33779_33935;
  wire signed [15:0] out_lshift_expr_FU_16_0_16_60_i0_fu_icrc_constprop_0_33779_34098;
  wire signed [7:0] out_lshift_expr_FU_8_0_8_61_i0_fu_icrc_constprop_0_33779_33967;
  wire out_lut_expr_FU_16_i0_fu_icrc_constprop_0_33779_34208;
  wire out_ne_expr_FU_32_0_32_62_i0_fu_icrc_constprop_0_33779_34314;
  wire signed [31:0] out_plus_expr_FU_32_0_32_63_i0_fu_icrc_constprop_0_33779_34039;
  wire out_read_cond_FU_20_i0_fu_icrc_constprop_0_33779_33836;
  wire out_read_cond_FU_36_i0_fu_icrc_constprop_0_33779_34040;
  wire out_read_cond_FU_41_i0_fu_icrc_constprop_0_33779_34049;
  wire out_read_cond_FU_54_i0_fu_icrc_constprop_0_33779_34104;
  wire [15:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [3:0] out_reg_11_reg_11;
  wire [9:0] out_reg_12_reg_12;
  wire [9:0] out_reg_13_reg_13;
  wire [9:0] out_reg_14_reg_14;
  wire out_reg_15_reg_15;
  wire [15:0] out_reg_16_reg_16;
  wire [15:0] out_reg_17_reg_17;
  wire [7:0] out_reg_18_reg_18;
  wire [15:0] out_reg_19_reg_19;
  wire [9:0] out_reg_1_reg_1;
  wire out_reg_20_reg_20;
  wire [15:0] out_reg_21_reg_21;
  wire [9:0] out_reg_2_reg_2;
  wire [9:0] out_reg_3_reg_3;
  wire [9:0] out_reg_4_reg_4;
  wire [9:0] out_reg_5_reg_5;
  wire [9:0] out_reg_6_reg_6;
  wire [9:0] out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire [15:0] out_reg_9_reg_9;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_64_i0_fu_icrc_constprop_0_33779_34020;
  wire [7:0] out_ui_bit_xor_expr_FU_8_8_8_65_i0_fu_icrc_constprop_0_33779_34092;
  wire [15:0] out_ui_cond_expr_FU_16_16_16_16_66_i0_fu_icrc_constprop_0_33779_33899;
  wire [15:0] out_ui_cond_expr_FU_16_16_16_16_66_i1_fu_icrc_constprop_0_33779_34353;
  wire out_ui_eq_expr_FU_1_0_1_67_i0_fu_icrc_constprop_0_33779_34312;
  wire out_ui_extract_bit_expr_FU_35_i0_fu_icrc_constprop_0_33779_34382;
  wire out_ui_le_expr_FU_16_16_16_68_i0_fu_icrc_constprop_0_33779_34320;
  wire [15:0] out_ui_lshift_expr_FU_16_0_16_69_i0_fu_icrc_constprop_0_33779_33914;
  wire [15:0] out_ui_lshift_expr_FU_16_0_16_70_i0_fu_icrc_constprop_0_33779_33944;
  wire [8:0] out_ui_lshift_expr_FU_16_0_16_71_i0_fu_icrc_constprop_0_33779_34298;
  wire [9:0] out_ui_lshift_expr_FU_32_0_32_72_i0_fu_icrc_constprop_0_33779_34262;
  wire out_ui_ne_expr_FU_32_0_32_73_i0_fu_icrc_constprop_0_33779_34316;
  wire [15:0] out_ui_plus_expr_FU_16_0_16_74_i0_fu_icrc_constprop_0_33779_34102;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_75_i0_fu_icrc_constprop_0_33779_33884;
  wire [9:0] out_ui_pointer_plus_expr_FU_16_16_16_76_i0_fu_icrc_constprop_0_33779_34088;
  wire [9:0] out_ui_pointer_plus_expr_FU_16_16_16_76_i1_fu_icrc_constprop_0_33779_34239;
  wire [9:0] out_ui_pointer_plus_expr_FU_16_16_16_76_i2_fu_icrc_constprop_0_33779_34253;
  wire [9:0] out_ui_pointer_plus_expr_FU_16_16_16_76_i3_fu_icrc_constprop_0_33779_34268;
  wire [9:0] out_ui_pointer_plus_expr_FU_16_16_16_76_i4_fu_icrc_constprop_0_33779_34284;
  wire [9:0] out_ui_pointer_plus_expr_FU_16_16_16_76_i5_fu_icrc_constprop_0_33779_34301;
  wire [11:0] out_ui_rshift_expr_FU_16_0_16_77_i0_fu_icrc_constprop_0_33779_34032;
  wire [7:0] out_ui_rshift_expr_FU_16_0_16_78_i0_fu_icrc_constprop_0_33779_34090;
  wire [15:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1;
  wire [9:0] out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_2;
  wire [9:0] out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_3;
  wire [31:0] out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_4;
  wire [15:0] out_uu_conv_conn_obj_5_UUdata_converter_FU_uu_conv_5;
  wire [7:0] out_uu_conv_conn_obj_6_UUdata_converter_FU_uu_conv_6;
  
  DPROXY_CTRLN #(.BITSIZE_in1(16),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(11),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(5),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(16),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(11),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) DPROXY_CTRLN_1_i0 (.out1({null_out_signal_DPROXY_CTRLN_1_i0_out1_1,
      out_DPROXY_CTRLN_1_i0_DPROXY_CTRLN_1_i0}),
    .proxy_in1(proxy_in1_33838),
    .proxy_in2(proxy_in2_33838),
    .proxy_in3(proxy_in3_33838),
    .proxy_sel_LOAD(proxy_sel_LOAD_33838),
    .proxy_sel_STORE(proxy_sel_STORE_33838),
    .in1({16'b0000000000000000,
      out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1}),
    .in2({11'b00000000000,
      out_MUX_7_DPROXY_CTRLN_1_i0_1_0_0}),
    .in3({5'b00000,
      out_conv_out_const_5_6_5}),
    .in4({1'b0,
      out_const_7}),
    .sel_LOAD({1'b0,
      fuselector_DPROXY_CTRLN_1_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_DPROXY_CTRLN_1_i0_STORE}),
    .proxy_out1(proxy_out1_33838));
  IIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IIdata_converter_FU_ii_conv_0 (.out1(out_ii_conv_conn_obj_4_IIdata_converter_FU_ii_conv_0),
    .in1(out_conv_out_const_0_I_1_I_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_103_reg_8_0_0_0 (.out1(out_MUX_103_reg_8_0_0_0),
    .sel(selector_MUX_103_reg_8_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_75_i0_fu_icrc_constprop_0_33779_33884),
    .in2(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_4));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_104_reg_9_0_0_0 (.out1(out_MUX_104_reg_9_0_0_0),
    .sel(selector_MUX_104_reg_9_0_0_0),
    .in1(out_ui_cond_expr_FU_16_16_16_16_66_i0_fu_icrc_constprop_0_33779_33899),
    .in2(out_ui_lshift_expr_FU_16_0_16_69_i0_fu_icrc_constprop_0_33779_33914));
  MUX_GATE #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) MUX_24_PROXY_CTRLN_2_i0_1_0_0 (.out1(out_MUX_24_PROXY_CTRLN_2_i0_1_0_0),
    .sel(selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0),
    .in1(out_conv_out_reg_13_reg_13_10_11),
    .in2(out_conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i5_fu_icrc_constprop_0_33779_34301_10_11));
  MUX_GATE #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) MUX_7_DPROXY_CTRLN_1_i0_1_0_0 (.out1(out_MUX_7_DPROXY_CTRLN_1_i0_1_0_0),
    .sel(selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0),
    .in1(out_conv_out_reg_1_reg_1_10_11),
    .in2(out_conv_out_addr_expr_FU_7_i0_fu_icrc_constprop_0_33779_34204_10_11));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_83_reg_0_0_0_0 (.out1(out_MUX_83_reg_0_0_0_0),
    .sel(selector_MUX_83_reg_0_0_0_0),
    .in1(out_IUdata_converter_FU_52_i0_fu_icrc_constprop_0_33779_34101),
    .in2(out_ui_cond_expr_FU_16_16_16_16_66_i1_fu_icrc_constprop_0_33779_34353));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_85_reg_10_0_0_0 (.out1(out_MUX_85_reg_10_0_0_0),
    .sel(selector_MUX_85_reg_10_0_0_0),
    .in1(out_ii_conv_conn_obj_4_IIdata_converter_FU_ii_conv_0),
    .in2(out_plus_expr_FU_32_0_32_63_i0_fu_icrc_constprop_0_33779_34039));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_91_reg_16_0_0_0 (.out1(out_MUX_91_reg_16_0_0_0),
    .sel(selector_MUX_91_reg_16_0_0_0),
    .in1(out_UUdata_converter_FU_53_i0_fu_icrc_constprop_0_33779_34103),
    .in2(out_conv_out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_2_10_16));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_91_reg_16_0_0_1 (.out1(out_MUX_91_reg_16_0_0_1),
    .sel(selector_MUX_91_reg_16_0_0_1),
    .in1(out_conv_out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_3_10_16),
    .in2(out_MUX_91_reg_16_0_0_0));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_92_reg_17_0_0_0 (.out1(out_MUX_92_reg_17_0_0_0),
    .sel(selector_MUX_92_reg_17_0_0_0),
    .in1(out_ui_plus_expr_FU_16_0_16_74_i0_fu_icrc_constprop_0_33779_34102),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1));
  PROXY_CTRLN #(.BITSIZE_in1(16),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(11),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(5),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(16),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(11),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) PROXY_CTRLN_2_i0 (.out1({null_out_signal_PROXY_CTRLN_2_i0_out1_1,
      out_PROXY_CTRLN_2_i0_PROXY_CTRLN_2_i0}),
    .proxy_in1(proxy_in1_33865),
    .proxy_in2(proxy_in2_33865),
    .proxy_in3(proxy_in3_33865),
    .proxy_sel_LOAD(proxy_sel_LOAD_33865),
    .proxy_sel_STORE(proxy_sel_STORE_33865),
    .in1({16'b0000000000000000,
      out_uu_conv_conn_obj_5_UUdata_converter_FU_uu_conv_5}),
    .in2({11'b00000000000,
      out_MUX_24_PROXY_CTRLN_2_i0_1_0_0}),
    .in3({5'b00000,
      out_conv_out_const_5_6_5}),
    .in4({1'b0,
      out_const_7}),
    .sel_LOAD({1'b0,
      fuselector_PROXY_CTRLN_2_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_PROXY_CTRLN_2_i0_STORE}),
    .proxy_out1(proxy_out1_33865));
  PROXY_CTRLN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(11),
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
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(11),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) PROXY_CTRLN_3_i0 (.out1({null_out_signal_PROXY_CTRLN_3_i0_out1_1,
      null_out_signal_PROXY_CTRLN_3_i0_out1_0}),
    .proxy_in1(proxy_in1_33948),
    .proxy_in2(proxy_in2_33948),
    .proxy_in3(proxy_in3_33948),
    .proxy_sel_LOAD(proxy_sel_LOAD_33948),
    .proxy_sel_STORE(proxy_sel_STORE_33948),
    .in1({8'b00000000,
      out_uu_conv_conn_obj_6_UUdata_converter_FU_uu_conv_6}),
    .in2({11'b00000000000,
      out_conv_out_reg_14_reg_14_10_11}),
    .in3({5'b00000,
      out_const_4}),
    .in4({1'b0,
      out_const_7}),
    .sel_LOAD({1'b0,
      fuselector_PROXY_CTRLN_3_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_PROXY_CTRLN_3_i0_STORE}),
    .proxy_out1(proxy_out1_33948));
  PROXY_CTRLN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(11),
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
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(11),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) PROXY_CTRLN_4_i0 (.out1({null_out_signal_PROXY_CTRLN_4_i0_out1_1,
      out_PROXY_CTRLN_4_i0_PROXY_CTRLN_4_i0}),
    .proxy_in1(proxy_in1_34115),
    .proxy_in2(proxy_in2_34115),
    .proxy_in3(proxy_in3_34115),
    .proxy_sel_LOAD(proxy_sel_LOAD_34115),
    .proxy_sel_STORE(proxy_sel_STORE_34115),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({11'b00000000000,
      out_conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i0_fu_icrc_constprop_0_33779_34088_10_11}),
    .in3({5'b00000,
      out_const_4}),
    .in4({1'b0,
      out_const_7}),
    .sel_LOAD({1'b0,
      fuselector_PROXY_CTRLN_4_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_PROXY_CTRLN_4_i0_STORE}),
    .proxy_out1(proxy_out1_34115));
  UUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) UUdata_converter_FU_uu_conv_1 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_1),
    .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) UUdata_converter_FU_uu_conv_2 (.out1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_2),
    .in1(out_conv_out_reg_16_reg_16_16_10));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) UUdata_converter_FU_uu_conv_3 (.out1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_3),
    .in1(out_conv_out_const_7_1_10));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_4 (.out1(out_uu_conv_conn_obj_3_UUdata_converter_FU_uu_conv_4),
    .in1(out_conv_out_const_0_1_32));
  UUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) UUdata_converter_FU_uu_conv_5 (.out1(out_uu_conv_conn_obj_5_UUdata_converter_FU_uu_conv_5),
    .in1(out_reg_9_reg_9));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) UUdata_converter_FU_uu_conv_6 (.out1(out_uu_conv_conn_obj_6_UUdata_converter_FU_uu_conv_6),
    .in1(out_IUdata_converter_FU_40_i0_fu_icrc_constprop_0_33779_33954));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(11),
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
    .BITSIZE_S_addr_ram(11),
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
    .MEMORY_INIT_file("/root/PandA-bambu-2023.1/examples/crc/tutorial/array_ref_33978.mem"),
    .n_elements(16),
    .data_size(8),
    .address_space_begin(MEM_var_33978_33779),
    .address_space_rangesize(512),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(1),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(11),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) array_33978_0 (.out1({out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_33978_0,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_33978_0}),
    .Sout_Rdata_ram({null_out_signal_array_33978_0_Sout_Rdata_ram_1,
      null_out_signal_array_33978_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_33978_0_Sout_DataRdy_1,
      null_out_signal_array_33978_0_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_33978_0_proxy_out1_1,
      null_out_signal_array_33978_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({out_conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i2_fu_icrc_constprop_0_33779_34253_10_11,
      out_conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i1_fu_icrc_constprop_0_33779_34239_10_11}),
    .in3({out_const_4,
      out_const_4}),
    .in4({out_const_7,
      out_const_7}),
    .sel_LOAD({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD}),
    .sel_STORE({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
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
    .proxy_in2({11'b00000000000,
      11'b00000000000}),
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
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(10),
    .value(MEM_var_33838_33781)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(10),
    .value(MEM_var_33865_33781)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(10),
    .value(MEM_var_33948_33781)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(10),
    .value(MEM_var_33978_33779)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(11),
    .value(MEM_var_34115_33781)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(14),
    .value(14'b01000000100001)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(9),
    .value(9'b100000000)) const_9 (.out1(out_const_9));
  IIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) conv_in_port_jinit_I_16_I_1 (.out1(out_conv_in_port_jinit_I_16_I_1),
    .in1(in_port_jinit));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(6)) conv_in_port_len_32_6 (.out1(out_conv_in_port_len_32_6),
    .in1(in_port_len));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_33978_0_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_33978_0_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_33978_0));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_33978_0_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_33978_0_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_33978_0));
  UUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) conv_out_DPROXY_CTRLN_1_i0_DPROXY_CTRLN_1_i0_16_1 (.out1(out_conv_out_DPROXY_CTRLN_1_i0_DPROXY_CTRLN_1_i0_16_1),
    .in1(out_DPROXY_CTRLN_1_i0_DPROXY_CTRLN_1_i0));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(11)) conv_out_addr_expr_FU_7_i0_fu_icrc_constprop_0_33779_34204_10_11 (.out1(out_conv_out_addr_expr_FU_7_i0_fu_icrc_constprop_0_33779_34204_10_11),
    .in1(out_addr_expr_FU_7_i0_fu_icrc_constprop_0_33779_34204));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  IIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_I_1_I_32 (.out1(out_conv_out_const_0_I_1_I_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(32)) conv_out_const_11_10_32 (.out1(out_conv_out_const_11_10_32),
    .in1(out_const_11));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(32)) conv_out_const_12_10_32 (.out1(out_conv_out_const_12_10_32),
    .in1(out_const_12));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(32)) conv_out_const_13_10_32 (.out1(out_conv_out_const_13_10_32),
    .in1(out_const_13));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(32)) conv_out_const_14_10_32 (.out1(out_conv_out_const_14_10_32),
    .in1(out_const_14));
  UUdata_converter_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(32)) conv_out_const_15_11_32 (.out1(out_conv_out_const_15_11_32),
    .in1(out_const_15));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(5)) conv_out_const_5_6_5 (.out1(out_conv_out_const_5_6_5),
    .in1(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(10)) conv_out_const_7_1_10 (.out1(out_conv_out_const_7_1_10),
    .in1(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(11)) conv_out_reg_13_reg_13_10_11 (.out1(out_conv_out_reg_13_reg_13_10_11),
    .in1(out_reg_13_reg_13));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(11)) conv_out_reg_14_reg_14_10_11 (.out1(out_conv_out_reg_14_reg_14_10_11),
    .in1(out_reg_14_reg_14));
  UUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(10)) conv_out_reg_16_reg_16_16_10 (.out1(out_conv_out_reg_16_reg_16_16_10),
    .in1(out_reg_16_reg_16));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(11)) conv_out_reg_1_reg_1_10_11 (.out1(out_conv_out_reg_1_reg_1_10_11),
    .in1(out_reg_1_reg_1));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(11)) conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i0_fu_icrc_constprop_0_33779_34088_10_11 (.out1(out_conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i0_fu_icrc_constprop_0_33779_34088_10_11),
    .in1(out_ui_pointer_plus_expr_FU_16_16_16_76_i0_fu_icrc_constprop_0_33779_34088));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(11)) conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i1_fu_icrc_constprop_0_33779_34239_10_11 (.out1(out_conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i1_fu_icrc_constprop_0_33779_34239_10_11),
    .in1(out_ui_pointer_plus_expr_FU_16_16_16_76_i1_fu_icrc_constprop_0_33779_34239));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(11)) conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i2_fu_icrc_constprop_0_33779_34253_10_11 (.out1(out_conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i2_fu_icrc_constprop_0_33779_34253_10_11),
    .in1(out_ui_pointer_plus_expr_FU_16_16_16_76_i2_fu_icrc_constprop_0_33779_34253));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(11)) conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i5_fu_icrc_constprop_0_33779_34301_10_11 (.out1(out_conv_out_ui_pointer_plus_expr_FU_16_16_16_76_i5_fu_icrc_constprop_0_33779_34301_10_11),
    .in1(out_ui_pointer_plus_expr_FU_16_16_16_76_i5_fu_icrc_constprop_0_33779_34301));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(16)) conv_out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_2_10_16 (.out1(out_conv_out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_2_10_16),
    .in1(out_uu_conv_conn_obj_1_UUdata_converter_FU_uu_conv_2));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(16)) conv_out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_3_10_16 (.out1(out_conv_out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_3_10_16),
    .in1(out_uu_conv_conn_obj_2_UUdata_converter_FU_uu_conv_3));
  read_cond_FU #(.BITSIZE_in1(1)) fu_icrc_constprop_0_33779_33836 (.out1(out_read_cond_FU_20_i0_fu_icrc_constprop_0_33779_33836),
    .in1(out_ui_eq_expr_FU_1_0_1_67_i0_fu_icrc_constprop_0_33779_34312));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_icrc_constprop_0_33779_33884 (.out1(out_ui_plus_expr_FU_32_0_32_75_i0_fu_icrc_constprop_0_33779_33884),
    .in1(out_reg_8_reg_8),
    .in2(out_const_7));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(16),
    .BITSIZE_in3(16),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_33899 (.out1(out_ui_cond_expr_FU_16_16_16_16_66_i0_fu_icrc_constprop_0_33779_33899),
    .in1(out_ui_extract_bit_expr_FU_35_i0_fu_icrc_constprop_0_33779_34382),
    .in2(out_IUdata_converter_FU_34_i0_fu_icrc_constprop_0_33779_33925),
    .in3(out_ui_lshift_expr_FU_16_0_16_70_i0_fu_icrc_constprop_0_33779_33944));
  ui_lshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(4),
    .BITSIZE_out1(16),
    .PRECISION(16)) fu_icrc_constprop_0_33779_33914 (.out1(out_ui_lshift_expr_FU_16_0_16_69_i0_fu_icrc_constprop_0_33779_33914),
    .in1(out_UUdata_converter_FU_24_i0_fu_icrc_constprop_0_33779_33920),
    .in2(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_33920 (.out1(out_UUdata_converter_FU_24_i0_fu_icrc_constprop_0_33779_33920),
    .in1(out_reg_8_reg_8));
  IUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_33925 (.out1(out_IUdata_converter_FU_34_i0_fu_icrc_constprop_0_33779_33925),
    .in1(out_bit_xor_expr_FU_16_0_16_57_i0_fu_icrc_constprop_0_33779_33928));
  bit_xor_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(14),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_33928 (.out1(out_bit_xor_expr_FU_16_0_16_57_i0_fu_icrc_constprop_0_33779_33928),
    .in1(out_IIconvert_expr_FU_33_i0_fu_icrc_constprop_0_33779_33932),
    .in2(out_const_6));
  IIconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_33932 (.out1(out_IIconvert_expr_FU_33_i0_fu_icrc_constprop_0_33779_33932),
    .in1(out_lshift_expr_FU_16_0_16_59_i0_fu_icrc_constprop_0_33779_33935));
  lshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(2),
    .BITSIZE_out1(16),
    .PRECISION(32)) fu_icrc_constprop_0_33779_33935 (.out1(out_lshift_expr_FU_16_0_16_59_i0_fu_icrc_constprop_0_33779_33935),
    .in1(out_UIdata_converter_FU_32_i0_fu_icrc_constprop_0_33779_33941),
    .in2(out_const_2));
  UIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_33941 (.out1(out_UIdata_converter_FU_32_i0_fu_icrc_constprop_0_33779_33941),
    .in1(out_reg_9_reg_9));
  ui_lshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(16),
    .PRECISION(16)) fu_icrc_constprop_0_33779_33944 (.out1(out_ui_lshift_expr_FU_16_0_16_70_i0_fu_icrc_constprop_0_33779_33944),
    .in1(out_reg_9_reg_9),
    .in2(out_const_7));
  IUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_icrc_constprop_0_33779_33954 (.out1(out_IUdata_converter_FU_40_i0_fu_icrc_constprop_0_33779_33954),
    .in1(out_bit_ior_expr_FU_0_8_8_56_i0_fu_icrc_constprop_0_33779_33958));
  bit_ior_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8)) fu_icrc_constprop_0_33779_33958 (.out1(out_bit_ior_expr_FU_0_8_8_56_i0_fu_icrc_constprop_0_33779_33958),
    .in1(out_IIconvert_expr_FU_38_i0_fu_icrc_constprop_0_33779_33964),
    .in2(out_UIdata_converter_FU_39_i0_fu_icrc_constprop_0_33779_34023));
  IIconvert_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_icrc_constprop_0_33779_33964 (.out1(out_IIconvert_expr_FU_38_i0_fu_icrc_constprop_0_33779_33964),
    .in1(out_lshift_expr_FU_8_0_8_61_i0_fu_icrc_constprop_0_33779_33967));
  lshift_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(4),
    .BITSIZE_out1(8),
    .PRECISION(32)) fu_icrc_constprop_0_33779_33967 (.out1(out_lshift_expr_FU_8_0_8_61_i0_fu_icrc_constprop_0_33779_33967),
    .in1(out_UIdata_converter_FU_37_i0_fu_icrc_constprop_0_33779_33972),
    .in2(out_const_3));
  UIdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(5)) fu_icrc_constprop_0_33779_33972 (.out1(out_UIdata_converter_FU_37_i0_fu_icrc_constprop_0_33779_33972),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_33978_0_8_4));
  UIdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(5)) fu_icrc_constprop_0_33779_34016 (.out1(out_UIdata_converter_FU_25_i0_fu_icrc_constprop_0_33779_34016),
    .in1(out_ui_bit_and_expr_FU_8_0_8_64_i0_fu_icrc_constprop_0_33779_34020));
  ui_bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_icrc_constprop_0_33779_34020 (.out1(out_ui_bit_and_expr_FU_8_0_8_64_i0_fu_icrc_constprop_0_33779_34020),
    .in1(out_UUdata_converter_FU_24_i0_fu_icrc_constprop_0_33779_33920),
    .in2(out_const_10));
  UIdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(5)) fu_icrc_constprop_0_33779_34023 (.out1(out_UIdata_converter_FU_39_i0_fu_icrc_constprop_0_33779_34023),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_33978_0_8_4));
  UIdata_converter_FU #(.BITSIZE_in1(12),
    .BITSIZE_out1(13)) fu_icrc_constprop_0_33779_34029 (.out1(out_UIdata_converter_FU_27_i0_fu_icrc_constprop_0_33779_34029),
    .in1(out_ui_rshift_expr_FU_16_0_16_77_i0_fu_icrc_constprop_0_33779_34032));
  ui_rshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(4),
    .BITSIZE_out1(12),
    .PRECISION(16)) fu_icrc_constprop_0_33779_34032 (.out1(out_ui_rshift_expr_FU_16_0_16_77_i0_fu_icrc_constprop_0_33779_34032),
    .in1(out_UUdata_converter_FU_24_i0_fu_icrc_constprop_0_33779_33920),
    .in2(out_const_3));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_icrc_constprop_0_33779_34039 (.out1(out_plus_expr_FU_32_0_32_63_i0_fu_icrc_constprop_0_33779_34039),
    .in1(out_reg_10_reg_10),
    .in2(out_const_2));
  read_cond_FU #(.BITSIZE_in1(1)) fu_icrc_constprop_0_33779_34040 (.out1(out_read_cond_FU_36_i0_fu_icrc_constprop_0_33779_34040),
    .in1(out_ne_expr_FU_32_0_32_62_i0_fu_icrc_constprop_0_33779_34314));
  read_cond_FU #(.BITSIZE_in1(1)) fu_icrc_constprop_0_33779_34049 (.out1(out_read_cond_FU_41_i0_fu_icrc_constprop_0_33779_34049),
    .in1(out_reg_15_reg_15));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10),
    .LSB_PARAMETER(0)) fu_icrc_constprop_0_33779_34088 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_76_i0_fu_icrc_constprop_0_33779_34088),
    .in1(out_reg_6_reg_6),
    .in2(out_conv_out_reg_16_reg_16_16_10));
  ui_rshift_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(5),
    .BITSIZE_out1(8),
    .PRECISION(16)) fu_icrc_constprop_0_33779_34090 (.out1(out_ui_rshift_expr_FU_16_0_16_78_i0_fu_icrc_constprop_0_33779_34090),
    .in1(out_reg_0_reg_0),
    .in2(out_const_4));
  UUconvert_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_icrc_constprop_0_33779_34091 (.out1(out_UUconvert_expr_FU_45_i0_fu_icrc_constprop_0_33779_34091),
    .in1(out_ui_rshift_expr_FU_16_0_16_78_i0_fu_icrc_constprop_0_33779_34090));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(8),
    .BITSIZE_out1(8)) fu_icrc_constprop_0_33779_34092 (.out1(out_ui_bit_xor_expr_FU_8_8_8_65_i0_fu_icrc_constprop_0_33779_34092),
    .in1(out_reg_18_reg_18),
    .in2(out_PROXY_CTRLN_4_i0_PROXY_CTRLN_4_i0));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_constprop_0_33779_34093 (.out1(out_UIdata_converter_FU_46_i0_fu_icrc_constprop_0_33779_34093),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_65_i0_fu_icrc_constprop_0_33779_34092));
  UIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_34095 (.out1(out_UIdata_converter_FU_48_i0_fu_icrc_constprop_0_33779_34095),
    .in1(out_PROXY_CTRLN_2_i0_PROXY_CTRLN_2_i0));
  UUconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(8)) fu_icrc_constprop_0_33779_34096 (.out1(out_UUconvert_expr_FU_49_i0_fu_icrc_constprop_0_33779_34096),
    .in1(out_reg_0_reg_0));
  UIdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(9)) fu_icrc_constprop_0_33779_34097 (.out1(out_UIdata_converter_FU_50_i0_fu_icrc_constprop_0_33779_34097),
    .in1(out_UUconvert_expr_FU_49_i0_fu_icrc_constprop_0_33779_34096));
  lshift_expr_FU #(.BITSIZE_in1(9),
    .BITSIZE_in2(5),
    .BITSIZE_out1(16),
    .PRECISION(32)) fu_icrc_constprop_0_33779_34098 (.out1(out_lshift_expr_FU_16_0_16_60_i0_fu_icrc_constprop_0_33779_34098),
    .in1(out_UIdata_converter_FU_50_i0_fu_icrc_constprop_0_33779_34097),
    .in2(out_const_4));
  IIconvert_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_34099 (.out1(out_IIconvert_expr_FU_51_i0_fu_icrc_constprop_0_33779_34099),
    .in1(out_lshift_expr_FU_16_0_16_60_i0_fu_icrc_constprop_0_33779_34098));
  bit_xor_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_34100 (.out1(out_bit_xor_expr_FU_16_16_16_58_i0_fu_icrc_constprop_0_33779_34100),
    .in1(out_UIdata_converter_FU_48_i0_fu_icrc_constprop_0_33779_34095),
    .in2(out_reg_19_reg_19));
  IUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_34101 (.out1(out_IUdata_converter_FU_52_i0_fu_icrc_constprop_0_33779_34101),
    .in1(out_bit_xor_expr_FU_16_16_16_58_i0_fu_icrc_constprop_0_33779_34100));
  ui_plus_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_34102 (.out1(out_ui_plus_expr_FU_16_0_16_74_i0_fu_icrc_constprop_0_33779_34102),
    .in1(out_reg_17_reg_17),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_34103 (.out1(out_UUdata_converter_FU_53_i0_fu_icrc_constprop_0_33779_34103),
    .in1(out_ui_plus_expr_FU_16_0_16_74_i0_fu_icrc_constprop_0_33779_34102));
  read_cond_FU #(.BITSIZE_in1(1)) fu_icrc_constprop_0_33779_34104 (.out1(out_read_cond_FU_54_i0_fu_icrc_constprop_0_33779_34104),
    .in1(out_reg_20_reg_20));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(10)) fu_icrc_constprop_0_33779_34204 (.out1(out_addr_expr_FU_7_i0_fu_icrc_constprop_0_33779_34204),
    .in1(out_conv_out_const_11_10_32));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_icrc_constprop_0_33779_34208 (.out1(out_lut_expr_FU_16_i0_fu_icrc_constprop_0_33779_34208),
    .in1(out_const_7),
    .in2(out_extract_bit_expr_FU_15_i0_fu_icrc_constprop_0_33779_34372),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(10)) fu_icrc_constprop_0_33779_34211 (.out1(out_addr_expr_FU_8_i0_fu_icrc_constprop_0_33779_34211),
    .in1(out_conv_out_const_11_10_32));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) fu_icrc_constprop_0_33779_34224 (.out1(out_UUdata_converter_FU_11_i0_fu_icrc_constprop_0_33779_34224),
    .in1(out_addr_expr_FU_10_i0_fu_icrc_constprop_0_33779_34273));
  IUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(4)) fu_icrc_constprop_0_33779_34232 (.out1(out_IUdata_converter_FU_26_i0_fu_icrc_constprop_0_33779_34232),
    .in1(out_UIdata_converter_FU_25_i0_fu_icrc_constprop_0_33779_34016));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(4),
    .BITSIZE_out1(10),
    .LSB_PARAMETER(0)) fu_icrc_constprop_0_33779_34239 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_76_i1_fu_icrc_constprop_0_33779_34239),
    .in1(out_reg_2_reg_2),
    .in2(out_reg_11_reg_11));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) fu_icrc_constprop_0_33779_34244 (.out1(out_UUdata_converter_FU_13_i0_fu_icrc_constprop_0_33779_34244),
    .in1(out_addr_expr_FU_12_i0_fu_icrc_constprop_0_33779_34277));
  IUdata_converter_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(10)) fu_icrc_constprop_0_33779_34247 (.out1(out_IUdata_converter_FU_28_i0_fu_icrc_constprop_0_33779_34247),
    .in1(out_UIdata_converter_FU_27_i0_fu_icrc_constprop_0_33779_34029));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10),
    .LSB_PARAMETER(0)) fu_icrc_constprop_0_33779_34253 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_76_i2_fu_icrc_constprop_0_33779_34253),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_12_reg_12));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(10),
    .PRECISION(32)) fu_icrc_constprop_0_33779_34262 (.out1(out_ui_lshift_expr_FU_32_0_32_72_i0_fu_icrc_constprop_0_33779_34262),
    .in1(out_reg_8_reg_8),
    .in2(out_const_7));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(10)) fu_icrc_constprop_0_33779_34265 (.out1(out_addr_expr_FU_9_i0_fu_icrc_constprop_0_33779_34265),
    .in1(out_conv_out_const_12_10_32));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10),
    .LSB_PARAMETER(1)) fu_icrc_constprop_0_33779_34268 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_76_i3_fu_icrc_constprop_0_33779_34268),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_lshift_expr_FU_32_0_32_72_i0_fu_icrc_constprop_0_33779_34262));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(10)) fu_icrc_constprop_0_33779_34273 (.out1(out_addr_expr_FU_10_i0_fu_icrc_constprop_0_33779_34273),
    .in1(out_conv_out_const_14_10_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(10)) fu_icrc_constprop_0_33779_34277 (.out1(out_addr_expr_FU_12_i0_fu_icrc_constprop_0_33779_34277),
    .in1(out_conv_out_const_14_10_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(10)) fu_icrc_constprop_0_33779_34281 (.out1(out_addr_expr_FU_14_i0_fu_icrc_constprop_0_33779_34281),
    .in1(out_conv_out_const_13_10_32));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(32),
    .BITSIZE_out1(10),
    .LSB_PARAMETER(0)) fu_icrc_constprop_0_33779_34284 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_76_i4_fu_icrc_constprop_0_33779_34284),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_8_reg_8));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(10)) fu_icrc_constprop_0_33779_34288 (.out1(out_addr_expr_FU_17_i0_fu_icrc_constprop_0_33779_34288),
    .in1(out_conv_out_const_15_11_32));
  UUdata_converter_FU #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) fu_icrc_constprop_0_33779_34291 (.out1(out_UUdata_converter_FU_19_i0_fu_icrc_constprop_0_33779_34291),
    .in1(out_addr_expr_FU_18_i0_fu_icrc_constprop_0_33779_34306));
  IUdata_converter_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(8)) fu_icrc_constprop_0_33779_34294 (.out1(out_IUdata_converter_FU_47_i0_fu_icrc_constprop_0_33779_34294),
    .in1(out_UIdata_converter_FU_46_i0_fu_icrc_constprop_0_33779_34093));
  ui_lshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(1),
    .BITSIZE_out1(9),
    .PRECISION(64)) fu_icrc_constprop_0_33779_34298 (.out1(out_ui_lshift_expr_FU_16_0_16_71_i0_fu_icrc_constprop_0_33779_34298),
    .in1(out_IUdata_converter_FU_47_i0_fu_icrc_constprop_0_33779_34294),
    .in2(out_const_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(9),
    .BITSIZE_out1(10),
    .LSB_PARAMETER(1)) fu_icrc_constprop_0_33779_34301 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_76_i5_fu_icrc_constprop_0_33779_34301),
    .in1(out_reg_7_reg_7),
    .in2(out_ui_lshift_expr_FU_16_0_16_71_i0_fu_icrc_constprop_0_33779_34298));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(10)) fu_icrc_constprop_0_33779_34306 (.out1(out_addr_expr_FU_18_i0_fu_icrc_constprop_0_33779_34306),
    .in1(out_conv_out_const_12_10_32));
  ui_eq_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_icrc_constprop_0_33779_34312 (.out1(out_ui_eq_expr_FU_1_0_1_67_i0_fu_icrc_constprop_0_33779_34312),
    .in1(out_conv_out_DPROXY_CTRLN_1_i0_DPROXY_CTRLN_1_i0_16_1),
    .in2(out_const_0));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(1)) fu_icrc_constprop_0_33779_34314 (.out1(out_ne_expr_FU_32_0_32_62_i0_fu_icrc_constprop_0_33779_34314),
    .in1(out_plus_expr_FU_32_0_32_63_i0_fu_icrc_constprop_0_33779_34039),
    .in2(out_const_4));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(9),
    .BITSIZE_out1(1)) fu_icrc_constprop_0_33779_34316 (.out1(out_ui_ne_expr_FU_32_0_32_73_i0_fu_icrc_constprop_0_33779_34316),
    .in1(out_ui_plus_expr_FU_32_0_32_75_i0_fu_icrc_constprop_0_33779_33884),
    .in2(out_const_9));
  ui_le_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu_icrc_constprop_0_33779_34320 (.out1(out_ui_le_expr_FU_16_16_16_68_i0_fu_icrc_constprop_0_33779_34320),
    .in1(out_UUdata_converter_FU_53_i0_fu_icrc_constprop_0_33779_34103),
    .in2(out_conv_in_port_len_32_6));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(16),
    .BITSIZE_out1(16)) fu_icrc_constprop_0_33779_34353 (.out1(out_ui_cond_expr_FU_16_16_16_16_66_i1_fu_icrc_constprop_0_33779_34353),
    .in1(out_lut_expr_FU_16_i0_fu_icrc_constprop_0_33779_34208),
    .in2(out_const_0),
    .in3(in_port_crc));
  extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_icrc_constprop_0_33779_34372 (.out1(out_extract_bit_expr_FU_15_i0_fu_icrc_constprop_0_33779_34372),
    .in1(out_conv_in_port_jinit_I_16_I_1),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(4)) fu_icrc_constprop_0_33779_34382 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu_icrc_constprop_0_33779_34382),
    .in1(out_reg_9_reg_9),
    .in2(out_const_10));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_83_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_8_i0_fu_icrc_constprop_0_33779_34211),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_85_reg_10_0_0_0),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_26_i0_fu_icrc_constprop_0_33779_34232),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_28_i0_fu_icrc_constprop_0_33779_34247),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_16_16_16_76_i3_fu_icrc_constprop_0_33779_34268),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_16_16_16_76_i4_fu_icrc_constprop_0_33779_34284),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_73_i0_fu_icrc_constprop_0_33779_34316),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_91_reg_16_0_0_1),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_92_reg_17_0_0_0),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_UUconvert_expr_FU_45_i0_fu_icrc_constprop_0_33779_34091),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_IIconvert_expr_FU_51_i0_fu_icrc_constprop_0_33779_34099),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_11_i0_fu_icrc_constprop_0_33779_34224),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_le_expr_FU_16_16_16_68_i0_fu_icrc_constprop_0_33779_34320),
    .wenable(wrenable_reg_20));
  register_STD #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_52_i0_fu_icrc_constprop_0_33779_34101),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_13_i0_fu_icrc_constprop_0_33779_34244),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_9_i0_fu_icrc_constprop_0_33779_34265),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_14_i0_fu_icrc_constprop_0_33779_34281),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_17_i0_fu_icrc_constprop_0_33779_34288),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_19_i0_fu_icrc_constprop_0_33779_34291),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_103_reg_8_0_0_0),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_104_reg_9_0_0_0),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_reg_21_reg_21;
  assign OUT_CONDITION_icrc_constprop_0_33779_33836 = out_read_cond_FU_20_i0_fu_icrc_constprop_0_33779_33836;
  assign OUT_CONDITION_icrc_constprop_0_33779_34040 = out_read_cond_FU_36_i0_fu_icrc_constprop_0_33779_34040;
  assign OUT_CONDITION_icrc_constprop_0_33779_34049 = out_read_cond_FU_41_i0_fu_icrc_constprop_0_33779_34049;
  assign OUT_CONDITION_icrc_constprop_0_33779_34104 = out_read_cond_FU_54_i0_fu_icrc_constprop_0_33779_34104;

endmodule

// FSM based controller description for icrc_constprop_0
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_icrc_constprop_0(done_port,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE,
  fuselector_DPROXY_CTRLN_1_i0_LOAD,
  fuselector_DPROXY_CTRLN_1_i0_STORE,
  selector_MUX_103_reg_8_0_0_0,
  selector_MUX_104_reg_9_0_0_0,
  selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0,
  selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0,
  selector_MUX_83_reg_0_0_0_0,
  selector_MUX_85_reg_10_0_0_0,
  selector_MUX_91_reg_16_0_0_0,
  selector_MUX_91_reg_16_0_0_1,
  selector_MUX_92_reg_17_0_0_0,
  fuselector_PROXY_CTRLN_2_i0_LOAD,
  fuselector_PROXY_CTRLN_2_i0_STORE,
  fuselector_PROXY_CTRLN_3_i0_LOAD,
  fuselector_PROXY_CTRLN_3_i0_STORE,
  fuselector_PROXY_CTRLN_4_i0_LOAD,
  fuselector_PROXY_CTRLN_4_i0_STORE,
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
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_icrc_constprop_0_33779_33836,
  OUT_CONDITION_icrc_constprop_0_33779_34040,
  OUT_CONDITION_icrc_constprop_0_33779_34049,
  OUT_CONDITION_icrc_constprop_0_33779_34104,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_icrc_constprop_0_33779_33836;
  input OUT_CONDITION_icrc_constprop_0_33779_34040;
  input OUT_CONDITION_icrc_constprop_0_33779_34049;
  input OUT_CONDITION_icrc_constprop_0_33779_34104;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE;
  output fuselector_DPROXY_CTRLN_1_i0_LOAD;
  output fuselector_DPROXY_CTRLN_1_i0_STORE;
  output selector_MUX_103_reg_8_0_0_0;
  output selector_MUX_104_reg_9_0_0_0;
  output selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0;
  output selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0;
  output selector_MUX_83_reg_0_0_0_0;
  output selector_MUX_85_reg_10_0_0_0;
  output selector_MUX_91_reg_16_0_0_0;
  output selector_MUX_91_reg_16_0_0_1;
  output selector_MUX_92_reg_17_0_0_0;
  output fuselector_PROXY_CTRLN_2_i0_LOAD;
  output fuselector_PROXY_CTRLN_2_i0_STORE;
  output fuselector_PROXY_CTRLN_3_i0_LOAD;
  output fuselector_PROXY_CTRLN_3_i0_STORE;
  output fuselector_PROXY_CTRLN_4_i0_LOAD;
  output fuselector_PROXY_CTRLN_4_i0_STORE;
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
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [9:0] S_0 = 10'b0000000001,
    S_1 = 10'b0000000010,
    S_2 = 10'b0000000100,
    S_3 = 10'b0000001000,
    S_4 = 10'b0000010000,
    S_5 = 10'b0000100000,
    S_6 = 10'b0001000000,
    S_7 = 10'b0010000000,
    S_8 = 10'b0100000000,
    S_9 = 10'b1000000000;
  reg [9:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE;
  reg fuselector_DPROXY_CTRLN_1_i0_LOAD;
  reg fuselector_DPROXY_CTRLN_1_i0_STORE;
  reg selector_MUX_103_reg_8_0_0_0;
  reg selector_MUX_104_reg_9_0_0_0;
  reg selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0;
  reg selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0;
  reg selector_MUX_83_reg_0_0_0_0;
  reg selector_MUX_85_reg_10_0_0_0;
  reg selector_MUX_91_reg_16_0_0_0;
  reg selector_MUX_91_reg_16_0_0_1;
  reg selector_MUX_92_reg_17_0_0_0;
  reg fuselector_PROXY_CTRLN_2_i0_LOAD;
  reg fuselector_PROXY_CTRLN_2_i0_STORE;
  reg fuselector_PROXY_CTRLN_3_i0_LOAD;
  reg fuselector_PROXY_CTRLN_3_i0_STORE;
  reg fuselector_PROXY_CTRLN_4_i0_LOAD;
  reg fuselector_PROXY_CTRLN_4_i0_STORE;
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
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE = 1'b0;
    fuselector_DPROXY_CTRLN_1_i0_LOAD = 1'b0;
    fuselector_DPROXY_CTRLN_1_i0_STORE = 1'b0;
    selector_MUX_103_reg_8_0_0_0 = 1'b0;
    selector_MUX_104_reg_9_0_0_0 = 1'b0;
    selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0 = 1'b0;
    selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0 = 1'b0;
    selector_MUX_83_reg_0_0_0_0 = 1'b0;
    selector_MUX_85_reg_10_0_0_0 = 1'b0;
    selector_MUX_91_reg_16_0_0_0 = 1'b0;
    selector_MUX_91_reg_16_0_0_1 = 1'b0;
    selector_MUX_92_reg_17_0_0_0 = 1'b0;
    fuselector_PROXY_CTRLN_2_i0_LOAD = 1'b0;
    fuselector_PROXY_CTRLN_2_i0_STORE = 1'b0;
    fuselector_PROXY_CTRLN_3_i0_LOAD = 1'b0;
    fuselector_PROXY_CTRLN_3_i0_STORE = 1'b0;
    fuselector_PROXY_CTRLN_4_i0_LOAD = 1'b0;
    fuselector_PROXY_CTRLN_4_i0_STORE = 1'b0;
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
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          fuselector_DPROXY_CTRLN_1_i0_LOAD = 1'b1;
          selector_MUX_91_reg_16_0_0_1 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          if (OUT_CONDITION_icrc_constprop_0_33779_33836 == 1'b1)
            begin
              _next_state = S_2;
              selector_MUX_91_reg_16_0_0_1 = 1'b0;
              wrenable_reg_16 = 1'b0;
              wrenable_reg_17 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
              wrenable_reg_1 = 1'b0;
              wrenable_reg_2 = 1'b0;
              wrenable_reg_3 = 1'b0;
              wrenable_reg_4 = 1'b0;
              wrenable_reg_5 = 1'b0;
            end
        end
      S_2 :
        begin
          fuselector_DPROXY_CTRLN_1_i0_STORE = 1'b1;
          selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0 = 1'b1;
          wrenable_reg_8 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          selector_MUX_103_reg_8_0_0_0 = 1'b1;
          selector_MUX_85_reg_10_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          selector_MUX_104_reg_9_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION_icrc_constprop_0_33779_34040 == 1'b1)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_5;
              wrenable_reg_10 = 1'b0;
            end
        end
      S_5 :
        begin
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD = 1'b1;
          selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0 = 1'b1;
          selector_MUX_91_reg_16_0_0_1 = 1'b1;
          fuselector_PROXY_CTRLN_2_i0_STORE = 1'b1;
          fuselector_PROXY_CTRLN_3_i0_STORE = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          if (OUT_CONDITION_icrc_constprop_0_33779_34049 == 1'b1)
            begin
              _next_state = S_3;
              selector_MUX_91_reg_16_0_0_1 = 1'b0;
              wrenable_reg_16 = 1'b0;
              wrenable_reg_17 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
            end
        end
      S_6 :
        begin
          selector_MUX_91_reg_16_0_0_0 = 1'b1;
          selector_MUX_92_reg_17_0_0_0 = 1'b1;
          fuselector_PROXY_CTRLN_4_i0_LOAD = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          _next_state = S_7;
        end
      S_7 :
        begin
          fuselector_PROXY_CTRLN_2_i0_LOAD = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          selector_MUX_83_reg_0_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_21 = 1'b1;
          if (OUT_CONDITION_icrc_constprop_0_33779_34104 == 1'b1)
            begin
              _next_state = S_6;
              wrenable_reg_21 = 1'b0;
            end
          else
            begin
              _next_state = S_9;
              done_port = 1'b1;
              selector_MUX_83_reg_0_0_0_0 = 1'b0;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_16 = 1'b0;
            end
        end
      S_9 :
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

// Top component for icrc_constprop_0
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module icrc_constprop_0(clock,
  reset,
  start_port,
  done_port,
  crc,
  len,
  jinit,
  return_port,
  proxy_out1_33838,
  proxy_out1_33865,
  proxy_out1_33948,
  proxy_out1_34115,
  proxy_in1_33838,
  proxy_in2_33838,
  proxy_in3_33838,
  proxy_sel_LOAD_33838,
  proxy_sel_STORE_33838,
  proxy_in1_33865,
  proxy_in2_33865,
  proxy_in3_33865,
  proxy_sel_LOAD_33865,
  proxy_sel_STORE_33865,
  proxy_in1_33948,
  proxy_in2_33948,
  proxy_in3_33948,
  proxy_sel_LOAD_33948,
  proxy_sel_STORE_33948,
  proxy_in1_34115,
  proxy_in2_34115,
  proxy_in3_34115,
  proxy_sel_LOAD_34115,
  proxy_sel_STORE_34115);
  parameter MEM_var_33838_33781=512,
    MEM_var_33865_33781=512,
    MEM_var_33948_33781=512,
    MEM_var_33978_33779=512,
    MEM_var_34115_33781=512;
  // IN
  input clock;
  input reset;
  input start_port;
  input [15:0] crc;
  input [31:0] len;
  input signed [15:0] jinit;
  input [31:0] proxy_out1_33838;
  input [31:0] proxy_out1_33865;
  input [31:0] proxy_out1_33948;
  input [31:0] proxy_out1_34115;
  // OUT
  output done_port;
  output [15:0] return_port;
  output [31:0] proxy_in1_33838;
  output [21:0] proxy_in2_33838;
  output [9:0] proxy_in3_33838;
  output [1:0] proxy_sel_LOAD_33838;
  output [1:0] proxy_sel_STORE_33838;
  output [31:0] proxy_in1_33865;
  output [21:0] proxy_in2_33865;
  output [9:0] proxy_in3_33865;
  output [1:0] proxy_sel_LOAD_33865;
  output [1:0] proxy_sel_STORE_33865;
  output [31:0] proxy_in1_33948;
  output [21:0] proxy_in2_33948;
  output [9:0] proxy_in3_33948;
  output [1:0] proxy_sel_LOAD_33948;
  output [1:0] proxy_sel_STORE_33948;
  output [31:0] proxy_in1_34115;
  output [21:0] proxy_in2_34115;
  output [9:0] proxy_in3_34115;
  output [1:0] proxy_sel_LOAD_34115;
  output [1:0] proxy_sel_STORE_34115;
  // Component and signal declarations
  wire OUT_CONDITION_icrc_constprop_0_33779_33836;
  wire OUT_CONDITION_icrc_constprop_0_33779_34040;
  wire OUT_CONDITION_icrc_constprop_0_33779_34049;
  wire OUT_CONDITION_icrc_constprop_0_33779_34104;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE;
  wire fuselector_DPROXY_CTRLN_1_i0_LOAD;
  wire fuselector_DPROXY_CTRLN_1_i0_STORE;
  wire fuselector_PROXY_CTRLN_2_i0_LOAD;
  wire fuselector_PROXY_CTRLN_2_i0_STORE;
  wire fuselector_PROXY_CTRLN_3_i0_LOAD;
  wire fuselector_PROXY_CTRLN_3_i0_STORE;
  wire fuselector_PROXY_CTRLN_4_i0_LOAD;
  wire fuselector_PROXY_CTRLN_4_i0_STORE;
  wire [15:0] in_port_crc_SIGI1;
  wire [15:0] in_port_crc_SIGI2;
  wire signed [15:0] in_port_jinit_SIGI1;
  wire [15:0] in_port_jinit_SIGI2;
  wire [31:0] in_port_len_SIGI1;
  wire [31:0] in_port_len_SIGI2;
  wire selector_MUX_103_reg_8_0_0_0;
  wire selector_MUX_104_reg_9_0_0_0;
  wire selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0;
  wire selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0;
  wire selector_MUX_83_reg_0_0_0_0;
  wire selector_MUX_85_reg_10_0_0_0;
  wire selector_MUX_91_reg_16_0_0_0;
  wire selector_MUX_91_reg_16_0_0_1;
  wire selector_MUX_92_reg_17_0_0_0;
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
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_icrc_constprop_0 Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE),
    .fuselector_DPROXY_CTRLN_1_i0_LOAD(fuselector_DPROXY_CTRLN_1_i0_LOAD),
    .fuselector_DPROXY_CTRLN_1_i0_STORE(fuselector_DPROXY_CTRLN_1_i0_STORE),
    .selector_MUX_103_reg_8_0_0_0(selector_MUX_103_reg_8_0_0_0),
    .selector_MUX_104_reg_9_0_0_0(selector_MUX_104_reg_9_0_0_0),
    .selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0(selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0),
    .selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0(selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0),
    .selector_MUX_83_reg_0_0_0_0(selector_MUX_83_reg_0_0_0_0),
    .selector_MUX_85_reg_10_0_0_0(selector_MUX_85_reg_10_0_0_0),
    .selector_MUX_91_reg_16_0_0_0(selector_MUX_91_reg_16_0_0_0),
    .selector_MUX_91_reg_16_0_0_1(selector_MUX_91_reg_16_0_0_1),
    .selector_MUX_92_reg_17_0_0_0(selector_MUX_92_reg_17_0_0_0),
    .fuselector_PROXY_CTRLN_2_i0_LOAD(fuselector_PROXY_CTRLN_2_i0_LOAD),
    .fuselector_PROXY_CTRLN_2_i0_STORE(fuselector_PROXY_CTRLN_2_i0_STORE),
    .fuselector_PROXY_CTRLN_3_i0_LOAD(fuselector_PROXY_CTRLN_3_i0_LOAD),
    .fuselector_PROXY_CTRLN_3_i0_STORE(fuselector_PROXY_CTRLN_3_i0_STORE),
    .fuselector_PROXY_CTRLN_4_i0_LOAD(fuselector_PROXY_CTRLN_4_i0_LOAD),
    .fuselector_PROXY_CTRLN_4_i0_STORE(fuselector_PROXY_CTRLN_4_i0_STORE),
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
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_icrc_constprop_0_33779_33836(OUT_CONDITION_icrc_constprop_0_33779_33836),
    .OUT_CONDITION_icrc_constprop_0_33779_34040(OUT_CONDITION_icrc_constprop_0_33779_34040),
    .OUT_CONDITION_icrc_constprop_0_33779_34049(OUT_CONDITION_icrc_constprop_0_33779_34049),
    .OUT_CONDITION_icrc_constprop_0_33779_34104(OUT_CONDITION_icrc_constprop_0_33779_34104),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_icrc_constprop_0 #(.MEM_var_33838_33781(MEM_var_33838_33781),
    .MEM_var_33865_33781(MEM_var_33865_33781),
    .MEM_var_33948_33781(MEM_var_33948_33781),
    .MEM_var_33978_33779(MEM_var_33978_33779),
    .MEM_var_34115_33781(MEM_var_34115_33781)) Datapath_i (.return_port(return_port),
    .proxy_in1_33838(proxy_in1_33838),
    .proxy_in2_33838(proxy_in2_33838),
    .proxy_in3_33838(proxy_in3_33838),
    .proxy_sel_LOAD_33838(proxy_sel_LOAD_33838),
    .proxy_sel_STORE_33838(proxy_sel_STORE_33838),
    .proxy_in1_33865(proxy_in1_33865),
    .proxy_in2_33865(proxy_in2_33865),
    .proxy_in3_33865(proxy_in3_33865),
    .proxy_sel_LOAD_33865(proxy_sel_LOAD_33865),
    .proxy_sel_STORE_33865(proxy_sel_STORE_33865),
    .proxy_in1_33948(proxy_in1_33948),
    .proxy_in2_33948(proxy_in2_33948),
    .proxy_in3_33948(proxy_in3_33948),
    .proxy_sel_LOAD_33948(proxy_sel_LOAD_33948),
    .proxy_sel_STORE_33948(proxy_sel_STORE_33948),
    .proxy_in1_34115(proxy_in1_34115),
    .proxy_in2_34115(proxy_in2_34115),
    .proxy_in3_34115(proxy_in3_34115),
    .proxy_sel_LOAD_34115(proxy_sel_LOAD_34115),
    .proxy_sel_STORE_34115(proxy_sel_STORE_34115),
    .OUT_CONDITION_icrc_constprop_0_33779_33836(OUT_CONDITION_icrc_constprop_0_33779_33836),
    .OUT_CONDITION_icrc_constprop_0_33779_34040(OUT_CONDITION_icrc_constprop_0_33779_34040),
    .OUT_CONDITION_icrc_constprop_0_33779_34049(OUT_CONDITION_icrc_constprop_0_33779_34049),
    .OUT_CONDITION_icrc_constprop_0_33779_34104(OUT_CONDITION_icrc_constprop_0_33779_34104),
    .clock(clock),
    .reset(reset),
    .in_port_crc(in_port_crc_SIGI2),
    .in_port_len(in_port_len_SIGI2),
    .in_port_jinit(in_port_jinit_SIGI2),
    .proxy_out1_33838(proxy_out1_33838),
    .proxy_out1_33865(proxy_out1_33865),
    .proxy_out1_33948(proxy_out1_33948),
    .proxy_out1_34115(proxy_out1_34115),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE),
    .fuselector_DPROXY_CTRLN_1_i0_LOAD(fuselector_DPROXY_CTRLN_1_i0_LOAD),
    .fuselector_DPROXY_CTRLN_1_i0_STORE(fuselector_DPROXY_CTRLN_1_i0_STORE),
    .selector_MUX_103_reg_8_0_0_0(selector_MUX_103_reg_8_0_0_0),
    .selector_MUX_104_reg_9_0_0_0(selector_MUX_104_reg_9_0_0_0),
    .selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0(selector_MUX_24_PROXY_CTRLN_2_i0_1_0_0),
    .selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0(selector_MUX_7_DPROXY_CTRLN_1_i0_1_0_0),
    .selector_MUX_83_reg_0_0_0_0(selector_MUX_83_reg_0_0_0_0),
    .selector_MUX_85_reg_10_0_0_0(selector_MUX_85_reg_10_0_0_0),
    .selector_MUX_91_reg_16_0_0_0(selector_MUX_91_reg_16_0_0_0),
    .selector_MUX_91_reg_16_0_0_1(selector_MUX_91_reg_16_0_0_1),
    .selector_MUX_92_reg_17_0_0_0(selector_MUX_92_reg_17_0_0_0),
    .fuselector_PROXY_CTRLN_2_i0_LOAD(fuselector_PROXY_CTRLN_2_i0_LOAD),
    .fuselector_PROXY_CTRLN_2_i0_STORE(fuselector_PROXY_CTRLN_2_i0_STORE),
    .fuselector_PROXY_CTRLN_3_i0_LOAD(fuselector_PROXY_CTRLN_3_i0_LOAD),
    .fuselector_PROXY_CTRLN_3_i0_STORE(fuselector_PROXY_CTRLN_3_i0_STORE),
    .fuselector_PROXY_CTRLN_4_i0_LOAD(fuselector_PROXY_CTRLN_4_i0_LOAD),
    .fuselector_PROXY_CTRLN_4_i0_STORE(fuselector_PROXY_CTRLN_4_i0_STORE),
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
  register_STD #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) in_port_crc_REG (.out1(in_port_crc_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_crc_SIGI1));
  register_STD #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) in_port_jinit_REG (.out1(in_port_jinit_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_jinit_SIGI1));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) in_port_len_REG (.out1(in_port_len_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_len_SIGI1));
  // io-signal post fix
  assign in_port_crc_SIGI1 = crc;
  assign in_port_len_SIGI1 = len;
  assign in_port_jinit_SIGI1 = jinit;
  assign done_port = done_delayed_REG_signal_out;

endmodule

// Datapath RTL description for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_main(clock,
  reset,
  return_port,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  S_data_ram_size,
  Sin_Rdata_ram,
  Sin_DataRdy,
  Sout_Rdata_ram,
  Sout_DataRdy,
  selector_IN_UNBOUNDED_main_33781_34160,
  selector_IN_UNBOUNDED_main_33781_34162,
  selector_MUX_4_icrc_constprop_0_11_i0_0_0_0,
  selector_MUX_5_icrc_constprop_0_11_i0_1_0_0,
  selector_MUX_6_icrc_constprop_0_11_i0_2_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  OUT_UNBOUNDED_main_33781_34160,
  OUT_UNBOUNDED_main_33781_34162);
  parameter MEM_var_33838_33781=512,
    MEM_var_33865_33781=512,
    MEM_var_33948_33781=512,
    MEM_var_33978_33779=512,
    MEM_var_34115_33781=512;
  // IN
  input clock;
  input reset;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [21:0] S_addr_ram;
  input [31:0] S_Wdata_ram;
  input [9:0] S_data_ram_size;
  input [31:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input selector_IN_UNBOUNDED_main_33781_34160;
  input selector_IN_UNBOUNDED_main_33781_34162;
  input selector_MUX_4_icrc_constprop_0_11_i0_0_0_0;
  input selector_MUX_5_icrc_constprop_0_11_i0_1_0_0;
  input selector_MUX_6_icrc_constprop_0_11_i0_2_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  // OUT
  output signed [31:0] return_port;
  output [31:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output OUT_UNBOUNDED_main_33781_34160;
  output OUT_UNBOUNDED_main_33781_34162;
  // Component and signal declarations
  wire null_out_signal_array_33838_0_Sout_DataRdy_0;
  wire null_out_signal_array_33838_0_Sout_DataRdy_1;
  wire [15:0] null_out_signal_array_33838_0_Sout_Rdata_ram_0;
  wire [15:0] null_out_signal_array_33838_0_Sout_Rdata_ram_1;
  wire [15:0] null_out_signal_array_33838_0_out1_0;
  wire [15:0] null_out_signal_array_33838_0_out1_1;
  wire null_out_signal_array_33865_0_Sout_DataRdy_0;
  wire null_out_signal_array_33865_0_Sout_DataRdy_1;
  wire [15:0] null_out_signal_array_33865_0_Sout_Rdata_ram_0;
  wire [15:0] null_out_signal_array_33865_0_Sout_Rdata_ram_1;
  wire [15:0] null_out_signal_array_33865_0_out1_0;
  wire [15:0] null_out_signal_array_33865_0_out1_1;
  wire null_out_signal_array_33948_0_Sout_DataRdy_0;
  wire null_out_signal_array_33948_0_Sout_DataRdy_1;
  wire [15:0] null_out_signal_array_33948_0_Sout_Rdata_ram_0;
  wire [15:0] null_out_signal_array_33948_0_Sout_Rdata_ram_1;
  wire [7:0] null_out_signal_array_33948_0_out1_0;
  wire [7:0] null_out_signal_array_33948_0_out1_1;
  wire [7:0] null_out_signal_array_34115_0_out1_0;
  wire [7:0] null_out_signal_array_34115_0_out1_1;
  wire [15:0] out_IUdata_converter_FU_7_i0_fu_main_33781_34329;
  wire [15:0] out_MUX_4_icrc_constprop_0_11_i0_0_0_0;
  wire [31:0] out_MUX_5_icrc_constprop_0_11_i0_1_0_0;
  wire [15:0] out_MUX_6_icrc_constprop_0_11_i0_2_0_0;
  wire signed [1:0] out_UIconvert_expr_FU_8_i0_fu_main_33781_34164;
  wire signed [16:0] out_UIdata_converter_FU_6_i0_fu_main_33781_34161;
  wire out_const_0;
  wire out_const_1;
  wire [8:0] out_const_2;
  wire [5:0] out_const_3;
  wire [5:0] out_const_4;
  wire signed [31:0] out_conv_out_UIconvert_expr_FU_8_i0_fu_main_33781_34164_I_2_I_32;
  wire [15:0] out_conv_out_const_0_1_16;
  wire signed [15:0] out_conv_out_const_0_I_1_I_16;
  wire signed [15:0] out_conv_out_const_1_I_1_I_16;
  wire [31:0] out_conv_out_const_3_6_32;
  wire [31:0] out_conv_out_const_4_6_32;
  wire [15:0] out_icrc_constprop_0_11_i0_icrc_constprop_0_11_i0;
  wire [15:0] out_reg_0_reg_0;
  wire [15:0] out_reg_1_reg_1;
  wire out_ui_ne_expr_FU_16_0_16_10_i0_fu_main_33781_34163;
  wire [31:0] proxy_out1_33838;
  wire [31:0] proxy_out1_33865;
  wire [31:0] proxy_out1_33948;
  wire [31:0] proxy_out1_34115;
  wire s_done_icrc_constprop_0_11_i0;
  wire s_icrc_constprop_0_11_i00;
  wire [31:0] sig_out_vector_bus_mergerproxy_in112_;
  wire [31:0] sig_out_vector_bus_mergerproxy_in117_;
  wire [31:0] sig_out_vector_bus_mergerproxy_in12_;
  wire [31:0] sig_out_vector_bus_mergerproxy_in17_;
  wire [21:0] sig_out_vector_bus_mergerproxy_in213_;
  wire [21:0] sig_out_vector_bus_mergerproxy_in218_;
  wire [21:0] sig_out_vector_bus_mergerproxy_in23_;
  wire [21:0] sig_out_vector_bus_mergerproxy_in28_;
  wire [9:0] sig_out_vector_bus_mergerproxy_in314_;
  wire [9:0] sig_out_vector_bus_mergerproxy_in319_;
  wire [9:0] sig_out_vector_bus_mergerproxy_in34_;
  wire [9:0] sig_out_vector_bus_mergerproxy_in39_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_LOAD10_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_LOAD15_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_LOAD20_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_LOAD5_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_STORE11_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_STORE16_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_STORE21_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_STORE6_;
  
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_4_icrc_constprop_0_11_i0_0_0_0 (.out1(out_MUX_4_icrc_constprop_0_11_i0_0_0_0),
    .sel(selector_MUX_4_icrc_constprop_0_11_i0_0_0_0),
    .in1(out_reg_1_reg_1),
    .in2(out_conv_out_const_0_1_16));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_5_icrc_constprop_0_11_i0_1_0_0 (.out1(out_MUX_5_icrc_constprop_0_11_i0_1_0_0),
    .sel(selector_MUX_5_icrc_constprop_0_11_i0_1_0_0),
    .in1(out_conv_out_const_3_6_32),
    .in2(out_conv_out_const_4_6_32));
  MUX_GATE #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) MUX_6_icrc_constprop_0_11_i0_2_0_0 (.out1(out_MUX_6_icrc_constprop_0_11_i0_2_0_0),
    .sel(selector_MUX_6_icrc_constprop_0_11_i0_2_0_0),
    .in1(out_conv_out_const_0_I_1_I_16),
    .in2(out_conv_out_const_1_I_1_I_16));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(16),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(11),
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
    .BITSIZE_S_addr_ram(11),
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
    .MEMORY_INIT_file("/root/PandA-bambu-2023.1/examples/crc/tutorial/array_ref_33838.mem"),
    .n_elements(1),
    .data_size(16),
    .address_space_begin(MEM_var_33838_33781),
    .address_space_rangesize(512),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(16),
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(11),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) array_33838_0 (.out1({null_out_signal_array_33838_0_out1_1,
      null_out_signal_array_33838_0_out1_0}),
    .Sout_Rdata_ram({null_out_signal_array_33838_0_Sout_Rdata_ram_1,
      null_out_signal_array_33838_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_33838_0_Sout_DataRdy_1,
      null_out_signal_array_33838_0_Sout_DataRdy_0}),
    .proxy_out1(proxy_out1_33838),
    .clock(clock),
    .reset(reset),
    .in1({16'b0000000000000000,
      16'b0000000000000000}),
    .in2({11'b00000000000,
      11'b00000000000}),
    .in3({5'b00000,
      5'b00000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .Sin_Rdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .S_data_ram_size({5'b00000,
      5'b00000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in12_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in23_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in34_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD5_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE6_));
  ARRAY_1D_STD_BRAM_NN_SDS #(.BITSIZE_in1(16),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(11),
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
    .BITSIZE_S_addr_ram(11),
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
    .MEMORY_INIT_file("/root/PandA-bambu-2023.1/examples/crc/tutorial/array_ref_33865.mem"),
    .n_elements(256),
    .data_size(16),
    .address_space_begin(MEM_var_33865_33781),
    .address_space_rangesize(512),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(16),
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(11),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) array_33865_0 (.out1({null_out_signal_array_33865_0_out1_1,
      null_out_signal_array_33865_0_out1_0}),
    .Sout_Rdata_ram({null_out_signal_array_33865_0_Sout_Rdata_ram_1,
      null_out_signal_array_33865_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_33865_0_Sout_DataRdy_1,
      null_out_signal_array_33865_0_Sout_DataRdy_0}),
    .proxy_out1(proxy_out1_33865),
    .clock(clock),
    .reset(reset),
    .in1({16'b0000000000000000,
      16'b0000000000000000}),
    .in2({11'b00000000000,
      11'b00000000000}),
    .in3({5'b00000,
      5'b00000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .Sin_Rdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .S_data_ram_size({5'b00000,
      5'b00000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in17_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in28_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in39_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD10_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE11_));
  ARRAY_1D_STD_BRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(11),
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
    .BITSIZE_S_addr_ram(11),
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
    .MEMORY_INIT_file("/root/PandA-bambu-2023.1/examples/crc/tutorial/array_ref_33948.mem"),
    .n_elements(256),
    .data_size(8),
    .address_space_begin(MEM_var_33948_33781),
    .address_space_rangesize(512),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(11),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) array_33948_0 (.out1({null_out_signal_array_33948_0_out1_1,
      null_out_signal_array_33948_0_out1_0}),
    .Sout_Rdata_ram({null_out_signal_array_33948_0_Sout_Rdata_ram_1,
      null_out_signal_array_33948_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_33948_0_Sout_DataRdy_1,
      null_out_signal_array_33948_0_Sout_DataRdy_0}),
    .proxy_out1(proxy_out1_33948),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({11'b00000000000,
      11'b00000000000}),
    .in3({5'b00000,
      5'b00000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .Sin_Rdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .S_data_ram_size({5'b00000,
      5'b00000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in112_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in213_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in314_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD15_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE16_));
  ARRAY_1D_STD_BRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(11),
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
    .BITSIZE_S_addr_ram(11),
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
    .MEMORY_INIT_file("/root/PandA-bambu-2023.1/examples/crc/tutorial/array_ref_34115.mem"),
    .n_elements(44),
    .data_size(8),
    .address_space_begin(MEM_var_34115_33781),
    .address_space_rangesize(512),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(0),
    .READ_ONLY_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(16),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(11),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(5),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(16),
    .PORTSIZE_proxy_out1(2)) array_34115_0 (.out1({null_out_signal_array_34115_0_out1_1,
      null_out_signal_array_34115_0_out1_0}),
    .Sout_Rdata_ram(Sout_Rdata_ram),
    .Sout_DataRdy(Sout_DataRdy),
    .proxy_out1(proxy_out1_34115),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({11'b00000000000,
      11'b00000000000}),
    .in3({5'b00000,
      5'b00000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in117_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in218_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in319_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD20_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE21_));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(9),
    .value(9'b100001100)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101000)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101010)) const_4 (.out1(out_const_4));
  IIdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(32)) conv_out_UIconvert_expr_FU_8_i0_fu_main_33781_34164_I_2_I_32 (.out1(out_conv_out_UIconvert_expr_FU_8_i0_fu_main_33781_34164_I_2_I_32),
    .in1(out_UIconvert_expr_FU_8_i0_fu_main_33781_34164));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(16)) conv_out_const_0_1_16 (.out1(out_conv_out_const_0_1_16),
    .in1(out_const_0));
  IIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(16)) conv_out_const_0_I_1_I_16 (.out1(out_conv_out_const_0_I_1_I_16),
    .in1(out_const_0));
  IIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(16)) conv_out_const_1_I_1_I_16 (.out1(out_conv_out_const_1_I_1_I_16),
    .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(32)) conv_out_const_3_6_32 (.out1(out_conv_out_const_3_6_32),
    .in1(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(32)) conv_out_const_4_6_32 (.out1(out_conv_out_const_4_6_32),
    .in1(out_const_4));
  UIdata_converter_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(17)) fu_main_33781_34161 (.out1(out_UIdata_converter_FU_6_i0_fu_main_33781_34161),
    .in1(out_reg_0_reg_0));
  ui_ne_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(9),
    .BITSIZE_out1(1)) fu_main_33781_34163 (.out1(out_ui_ne_expr_FU_16_0_16_10_i0_fu_main_33781_34163),
    .in1(out_reg_0_reg_0),
    .in2(out_const_2));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_main_33781_34164 (.out1(out_UIconvert_expr_FU_8_i0_fu_main_33781_34164),
    .in1(out_ui_ne_expr_FU_16_0_16_10_i0_fu_main_33781_34163));
  IUdata_converter_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(16)) fu_main_33781_34329 (.out1(out_IUdata_converter_FU_7_i0_fu_main_33781_34329),
    .in1(out_UIdata_converter_FU_6_i0_fu_main_33781_34161));
  icrc_constprop_0 #(.MEM_var_33838_33781(MEM_var_33838_33781),
    .MEM_var_33865_33781(MEM_var_33865_33781),
    .MEM_var_33948_33781(MEM_var_33948_33781),
    .MEM_var_33978_33779(MEM_var_33978_33779),
    .MEM_var_34115_33781(MEM_var_34115_33781)) icrc_constprop_0_11_i0 (.done_port(s_done_icrc_constprop_0_11_i0),
    .return_port(out_icrc_constprop_0_11_i0_icrc_constprop_0_11_i0),
    .proxy_in1_33838(sig_out_vector_bus_mergerproxy_in12_),
    .proxy_in2_33838(sig_out_vector_bus_mergerproxy_in23_),
    .proxy_in3_33838(sig_out_vector_bus_mergerproxy_in34_),
    .proxy_sel_LOAD_33838(sig_out_vector_bus_mergerproxy_sel_LOAD5_),
    .proxy_sel_STORE_33838(sig_out_vector_bus_mergerproxy_sel_STORE6_),
    .proxy_in1_33865(sig_out_vector_bus_mergerproxy_in17_),
    .proxy_in2_33865(sig_out_vector_bus_mergerproxy_in28_),
    .proxy_in3_33865(sig_out_vector_bus_mergerproxy_in39_),
    .proxy_sel_LOAD_33865(sig_out_vector_bus_mergerproxy_sel_LOAD10_),
    .proxy_sel_STORE_33865(sig_out_vector_bus_mergerproxy_sel_STORE11_),
    .proxy_in1_33948(sig_out_vector_bus_mergerproxy_in112_),
    .proxy_in2_33948(sig_out_vector_bus_mergerproxy_in213_),
    .proxy_in3_33948(sig_out_vector_bus_mergerproxy_in314_),
    .proxy_sel_LOAD_33948(sig_out_vector_bus_mergerproxy_sel_LOAD15_),
    .proxy_sel_STORE_33948(sig_out_vector_bus_mergerproxy_sel_STORE16_),
    .proxy_in1_34115(sig_out_vector_bus_mergerproxy_in117_),
    .proxy_in2_34115(sig_out_vector_bus_mergerproxy_in218_),
    .proxy_in3_34115(sig_out_vector_bus_mergerproxy_in319_),
    .proxy_sel_LOAD_34115(sig_out_vector_bus_mergerproxy_sel_LOAD20_),
    .proxy_sel_STORE_34115(sig_out_vector_bus_mergerproxy_sel_STORE21_),
    .clock(clock),
    .reset(reset),
    .start_port(s_icrc_constprop_0_11_i00),
    .crc(out_MUX_4_icrc_constprop_0_11_i0_0_0_0),
    .len(out_MUX_5_icrc_constprop_0_11_i0_1_0_0),
    .jinit(out_MUX_6_icrc_constprop_0_11_i0_2_0_0),
    .proxy_out1_33838(proxy_out1_33838),
    .proxy_out1_33865(proxy_out1_33865),
    .proxy_out1_33948(proxy_out1_33948),
    .proxy_out1_34115(proxy_out1_34115));
  or or_or_icrc_constprop_0_11_i00( s_icrc_constprop_0_11_i00, selector_IN_UNBOUNDED_main_33781_34160, selector_IN_UNBOUNDED_main_33781_34162);
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_icrc_constprop_0_11_i0_icrc_constprop_0_11_i0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(16),
    .BITSIZE_out1(16)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_7_i0_fu_main_33781_34329),
    .wenable(wrenable_reg_1));
  // io-signal post fix
  assign return_port = out_conv_out_UIconvert_expr_FU_8_i0_fu_main_33781_34164_I_2_I_32;
  assign OUT_UNBOUNDED_main_33781_34160 = s_done_icrc_constprop_0_11_i0;
  assign OUT_UNBOUNDED_main_33781_34162 = s_done_icrc_constprop_0_11_i0;

endmodule

// FSM based controller description for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_main(done_port,
  selector_IN_UNBOUNDED_main_33781_34160,
  selector_IN_UNBOUNDED_main_33781_34162,
  selector_MUX_4_icrc_constprop_0_11_i0_0_0_0,
  selector_MUX_5_icrc_constprop_0_11_i0_1_0_0,
  selector_MUX_6_icrc_constprop_0_11_i0_2_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  OUT_UNBOUNDED_main_33781_34160,
  OUT_UNBOUNDED_main_33781_34162,
  clock,
  reset,
  start_port);
  // IN
  input OUT_UNBOUNDED_main_33781_34160;
  input OUT_UNBOUNDED_main_33781_34162;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output selector_IN_UNBOUNDED_main_33781_34160;
  output selector_IN_UNBOUNDED_main_33781_34162;
  output selector_MUX_4_icrc_constprop_0_11_i0_0_0_0;
  output selector_MUX_5_icrc_constprop_0_11_i0_1_0_0;
  output selector_MUX_6_icrc_constprop_0_11_i0_2_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  parameter [5:0] S_0 = 6'b000001,
    S_1 = 6'b000010,
    S_2 = 6'b000100,
    S_3 = 6'b001000,
    S_4 = 6'b010000,
    S_5 = 6'b100000;
  reg [5:0] _present_state=S_0, _next_state;
  reg done_port;
  reg selector_IN_UNBOUNDED_main_33781_34160;
  reg selector_IN_UNBOUNDED_main_33781_34162;
  reg selector_MUX_4_icrc_constprop_0_11_i0_0_0_0;
  reg selector_MUX_5_icrc_constprop_0_11_i0_1_0_0;
  reg selector_MUX_6_icrc_constprop_0_11_i0_2_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    selector_IN_UNBOUNDED_main_33781_34160 = 1'b0;
    selector_IN_UNBOUNDED_main_33781_34162 = 1'b0;
    selector_MUX_4_icrc_constprop_0_11_i0_0_0_0 = 1'b0;
    selector_MUX_5_icrc_constprop_0_11_i0_1_0_0 = 1'b0;
    selector_MUX_6_icrc_constprop_0_11_i0_2_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_IN_UNBOUNDED_main_33781_34160 = 1'b1;
          selector_MUX_5_icrc_constprop_0_11_i0_1_0_0 = 1'b1;
          selector_MUX_6_icrc_constprop_0_11_i0_2_0_0 = 1'b1;
          wrenable_reg_0 = OUT_UNBOUNDED_main_33781_34160;
          if (OUT_UNBOUNDED_main_33781_34160 == 1'b0)
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
          selector_MUX_5_icrc_constprop_0_11_i0_1_0_0 = 1'b1;
          selector_MUX_6_icrc_constprop_0_11_i0_2_0_0 = 1'b1;
          wrenable_reg_0 = OUT_UNBOUNDED_main_33781_34160;
          if (OUT_UNBOUNDED_main_33781_34160 == 1'b0)
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
          wrenable_reg_1 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          selector_IN_UNBOUNDED_main_33781_34162 = 1'b1;
          selector_MUX_4_icrc_constprop_0_11_i0_0_0_0 = 1'b1;
          wrenable_reg_0 = OUT_UNBOUNDED_main_33781_34162;
          if (OUT_UNBOUNDED_main_33781_34162 == 1'b0)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_5;
              done_port = 1'b1;
            end
        end
      S_4 :
        begin
          selector_MUX_4_icrc_constprop_0_11_i0_0_0_0 = 1'b1;
          wrenable_reg_0 = OUT_UNBOUNDED_main_33781_34162;
          if (OUT_UNBOUNDED_main_33781_34162 == 1'b0)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_5;
              done_port = 1'b1;
            end
        end
      S_5 :
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

// Top component for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _main(clock,
  reset,
  start_port,
  done_port,
  return_port,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  S_data_ram_size,
  Sin_Rdata_ram,
  Sin_DataRdy,
  Sout_Rdata_ram,
  Sout_DataRdy);
  // IN
  input clock;
  input reset;
  input start_port;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [21:0] S_addr_ram;
  input [31:0] S_Wdata_ram;
  input [9:0] S_data_ram_size;
  input [31:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  // OUT
  output done_port;
  output signed [31:0] return_port;
  output [31:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  // Component and signal declarations
  wire OUT_UNBOUNDED_main_33781_34160;
  wire OUT_UNBOUNDED_main_33781_34162;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire selector_IN_UNBOUNDED_main_33781_34160;
  wire selector_IN_UNBOUNDED_main_33781_34162;
  wire selector_MUX_4_icrc_constprop_0_11_i0_0_0_0;
  wire selector_MUX_5_icrc_constprop_0_11_i0_1_0_0;
  wire selector_MUX_6_icrc_constprop_0_11_i0_2_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  
  controller_main Controller_i (.done_port(done_delayed_REG_signal_in),
    .selector_IN_UNBOUNDED_main_33781_34160(selector_IN_UNBOUNDED_main_33781_34160),
    .selector_IN_UNBOUNDED_main_33781_34162(selector_IN_UNBOUNDED_main_33781_34162),
    .selector_MUX_4_icrc_constprop_0_11_i0_0_0_0(selector_MUX_4_icrc_constprop_0_11_i0_0_0_0),
    .selector_MUX_5_icrc_constprop_0_11_i0_1_0_0(selector_MUX_5_icrc_constprop_0_11_i0_1_0_0),
    .selector_MUX_6_icrc_constprop_0_11_i0_2_0_0(selector_MUX_6_icrc_constprop_0_11_i0_2_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .OUT_UNBOUNDED_main_33781_34160(OUT_UNBOUNDED_main_33781_34160),
    .OUT_UNBOUNDED_main_33781_34162(OUT_UNBOUNDED_main_33781_34162),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_main #(.MEM_var_33838_33781(512),
    .MEM_var_33865_33781(512),
    .MEM_var_33948_33781(512),
    .MEM_var_33978_33779(512),
    .MEM_var_34115_33781(512)) Datapath_i (.return_port(return_port),
    .Sout_Rdata_ram(Sout_Rdata_ram),
    .Sout_DataRdy(Sout_DataRdy),
    .OUT_UNBOUNDED_main_33781_34160(OUT_UNBOUNDED_main_33781_34160),
    .OUT_UNBOUNDED_main_33781_34162(OUT_UNBOUNDED_main_33781_34162),
    .clock(clock),
    .reset(reset),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .Sin_DataRdy(Sin_DataRdy),
    .selector_IN_UNBOUNDED_main_33781_34160(selector_IN_UNBOUNDED_main_33781_34160),
    .selector_IN_UNBOUNDED_main_33781_34162(selector_IN_UNBOUNDED_main_33781_34162),
    .selector_MUX_4_icrc_constprop_0_11_i0_0_0_0(selector_MUX_4_icrc_constprop_0_11_i0_0_0_0),
    .selector_MUX_5_icrc_constprop_0_11_i0_1_0_0(selector_MUX_5_icrc_constprop_0_11_i0_1_0_0),
    .selector_MUX_6_icrc_constprop_0_11_i0_2_0_0(selector_MUX_6_icrc_constprop_0_11_i0_2_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1));
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
module view_convert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// Minimal interface for function: main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module main(clock,
  reset,
  start_port,
  done_port,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire null_out_signal__main_i0_Sout_DataRdy_0;
  wire null_out_signal__main_i0_Sout_DataRdy_1;
  wire [15:0] null_out_signal__main_i0_Sout_Rdata_ram_0;
  wire [15:0] null_out_signal__main_i0_Sout_Rdata_ram_1;
  wire signed [31:0] out_return_port_view_convert_expr_FU;
  
  _main _main_i0 (.done_port(done_port),
    .return_port(out_return_port_view_convert_expr_FU),
    .Sout_Rdata_ram({null_out_signal__main_i0_Sout_Rdata_ram_1,
      null_out_signal__main_i0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal__main_i0_Sout_DataRdy_1,
      null_out_signal__main_i0_Sout_DataRdy_0}),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .S_data_ram_size({5'b00000,
      5'b00000}),
    .Sin_Rdata_ram({16'b0000000000000000,
      16'b0000000000000000}),
    .Sin_DataRdy({1'b0,
      1'b0}));
  view_convert_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) return_port_view_convert_expr_FU (.out1(return_port),
    .in1(out_return_port_view_convert_expr_FU));

endmodule


