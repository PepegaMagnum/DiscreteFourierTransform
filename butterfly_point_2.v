module butterfly_point_2
(
	input  [7:0]x0, //ufix 4.4
	input  [7:0]x4, //ufix 4.4
	output reg [7:0] a0, //ufix 4.4
	output reg [7:0] a1 //ufix 4.4
	
);
reg [15:0] temp;
parameter [7:0] w02 = 8'b00010000;


always@(*)
 begin
		temp <= w02*x4;
		a0 <= x0 + temp[11:4];
		a1 <= x0 - temp[11:4];
 end
 
endmodule 