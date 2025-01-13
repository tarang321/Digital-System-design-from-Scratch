`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2024 22:43:36
// Design Name: 
// Module Name: KA_232bit5653
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module KA_232bit5653(

   a,

   b,

   y

   );


input [231:0] a;

input [231:0] b;

output [462:0] y;



//Since input is only 232 bits, appending 3 bits to a3,b4

//to make overall bitwidth allows us to make 4 equal parts

wire [234:0] aa;

wire [234:0] bb;


assign aa = a;

assign bb = b;


wire [46:0] a0,a1,a2,a3,a4;

wire [46:0] b0,b1,b2,b3,b4;

wire [92:0] p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12;


assign a0 = aa[46:0];

assign b0 = bb[46:0];

assign a1 = aa[93:47];

assign b1 = bb[93:47];

assign a2 = aa[234:94];

assign b2 = bb[234:94];

assign a3 = aa[187:141];

assign b3 = bb[187:141];

assign a4 = aa[234:188];

assign b4 = bb[234:188];

KA_48bit KA_48bit_mod_0 (.a(a0),.b(b0),.y(p0));


KA_48bit KA_48bit_mod_1 (.a(a1),.b(b1),.y(p1));


KA_48bit KA_48bit_mod_2 (.a(a0^a1),.b(b0^b1),.y(p2));


KA_48bit KA_48bit_mod_3 (.a(a2),.b(b2),.y(p3));


KA_48bit KA_48bit_mod_4 (.a(a0^a2),.b(b0^b2),.y(p4));


KA_48bit KA_48bit_mod_5 (.a(a3),.b(b3),.y(p5));


KA_48bit KA_48bit_mod_6 (.a(a0^a2^a3),.b(b0^b2^b3),.y(p6));


KA_48bit KA_48bit_mod_7 (.a(a4),.b(b4),.y(p7));


KA_48bit KA_48bit_mod_8 (.a(a2^a4),.b(b2^b4),.y(p8));


KA_48bit KA_48bit_mod_9 (.a(a1^a2^a4),.b(b1^b2^b4),.y(p9));


KA_48bit KA_48bit_mod_10 (.a(a3^a4),.b(b3^b4),.y(p10));


KA_48bit KA_48bit_mod_11 (.a(a0^a1^a3^a4),.b(b0^b1^b3^b4),.y(p11));


KA_48bit KA_48bit_mod_12 (.a(a0^a1^a2^a3^a4),.b(b0^b1^b2^b3^b4),.y(p12));


overlap_235bit ov_mod (.p0(p0),.p1(p1),.p2(p2),.p3(p3),.p4(p4),.p5(p5),.p6(p6),.p7(p7),.p8(p8),.p9(p9),.p10(p10),.p11(p11),.p12(p12),.y(y));

endmodule


module overlap_235bit(p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,y);

input [92:0] p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12;

output [468:0] y;


assign y[46:0] = p0[46:0];

assign y[92:47] = p0[92:47]^p0[45:0]^p1[45:0]^p2[45:0];

assign y[93] = p0[46]^p1[46]^p2[46];

assign y[139:94] = p0[92:47]^p1[92:47]^p2[92:47]^p0[45:0]^p1[45:0]^p3[45:0]^p4[45:0];

assign y[140] = p0[46]^p1[46]^p3[46]^p4[46];

assign y[186:141] = p0[92:47]^p1[92:47]^p3[92:47]^p4[92:47]^p0[45:0]^p3[45:0]^p5[45:0]^p6[45:0]^p7[45:0]^p8[45:0]^p11[45:0]^p12[45:0];

assign y[187] = p0[46]^p3[46]^p5[46]^p6[46]^p7[46]^p8[46]^p11[46]^p12[46];

assign y[233:188] = p0[92:47]^p3[92:47]^p5[92:47]^p6[92:47]^p7[92:47]^p8[92:47]^p11[92:47]^p12[92:47]^p0[45:0]^p1[45:0]^p2[45:0]^p5[45:0]^p6[45:0]^p7[45:0]^p9[45:0]^p10[45:0]^p12[45:0];

assign y[234] = p0[46]^p1[46]^p2[46]^p5[46]^p6[46]^p7[46]^p9[46]^p10[46]^p12[46];

assign y[280:235] = p0[92:47]^p1[92:47]^p2[92:47]^p5[92:47]^p6[92:47]^p7[92:47]^p9[92:47]^p10[92:47]^p12[92:47]^p0[45:0]^p1[45:0]^p3[45:0]^p4[45:0]^p7[45:0]^p9[45:0]^p11[45:0]^p12[45:0];

assign y[281] = p0[46]^p1[46]^p3[46]^p4[46]^p7[46]^p9[46]^p11[46]^p12[46];

assign y[327:282] = p0[92:47]^p1[92:47]^p3[92:47]^p4[92:47]^p7[92:47]^p9[92:47]^p11[92:47]^p12[92:47]^p3[45:0]^p5[45:0]^p7[45:0]^p8[45:0];

assign y[328] = p5[46]^p5[46]^p7[46]^p8[46];

assign y[374:329] = p3[92:47]^p5[92:47]^p7[92:47]^p8[92:47]^p5[45:0]^p7[45:0]^p10[45:0];

assign y[375] = p5[46]^p7[46]^p10[46];

assign y[421:375] = p5[92:47]^p7[92:47]^p10[92:47]^p7[45:0];

assign y[468:422] =p7[92:46];



endmodule


// KaratSuba for 48Bit

// Module: 2

// Module type is : 6 term

module KA_48bit(

   a,

   b,

   y

   );


input [47:0] a;

input [47:0] b;

output [94:0] y;


wire [47:0] aa;

wire [47:0] bb;


assign aa = a;

assign bb = b;


wire [7:0] a0,a1,a2,a3,a4,a5;

wire [7:0] b0,b1,b2,b3,b4,b5;

wire [14:0] p0, p1, p2, p3, p4, p5, p6, p7, p8,p9,p10,p11,p12,p13,p14,p15,p16;


assign a0 = aa[7:0];

assign b0 = bb[7:0];

assign a1 = aa[15:8];

assign b1 = bb[15:8];

assign a2 = aa[23:16];

assign b2 = bb[23:16];

assign a3 = aa[31:24];

assign b3 = bb[31:24];

assign a4 = aa[39:32];

assign b4 = bb[39:32];

assign a5 = aa[47:40];

assign b5 = bb[47:40];

KA_10bit KA_10bit_mod_0 (.a(a0),.b(b0),.y(p0));


KA_10bit KA_10bit_mod_1 (.a(a1),.b(b1),.y(p1));


KA_10bit KA_10bit_mod_2 (.a((a0 ^ a1)),.b((b0 ^ b1)),.y(p2));


KA_10bit KA_10bit_mod_3 (.a((a1 ^ a2)),.b((b1 ^ b2)),.y(p3));


KA_10bit KA_10bit_mod_4 (.a((a0 ^ a1 ^ a2)),.b((b0 ^ b1 ^ b2)),.y(p4));


KA_10bit KA_10bit_mod_5 (.a((a2 ^ a3)),.b((b2 ^ b3)),.y(p5));


KA_10bit KA_10bit_mod_6 (.a(a4),.b(b4),.y(p6));


KA_10bit KA_10bit_mod_7 (.a((a1 ^ a4)),.b((b1 ^ b4)),.y(p7));


KA_10bit KA_10bit_mod_8 (.a((a3 ^ a4)),.b((b3 ^ b4)),.y(p8));


KA_10bit KA_10bit_mod_9 (.a((a0 ^ a1 ^ a3 ^ a4)),.b((b0 ^ b1 ^ b3 ^ b4)),.y(p9));


KA_10bit KA_10bit_mod_10 (.a(a5),.b(b5),.y(p10));


KA_10bit KA_10bit_mod_11 (.a((a0 ^ a2 ^ a5)),.b((b0 ^ b2 ^ b5)),.y(p11));


KA_10bit KA_10bit_mod_12 (.a((a0 ^ a3 ^ a5)),.b((b0 ^ b3 ^ b5)),.y(p12));


KA_10bit KA_10bit_mod_13 (.a((a0 ^ a2 ^ a3 ^ a5)),.b((b0 ^ b2 ^ b3 ^ b5)),.y(p13));


KA_10bit KA_10bit_mod_14 (.a((a4 ^ a5)),.b((b4 ^ b5)),.y(p14));


KA_10bit KA_10bit_mod_15 (.a((a1 ^ a2 ^ a4 ^ a5)),.b((b1 ^ b2 ^ b4 ^ b5)),.y(p15));


KA_10bit KA_10bit_mod_16 (.a((a3 ^ a4 ^ a5)),.b((b3 ^ b4 ^ b5)),.y(p16));


overlap_48bit ov_mod (.p0(p0),.p1(p1),.p2(p2),.p3(p3),.p4(p4),.p5(p5),.p6(p6),.p7(p7),.p8(p8),.p9(p9),.p10(p10),.p11(p11),.p12(p12),.p13(p13),.p14(p14),.p15(p15),.p16(p16),.y(y));


endmodule



// overlap modulue for 48 bit

module overlap_48bit(p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,y);

input [14:0] p0, p1, p2, p3, p4, p5, p6, p7, p8,p9,p10,p11,p12,p13,p14,p15,p16;

output [94:0] y;


assign y[7:0] = p0[7:0];

assign y[14:8] = p0[14:8]^p0[6:0]^p1[6:0]^p2[6:0];

assign y[15] = p0[7]^p1[7]^p2[7];

assign y[22:16] = p0[14:8]^p1[14:8]^p2[14:8]^p2[6:0]^p3[6:0]^p4[6:0];

assign y[23] =p2[7]^p3[7]^p4[7];

assign y[30:24] =p2[14:8]^p3[14:8]^p4[14:8]^p1[6:0]^p3[6:0]^p5[6:0]^p6[6:0]^p8[6:0]^p11[6:0]^p13[6:0]^p14[6:0]^p16[6:0];

assign y[31] = p1[7]^p3[7]^p5[7]^p6[7]^p8[7]^p11[7]^p13[7]^p14[7]^p16[7];

assign y[38:32] = p1[14:8] ^ p3[14:8] ^ p5[14:8] ^ p6[14:8] ^ p8[14:8] ^ p11[14:8] ^ p13[14:8] ^ p14[14:8] ^ p16[14:8] ^ p1[6:0] ^ p2[6:0] ^ p5[6:0] ^ p7[6:0] ^ p9[6:0] ^ p11[6:0] ^ p13[6:0] ^ p14[6:0] ^ p16[6:0];

assign y[39] = p1[7] ^ p2[7] ^ p5[7] ^ p7[7] ^ p9[7] ^ p11[7] ^ p13[7] ^ p14[7] ^ p16[7];

assign y[46:40] = p1[14:8] ^ p2[14:8] ^ p5[14:8] ^ p7[14:8] ^ p9[14:8] ^ p11[14:8] ^ p13[14:8] ^ p14[14:8] ^ p16[14:8] ^ p0[6:0] ^ p1[6:0] ^ p6[6:0] ^ p7[6:0] ^ p10[6:0] ^ p11[6:0] ^ p12[6:0] ^ p13[6:0];

assign y[47] = p0[7] ^ p1[7] ^ p6[7] ^ p7[7] ^ p10[7] ^ p11[7] ^ p12[7] ^ p13[7];

assign y[54:48] = p0[14:8] ^ p1[14:8] ^ p6[14:8] ^ p7[14:8] ^ p10[14:8] ^ p11[14:8] ^ p12[14:8] ^ p13[14:8] ^ p2[6:0] ^ p4[6:0] ^ p5[6:0] ^ p6[6:0] ^ p7[6:0] ^ p12[6:0] ^ p13[6:0] ^ p14[6:0] ^ p15[6:0];

assign y[55] = p2[7] ^ p4[7] ^ p5[7] ^ p6[7] ^ p7[7] ^ p12[7] ^ p13[7] ^ p14[7] ^ p15[7];

assign y[62:56] = p2[14:8] ^ p4[14:8] ^ p5[14:8] ^ p6[14:8] ^ p7[14:8] ^ p12[14:8] ^ p13[14:8] ^ p14[14:8] ^ p15[14:8] ^ p1[6:0] ^ p2[6:0] ^ p3[6:0] ^ p4[6:0] ^ p5[6:0] ^ p6[6:0] ^ p8[6:0] ^ p12[6:0] ^ p13[6:0];

assign y[63] = p1[7] ^ p2[7] ^ p3[7] ^ p4[7] ^ p5[7] ^ p6[7] ^ p8[7] ^ p12[7] ^ p13[7];

assign y[70:64] = p1[14:8] ^ p2[14:8] ^ p3[14:8] ^ p4[14:8] ^ p5[14:8] ^ p6[14:8] ^ p8[14:8] ^ p12[14:8] ^ p13[14:8] ^ p8[6:0] ^ p14[6:0] ^ p16[6:0];

assign y[71] = p8[7] ^ p14[7] ^ p16[7];

assign y[78:72] = p8[14:8] ^ p14[14:8] ^ p16[14:8] ^ p6[6:0] ^ p10[6:0] ^ p14[6:0];

assign y[79] = p6[7] ^ p10[7] ^ p14[7];

assign y[86:80] = p6[14:8] ^ p10[14:8] ^ p14[14:8] ^ p10[6:0];

assign y[94:87] =p10[14:7];

endmodule


// KaratSuba for 10Bit

// Module: 3

// Module type is : 5 term

module KA_10bit(

   a,

   b,

   y

   );


input [9:0] a;

input [9:0] b;

output [18:0] y;


wire [9:0] aa;

wire [9:0] bb;


assign aa = a;

assign bb = b;


wire [1:0] a0,a1,a2,a3,a4;

wire [1:0] b0,b1,b2,b3,b4;

wire [2:0] p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12;


assign a0 = aa[1:0];

assign b0 = bb[1:0];

assign a1 = aa[3:2];

assign b1 = bb[3:2];

assign a2 = aa[9:4];

assign b2 = bb[9:4];

assign a3 = aa[7:6];

assign b3 = bb[7:6];

assign a4 = aa[9:8];

assign b4 = bb[9:8];

KA_3bit KA_3bit_mod_0 (.a(a0),.b(b0),.y(p0));


KA_3bit KA_3bit_mod_1 (.a(a1),.b(b1),.y(p1));


KA_3bit KA_3bit_mod_2 (.a(a0^a1),.b(b0^b1),.y(p2));


KA_3bit KA_3bit_mod_3 (.a(a2),.b(b2),.y(p3));


KA_3bit KA_3bit_mod_4 (.a(a0^a2),.b(b0^b2),.y(p4));


KA_3bit KA_3bit_mod_5 (.a(a3),.b(b3),.y(p5));


KA_3bit KA_3bit_mod_6 (.a(a0^a2^a3),.b(b0^b2^b3),.y(p6));


KA_3bit KA_3bit_mod_7 (.a(a4),.b(b4),.y(p7));


KA_3bit KA_3bit_mod_8 (.a(a2^a4),.b(b2^b4),.y(p8));


KA_3bit KA_3bit_mod_9 (.a(a1^a2^a4),.b(b1^b2^b4),.y(p9));


KA_3bit KA_3bit_mod_10 (.a(a3^a4),.b(b3^b4),.y(p10));


KA_3bit KA_3bit_mod_11 (.a(a0^a1^a3^a4),.b(b0^b1^b3^b4),.y(p11));


KA_3bit KA_3bit_mod_12 (.a(a0^a1^a2^a3^a4),.b(b0^b1^b2^b3^b4),.y(p12));


overlap_10bit ov_mod (.p0(p0),.p1(p1),.p2(p2),.p3(p3),.p4(p4),.p5(p5),.p6(p6),.p7(p7),.p8(p8),.p9(p9),.p10(p10),.p11(p11),.p12(p12),.y(y));

endmodule


module overlap_10bit(p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,y);

input [2:0] p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12;

output [18:0] y;


assign y[1:0] = p0[1:0];

assign y[2:2] = p0[2:2]^p0[0:0]^p1[0:0]^p2[0:0];

assign y[3] = p0[1]^p1[1]^p2[1];

assign y[4:4] = p0[2:2]^p1[2:2]^p2[2:2]^p0[0:0]^p1[0:0]^p3[0:0]^p4[0:0];

assign y[5] = p0[1]^p1[1]^p3[1]^p4[1];

assign y[6:6] = p0[2:2]^p1[2:2]^p3[2:2]^p4[2:2]^p0[0:0]^p3[0:0]^p5[0:0]^p6[0:0]^p7[0:0]^p8[0:0]^p11[0:0]^p12[0:0];

assign y[7] = p0[1]^p3[1]^p5[1]^p6[1]^p7[1]^p8[1]^p11[1]^p12[1];

assign y[8:8] = p0[2:2]^p3[2:2]^p5[2:2]^p6[2:2]^p7[2:2]^p8[2:2]^p11[2:2]^p12[2:2]^p0[0:0]^p1[0:0]^p2[0:0]^p5[0:0]^p6[0:0]^p7[0:0]^p9[0:0]^p10[0:0]^p12[0:0];

assign y[9] = p0[1]^p1[1]^p2[1]^p5[1]^p6[1]^p7[1]^p9[1]^p10[1]^p12[1];

assign y[10:10] = p0[2:2]^p1[2:2]^p2[2:2]^p5[2:2]^p6[2:2]^p7[2:2]^p9[2:2]^p10[2:2]^p12[2:2]^p0[0:0]^p1[0:0]^p3[0:0]^p4[0:0]^p7[0:0]^p9[0:0]^p11[0:0]^p12[0:0];

assign y[11] = p0[1]^p1[1]^p3[1]^p4[1]^p7[1]^p9[1]^p11[1]^p12[1];

assign y[12:12] = p0[2:2]^p1[2:2]^p3[2:2]^p4[2:2]^p7[2:2]^p9[2:2]^p11[2:2]^p12[2:2]^p3[0:0]^p5[0:0]^p7[0:0]^p8[0:0];

assign y[13] = p5[1]^p5[1]^p7[1]^p8[1];

assign y[14:14] = p3[2:2]^p5[2:2]^p7[2:2]^p8[2:2]^p5[0:0]^p7[0:0]^p10[0:0];

assign y[15] = p5[1]^p7[1]^p10[1];

assign y[16:15] = p5[2:2]^p7[2:2]^p10[2:2]^p7[0:0];

assign y[18:17] =p7[2:1];



endmodule


// SchoolBook for 3Bit

// Module: 4

// Module type is : 3 term

module KA_3bit(

   a,

   b,

   y

   );


input [2:0] a;

input [2:0] b;


output [4:0] y;


reg [4:0] y;


always @(a,b)

begin

   y[0] = (a[0] & b[0]);

   y[1] = (a[1] & b[0]) ^ (a[0] & b[1]);

   y[2] = (a[0] & b[2]) ^ (a[1] & b[1]) ^ (a[2] & b[0]);

   y[3] = (a[1] & b[2]) ^ (a[2] & b[1]);

   y[4] = (a[2] & b[2]);


end


endmodule// End of Code5653(



