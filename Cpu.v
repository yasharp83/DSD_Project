module Cpu(
    input clk ,
    input [2:0] instruction , //add(10) , mul(11) , load(00) , store(01) , initialize registers(100)
    input [1:0] reg_addr , 
    input [8:0] mem_address , 
    input [511:0] initialize_value , 
    output [511:0] A1_out , A2_out , A3_out , A4_out
);
    wire [2:0] write_addres ; 
    wire [1023:0] rf_write_data ; 
    wire rf_write ; 
    assign write_addres = {instruction[1] , reg_addr} ; 
    assign rf_write = (instruction[1:0] == 'b00) ; 
    

    RegisterFile regFile (
        .clk(clk) , 
        .write(rf_write) , 
        .write_addres(write_addres) , 
        .write_data(rf_write_data) , 
        .A1_out(A1_out) , 
        .A2_out(A2_out) , 
        .A3_out(A3_out) , 
        .A4_out(A4_out)
    );

    wire alu_mull_add ; 
    wire [1023:0] alu_out ; 
    assign alu_mull_add = (instruction == 3'b010) ; 
    Alu alu (
        .mul_add(alu_mull_add) , 
        .in1(A1_out) , 
        .in2(A2_out) , 
        .out(alu_out)
    );

    wire mem_write , mem_read ; 
    wire [511:0] mem_in_data , mem_out_data ; 
    assign mem_write = (instruction == 3'b001) ; //store
    assign mem_read = (instruction == 3'b000) ; //load
    assign mem_in_data = reg_addr[1] ? (reg_addr[0] ? A3_out : A4_out) :
                                        (reg_addr[0] ? A1_out : A2_out) ; 

    memory mem (
        .clk(clk) , 
        .write(mem_write) , 
        .read(mem_read) , 
        .address(mem_address) , 
        .in_data(mem_in_data) , 
        .out_data(mem_out_data)
    );

    
    assign rf_write_data[511:0] = instruction[2] ? initialize_value :
                                    (instruction[1] ? alu_out[511:0] : mem_out_data) ; 
    assign rf_write_data[1023:512] = instruction[1] ? alu_out[1023:512] : 512'b0 ; 



endmodule
