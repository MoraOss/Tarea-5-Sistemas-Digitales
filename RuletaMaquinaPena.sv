`timescale 1ns / 1ps

module RuletaMaquina(
    input logic clk_main,
    input logic reset,
    output logic [2:0] state_out
    );
    

logic clk2, clk4, clk8, clk16;
//Clocks a utilizar:
Clock2Hz clk_2(clk_main,reset, clk2); 
Clock4Hz clk_4(clk_main,reset, clk4); 
Clock8Hz clk_8(clk_main, reset, clk8);






assign a=1;
//Estados: S0=000->0, S1=001->1, S2=010->2, S3=011->3, S4=100->4, S5=101->5 NÚMEROS DE LA RULETA
   typedef enum logic [2:0] {S0 =3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100, S5=3'b101} statetype;
   statetype state, nextstate;



Clock16Hz clk_16(clk_main, reset, clk16);
counter count_16(clk16, reset, count16);

   always_ff@(posedge clk16, posedge reset, posedge count16)
        if (reset) state <= S0;
        else       state <= nextstate;      
        
        
       always_comb //next state logic
        case (state)
         S0: if(a) nextstate = S1;   
                   
         S1: if(a) nextstate = S2;
                
         S2: if(a) nextstate = S3;
         
         S3: if(a) nextstate = S4;
         
         S4: if(a) nextstate = S5; 
         
         S5: if(a) nextstate = S0;  
           
        endcase
  
  
        
assign state_out = state; //Salida



counter count_8(clk8, reset, count8);
always_ff@(posedge clk8, posedge reset, posedge count8)
        if (reset) state <= S0;
        else       state <= nextstate;      
        
        
       always_comb //next state logic
        case (state)
         S0: if(a) nextstate = S1;   
                   
         S1: if(a) nextstate = S2;
                
         S2: if(a) nextstate = S3;
         
         S3: if(a) nextstate = S4;
         
         S4: if(a) nextstate = S5; 
         
         S5: if(a) nextstate = S0;  
           
        endcase  
  
assign state_out = state; //Salida 



counter count_4(clk4, reset, count4);
always_ff@(posedge clk4, posedge reset, posedge count4)
        if (reset) state <= S0;
        else       state <= nextstate;      
        
        
       always_comb //next state logic
        case (state)
         S0: if(a) nextstate = S1;   
                   
         S1: if(a) nextstate = S2;
                
         S2: if(a) nextstate = S3;
         
         S3: if(a) nextstate = S4;
         
         S4: if(a) nextstate = S5; 
         
         S5: if(a) nextstate = S0;  
           
        endcase  
  
assign state_out = state; //Salida 



counter count_2(clk2, reset, count2);
always_ff@(posedge clk2, posedge reset, posedge count2)
        if (reset) state <= S0;
        else       state <= nextstate;      
        
        
       always_comb //next state logic
        case (state)
         S0: if(a) nextstate = S1;   
                   
         S1: if(a) nextstate = S2;
                
         S2: if(a) nextstate = S3;
         
         S3: if(a) nextstate = S4;
         
         S4: if(a) nextstate = S5; 
         
         S5: if(a) nextstate = S0;  
           
        endcase  
assign state_out = state; //Salida 



endmodule



