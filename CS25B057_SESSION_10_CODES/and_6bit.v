`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:03:02 PM
// Design Name: 
// Module Name: and_6bit
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


module and_6bit (
    input  [5:0] A,
    input  [5:0] B,
    output [5:0] out,
    output       valid
);
    assign out   = A & B;
    assign valid = 1'b1;
endmodule