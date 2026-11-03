`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:41:33 PM
// Design Name: 
// Module Name: tb_adder_6bit
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


module tb_adder_6bit;
    reg  [5:0] A, B;
    wire [5:0] sum;
    wire       valid;

    adder_6bit uut (
        .A(A),
        .B(B),
        .sum(sum),
        .valid(valid)
    );

    initial begin
        $monitor("Time=%0t | A=%d B=%d | sum=%d valid=%b", $time, A, B, sum, valid);

        // Normal addition (Sum <= 63)
        A = 6'd20; B = 6'd15; #10;
        A = 6'd35; B = 6'd28; #10; // Sum = 63 (Max representable)

        // Overflow condition (Sum > 63)
        A = 6'd40; B = 6'd30; #10; // Sum = 70 (Overflow)

        $finish;
    end
endmodule
