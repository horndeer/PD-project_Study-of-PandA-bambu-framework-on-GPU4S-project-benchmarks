// verilator lint_off BLKANDNBLK
// verilator lint_off BLKSEQ
`timescale 1ns / 1ps
// CONSTANTS DECLARATION
`define EOF 32'hFFFF_FFFF
`define NULL 0
`define MAX_COMMENT_LENGTH 1000
`define SIMULATION_LENGTH 200000000
`define INIT_TIME  100

`define HALF_CLOCK_PERIOD 1

`define CLOCK_PERIOD (2*`HALF_CLOCK_PERIOD)

`define MEM_DELAY_READ 2

`define MEM_MAX_DELAY 2

`define MEM_DELAY_WRITE 1

// MODULE DECLARATION
module icrc_tb(clock);

  function real bits32_to_real64;
    input [31:0] in1;
    reg [7:0] exponent1;
    reg is_exp_zero;
    reg is_all_ones;
    reg [10:0] exp_tmp;
    reg [63:0] out1;
  begin
    exponent1 = in1[30:23];
    is_exp_zero = exponent1 == 8'd0;
    is_all_ones = exponent1 == {8{1'b1}};
    exp_tmp = {3'd0, exponent1} + 11'd896;
    out1[63] = in1[31];
    out1[62:52] = is_exp_zero ? 11'd0 : (is_all_ones ? {11{1'b1}} : exp_tmp);
    out1[51:29] = in1[22:0];
    out1[28:0] = 29'd0;
    bits32_to_real64 = $bitstoreal(out1);
  end
  endfunction
  function real compute_ulp32;
    input [31:0] computed;
    input [31:0] expected;
    real computedR;
    real expectedR;
    real diffR;
    reg [31:0] denom;
    real denomR;
  begin
    if (expected[30:23] == {8{1'b1}} ||computed[30:23] == {8{1'b1}})
      compute_ulp32 = computed != expected && (computed[22:0] == 23'd0 || expected[22:0] == 23'd0) ? {1'b0,({8{1'b1}}-8'd1),{23'b1} } : 32'd0;
    else
    begin
      denom = 32'd0;
      if (expected[30:0] == 31'd0)
        denom[30:23] = 8'd104;
      else
        denom[30:23] = expected[30:23]-8'd23;
      computedR = bits32_to_real64({1'b0, computed[30:0]});
      expectedR = bits32_to_real64({1'b0, expected[30:0]});
      denomR = bits32_to_real64(denom);
      diffR = computedR - expectedR;
      if(diffR < 0.0)
        diffR = - diffR;
      if (expected[30:0] == 31'd0 && computed[30:0] == 31'd0  && expected[31] != computed[31] )
        compute_ulp32 = 1.0;
      else
        compute_ulp32 = diffR / denomR;
    end
  end
  endfunction
  
  function real compute_ulp64;
    input [63:0] computed;
    input [63:0] expected;
    real computedR;
    real expectedR;
    real diffR;
    reg [63:0] denom;
    real denomR;
  begin
    if (expected[62:52] == {11{1'b1}} ||computed[62:52] == {11{1'b1}})
      compute_ulp64 = computed != expected && (computed[51:0] == 52'd0 || expected[51:0] == 52'd0) ? {1'b0,({11{1'b1}}-11'd1),{52'b1} } : 64'd0;
    else
    begin
      denom = 64'd0;
      if (expected[62:0] == 63'd0)
        denom[62:52] = 11'd971;
      else
        denom[62:52] = expected[62:52]-11'd52;
      computedR = $bitstoreal({1'b0, computed[62:0]});
      expectedR = $bitstoreal({1'b0, expected[62:0]});
      denomR = $bitstoreal(denom);
      diffR = computedR - expectedR;
      if(diffR < 0.0)
        diffR = - diffR;
      if (expected[62:0] == 63'd0 && computed[62:0] == 63'd0  && expected[63] != computed[63] )
        compute_ulp64 = 1.0;
      else
        compute_ulp64 = diffR / denomR;
    end
  end
  endfunction
  parameter MEMSIZE = 1024;
  // AUXILIARY VARIABLES DECLARATION
  time startTime, endTime, sim_time;
  integer res_file, file, _r_, _n_, _i_, _addr_i_;
  integer _ch_;
  reg compare_outputs, success; // Flag: True if input vector specifies expected outputs
  reg [8*`MAX_COMMENT_LENGTH:0] line; // Comment line read from file
  
  reg [31:0] addr, base_addr;
  reg [7:0] _bambu_testbench_mem_ [0:MEMSIZE-1];
  
  reg [7:0] _bambu_databyte_;
  
  reg [3:0] __state, __next_state;
  reg start_results_comparison;
  reg next_start_port;
  integer currTime;
  // INPUT SIGNALS
  input clock;
  reg reset;
  reg start_port;
  reg [15:0] crc;
  reg [31:0] lin;
  reg [7:0] ex_lin;
  reg [31:0] len;
  reg [15:0] jinit;
  reg [31:0] jrev;
  wire [31:0] M_Rdata_ram;
  wire [1:0] M_DataRdy;
  
  reg start_next_sim;
  // OUTPUT SIGNALS
  wire done_port;
  wire [15:0] return_port;
  reg [15:0] ex_return_port;
  reg [15:0] registered_return_port;
  wire [1:0] Mout_oe_ram;
  wire [1:0] Mout_we_ram;
  wire [63:0] Mout_addr_ram;
  wire [31:0] Mout_Wdata_ram;
  wire [9:0] Mout_data_ram_size;
  
  reg signed [31:0] reg_DataReady[1:0];
  reg [31:0] mask;
  reg [31:0] M_Rdata_ram_temp;
  reg [1:0] M_DataRdy_temp;
  
  reg [2*`MEM_DELAY_READ-1:0] Mout_oe_ram_queue_next;
  reg [2*`MEM_DELAY_READ-1:0] Mout_oe_ram_queue_curr;
  reg [2*`MEM_DELAY_WRITE-1:0] Mout_we_ram_queue_next;
  reg [2*`MEM_DELAY_WRITE-1:0] Mout_we_ram_queue_curr;
  reg [64*`MEM_MAX_DELAY-1:0] Mout_addr_ram_queue_next;
  reg [64*`MEM_MAX_DELAY-1:0] Mout_addr_ram_queue_curr;
  reg [32*`MEM_DELAY_WRITE-1:0] Mout_Wdata_ram_queue_next;
  reg [32*`MEM_DELAY_WRITE-1:0] Mout_Wdata_ram_queue_curr;
  reg [10*`MEM_MAX_DELAY-1:0] Mout_data_ram_size_queue_next;
  reg [10*`MEM_MAX_DELAY-1:0] Mout_data_ram_size_queue_curr;
  //initialization of memory queue signals
  initial
  begin
    Mout_oe_ram_queue_next = 0;
    Mout_oe_ram_queue_curr = 0;
    Mout_we_ram_queue_next = 0;
    Mout_we_ram_queue_curr = 0;
    Mout_addr_ram_queue_next = 0;
    Mout_addr_ram_queue_curr = 0;
    Mout_Wdata_ram_queue_next = 0;
    Mout_Wdata_ram_queue_curr = 0;
    Mout_data_ram_size_queue_next = 0;
    Mout_data_ram_size_queue_curr = 0;
    M_DataRdy_temp = 0;
    M_Rdata_ram_temp = 0;
    base_addr = 0;
  end
  
  wire [31:0] M_Rdata_ram_delayed_temporary;
  reg [31:0] M_Rdata_ram_delayed [`MEM_DELAY_READ-2:0];
  
  // MODULE INSTANTIATION AND PORTS BINDING
  icrc icrc (.clock(clock), .reset(reset), .start_port(start_port), .crc(crc), .lin(lin), .len(len), .jinit(jinit), .jrev(jrev), .M_Rdata_ram(M_Rdata_ram), .M_DataRdy(M_DataRdy), .done_port(done_port), .return_port(return_port), .Mout_oe_ram(Mout_oe_ram), .Mout_we_ram(Mout_we_ram), .Mout_addr_ram(Mout_addr_ram), .Mout_Wdata_ram(Mout_Wdata_ram), .Mout_data_ram_size(Mout_data_ram_size));
  
  // Operation to be executed just one time
  initial
  begin
    // OPEN FILE WITH VALUES FOR SIMULATION
    file = $fopen("/root/PandA-bambu-2023.1/examples/crc/tutorial/HLS_output//simulation/values.txt","r");
    // Error in file open
    if (file == `NULL)
    begin
      $display("ERROR - Error opening the file");
      $finish;// Terminate
          end
    // OPEN FILE WHERE results will be written
    res_file = $fopen("/root/PandA-bambu-2023.1/examples/crc/tutorial/results.txt","w");
    
    // Error in file open
    if (res_file == `NULL)
    begin
      $display("ERROR - Error opening the res_file");
      $fclose(file);
      $finish;// Terminate
          end
    // Variables initialization
    sim_time = 0;
    startTime = 0;
    endTime = 0;
    _ch_ = 0;
    _n_ = 0;
    _r_ = 0;
    line = 0;
    _i_ = 0;
    _addr_i_ = 0;
    compare_outputs = 0;
    start_next_sim = 0;
    __next_state = 0;
    reset = 0;
    next_start_port = 0;
    success = 1;
    crc = 0;
    lin = 0;
    ex_lin = 0;
    len = 0;
    jinit = 0;
    jrev = 0;
    
    
    ex_return_port = 0;
    registered_return_port = 0;
    
    reg_DataReady[0] = 0;
    
    reg_DataReady[1] = 0;
    
    for (addr = 0; addr < MEMSIZE; addr = addr + 1)
    begin
      _bambu_testbench_mem_[addr] = 8'b0;
    end
  end
  
  // Assigning values
  always @ (posedge clock)
  begin
    if (next_start_port == 1'b1)
    begin
      // reading base address memory --------------------------------------------------------------
      _ch_ = $fgetc(file);
      if ($feof(file))
      begin
        $display("No more values found. Simulation(s) executed: %d.\n", _n_);
        $fclose(res_file);
        $fclose(file);
        $finish;
      end
      while (_ch_ == "/" || _ch_ == "\n" || _ch_ == "b")
      begin
        if (_ch_ == "b")
        begin
          _r_ = $fscanf(file,"%b\n", base_addr); end
        else
        begin
          _r_ = $fgets(line, file);
        end
        _ch_ = $fgetc(file);
      end
      // initializing memory --------------------------------------------------------------
      while (_ch_ == "/" || _ch_ == "\n" || _ch_ == "m")
      begin
        if (_ch_ == "m")
        begin
          _r_ = $fscanf(file,"%b\n", _bambu_databyte_);
          _bambu_testbench_mem_[_addr_i_] = _bambu_databyte_;
          _addr_i_ = _addr_i_ + 1;
        end
        else
        begin
          _r_ = $fgets(line, file);
        end
        _ch_ = $fgetc(file);
      end
      
      // Read a value for crc --------------------------------------------------------------
      while (_ch_ == "/" || _ch_ == "\n")
      begin
        _r_ = $fgets(line, file);
        _ch_ = $fgetc(file);
      end
      // If no character found
      if (_ch_ == -1)
      begin
        $display("No more values found. Simulation(s) executed: %d.\n", _n_);
        $fclose(res_file);
        $fclose(file);
        $finish;
      end
      else
      begin
        // Vectors count
        _n_ = _n_ + 1;
        $display("Start reading vector %d's values from input file.\n", _n_);
      end
      if (_ch_ == "p")
      begin
        _r_ = $fscanf(file,"%b\n", crc); // expected format: bbb...b (example: 00101110)
      end
      if (_r_ != 1) // error
      begin
        _ch_ = $fgetc(file);
        if (_ch_ == `EOF) // end-of-file reached
        begin
          $display("ERROR - End of file reached before getting all the values for the parameters");
          $fclose(res_file);
          $fclose(file);
          $finish;
        end
        else // generic error
        begin
          $display("ERROR - Unknown error while reading the file. Character found: %c", _ch_[7:0]);
          $fclose(res_file);
          $fclose(file);
          $finish;
        end
      end
      else
      begin
      end
      // Value for crc found ---------------------------------------------------------------
      
      // Read a value for lin --------------------------------------------------------------
      _ch_ = $fgetc(file);
      while (_ch_ == "/" || _ch_ == "\n")
      begin
        _r_ = $fgets(line, file);
        _ch_ = $fgetc(file);
      end
      if (_ch_ == "p")
      begin
        _r_ = $fscanf(file,"%b\n", lin); // expected format: bbb...b (example: 00101110)
      end
      if (_r_ != 1) // error
      begin
        _ch_ = $fgetc(file);
        if (_ch_ == `EOF) // end-of-file reached
        begin
          $display("ERROR - End of file reached before getting all the values for the parameters");
          $fclose(res_file);
          $fclose(file);
          $finish;
        end
        else // generic error
        begin
          $display("ERROR - Unknown error while reading the file. Character found: %c", _ch_[7:0]);
          $fclose(res_file);
          $fclose(file);
          $finish;
        end
      end
      else
      begin
      end
      // Value for lin found ---------------------------------------------------------------
      
      // Read a value for len --------------------------------------------------------------
      _ch_ = $fgetc(file);
      while (_ch_ == "/" || _ch_ == "\n")
      begin
        _r_ = $fgets(line, file);
        _ch_ = $fgetc(file);
      end
      if (_ch_ == "p")
      begin
        _r_ = $fscanf(file,"%b\n", len); // expected format: bbb...b (example: 00101110)
      end
      if (_r_ != 1) // error
      begin
        _ch_ = $fgetc(file);
        if (_ch_ == `EOF) // end-of-file reached
        begin
          $display("ERROR - End of file reached before getting all the values for the parameters");
          $fclose(res_file);
          $fclose(file);
          $finish;
        end
        else // generic error
        begin
          $display("ERROR - Unknown error while reading the file. Character found: %c", _ch_[7:0]);
          $fclose(res_file);
          $fclose(file);
          $finish;
        end
      end
      else
      begin
      end
      // Value for len found ---------------------------------------------------------------
      
      // Read a value for jinit --------------------------------------------------------------
      _ch_ = $fgetc(file);
      while (_ch_ == "/" || _ch_ == "\n")
      begin
        _r_ = $fgets(line, file);
        _ch_ = $fgetc(file);
      end
      if (_ch_ == "p")
      begin
        _r_ = $fscanf(file,"%b\n", jinit); // expected format: bbb...b (example: 00101110)
      end
      if (_r_ != 1) // error
      begin
        _ch_ = $fgetc(file);
        if (_ch_ == `EOF) // end-of-file reached
        begin
          $display("ERROR - End of file reached before getting all the values for the parameters");
          $fclose(res_file);
          $fclose(file);
          $finish;
        end
        else // generic error
        begin
          $display("ERROR - Unknown error while reading the file. Character found: %c", _ch_[7:0]);
          $fclose(res_file);
          $fclose(file);
          $finish;
        end
      end
      else
      begin
      end
      // Value for jinit found ---------------------------------------------------------------
      
      // Read a value for jrev --------------------------------------------------------------
      _ch_ = $fgetc(file);
      while (_ch_ == "/" || _ch_ == "\n")
      begin
        _r_ = $fgets(line, file);
        _ch_ = $fgetc(file);
      end
      if (_ch_ == "p")
      begin
        _r_ = $fscanf(file,"%b\n", jrev); // expected format: bbb...b (example: 00101110)
      end
      if (_r_ != 1) // error
      begin
        _ch_ = $fgetc(file);
        if (_ch_ == `EOF) // end-of-file reached
        begin
          $display("ERROR - End of file reached before getting all the values for the parameters");
          $fclose(res_file);
          $fclose(file);
          $finish;
        end
        else // generic error
        begin
          $display("ERROR - Unknown error while reading the file. Character found: %c", _ch_[7:0]);
          $fclose(res_file);
          $fclose(file);
          $finish;
        end
      end
      else
      begin
      end
      // Value for jrev found ---------------------------------------------------------------
      _ch_ = $fgetc(file);
      // Simulation start
      startTime = $time;
      $display("Reading of vector values from input file completed. Simulation started.");
    end
  end
  
  // Memory queue update
  generate
    if(`MEM_DELAY_READ != 1)
    begin
      always @(posedge clock)
      begin
        Mout_oe_ram_queue_next[`MEM_DELAY_READ*2 -1 : 2] <= Mout_oe_ram_queue_curr[(`MEM_DELAY_READ-1) *2 -1 : 0];
      end
      always @(*)
      begin
        Mout_oe_ram_queue_curr[`MEM_DELAY_READ*2 -1 : 2] = Mout_oe_ram_queue_next[`MEM_DELAY_READ*2 -1 : 2];
        Mout_oe_ram_queue_curr[1 :0] = Mout_oe_ram;
      end
    end
    else
    begin
      always @(*)
      begin
        Mout_oe_ram_queue_curr[1 :0] = Mout_oe_ram;
      end
    end
  endgenerate
  
  generate
    if(`MEM_DELAY_WRITE != 1)
    begin
      always @(posedge clock)
      begin
        Mout_we_ram_queue_next[`MEM_DELAY_WRITE*2 -1 : 2] <= Mout_we_ram_queue_curr[(`MEM_DELAY_WRITE-1) *2 -1 : 0];
      end
      always @(*)
      begin
        Mout_we_ram_queue_curr[`MEM_DELAY_WRITE*2 -1 : 2] = Mout_we_ram_queue_next[`MEM_DELAY_WRITE*2 -1 : 2];
        Mout_we_ram_queue_curr[1 :0] = Mout_we_ram;
      end
    end
    else
    begin
      always @(*)
      begin
        Mout_we_ram_queue_curr[1 :0] = Mout_we_ram;
      end
    end
  endgenerate
  
  generate
    if(`MEM_MAX_DELAY != 1)
    begin
      always @(posedge clock)
      begin
        Mout_addr_ram_queue_next[`MEM_MAX_DELAY*64 -1 : 64] <= Mout_addr_ram_queue_curr[(`MEM_MAX_DELAY-1) *64 -1 : 0];
      end
      always @(*)
      begin
        Mout_addr_ram_queue_curr[`MEM_MAX_DELAY*64 -1 : 64] = Mout_addr_ram_queue_next[`MEM_MAX_DELAY*64 -1 : 64];
        Mout_addr_ram_queue_curr[63 :0] = Mout_addr_ram;
      end
    end
    else
    begin
      always @(*)
      begin
        Mout_addr_ram_queue_curr[63 :0] = Mout_addr_ram;
      end
    end
  endgenerate
  
  generate
    if(`MEM_DELAY_WRITE != 1)
    begin
      always @(posedge clock)
      begin
        Mout_Wdata_ram_queue_next[`MEM_DELAY_WRITE*32 -1 : 32] <= Mout_Wdata_ram_queue_curr[(`MEM_DELAY_WRITE-1) *32 -1 : 0];
      end
      always @(*)
      begin
        Mout_Wdata_ram_queue_curr[`MEM_DELAY_WRITE*32 -1 : 32] = Mout_Wdata_ram_queue_next[`MEM_DELAY_WRITE*32 -1 : 32];
        Mout_Wdata_ram_queue_curr[31 :0] = Mout_Wdata_ram;
      end
    end
    else
    begin
      always @(*)
      begin
        Mout_Wdata_ram_queue_curr[31 :0] = Mout_Wdata_ram;
      end
    end
  endgenerate
  
  generate
    if(`MEM_MAX_DELAY != 1)
    begin
      always @(posedge clock)
      begin
        Mout_data_ram_size_queue_next[`MEM_MAX_DELAY*10 -1 : 10] <= Mout_data_ram_size_queue_curr[(`MEM_MAX_DELAY-1) *10 -1 : 0];
      end
      always @(*)
      begin
        Mout_data_ram_size_queue_curr[`MEM_MAX_DELAY*10 -1 : 10] = Mout_data_ram_size_queue_next[`MEM_MAX_DELAY*10 -1 : 10];
        Mout_data_ram_size_queue_curr[9 :0] = Mout_data_ram_size;
      end
    end
    else
    begin
      always @(*)
      begin
        Mout_data_ram_size_queue_curr[9 :0] = Mout_data_ram_size;
      end
    end
  endgenerate
  
  always @(*)
  begin
    if(Mout_we_ram_queue_curr[2*(`MEM_DELAY_WRITE-1) + 0] === 1'b1)
    begin
      mask[15:0] = (1 << Mout_data_ram_size_queue_curr[4+(`MEM_DELAY_WRITE-1)*10 : 0+(`MEM_DELAY_WRITE-1)*10]) -1;
    end
    else
    begin
      mask[15:0] = 0;
    end
  end
  
  always @(*)
  begin
    if(Mout_we_ram_queue_curr[2*(`MEM_DELAY_WRITE-1) + 1] === 1'b1)
    begin
      mask[31:16] = (1 << Mout_data_ram_size_queue_curr[9+(`MEM_DELAY_WRITE-1)*10 : 5+(`MEM_DELAY_WRITE-1)*10]) -1;
    end
    else
    begin
      mask[31:16] = 0;
    end
  end
  
  // OffChip Memory write
  always @(posedge clock)
  begin
    if (Mout_we_ram_queue_curr[0+2*(`MEM_DELAY_WRITE-1)] === 1'b1 && base_addr <= Mout_addr_ram_queue_curr[31+(`MEM_DELAY_WRITE-1)*64:0+(`MEM_DELAY_WRITE-1)*64] && Mout_addr_ram_queue_curr[31+(`MEM_DELAY_WRITE-1)*64:0+(`MEM_DELAY_WRITE-1)*64] < (base_addr + MEMSIZE))
    begin
      {_bambu_testbench_mem_[Mout_addr_ram_queue_curr[31+(`MEM_DELAY_WRITE-1)*64:0+(`MEM_DELAY_WRITE-1)*64] + 1 - base_addr], _bambu_testbench_mem_[Mout_addr_ram_queue_curr[31+(`MEM_DELAY_WRITE-1)*64:0+(`MEM_DELAY_WRITE-1)*64] + 0 - base_addr]} = (Mout_Wdata_ram_queue_curr[15+(`MEM_DELAY_WRITE-1)*32:0+(`MEM_DELAY_WRITE-1)*32] & mask[15:0]) | ({_bambu_testbench_mem_[Mout_addr_ram_queue_curr[31+(`MEM_DELAY_WRITE-1)*64:0+(`MEM_DELAY_WRITE-1)*64] + 1 - base_addr], _bambu_testbench_mem_[Mout_addr_ram_queue_curr[31+(`MEM_DELAY_WRITE-1)*64:0+(`MEM_DELAY_WRITE-1)*64] + 0 - base_addr]} & ~(mask[15:0]));
    end
    if (Mout_we_ram_queue_curr[1+2*(`MEM_DELAY_WRITE-1)] === 1'b1 && base_addr <= Mout_addr_ram_queue_curr[63+(`MEM_DELAY_WRITE-1)*64:32+(`MEM_DELAY_WRITE-1)*64] && Mout_addr_ram_queue_curr[63+(`MEM_DELAY_WRITE-1)*64:32+(`MEM_DELAY_WRITE-1)*64] < (base_addr + MEMSIZE))
    begin
      {_bambu_testbench_mem_[Mout_addr_ram_queue_curr[63+(`MEM_DELAY_WRITE-1)*64:32+(`MEM_DELAY_WRITE-1)*64] + 1 - base_addr], _bambu_testbench_mem_[Mout_addr_ram_queue_curr[63+(`MEM_DELAY_WRITE-1)*64:32+(`MEM_DELAY_WRITE-1)*64] + 0 - base_addr]} = (Mout_Wdata_ram_queue_curr[31+(`MEM_DELAY_WRITE-1)*32:16+(`MEM_DELAY_WRITE-1)*32] & mask[31:16]) | ({_bambu_testbench_mem_[Mout_addr_ram_queue_curr[63+(`MEM_DELAY_WRITE-1)*64:32+(`MEM_DELAY_WRITE-1)*64] + 1 - base_addr], _bambu_testbench_mem_[Mout_addr_ram_queue_curr[63+(`MEM_DELAY_WRITE-1)*64:32+(`MEM_DELAY_WRITE-1)*64] + 0 - base_addr]} & ~(mask[31:16]));
    end
  end
  
  always @(*)
  begin
    M_Rdata_ram_temp[15:0] = ((base_addr <= Mout_addr_ram_queue_curr[31+(`MEM_DELAY_READ-1)*64:0+(`MEM_DELAY_READ-1)*64] && Mout_addr_ram_queue_curr[31+(`MEM_DELAY_READ-1)*64:0+(`MEM_DELAY_READ-1)*64] < (base_addr + MEMSIZE))) ? {_bambu_testbench_mem_[Mout_addr_ram_queue_curr[31+(`MEM_DELAY_READ-1)*64:0+(`MEM_DELAY_READ-1)*64] + 1 - base_addr], _bambu_testbench_mem_[Mout_addr_ram_queue_curr[31+(`MEM_DELAY_READ-1)*64:0+(`MEM_DELAY_READ-1)*64] + 0 - base_addr]} : 16'b0;
  end
  assign M_Rdata_ram[15:0] = M_Rdata_ram_temp[15:0];
  
  always @(*)
  begin
    M_Rdata_ram_temp[31:16] = ((base_addr <= Mout_addr_ram_queue_curr[63+(`MEM_DELAY_READ-1)*64:32+(`MEM_DELAY_READ-1)*64] && Mout_addr_ram_queue_curr[63+(`MEM_DELAY_READ-1)*64:32+(`MEM_DELAY_READ-1)*64] < (base_addr + MEMSIZE))) ? {_bambu_testbench_mem_[Mout_addr_ram_queue_curr[63+(`MEM_DELAY_READ-1)*64:32+(`MEM_DELAY_READ-1)*64] + 1 - base_addr], _bambu_testbench_mem_[Mout_addr_ram_queue_curr[63+(`MEM_DELAY_READ-1)*64:32+(`MEM_DELAY_READ-1)*64] + 0 - base_addr]} : 16'b0;
  end
  assign M_Rdata_ram[31:16] = M_Rdata_ram_temp[31:16];
  
  always @(*)
  begin
  
    M_DataRdy_temp[0] =0;if(Mout_we_ram_queue_curr[2*(`MEM_DELAY_WRITE-1) + 0] === 1'b1)
    begin
      M_DataRdy_temp[0] =(base_addr <= Mout_addr_ram_queue_curr[31+(`MEM_DELAY_WRITE-1)*64:0+(`MEM_DELAY_WRITE-1)*64] && Mout_addr_ram_queue_curr[31+(`MEM_DELAY_WRITE-1)*64:0+(`MEM_DELAY_WRITE-1)*64] < (base_addr + MEMSIZE));
    end
    else if(Mout_oe_ram_queue_curr[2*(`MEM_DELAY_READ-1) + 0] === 1'b1)
    begin
      M_DataRdy_temp[0] =(base_addr <= Mout_addr_ram_queue_curr[31+(`MEM_DELAY_READ-1)*64:0+(`MEM_DELAY_READ-1)*64] && Mout_addr_ram_queue_curr[31+(`MEM_DELAY_READ-1)*64:0+(`MEM_DELAY_READ-1)*64] < (base_addr + MEMSIZE));
    end
  end
  
  always @(*)
  begin
  
    M_DataRdy_temp[1] =0;if(Mout_we_ram_queue_curr[2*(`MEM_DELAY_WRITE-1) + 1] === 1'b1)
    begin
      M_DataRdy_temp[1] =(base_addr <= Mout_addr_ram_queue_curr[63+(`MEM_DELAY_WRITE-1)*64:32+(`MEM_DELAY_WRITE-1)*64] && Mout_addr_ram_queue_curr[63+(`MEM_DELAY_WRITE-1)*64:32+(`MEM_DELAY_WRITE-1)*64] < (base_addr + MEMSIZE));
    end
    else if(Mout_oe_ram_queue_curr[2*(`MEM_DELAY_READ-1) + 1] === 1'b1)
    begin
      M_DataRdy_temp[1] =(base_addr <= Mout_addr_ram_queue_curr[63+(`MEM_DELAY_READ-1)*64:32+(`MEM_DELAY_READ-1)*64] && Mout_addr_ram_queue_curr[63+(`MEM_DELAY_READ-1)*64:32+(`MEM_DELAY_READ-1)*64] < (base_addr + MEMSIZE));
    end
  end
  
  assign M_DataRdy = M_DataRdy_temp;
  
  always @(posedge clock)
  begin
    if (Mout_we_ram[0]===1'b1 && Mout_oe_ram[0]===1'b1)
    begin
    // error
      $display("ERROR - Mout_we_ram and Mout_oe_ram both enabled");
      $fclose(res_file);
      $fclose(file);
      $finish;
    end
    if (Mout_we_ram[1]===1'b1 && Mout_oe_ram[1]===1'b1)
    begin
    // error
      $display("ERROR - Mout_we_ram and Mout_oe_ram both enabled");
      $fclose(res_file);
      $fclose(file);
      $finish;
    end
  
  end
  
  always @(negedge clock)
  begin
  if (done_port == 1)
    begin
    registered_return_port = return_port;
      end
    end
  always @(negedge clock)
  begin
    if (start_results_comparison == 1)
    begin
      
      // OPTIONAL - Read a value for lin --------------------------------------------------------------
      _i_ = 0;
      while (_ch_ == "/" || _ch_ == "\n" || _ch_ == "o")
      begin
        if (_ch_ == "o")
        begin
          compare_outputs = 1;
          _r_ = $fscanf(file,"%b\n", ex_lin); // expected format: bbb...b (example: 00101110)
          if (_r_ != 1)
          begin
            // error
            $display("ERROR - Unknown error while reading the file. Character found: %c", _ch_[7:0]);
            $fclose(res_file);
            $fclose(file);
            $finish;
          end
          if (_bambu_testbench_mem_[(lin - base_addr) + _i_] !== ex_lin)
          begin
            success = 0;
          end
          _i_ = _i_ + 1;
          _ch_ = $fgetc(file);
        end
        else
        begin
          // skip comments and empty lines
          _r_ = $fgets(line, file);
          _ch_ = $fgetc(file);
        end
      end
      if (_ch_ == "e")
      begin
        _r_ = $fgets(line, file);
        _ch_ = $fgetc(file);
      end
      else
      begin
      // error
        $display("ERROR - Unknown error while reading the file. Character found: %c", _ch_[7:0]);
        $fclose(res_file);
        $fclose(file);
        $finish;
      end
      _i_ = 0;
      while (_ch_ == "/" || _ch_ == "\n" || _ch_ == "o")
      begin
        if (_ch_ == "o")
        begin
          compare_outputs = 1;
          _r_ = $fscanf(file,"%b\n", ex_return_port); // expected format: bbb...b (example: 00101110)
          if (_r_ != 1)
          begin
            // error
            $display("ERROR - Unknown error while reading the file. Character found: %c", _ch_[7:0]);
            $fclose(res_file);
            $fclose(file);
            $finish;
          end
          else
          begin
          end
          $display(" return_port = %d   expected = %d \n", registered_return_port, ex_return_port);
          if (registered_return_port !== ex_return_port)
          begin
            success = 0;
          end
          _i_ = _i_ + 1;
          _ch_ = $fgetc(file);
        end
        else
        begin
          // skip comments and empty lines
          _r_ = $fgets(line, file);
          _ch_ = $fgetc(file);
        end
      end
      if (_ch_ == "e")
      begin
        _r_ = $fgets(line, file);
        _ch_ = $fgetc(file);
      end
      else
      begin
        // error
        $display("ERROR - Unknown error while reading the file. Character found: %c", _ch_[7:0]);
        $fclose(res_file);
        $fclose(file);
        $finish;
      end
      // Compare output with expected output (if given)
      if (compare_outputs == 1)
      begin
        $display("Simulation ended after %d cycles.\n", sim_time);
        if (success == 1)
        begin
          $display("Simulation completed with success\n");
          $fwrite(res_file, "1\t");
        end
        else
        begin
          $display("Simulation FAILED\n");
          $fwrite(res_file, "0\t");
        end
      end
      else
      begin
        $display("Simulation ended after %d cycles (no expected outputs specified).\n", sim_time);
        $fwrite(res_file, "-\t");
      end
      $fwrite(res_file, "%d\n", sim_time);
    end
  end
  
  always @(*)
    begin
       start_results_comparison = 0;
       reset = 1;
       start_next_sim = 0;
       next_start_port = 0;
       case (__state)
         0:
           begin
              reset = 0;
              __next_state = 1;
           end
         1:
           begin
              reset = 0;
              __next_state = 2;
           end
         2:
           if(currTime > `INIT_TIME)
             begin
                next_start_port = 1;
                if (done_port == 1'b1)
                  begin
                    __next_state = 4;
                  end
                else
                  __next_state = 3;
             end
           else
             __next_state = 2;
         3:
           if (done_port == 1'b1)
             begin
                __next_state = 4;
             end
           else
             __next_state = 3;
         4:
           begin
              start_results_comparison = 1;
              __next_state = 5;
           end
         5:
           begin
  // Restart a new computation if possible
              __next_state = 2;
           end
         default:
           begin
              __next_state = 0;
           end
       endcase // case (__state)
    end // always @ (*)
  always @(posedge clock)
    begin
    __state <= __next_state;
    start_port <= next_start_port;
    end
  // Check done_port signal
  always @(negedge clock)
  begin
    if (done_port == 1)
    begin
      endTime = $time;
      
      // Simulation time (clock cycles) = 1+(time elapsed (seconds) / clock cycle (seconds per cycle)) (until done is 1)
      sim_time = $rtoi((endTime + `HALF_CLOCK_PERIOD - startTime)/`CLOCK_PERIOD);
      
      success = 1;
      compare_outputs = 0;
    end
  end
  always @(posedge clock)
  begin
    currTime = $time;
    if ($time >= startTime && (($time - startTime)/`CLOCK_PERIOD > `SIMULATION_LENGTH))
    begin
      $display("Simulation not completed into %d cycles", `SIMULATION_LENGTH);
      $fwrite(res_file, "X\t");
      $fwrite(res_file, "%d\n", `SIMULATION_LENGTH);
      $fclose(res_file);
      $fclose(file);
      $finish;
    end
  end
  
endmodule

// verilator lint_on BLKANDNBLK
// verilator lint_on BLKSEQ

