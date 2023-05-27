`include "dff.v"
`timescale 1ns/1ns
module tb_d_ff_async_reset;

 
  reg clk;
  reg reset;
  reg d;

  wire q;


  d_ff_async_reset dut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
  );
  initial begin 
  $dumpfile("new.vcd");
  $dumpvars();
  end


  always begin
    #5 clk = ~clk;   // Toggle the clock every 5 time units
  end

  // Stimulus
  initial begin
    clk = 0;
    reset = 1;      // Assert the reset
    d = 0;

    #10 reset = 0;   // Deassert the reset after 10 time units
    #10 d = 1;      // Set input to 1
    #10 d = 0;      // Set input to 0
    #10 d = 1;      // Set input to 1

    #20 $finish;    // End simulation after 20 time units
  end

  always @(posedge clk) begin
    $display("q = %b", q);
  end

endmodule