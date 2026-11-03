`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:08:04 PM
// Design Name: 
// Module Name: alu_top_tb
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


module alu_top_tb;
    reg  [5:0] A;
    reg  [5:0] B;
    reg  [2:0] sel;

    wire [5:0] result;
    wire [1:0] comp_out;
    wire       valid;

    alu_top uut (
        .A(A),
        .B(B),
        .sel(sel),
        .result(result),
        .comp_out(comp_out),
        .valid(valid)
    );

    initial begin
        $monitor("Time=%0t | sel=%b | A=%d (%b) | B=%d (%b) | Result=%d (%b) | Comp=%b | Valid=%b",
                 $time, sel, A, A, B, B, result, result, comp_out, valid);

        // 1. Test ADD (Normal & Overflow)
        sel = 3'b000; A = 6'd20; B = 6'd15; #10;
        A = 6'd40; B = 6'd30; #10;

        // 2. Test SUB (Normal & Underflow)
        sel = 3'b001; A = 6'd30; B = 6'd10; #10;
        A = 6'd10; B = 6'd20; #10;

        // 3. Test AND
        sel = 3'b010; A = 6'b101101; B = 6'b110011; #10;

        // 4. Test OR
        sel = 3'b011; A = 6'b101101; B = 6'b110011; #10;

        // 5. Test INV
        sel = 3'b100; A = 6'b101010; B = 6'd0; #10;

        // 6. Test MUL (Normal & Overflow)
        sel = 3'b101; A = 6'd5; B = 6'd8; #10;
        A = 6'd10; B = 6'd10; #10;

        // 7. Test COMPARATOR (Equal, Greater, Smaller)
        sel = 3'b110; A = 6'd25; B = 6'd25; #10;
        A = 6'd40; B = 6'd15; #10;
        A = 6'd5;  B = 6'd20; #10;

        $finish;
    end
endmodule
