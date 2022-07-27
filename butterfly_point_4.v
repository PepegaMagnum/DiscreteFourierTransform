module butterfly_point_4
(
	input [7:0] x0,//ufix 4.4
	input [7:0] x2,//ufix 4.4
	input [7:0] x4,//ufix 4.4
	input [7:0] x6,//ufix 4.4
	
	output reg [7:0] b0r,
	output reg [7:0] b0i,

	output reg [7:0] b1r,
	output reg [7:0] b1i,

	output reg [7:0] b2r,
	output reg [7:0] b2i,

	output reg [7:0] b3r,
	output reg [7:0] b3i
);
	
	wire [7:0] cona0;//ufix 4.4
   wire [7:0] cona1;//ufix 4.4
   wire [7:0] cona2;//ufix 4.4
   wire [7:0] cona3;//ufix 4.4
	
	reg [15:0]temp0;
	reg [15:0]temp1;
	
	parameter [7:0] w04 = 8'b00010000;
	parameter [7:0] w14 = 8'b11110000;
	
	
	butterfly_point_2 Butter_stage_0_1(

        .x0 (x0),
        .x4 (x4),
        .a0 (cona0),
		  .a1 (cona1)
    );
	 
	 butterfly_point_2 Butter_stage_0_2(

        .x0 (x2),
        .x4 (x6),
        .a0 (cona2),
        .a1 (cona3)
    );
	 
	always@(*)
		begin
			temp0 <= w04*cona2;
		
			b0r <= cona0 + temp0[11:4];
			b0i <= 8'b0;
			
			temp1 <= w14*cona3;
			
			b1r <= cona1;
			b1i <= temp1[11:4];

			b2r <= cona0 - temp0[11:4];
			b2i <= 8'b0;

			b3r <= cona1;
			b3i <= -temp1[11:4];


  end

	 
	
endmodule 