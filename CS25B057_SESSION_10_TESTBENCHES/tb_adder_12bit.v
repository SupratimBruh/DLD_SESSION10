`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:42:05 PM
// Design Name: 
// Module Name: tb_adder_12bit
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


module tb_adder_12bit;
    reg  [11:0] A, B;
    wire [11:0] sum;
    wire        cout;

    adder_12bit uut (
        .A(A),
        .B(B),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $monitor("Time=%0t | A=%d B=%d | sum=%d cout=%b", $time, A, B, sum, cout);

        A = 12'd100; B = 12'd250; #10;
        A = 12'd4000; B = 12'd95; #10;
        A = 12'd4095; B = 12'd1;  #10; // Carry out test

        $finish;
    end
endmodule
