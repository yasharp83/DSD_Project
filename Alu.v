module Alu(
    input mul_add, //0 for mul and 1 for add
    input [511:0] in1 , in2 , 
    output [1023:0] out
);

    wire [511:0] H  , L ; 
    genvar i; 
    generate
        for (i = 0 ; i < 16 ; i = i + 1) begin
            assign {H[32*(i+1)-1:32*i] , L[32*(i+1)-1:32*i]} = mul_add ?
            $signed(in1[32*(i+1)-1:32*i]) + $signed(in2[32*(i+1)-1:32*i]) :
            $signed(in1[32*(i+1)-1:32*i]) * $signed(in2[32*(i+1)-1:32*i]) ; 
        end
    endgenerate
    
    assign out = {H , L} ; 

endmodule
