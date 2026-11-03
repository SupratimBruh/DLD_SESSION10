`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:42:20 PM
// Design Name: 
// Module Name: tb_and_6bit
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


module tb_and_6bit;
    reg  [5:0] A, B;
    wire [5:0] out;
    wire       valid;

    and_6bit uut (
        .A(A),
        .B(B),
        .out(out),
        .valid(valid)
    );

    initial begin
        $monitor("Time=%0t | A=%b B=%b | out=%b valid=%b", $time, A, B, out, valid);

        A = 6'b101101; B = 6'b110011; #10;
        A = 6'b111111; B = 6'b000000; #10;

        $finish;
    end
endmodule
