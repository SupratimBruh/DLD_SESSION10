`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:41:50 PM
// Design Name: 
// Module Name: tb_subtractor_6bit
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

module tb_subtractor_6bit;
    reg  [5:0] A, B;
    wire [5:0] diff;
    wire       borrow, valid;

    subtractor_6bit uut (
        .A(A),
        .B(B),
        .diff(diff),
        .borrow(borrow),
        .valid(valid)
    );

    initial begin
        $monitor("Time=%0t | A=%d B=%d | diff=%d borrow=%b valid=%b", $time, A, B, diff, borrow, valid);

        // Normal Subtraction (A >= B)
        A = 6'd30; B = 6'd10; #10;
        A = 6'd15; B = 6'd15; #10;

        // Underflow Condition (A < B)
        A = 6'd10; B = 6'd20; #10;

        $finish;
    end
endmodule
