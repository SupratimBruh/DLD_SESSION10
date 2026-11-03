`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2026 02:05:01 PM
// Design Name: 
// Module Name: alu_top
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


module alu_top (
    input  [5:0] A,
    input  [5:0] B,
    input  [2:0] sel,
    output reg [5:0] result,
    output reg [1:0] comp_out,
    output reg       valid
);
    wire [5:0] add_res, sub_res, and_res, or_res, inv_res, mul_res;
    wire [1:0] cmp_res;
    wire       add_val, sub_val, and_val, or_val, inv_val, mul_val, cmp_val;

    adder_6bit u_adder (
        .A(A), .B(B), .sum(add_res), .valid(add_val)
    );

    subtractor_6bit u_subtractor (
        .A(A), .B(B), .diff(sub_res), .borrow(), .valid(sub_val)
    );

    and_6bit u_and (
        .A(A), .B(B), .out(and_res), .valid(and_val)
    );

    or_6bit u_or (
        .A(A), .B(B), .out(or_res), .valid(or_val)
    );

    inv_6bit u_inv (
        .A(A), .out(inv_res), .valid(inv_val)
    );

    multiplier_6bit u_mult (
        .A(A), .B(B), .prod(mul_res), .valid(mul_val)
    );

    comparator_6bit u_comp (
        .A(A), .B(B), .comp_out(cmp_res), .valid(cmp_val)
    );

    always @(*) begin
        comp_out = 2'b00;

        case (sel)
            3'b000: begin // ADDITION
                result   = add_res;
                valid    = add_val;
            end
            3'b001: begin // SUBTRACTION
                result   = sub_res;
                valid    = sub_val;
            end
            3'b010: begin // BITWISE AND
                result   = and_res;
                valid    = and_val;
            end
            3'b011: begin // BITWISE OR
                result   = or_res;
                valid    = or_val;
            end
            3'b100: begin // BITWISE INVERT
                result   = inv_res;
                valid    = inv_val;
            end
            3'b101: begin // MULTIPLICATION
                result   = mul_res;
                valid    = mul_val;
            end
            3'b110: begin // COMPARATOR
                result   = 6'b000000;
                comp_out = cmp_res;
                valid    = cmp_val;
            end
            default: begin
                result   = 6'b000000;
                comp_out = 2'b00;
                valid    = 1'b0;
            end
        endcase
    end
endmodule
