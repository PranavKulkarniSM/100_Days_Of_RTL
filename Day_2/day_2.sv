module day_2 (clk, reset, di , noreset_q, syncreset_q, asyncreset_q);
  input     logic      clk, reset, di;
  output    logic      syncreset_q, asyncreset_q, noreset_q;
  always_ff @(posedge clk)
    noreset_q <= di;
  
  always_ff @(posedge clk)
    if (reset)
      syncreset_q <= 1'b0;
    else
      syncreset_q <= di;

  // Async reset
  always_ff @(posedge clk or posedge reset)
    if (reset)
      asyncreset_q <= 1'b0;
    else
      asyncreset_q <= di;

endmodule
