module day1_top();
  logic [1:0] a;
  logic s,o;
  day1 DUT(.in(a), .sel(s), .out(o));
  initial
    begin
      a=2'b00;
      s=1'b0;
      #100;
      $finish();
    end
  always #1 a=a+1;
  always #5 s=s+1;
  initial begin
    $dumpfile("day_1.vcd");
    $dumpvars(0, day1_top);
  end
endmodule
