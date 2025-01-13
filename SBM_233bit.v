// Sequence:-4--3--5--4-

// KaratSuba for 233Bit

// Module: 1

// Module type is : 4 term

module KA_233bit(

	a,

	b,

	y

	);

input [232:0] a;

input [232:0] b;

output [464:0] y;

//Since input is only 233 bits, appending 3 bits to a3,b4

//to make overall bitwidth allows us to make 4 equal parts

wire [235:0] aa;

wire [235:0] bb;

assign aa = a;

assign bb = b;

wire [58:0] a0,a1,a2,a3;

wire [58:0] b0,b1,b2,b3;

wire [116:0] p0, p1, p2, p3, p4, p5, p6, p7, p8;

assign a0 = aa[58:0];

assign b0 = bb[58:0];

assign a1 = aa[117:59];

assign b1 = bb[117:59];

assign a2 = aa[176:118];

assign b2 = bb[176:118];

assign a3 = aa[235:177];

assign b3 = bb[235:177];

//Since 59 bit modulues cant be produced, creating next possible module of 60 bits and sening 1 zeros in extra bit widths

KA_60bit KA_60bit_mod_0 (.a({a0}),.b({b0}),.y(p0));

KA_60bit KA_60bit_mod_1 (.a({a1}),.b({b1}),.y(p1));

KA_60bit KA_60bit_mod_2 (.a(({a0} ^ {a1} )),.b(({b0} ^ {b1}) ),.y(p2));

KA_60bit KA_60bit_mod_3 (.a({a2}),.b({b2}),.y(p3));

KA_60bit KA_60bit_mod_4 (.a(({a0} ^ {a2} )),.b(({b0} ^ {b2})),.y(p4));

KA_60bit KA_60bit_mod_5 (.a(({a3} )),.b(({b3})),.y(p5));

KA_60bit KA_60bit_mod_6 (.a(({a1} ^ {a3} )),.b(({b1} ^ {b3})),.y(p6));

KA_60bit KA_60bit_mod_7 (.a(({a2} ^ {a3} )),.b(({b2} ^ {b3})),.y(p7));

KA_60bit KA_60bit_mod_8 (.a(({a0} ^ {a1} ^ {a2} ^ {a3} )),.b(({b0} ^ {b1} ^ {b2} ^ {b3})),.y(p8));

overlap_236bit ov_mod (.p0(p0),.p1(p1),.p2(p2),.p3(p3),.p4(p4),.p5(p5),.p6(p6),.p7(p7),.p8(p8),.y(y));

endmodule

// overlap modulue for 236 bit

module overlap_236bit(p0,p1,p2,p3,p4,p5,p6,p7,p8,y);

input [116:0] p0, p1, p2, p3, p4, p5, p6, p7, p8;

output [470:0] y;

assign y[58:0] = p0[58:0];

assign y[116:59] = p0[116:59]^p0[57:0]^p1[57:0]^p2[57:0];

assign y[117] = p0[58]^p1[58]^p2[58];

assign y[175:118] = p0[116:59]^p1[116:59]^p2[116:59]^p0[57:0]^p1[57:0]^p3[57:0]^p4[57:0];

assign y[176] =p0[58]^p1[58]^p3[58]^p4[58];

assign y[234:177] =p0[116:59]^p1[116:59]^p3[116:59]^p4[116:59]^p0[57:0]^p1[57:0]^p2[57:0]^p3[57:0]^p4[57:0]^p5[57:0]^p6[57:0]^p7[57:0]^p8[57:0];

assign y[235] = p0[58]^p1[58]^p2[58]^p3[58]^p4[58]^p5[58]^p6[58]^p7[58]^p8[58];

assign y[293:236] = p0[116:59] ^ p1[116:59] ^ p2[116:59] ^ p3[116:59] ^ p4[116:59] ^ p5[116:59] ^ p6[116:59] ^ p7[116:59] ^ p8[116:59] ^ p1[57:0] ^ p3[57:0] ^ p5[57:0] ^ p6[57:0];

assign y[294] = p1[58] ^ p3[58] ^ p5[58] ^ p6[58];

assign y[352:295] = p1[116:59] ^ p3[116:59] ^ p5[116:59] ^ p6[116:59] ^ p3[57:0] ^ p5[57:0] ^ p7[57:0];

assign y[353] = p3[58] ^ p5[58] ^ p7[58];

assign y[411:354] = p3[116:59]^ p5[116:59]^ p7[116:59]^ p5[57:0];

assign y[470:412] =p5[116:58];

endmodule

// KaratSuba for 60Bit

// Module: 2

// Module type is : 3 term

module KA_60bit(

	a,

	b,

	y

	);

input [59:0] a;

input [59:0] b;

output [118:0] y;

wire [59:0] aa;

wire [59:0] bb;

assign aa = a;

assign bb =b;

wire [19:0] a0,a1,a2;

wire [19:0] b0,b1,b2;

wire [38:0] p0,p1,p2,p3,p4,p5;

assign a0 = aa[19:0];

assign b0 = bb[19:0];

assign a1 = aa[39:20];

assign b1 = bb[39:20];

assign a2 = aa[59:40];

assign b2 = bb[59:40];

KA_20bit KA_20bit_mod_0 (.a(a0),.b(b0),.y(p0));

KA_20bit KA_20bit_mod_1 (.a(a1),.b(b1),.y(p1));

KA_20bit KA_20bit_mod_2 (.a((a0 ^ a1 )),.b((b0 ^ b1) ),.y(p2));

KA_20bit KA_20bit_mod_3 (.a(a2),.b(b2),.y(p3));

KA_20bit KA_20bit_mod_4 (.a((a0 ^ a2 )),.b((b0 ^ b2)),.y(p4));

KA_20bit KA_20bit_mod_5 (.a((a2 ^ a1 )),.b((b2 ^ b1)),.y(p5));

overlap_60bit ov_mod ( .p0(p0),.p1(p1),.p2(p2),.p3(p3),.p4(p4),.p5(p5),.y(y));

endmodule

module overlap_60bit(p0,p1,p2,p3,p4,p5,y);

input [38:0] p0,p1,p2,p3,p4,p5;

output [118:0] y;

assign y[19:0] = p0[19:0];

assign y[38:20] = p0[38:20]^p0[18:0]^p1[18:0]^p2[18:0];

assign y[39] = p0[19]^p1[19]^p2[19];

assign y[58:40] = p0[38:20]^p1[38:20]^p2[38:20]^p0[18:0]^p1[18:0]^p3[18:0]^p4[18:0];

assign y[59] = p0[19]^p1[19]^p3[19]^p4[19];

assign y[78:60] = p0[38:20]^p1[38:20]^p3[38:20]^p4[38:20]^p1[18:0]^p3[18:0]^p5[18:0];

assign y[79] = p1[19]^p5[19]^p3[19];

assign y[98:80] = p1[38:20]^p5[38:20]^p3[38:20]^p3[18:0];

assign y[118:99] = p3[38:19];

endmodule

// KaratSuba for 20Bit

// Module: 3

// Module type is : 5 term

module KA_20bit(

	a,

	b,

	y

	);

input [19:0] a;

input [19:0] b;

output [38:0] y;

wire [19:0] aa;

wire [19:0] bb;

assign aa = a;

assign bb = b;

wire [3:0] a0,a1,a2,a3,a4;

wire [3:0] b0,b1,b2,b3,b4;

wire [6:0] p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12;

assign a0 = aa[3:0];

assign b0 = bb[3:0];

assign a1 = aa[7:4];

assign b1 = bb[7:4];

assign a2 = aa[19:8];

assign b2 = bb[19:8];

assign a3 = aa[15:12];

assign b3 = bb[15:12];

assign a4 = aa[19:16];

assign b4 = bb[19:16];

KA_4bit KA_4bit_mod_0 (.a(a0),.b(b0),.y(p0));

KA_4bit KA_4bit_mod_1 (.a(a1),.b(b1),.y(p1));

KA_4bit KA_4bit_mod_2 (.a(a0^a1),.b(b0^b1),.y(p2));

KA_4bit KA_4bit_mod_3 (.a(a2),.b(b2),.y(p3));

KA_4bit KA_4bit_mod_4 (.a(a0^a2),.b(b0^b2),.y(p4));

KA_4bit KA_4bit_mod_5 (.a(a3),.b(b3),.y(p5));

KA_4bit KA_4bit_mod_6 (.a(a0^a2^a3),.b(b0^b2^b3),.y(p6));

KA_4bit KA_4bit_mod_7 (.a(a4),.b(b4),.y(p7));

KA_4bit KA_4bit_mod_8 (.a(a2^a4),.b(b2^b4),.y(p8));

KA_4bit KA_4bit_mod_9 (.a(a1^a2^a4),.b(b1^b2^b4),.y(p9));

KA_4bit KA_4bit_mod_10 (.a(a3^a4),.b(b3^b4),.y(p10));

KA_4bit KA_4bit_mod_11 (.a(a0^a1^a3^a4),.b(b0^b1^b3^b4),.y(p11));

KA_4bit KA_4bit_mod_12 (.a(a0^a1^a2^a3^a4),.b(b0^b1^b2^b3^b4),.y(p12));

overlap_20bit ov_mod (.p0(p0),.p1(p1),.p2(p2),.p3(p3),.p4(p4),.p5(p5),.p6(p6),.p7(p7),.p8(p8),.p9(p9),.p10(p10),.p11(p11),.p12(p12),.y(y));

endmodule

module overlap_20bit(p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,y);

input [6:0] p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12;

output [38:0] y;

assign y[3:0] = p0[3:0];

assign y[6:4] = p0[6:4]^p0[2:0]^p1[2:0]^p2[2:0];

assign y[7] = p0[3]^p1[3]^p2[3];

assign y[10:8] = p0[6:4]^p1[6:4]^p2[6:4]^p0[2:0]^p1[2:0]^p3[2:0]^p4[2:0];

assign y[11] = p0[3]^p1[3]^p3[3]^p4[3];

assign y[14:12] = p0[6:4]^p1[6:4]^p3[6:4]^p4[6:4]^p0[2:0]^p3[2:0]^p5[2:0]^p6[2:0]^p7[2:0]^p8[2:0]^p11[2:0]^p12[2:0];

assign y[15] = p0[3]^p3[3]^p5[3]^p6[3]^p7[3]^p8[3]^p11[3]^p12[3];

assign y[18:16] = p0[6:4]^p3[6:4]^p5[6:4]^p6[6:4]^p7[6:4]^p8[6:4]^p11[6:4]^p12[6:4]^p0[2:0]^p1[2:0]^p2[2:0]^p5[2:0]^p6[2:0]^p7[2:0]^p9[2:0]^p10[2:0]^p12[2:0];

assign y[19] = p0[3]^p1[3]^p2[3]^p5[3]^p6[3]^p7[3]^p9[3]^p10[3]^p12[3];

assign y[22:20] = p0[6:4]^p1[6:4]^p2[6:4]^p5[6:4]^p6[6:4]^p7[6:4]^p9[6:4]^p10[6:4]^p12[6:4]^p0[2:0]^p1[2:0]^p3[2:0]^p4[2:0]^p7[2:0]^p9[2:0]^p11[2:0]^p12[2:0];

assign y[23] = p0[3]^p1[3]^p3[3]^p4[3]^p7[3]^p9[3]^p11[3]^p12[3];

assign y[26:24] = p0[6:4]^p1[6:4]^p3[6:4]^p4[6:4]^p7[6:4]^p9[6:4]^p11[6:4]^p12[6:4]^p3[2:0]^p5[2:0]^p7[2:0]^p8[2:0];

assign y[27] = p5[3]^p5[3]^p7[3]^p8[3];

assign y[30:28] = p3[6:4]^p5[6:4]^p7[6:4]^p8[6:4]^p5[2:0]^p7[2:0]^p10[2:0];

assign y[31] = p5[3]^p7[3]^p10[3];

assign y[34:31] = p5[6:4]^p7[6:4]^p10[6:4]^p7[2:0];

assign y[38:35] =p7[6:3];

endmodule

// SchoolBook for 4Bit

// Module: 4

// Module type is : 4 term

module KA_4bit(

	a,

	b,

	y

	);

input [3:0] a;

input [3:0] b;

output [6:0] y;

reg [6:0] y;

always @(a,b)

begin

	y[0] = (a[0] & b[0]);

	y[1] = (a[1] & b[0]) ^ (a[0] & b[1]);

	y[2] = (a[2] & b[0]) ^ (a[0] & b[2]) ^ (a[1] & b[1]);

	y[3] = (a[3] & b[0]) ^ (a[0] & b[3]) ^ (a[2] & b[1]) ^ (a[1] & b[2]) ;

	y[4] = (a[3] & b[1]) ^ (a[1] & b[3]) ^ (a[2] & b[2]);

	y[5] = (a[3] & b[2]) ^ (a[2] & b[3]);

	y[6] = (a[3] & b[3]);

end

endmodule// End of Code


