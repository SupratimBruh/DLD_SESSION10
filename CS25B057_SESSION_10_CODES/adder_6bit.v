`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:01:50 PM
// Design Name: 
// Module Name: adder_6bit
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


module adder_6bit (
    input  [5:0] A,
    input  [5:0] B,
    output [5:0] sum,
    output       valid
);
    wire [5:0] c;

    half_adder ha0 (.a(A[0]), .b(B[0]), .sum(sum[0]), .carry(c[0]));
    full_adder fa1 (.a(A[1]), .b(B[1]), .cin(c[0]), .sum(sum[1]), .cout(c[1]));
    full_adder fa2 (.a(A[2]), .b(B[2]), .cin(c[1]), .sum(sum[2]), .cout(c[2]));
    full_adder fa3 (.a(A[3]), .b(B[3]), .cin(c[2]), .sum(sum[3]), .cout(c[3]));
    full_adder fa4 (.a(A[4]), .b(B[4]), .cin(c[3]), .sum(sum[4]), .cout(c[4]));
    full_adder fa5 (.a(A[5]), .b(B[5]), .cin(c[4]), .sum(sum[5]), .cout(c[5]));

    // Signed overflow occurs when c[4] ^ c[5] is 1
    assign valid = ~(c[4] ^ c[5]);
endmodule
