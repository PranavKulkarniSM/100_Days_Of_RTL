module day_2_tb;

  logic clk, reset, di, noreset_q, syncreset_q, asyncrest_q;

  day_2 DUT (.clk(clk), .reset(reset), .di(di), .noreset_q(noreset_q), .syncreset_q(syncreset_q), .asyncreset_q(asyncrest_q));

  parameter CLK_PERIOD = 10;
  always begin
    clk = 1'b1;
    #(CLK_PERIOD/2);
    clk = 1'b0;
    #(CLK_PERIOD/2);
  end

  initial begin
    reset = 1'b1;
    di = 1'b0;
    
    repeat(2) @(posedge clk);
    
    reset = 1'b0;
    @(posedge clk);
    
    di = 1'b1;
    @(posedge clk);
    
    repeat(2) @(posedge clk);
    
    @(negedge clk);
    reset = 1'b1;
    @(posedge clk);
    
    @(posedge clk);
    reset = 1'b0;
    repeat(2) @(posedge clk);
    $finish();
  end
  initial begin
    $dumpfile("day_2.vcd");
    $dumpvars(0, day_2_tb);
  end

endmodule
