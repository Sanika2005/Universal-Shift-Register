module universal_shift_reg(
input wire clk,
input wire rst,
input wire [1:0] mode,
input wire [3:0] data_in,
input wire sr,
input wire sl,
output reg [3:0] q
);
always @(posedge clk or posedge rst)
begin
     if (rst)
     begin
     q <= 4'b0000;
     end
           else 
           begin
              case (mode)
              2'b00: q <= q; //hold   
              2'b01: q <= {sr,q[3:1]}; //shift right 
              2'b10: q <= {q[2:0],sl}; //shift left   
              2'b11: q <= data_in;  //parallel load  
              default: q <= q;
              endcase
           end
end
endmodule
