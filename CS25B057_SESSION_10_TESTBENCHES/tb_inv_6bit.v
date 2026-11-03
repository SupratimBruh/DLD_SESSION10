`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:42:58 PM
// Design Name: 
// Module Name: tb_inv_6bit
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


module tb_inv_6bit;
    reg  [5:0] A;
    wire [5:0] out;
    wire       valid;

    inv_6bit uut (
        .A(A),
        .out(out),
        .valid(valid)
    );

    initial begin
        $monitor("Time=%0t | A=%b | out=%b valid=%b", $time, A, out, valid);

        A = 6'b101010; #10;
        A = 6'b000000; #10;
        A = 6'b111111; #10;

        $finish;
    end
endmodule