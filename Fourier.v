module Fourier
(
	input [7:0] x0,//ufix 4.4
	input [7:0] x2,//ufix 4.4
	input [7:0] x4,//ufix 4.4
	input [7:0] x6,//ufix 4.4
	
	input [7:0] x1,//ufix 4.4
	input [7:0] x3,//ufix 4.4
	input [7:0] x5,//ufix 4.4
	input [7:0] x7,//ufix 4.4
	
	output reg [7:0] z0r,
	output reg [15:0] z1r,
	output reg [15:0] z2r,
	output reg [7:0] z3r,
	output reg [7:0] z4r,
	output reg [15:0] z5r,
	output reg [15:0] z6r,
	output reg [7:0] z7r,
	
	output reg [7:0] z0i,
	output reg [15:0] z1i,
	output reg [15:0] z2i,
	output reg [7:0] z3i,
	output reg [7:0] z4i,
	output reg [15:0] z5i,
	output reg [15:0] z6i,
	output reg [7:0] z7i
);

	wire [7:0] conb0r;//ufix 4.4
	wire [7:0] conb0i;
	
   wire [7:0] conb1r;//ufix 4.4
	wire [7:0] conb1i;
	
   wire [7:0] conb2r;//ufix 4.4
	wire [7:0] conb2i;
	
   wire [7:0] conb3r;//ufix 4.4
	wire [7:0] conb3i;
	
	
	wire [7:0] conb4r;//ufix 4.4
	wire [7:0] conb4i;
	
	wire [7:0] conb5r;//ufix 4.4
	wire [7:0] conb5i;
	
	wire [7:0] conb6r;//ufix 4.4
	wire [7:0] conb6i;
	
	wire [7:0] conb7r;//ufix 4.4
	wire [7:0] conb7i;
	
	parameter [7:0] w08 = 8'b10000;//ufix 4.4
	
	
	parameter [7:0] w18r = 8'b00001011;//ufix 4.4
	parameter [7:0] w18i = 8'b11110101;
	
	parameter [7:0] w28 = 8'b11110000;

	parameter [7:0] w38r = 8'b11110101;//ufix 4.4
	parameter [7:0] w38i = 8'b11110101;
	
	
	reg [15:0]temp0;
	reg [15:0]temp1;
	
	reg [15:0]temp2;
	reg [15:0]temp3;
	
	reg [15:0]temp4;
	reg [15:0]temp5;
	
	reg [15:0]temp6;
	reg [15:0]temp7;
	
	reg [15:0]temp8;
	reg [15:0]temp9;
	
	reg [15:0]temp10;
	reg [15:0]temp11;
	
	
	
	butterfly_point_4 Butter_stage_1_0(
		.x0(x0),
		.x2(x2),
		.x4(x4),
		.x6(x6),
		
		.b0r(conb0r),
		.b0i(conb0i),
		
		.b1r(conb1r),
		.b1i(conb1i),
		
		.b2r(conb2r),
		.b2i(conb2i),
		
		.b3r(conb3r),
		.b3i(conb3i)
	
	);
	
	butterfly_point_4 Butter_stage_1_1(
		.x0(x1),
		.x2(x3),
		.x4(x5),
		.x6(x7),
		
		
		.b0r(conb4r),
		.b0i(conb4i),
		
		.b1r(conb5r),
		.b1i(conb5i),
		
		.b2r(conb6r),
		.b2i(conb6i),
		
		.b3r(conb7r),
		.b3i(conb7i)
	
	);
	always@(*)
		begin
			//mnożenie w08*b4
			temp0  <= w08*conb4r;
			temp1  <= w08*conb4i;
			//mnożeie w18*b5
			temp2  <= w18i*conb5i;
			temp3  <= w18i*conb5r;
			temp4  <= w18r*conb5r;
			temp5  <= w18r*conb5i;
			//mnożeie w28*b6
			temp6  <= w28*conb6r;
			temp7  <= w28*conb6i;
			
			//mnożeie w38*b7
			temp8 <= w38i*conb7i;
			temp9 <= w38r*conb7r;
			temp10 <= w38i*conb7r;
			temp11 <= w38r*conb7i;
			
			z0r <= conb0r + temp0[11:4];
			z0i <= conb0i + temp1[11:4];
			
			z1r <= {conb1r,{4{1'b0}}} - temp2 + temp4;
			z1i <= {conb1i,{4{1'b0}}} + temp3 + temp5;
			
			z2r <= {conb2r,{4{1'b0}}} - temp7;
			z2i <= {conb2i,{4{1'b0}}} + temp6;
			
			
			z3r <= conb3r - temp8[11:4] + temp9[11:4];
			z3i <= conb3i + temp10[11:4] + temp11[11:4];
			
			
			z4r <= conb0r - temp0[11:4];
			z4i <= conb0i - temp1[11:4];
			
			z5r <= {conb1r,{4{1'b0}}} + temp2 - temp4;
			z5i <= {conb1i,{4{1'b0}}} - temp3 - temp5;
			
			z6r <= {conb2r,{4{1'b0}}} + temp7;
			z6i <= {conb2i,{4{1'b0}}} - temp6;
			
			
			z7r <= conb3r + temp8[11:4] - temp9[11:4];
			z7i <= conb3i - temp10[11:4] - temp11[11:4];
 					
		end
	
	
endmodule 