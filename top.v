module top (
input clk
);
wire [3:0] q;
wire rst;
wire [1:0] mode;
wire [3:0] data_in;
wire sr,sl;

universal_shift_reg i1 (
          .clk(clk),
          .rst(rst),
          .mode(mode),
          .data_in(data_in),
          .sr(sr),
          .sl(sl),
          .q(q)
);
ila_0 i2 (
	.clk(clk), // input wire clk


	.probe0(q) // input wire [3:0] probe0
);
vio_0 i3 (
  .clk(clk),                // input wire clk
  .probe_out0(rst),  // output wire [0 : 0] probe_out0
  .probe_out1(mode),  // output wire [1 : 0] probe_out1
  .probe_out2(data_in),  // output wire [3 : 0] probe_out2
  .probe_out3(sr),  // output wire [0 : 0] probe_out3
  .probe_out4(sl)  // output wire [0 : 0] probe_out4
);
endmodule
