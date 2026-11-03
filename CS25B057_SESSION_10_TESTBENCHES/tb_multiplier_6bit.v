`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:43:15 PM
// Design Name: 
// Module Name: tb_multiplier_6bit
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

module tb_multiplier_6bit;
    reg  [5:0] A, B;
    wire [5:0] prod;
    wire       valid;

    multiplier_6bit uut (
        .A(A),
        .B(B),
        .prod(prod),
        .valid(valid)
    );

    initial begin
        $monitor("Time=%0t | A=%d B=%d | prod=%d valid=%b", $time, A, B, prod, valid);

        // Normal multiplication (Prod <= 63)
        A = 6'd5; B = 6'd8; #10; // Prod = 40, Valid = 1
        A = 6'd7; B = 6'd9; #10; // Prod = 63, Valid = 1

        // Overflow condition (Prod > 63)
        A = 6'd10; B = 6'd10; #10; // Prod = 100, Valid = 0

        $finish;
    end
endmodule
