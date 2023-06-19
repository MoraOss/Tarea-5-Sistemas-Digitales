`timescale 1ns / 1ps

module counter(
input logic clk,
input logic reset,
output logic count
    );
    
always_ff@(posedge clk, posedge reset)
    if (reset) count <= 0;
    
    else if (count == 1) count <= 1;
    
    else count <= count + 1;

endmodule
