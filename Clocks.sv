`timescale 1ns / 1ps
 
//100Mhz/2^20 = 95.3Hz 
module clk_95_3Hz(
    input logic clk_main,  //clock fuente
    output logic clk_sub   //clock reducido
    );
 
    //Con 20 estados bajamos la frecuencia a 95.3Hz approx.    
    logic [19:0] counter;
 
    always_ff @(posedge clk_main)
        counter <= counter + 1;
 
    //Extraemos counter [19], que opera a 95.3 Hz    
    always_comb
        clk_sub = counter[19];
 
endmodule
 
 
 
//clk de 95,3Hz tiene 0.01048 segundos
//0.01048 x 6 = 0.06288
//y el clk de 16Hz tiene 0.0625 segundos, por lo que sería una buena aproximación
module Clock16Hz(input logic clk_main,reset,
                 output logic clk_sub);
 
    logic clk_aux;      //Variable auxiliar: 
    logic [5:0]counter; //Contador                  
     
    clk_95_3Hz clk16(clk_main,clk_aux);             
 
    always_ff @(posedge clk_aux)
        if ((counter == 3'b101)| reset) //Incluimos un reset, sincronizado con el contador de 3Hz
            counter <= 0;
        else
            counter <= counter + 1;
    
    //Asignamos la salida con logica combinacional.
    always_comb
        clk_sub = counter[2];
 
endmodule
 
 
module Clock32Hz(input logic clk_main,reset,
                 output logic clk_sub);
 
    logic clk_aux;      //Variable auxiliar: 
    logic [2:0]counter; //Contador                  
     
    clk_95_3Hz clk16(clk_main,clk_aux);             
 
    always_ff @(posedge clk_aux)
        if ((counter == 3'b010)| reset) //Incluimos un reset, sincronizado con el contador de 3Hz
            counter <= 0;
        else
            counter <= counter + 1;
    
    //Asignamos la salida con logica combinacional.
    always_comb
        clk_sub = counter[1];
 
endmodule
 
 
 
module Clock8Hz(input logic clk_main,reset,
                 output logic clk_sub);
                 
    logic clk_aux;      //Variable auxiliar: clock de 
    logic [1:0]counter; //Contador   
    
    Clock16Hz clk8(clk_main, reset, clk_aux);   
        
    
    always_ff @(posedge clk_aux)
        if ((counter == 2'b01)| reset) //Incluimos un reset, sincronizado con el contador de 3Hz
            counter <= 0;
        else
            counter <= counter + 1;
    
    //Asignamos la salida con logica combinacional.
    always_comb
        clk_sub = counter[0];
  
        
endmodule
 
module Clock2Hz(input logic clk_main,reset,
                 output logic clk_sub);
                 
    logic clk_aux;      //Variable auxiliar: clock de 16 Hz
    logic [1:0]counter; //Contador   
    
    Clock4Hz clk2(clk_main,reset, clk_aux);       
    
    always_ff @(posedge clk_aux)
        if ((counter == 2'b01)| reset) //Incluimos un reset, sincronizado con el contador de 3Hz
            counter <= 0;
        else
            counter <= counter + 1;
    
    //Asignamos la salida con logica combinacional.
    always_comb
        clk_sub = counter[0];
 
endmodule
