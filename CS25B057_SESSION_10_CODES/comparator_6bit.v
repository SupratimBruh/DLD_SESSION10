`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:04:41 PM
// Design Name: 
// Module Name: comparator_6bit
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


module comparator_6bit (
    input  [5:0] A,
    input  [5:0] B,
    output reg [1:0] comp_out, // 2'b00: Equal, 2'b01: Greater, 2'b10: Smaller
    output       valid
);
    wire [5:0] diff;
    wire       borrow;
    wire       sub_valid;
    wire       is_equal;
    wire       ovf;
    wire       is_less;

    subtractor_6bit sub_inst (
        .A(A),
        .B(B),
        .diff(diff),
        .borrow(borrow),
        .valid(sub_valid)
    );

    assign ovf      = ~sub_valid;
    assign is_equal = ~|diff;
    assign is_less  = diff[5] ^ ovf; // Handles 2's complement signed ordering

    always @(*) begin
        if (is_equal) begin
            comp_out = 2'b00; // Equal
        end else if (is_less) begin
            comp_out = 2'b10; // Smaller (A < B)
        end else begin
            comp_out = 2'b01; // Greater (A > B)
        end
    end

    assign valid = 1'b1;
endmodule