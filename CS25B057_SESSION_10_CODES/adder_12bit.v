`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:38:17 PM
// Design Name: 
// Module Name: adder_12bit
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


module adder_12bit (
    input  [11:0] A,
    input  [11:0] B,
    input         cin,
    output [11:0] sum,
    output        cout
);
    wire [12:0] c;
    assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 12; i = i + 1) begin : gen_add12
            full_adder fa (
                .a(A[i]),
                .b(B[i]),
                .cin(c[i]),
                .sum(sum[i]),
                .cout(c[i+1])
            );
        end
    endgenerate

    assign cout = c[12];
endmodule
