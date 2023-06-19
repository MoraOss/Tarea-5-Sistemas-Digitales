`timescale 1ns / 1ps

module Display_ruleta(
    input logic clk_main,
    input logic reset,
    output logic [6:0] seg
    );
    
logic clk_main, reset;
logic [2:0] data;

RuletaMaquina ruleta(clk_main,reset,data);

always_comb    
 case(data)
 3'b000: seg = 7'b0000001; // "0"  
 3'b001: seg = 7'b1001111; // "1" 
 3'b010: seg = 7'b0010010; // "2" 
 3'b011: seg = 7'b0000110; // "3" 
 3'b100: seg = 7'b1001100; // "4" 
 3'b101: seg = 7'b0100100; // "5" 
 endcase
endmodule