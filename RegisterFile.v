module RegisterFile(
    input clk , write ,
    input [2:0] write_address , 
    input [1023:0] write_data , 
    output [511:0] A1_out , A2_out , A3_out , A4_out 
);
    reg [511 : 0] registers[3:0] ; 

    always @(posedge clk) begin
        if (write_address[2])
            {registers[3] , registers[2]} <= write_data ; 
        else if (write)
            registers[write_address] <= write_data[511:0] ; 
    end

    assign A1_out = registers[0] ; 
    assign A2_out = registers[1] ; 
    assign A3_out = registers[2] ; 
    assign A4_out = registers[3] ; 
endmodule