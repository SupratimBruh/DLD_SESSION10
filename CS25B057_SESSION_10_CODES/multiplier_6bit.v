`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:04:08 PM
// Design Name: 
// Module Name: multiplier_6bit
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


module multiplier_6bit (
    input  [5:0] A,
    input  [5:0] B,
    output [5:0] prod,
    output       valid
);
    // Sign-extend A to 12 bits
    wire [11:0] A_ext = {{6{A[5]}}, A};

    // Generate partial products
    wire [11:0] pp0     = {12{B[0]}} & A_ext;
    wire [11:0] pp1     = {12{B[1]}} & {A_ext[10:0], 1'b0};
    wire [11:0] pp2     = {12{B[2]}} & {A_ext[9:0],  2'b00};
    wire [11:0] pp3     = {12{B[3]}} & {A_ext[8:0],  3'b000};
    wire [11:0] pp4     = {12{B[4]}} & {A_ext[7:0],  4'b0000};
    wire [11:0] pp5_pos = {12{B[5]}} & {A_ext[6:0],  5'b00000};

    wire [11:0] s1, s2, s3, s4, full_prod;

    // Accumulate positive partial products
    adder_12bit add0 (.A(pp0), .B(pp1), .cin(1'b0), .sum(s1), .cout());
    adder_12bit add1 (.A(s1),  .B(pp2), .cin(1'b0), .sum(s2), .cout());
    adder_12bit add2 (.A(s2),  .B(pp3), .cin(1'b0), .sum(s3), .cout());
    adder_12bit add3 (.A(s3),  .B(pp4), .cin(1'b0), .sum(s4), .cout());

    // Subtract B[5] partial product (~pp5_pos + 1)
    adder_12bit add4 (.A(s4),  .B(~pp5_pos), .cin(1'b1), .sum(full_prod), .cout());

    assign prod = full_prod[5:0];

    // Valid if upper 6 bits match the sign bit prod[5]
    assign valid = &(~(full_prod[11:6] ^ {6{full_prod[5]}}));
endmodule