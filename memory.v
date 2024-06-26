module memory(
    input clk , write , read ,
    input [8:0] address ,
    input [511:0] in_data , 
    output [511:0] out_data
);

    reg [31:0] MEM[511:0] ; 

    assign out_data = read ? {
        MEM[address] ,
        MEM[address+1] , 
        MEM[address+2] ,
        MEM[address+3] ,  
        MEM[address+4] ,
        MEM[address+5] , 
        MEM[address+6] ,
        MEM[address+7] ,  
        MEM[address+8] ,
        MEM[address+9] , 
        MEM[address+10] ,
        MEM[address+11] ,  
        MEM[address+12] ,
        MEM[address+13] , 
        MEM[address+14] ,
        MEM[address+15] 
    } : 512'bz ; 

    always @(posedge clk) begin
        if (write) begin 
            {MEM[address] ,
            MEM[address+1] , 
            MEM[address+2] ,
            MEM[address+3] ,  
            MEM[address+4] ,
            MEM[address+5] , 
            MEM[address+6] ,
            MEM[address+7] ,  
            MEM[address+8] ,
            MEM[address+9] , 
            MEM[address+10] ,
            MEM[address+11] ,  
            MEM[address+12] ,
            MEM[address+13] , 
            MEM[address+14] ,
            MEM[address+15] } <= in_data ; 
        end
    end

endmodule
