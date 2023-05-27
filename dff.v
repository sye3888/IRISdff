module d_ff_async_reset( input wire clk,input wire reset,input wire d,output reg q);

always @(posedge clk or negedge reset)
begin 
if(!reset) //Asynchronous reset(active low)
 q <= 1'b0; //Reset the output to 0
 else 
 q <= d; //update the output with the input value
 end

 endmodule
 