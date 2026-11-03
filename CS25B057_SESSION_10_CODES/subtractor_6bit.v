`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:02:38 PM
// Design Name: 
// Module Name: subtractor_6bit
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


module subtractor_6bit (
    input  [5:0] A,
    input  [5:0] B,
    output [5:0] diff,
    output       borrow,
    output       valid
);
    wire [5:0] c;
    wire [5:0] B_inv = ~B;

    full_adder fa0 (.a(A[0]), .b(B_inv[0]), .cin(1'b1), .sum(diff[0]), .cout(c[0]));
    full_adder fa1 (.a(A[1]), .b(B_inv[1]), .cin(c[0]), .sum(diff[1]), .cout(c[1]));
    full_adder fa2 (.a(A[2]), .b(B_inv[2]), .cin(c[1]), .sum(diff[2]), .cout(c[2]));
    full_adder fa3 (.a(A[3]), .b(B_inv[3]), .cin(c[2]), .sum(diff[3]), .cout(c[3]));
    full_adder fa4 (.a(A[4]), .b(B_inv[4]), .cin(c[3]), .sum(diff[4]), .cout(c[4]));
    full_adder fa5 (.a(A[5]), .b(B_inv[5]), .cin(c[4]), .sum(diff[5]), .cout(c[5]));

    assign borrow = ~c[5];
    // Signed overflow occurs when c[4] ^ c[5] is 1
    assign valid  = ~(c[4] ^ c[5]);
endmodule