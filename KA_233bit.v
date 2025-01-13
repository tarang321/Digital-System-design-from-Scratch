// Sequence:-6--6--7-

// KaratSuba for 233Bit

// Module: 1

// Module type is : 6 term

module KA_233bit(

	a,

	b,

	y

	);

input [232:0] a;

input [232:0] b;

output [464:0] y;

//Since input is only 233 bits, appending 1 bits to a3,b4

//to make overall bitwidth allows us to make 4 equal parts

wire [233:0] aa;

wire [233:0] bb;

assign aa = a;

assign bb = b;

wire [38:0] a0,a1,a2,a3,a4,a5;

wire [38:0] b0,b1,b2,b3,b4,b5;

wire [76:0] p0, p1, p2, p3, p4, p5, p6, p7, p8,p9,p10,p11,p12,p13,p14,p15,p16;

assign a0 = aa[38:0];

assign b0 = bb[38:0];

assign a1 = aa[77:39];

assign b1 = bb[77:39];

assign a2 = aa[116:78];

assign b2 = bb[116:78];

assign a3 = aa[155:117];

assign b3 = bb[155:117];

assign a4 = aa[194:156];

assign b4 = bb[194:156];

assign a5 = aa[233:195];

assign b5 = bb[233:195];

KA_42bit KA_42bit_mod_0 (.a(a0),.b(b0),.y(p0));

KA_42bit KA_42bit_mod_1 (.a(a1),.b(b1),.y(p1));

KA_42bit KA_42bit_mod_2 (.a((a0 ^ a1)),.b((b0 ^ b1)),.y(p2));

KA_42bit KA_42bit_mod_3 (.a((a1 ^ a2)),.b((b1 ^ b2)),.y(p3));

KA_42bit KA_42bit_mod_4 (.a((a0 ^ a1 ^ a2)),.b((b0 ^ b1 ^ b2)),.y(p4));

KA_42bit KA_42bit_mod_5 (.a((a2 ^ a3)),.b((b2 ^ b3)),.y(p5));

KA_42bit KA_42bit_mod_6 (.a(a4),.b(b4),.y(p6));

KA_42bit KA_42bit_mod_7 (.a((a1 ^ a4)),.b((b1 ^ b4)),.y(p7));

KA_42bit KA_42bit_mod_8 (.a((a3 ^ a4)),.b((b3 ^ b4)),.y(p8));

KA_42bit KA_42bit_mod_9 (.a((a0 ^ a1 ^ a3 ^ a4)),.b((b0 ^ b1 ^ b3 ^ b4)),.y(p9));

KA_42bit KA_42bit_mod_10 (.a(a5),.b(b5),.y(p10));

KA_42bit KA_42bit_mod_11 (.a((a0 ^ a2 ^ a5)),.b((b0 ^ b2 ^ b5)),.y(p11));

KA_42bit KA_42bit_mod_12 (.a((a0 ^ a3 ^ a5)),.b((b0 ^ b3 ^ b5)),.y(p12));

KA_42bit KA_42bit_mod_13 (.a((a0 ^ a2 ^ a3 ^ a5)),.b((b0 ^ b2 ^ b3 ^ b5)),.y(p13));

KA_42bit KA_42bit_mod_14 (.a((a4 ^ a5)),.b((b4 ^ b5)),.y(p14));

KA_42bit KA_42bit_mod_15 (.a((a1 ^ a2 ^ a4 ^ a5)),.b((b1 ^ b2 ^ b4 ^ b5)),.y(p15));

KA_42bit KA_42bit_mod_16 (.a((a3 ^ a4 ^ a5)),.b((b3 ^ b4 ^ b5)),.y(p16));

overlap_234bit ov_mod (.p0(p0),.p1(p1),.p2(p2),.p3(p3),.p4(p4),.p5(p5),.p6(p6),.p7(p7),.p8(p8),.p9(p9),.p10(p10),.p11(p11),.p12(p12),.p13(p13),.p14(p14),.p15(p15),.p16(p16),.y(y));

endmodule

// overlap modulue for 234 bit

module overlap_234bit(p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,y);

input [76:0] p0, p1, p2, p3, p4, p5, p6, p7, p8,p9,p10,p11,p12,p13,p14,p15,p16;

output [466:0] y;

assign y[38:0] = p0[38:0];

assign y[76:39] = p0[76:39]^p0[37:0]^p1[37:0]^p2[37:0];

assign y[77] = p0[38]^p1[38]^p2[38];

assign y[115:78] = p0[76:39]^p1[76:39]^p2[76:39]^p2[37:0]^p3[37:0]^p4[37:0];

assign y[116] =p2[38]^p3[38]^p4[38];

assign y[154:117] =p2[76:39]^p3[76:39]^p4[76:39]^p1[37:0]^p3[37:0]^p5[37:0]^p6[37:0]^p8[37:0]^p11[37:0]^p13[37:0]^p14[37:0]^p16[37:0];

assign y[155] = p1[38]^p3[38]^p5[38]^p6[38]^p8[38]^p11[38]^p13[38]^p14[38]^p16[38];

assign y[193:156] = p1[76:39] ^ p3[76:39] ^ p5[76:39] ^ p6[76:39] ^ p8[76:39] ^ p11[76:39] ^ p13[76:39] ^ p14[76:39] ^ p16[76:39] ^ p1[37:0] ^ p2[37:0] ^ p5[37:0] ^ p7[37:0] ^ p9[37:0] ^ p11[37:0] ^ p13[37:0] ^ p14[37:0] ^ p16[37:0];

assign y[194] = p1[38] ^ p2[38] ^ p5[38] ^ p7[38] ^ p9[38] ^ p11[38] ^ p13[38] ^ p14[38] ^ p16[38];

assign y[232:195] = p1[76:39] ^ p2[76:39] ^ p5[76:39] ^ p7[76:39] ^ p9[76:39] ^ p11[76:39] ^ p13[76:39] ^ p14[76:39] ^ p16[76:39] ^ p0[37:0] ^ p1[37:0] ^ p6[37:0] ^ p7[37:0] ^ p10[37:0] ^ p11[37:0] ^ p12[37:0] ^ p13[37:0];

assign y[233] = p0[38] ^ p1[38] ^ p6[38] ^ p7[38] ^ p10[38] ^ p11[38] ^ p12[38] ^ p13[38];

assign y[271:234] = p0[76:39] ^ p1[76:39] ^ p6[76:39] ^ p7[76:39] ^ p10[76:39] ^ p11[76:39] ^ p12[76:39] ^ p13[76:39] ^ p2[37:0] ^ p4[37:0] ^ p5[37:0] ^ p6[37:0] ^ p7[37:0] ^ p12[37:0] ^ p13[37:0] ^ p14[37:0] ^ p15[37:0];

assign y[272] = p2[38] ^ p4[38] ^ p5[38] ^ p6[38] ^ p7[38] ^ p12[38] ^ p13[38] ^ p14[38] ^ p15[38];

assign y[310:273] = p2[76:39] ^ p4[76:39] ^ p5[76:39] ^ p6[76:39] ^ p7[76:39] ^ p12[76:39] ^ p13[76:39] ^ p14[76:39] ^ p15[76:39] ^ p1[37:0] ^ p2[37:0] ^ p3[37:0] ^ p4[37:0] ^ p5[37:0] ^ p6[37:0] ^ p8[37:0] ^ p12[37:0] ^ p13[37:0];

assign y[311] = p1[38] ^ p2[38] ^ p3[38] ^ p4[38] ^ p5[38] ^ p6[38] ^ p8[38] ^ p12[38] ^ p13[38];

assign y[349:312] = p1[76:39] ^ p2[76:39] ^ p3[76:39] ^ p4[76:39] ^ p5[76:39] ^ p6[76:39] ^ p8[76:39] ^ p12[76:39] ^ p13[76:39] ^ p8[37:0] ^ p14[37:0] ^ p16[37:0];

assign y[350] = p8[38] ^ p14[38] ^ p16[38];

assign y[388:351] = p8[76:39] ^ p14[76:39] ^ p16[76:39] ^ p6[37:0] ^ p10[37:0] ^ p14[37:0];

assign y[389] = p6[38] ^ p10[38] ^ p14[38];

assign y[427:390] = p6[76:39] ^ p10[76:39] ^ p14[76:39] ^ p10[37:0];

assign y[466:428] =p10[76:38];

endmodule

// KaratSuba for 42Bit

// Module: 2

// Module type is : 6 term

module KA_42bit(

	a,

	b,

	y

	);

input [41:0] a;

input [41:0] b;

output [82:0] y;

wire [41:0] aa;

wire [41:0] bb;

assign aa = a;

assign bb = b;

wire [6:0] a0,a1,a2,a3,a4,a5;

wire [6:0] b0,b1,b2,b3,b4,b5;

wire [12:0] p0, p1, p2, p3, p4, p5, p6, p7, p8,p9,p10,p11,p12,p13,p14,p15,p16;

assign a0 = aa[6:0];

assign b0 = bb[6:0];

assign a1 = aa[13:7];

assign b1 = bb[13:7];

assign a2 = aa[20:14];

assign b2 = bb[20:14];

assign a3 = aa[27:21];

assign b3 = bb[27:21];

assign a4 = aa[34:28];

assign b4 = bb[34:28];

assign a5 = aa[41:35];

assign b5 = bb[41:35];

KA_7bit KA_7bit_mod_0 (.a(a0),.b(b0),.y(p0));

KA_7bit KA_7bit_mod_1 (.a(a1),.b(b1),.y(p1));

KA_7bit KA_7bit_mod_2 (.a((a0 ^ a1)),.b((b0 ^ b1)),.y(p2));

KA_7bit KA_7bit_mod_3 (.a((a1 ^ a2)),.b((b1 ^ b2)),.y(p3));

KA_7bit KA_7bit_mod_4 (.a((a0 ^ a1 ^ a2)),.b((b0 ^ b1 ^ b2)),.y(p4));

KA_7bit KA_7bit_mod_5 (.a((a2 ^ a3)),.b((b2 ^ b3)),.y(p5));

KA_7bit KA_7bit_mod_6 (.a(a4),.b(b4),.y(p6));

KA_7bit KA_7bit_mod_7 (.a((a1 ^ a4)),.b((b1 ^ b4)),.y(p7));

KA_7bit KA_7bit_mod_8 (.a((a3 ^ a4)),.b((b3 ^ b4)),.y(p8));

KA_7bit KA_7bit_mod_9 (.a((a0 ^ a1 ^ a3 ^ a4)),.b((b0 ^ b1 ^ b3 ^ b4)),.y(p9));

KA_7bit KA_7bit_mod_10 (.a(a5),.b(b5),.y(p10));

KA_7bit KA_7bit_mod_11 (.a((a0 ^ a2 ^ a5)),.b((b0 ^ b2 ^ b5)),.y(p11));

KA_7bit KA_7bit_mod_12 (.a((a0 ^ a3 ^ a5)),.b((b0 ^ b3 ^ b5)),.y(p12));

KA_7bit KA_7bit_mod_13 (.a((a0 ^ a2 ^ a3 ^ a5)),.b((b0 ^ b2 ^ b3 ^ b5)),.y(p13));

KA_7bit KA_7bit_mod_14 (.a((a4 ^ a5)),.b((b4 ^ b5)),.y(p14));

KA_7bit KA_7bit_mod_15 (.a((a1 ^ a2 ^ a4 ^ a5)),.b((b1 ^ b2 ^ b4 ^ b5)),.y(p15));

KA_7bit KA_7bit_mod_16 (.a((a3 ^ a4 ^ a5)),.b((b3 ^ b4 ^ b5)),.y(p16));

overlap_42bit ov_mod (.p0(p0),.p1(p1),.p2(p2),.p3(p3),.p4(p4),.p5(p5),.p6(p6),.p7(p7),.p8(p8),.p9(p9),.p10(p10),.p11(p11),.p12(p12),.p13(p13),.p14(p14),.p15(p15),.p16(p16),.y(y));

endmodule

// overlap modulue for 42 bit

module overlap_42bit(p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,y);

input [12:0] p0, p1, p2, p3, p4, p5, p6, p7, p8,p9,p10,p11,p12,p13,p14,p15,p16;

output [82:0] y;

assign y[6:0] = p0[6:0];

assign y[12:7] = p0[12:7]^p0[5:0]^p1[5:0]^p2[5:0];

assign y[13] = p0[6]^p1[6]^p2[6];

assign y[19:14] = p0[12:7]^p1[12:7]^p2[12:7]^p2[5:0]^p3[5:0]^p4[5:0];

assign y[20] =p2[6]^p3[6]^p4[6];

assign y[26:21] =p2[12:7]^p3[12:7]^p4[12:7]^p1[5:0]^p3[5:0]^p5[5:0]^p6[5:0]^p8[5:0]^p11[5:0]^p13[5:0]^p14[5:0]^p16[5:0];

assign y[27] = p1[6]^p3[6]^p5[6]^p6[6]^p8[6]^p11[6]^p13[6]^p14[6]^p16[6];

assign y[33:28] = p1[12:7] ^ p3[12:7] ^ p5[12:7] ^ p6[12:7] ^ p8[12:7] ^ p11[12:7] ^ p13[12:7] ^ p14[12:7] ^ p16[12:7] ^ p1[5:0] ^ p2[5:0] ^ p5[5:0] ^ p7[5:0] ^ p9[5:0] ^ p11[5:0] ^ p13[5:0] ^ p14[5:0] ^ p16[5:0];

assign y[34] = p1[6] ^ p2[6] ^ p5[6] ^ p7[6] ^ p9[6] ^ p11[6] ^ p13[6] ^ p14[6] ^ p16[6];

assign y[40:35] = p1[12:7] ^ p2[12:7] ^ p5[12:7] ^ p7[12:7] ^ p9[12:7] ^ p11[12:7] ^ p13[12:7] ^ p14[12:7] ^ p16[12:7] ^ p0[5:0] ^ p1[5:0] ^ p6[5:0] ^ p7[5:0] ^ p10[5:0] ^ p11[5:0] ^ p12[5:0] ^ p13[5:0];

assign y[41] = p0[6] ^ p1[6] ^ p6[6] ^ p7[6] ^ p10[6] ^ p11[6] ^ p12[6] ^ p13[6];

assign y[47:42] = p0[12:7] ^ p1[12:7] ^ p6[12:7] ^ p7[12:7] ^ p10[12:7] ^ p11[12:7] ^ p12[12:7] ^ p13[12:7] ^ p2[5:0] ^ p4[5:0] ^ p5[5:0] ^ p6[5:0] ^ p7[5:0] ^ p12[5:0] ^ p13[5:0] ^ p14[5:0] ^ p15[5:0];

assign y[48] = p2[6] ^ p4[6] ^ p5[6] ^ p6[6] ^ p7[6] ^ p12[6] ^ p13[6] ^ p14[6] ^ p15[6];

assign y[54:49] = p2[12:7] ^ p4[12:7] ^ p5[12:7] ^ p6[12:7] ^ p7[12:7] ^ p12[12:7] ^ p13[12:7] ^ p14[12:7] ^ p15[12:7] ^ p1[5:0] ^ p2[5:0] ^ p3[5:0] ^ p4[5:0] ^ p5[5:0] ^ p6[5:0] ^ p8[5:0] ^ p12[5:0] ^ p13[5:0];

assign y[55] = p1[6] ^ p2[6] ^ p3[6] ^ p4[6] ^ p5[6] ^ p6[6] ^ p8[6] ^ p12[6] ^ p13[6];

assign y[61:56] = p1[12:7] ^ p2[12:7] ^ p3[12:7] ^ p4[12:7] ^ p5[12:7] ^ p6[12:7] ^ p8[12:7] ^ p12[12:7] ^ p13[12:7] ^ p8[5:0] ^ p14[5:0] ^ p16[5:0];

assign y[62] = p8[6] ^ p14[6] ^ p16[6];

assign y[68:63] = p8[12:7] ^ p14[12:7] ^ p16[12:7] ^ p6[5:0] ^ p10[5:0] ^ p14[5:0];

assign y[69] = p6[6] ^ p10[6] ^ p14[6];

assign y[75:70] = p6[12:7] ^ p10[12:7] ^ p14[12:7] ^ p10[5:0];

assign y[82:76] =p10[12:6];

endmodule

// SchoolBook for 7Bit

// Module: 3

// Module type is : 7 term

module KA_7bit(

	a,

	b,

	y

	);

input [6:0] a;

input [6:0] b;

output [12:0] y;

reg [12:0] y;

always @(a,b)

begin

	 y[0] = (a[0] & b[0]);

	y[1] = ((a[0] & b[1]) ^ (a[1] & b[0]));

	y[2] = ((a[0] & b[2]) ^ (a[1] & b[1]) ^ (a[2] & b[0]));

	y[3] = ((a[0] & b[3]) ^ (a[1] & b[2]) ^ (a[2] & b[1]) ^ (a[3] & b[0]));

	y[4] = ((a[0] & b[4]) ^ (a[1] & b[3]) ^ (a[2] & b[2]) ^ (a[3] & b[1]) ^ (a[4] & b[0]));

	y[5] = ((a[0] & b[5]) ^ (a[1] & b[4]) ^ (a[2] & b[3]) ^ (a[3] & b[2]) ^ (a[4] & b[1]) ^ (a[5] & b[0]));

	y[6] = ((a[0] & b[6]) ^ (a[1] & b[5]) ^ (a[2] & b[4]) ^ (a[3] & b[3]) ^ (a[4] & b[2]) ^ (a[5] & b[1]) ^ (a[6] & b[0]));

	y[7] = ((a[1] & b[6]) ^ (a[2] & b[5]) ^ (a[3] & b[4]) ^ (a[4] & b[3]) ^ (a[5] & b[2]) ^ (a[6] & b[1]));

	y[8] = ((a[2] & b[6]) ^ (a[3] & b[5]) ^ (a[4] & b[4]) ^ (a[5] & b[3]) ^ (a[6] & b[2]));

	y[9] = ((a[3] & b[6]) ^ (a[4] & b[5]) ^ (a[5] & b[4]) ^ (a[6] & b[3]));

	y[10] = ((a[4] & b[6]) ^ (a[5] & b[5]) ^ (a[6] & b[4]));

	y[11] = ((a[5] & b[6]) ^ (a[6] & b[5]));

	y[12] = (a[6] & b[6]);

end

endmodule// End of Code


