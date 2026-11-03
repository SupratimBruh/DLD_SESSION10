`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:43:36 PM
// Design Name: 
// Module Name: tb_comparator_6bit
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


module tb_comparator_6bit;
    reg  [5:0] A, B;
    wire [1:0] comp_out;
    wire       valid;

    comparator_6bit uut (
        .A(A),
        .B(B),
        .comp_out(comp_out),
        .valid(valid)
    );

    initial begin
        $monitor("Time=%0t | A=%d B=%d | comp_out=%b (00:Equal, 01:Greater, 10:Smaller) valid=%b",
                 $time, A, B, comp_out, valid);

        A = 6'd25; B = 6'd25; #10; // Equal   (2'b00)
        A = 6'd40; B = 6'd15; #10; // Greater (2'b01)
        A = 6'd5;  B = 6'd20; #10; // Smaller (2'b10)

        $finish;
    end
endmodule
