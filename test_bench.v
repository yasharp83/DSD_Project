module TB();

    reg clk ; 
    reg [2:0] opcode ; 
    reg [1:0] reg_addr ; 
    reg [8:0] mem_address ; 
    reg [511:0] initialize_value ; 
    
    wire [511:0] A1 , A2 , A3 , A4 ; 


    Cpu cpu(
        .clk(clk), 
        .instruction(opcode),
        .reg_addr(reg_addr), 
        .mem_address(mem_address),
        .initialize_value(initialize_value),
        .A1_out(A1),
        .A2_out(A2),
        .A3_out(A3),
        .A4_out(A4)
    );


    always
        #5 clk = ~clk ; 

    integer i;
    initial begin
        clk = 0 ; 
        initialize_value = {32'd0 , 32'd1 ,32'd24 , 32'd0 ,32'd0 , 32'd0 ,32'd0 , 32'd2 ,
                            32'd0 , 32'd1048576 ,32'd9 , 32'd0 ,32'd0 , 32'd8 ,32'd0 , 32'd1 } ; 
        opcode = 3'b100 ; 
        reg_addr = 2'b00 ; 
        mem_address = 9'd10 ; 
        #10
        $display("A1 : %h" , A1) ; 
        $display("A2 : %h" , A2) ; 
        $display("A3 : %h" , A3) ; 
        $display("A4 : %h" , A4) ; 
        
        // for (i = 0 ; i < 16 ; i = i + 1)begin
        //     $display("A1[%d] = %d ," ,i ,  A1[32*(i+1)-1:32*i]) ; 
        // end 
        // for (i = 0 ; i < 16 ; i = i + 1)begin
        //     $display("A1[%d] = %d ," ,i ,  A2[32*(i+1)-1:32*i]) ; 
        // end
        // for (i = 0 ; i < 16 ; i = i + 1)begin
        //     $display("A4A3[%d] = %d ," ,i ,  {A4[32*(i+1)-1:32*i] , A3[32*(i+1)-1:32*i]}) ; 
        // end
        reg_addr = 2'b01 ; 
        #10 
        // for (i = 0 ; i < 16 ; i = i + 1)begin
        //     $display("A1[%d] = %d ," ,i ,  A1[32*(i+1)-1:32*i]) ; 
        // end 
        // for (i = 0 ; i < 16 ; i = i + 1)begin
        //     $display("A1[%d] = %d ," ,i ,  A2[32*(i+1)-1:32*i]) ; 
        // end
        // for (i = 0 ; i < 16 ; i = i + 1)begin
        //     $display("A4A3[%d] = %d ," ,i ,  {A4[32*(i+1)-1:32*i] , A3[32*(i+1)-1:32*i]}) ; 
        // end
        $display("A1 : %h" , A1) ; 
        $display("A2 : %h" , A2) ; 
        $display("A3 : %h" , A3) ; 
        $display("A4 : %h" , A4) ; 
        
        opcode = 3'b011 ; 
        #10
        $display("A1 : %h" , A1) ; 
        $display("A2 : %h" , A2) ; 
        $display("A3 : %h" , A3) ; 
        $display("A4 : %h" , A4) ; 

        opcode = 3'b001 ; 
        #10
        $display("A1 : %h" , A1) ; 
        $display("A2 : %h" , A2) ; 
        $display("A3 : %h" , A3) ; 
        $display("A4 : %h" , A4) ; 


        initialize_value = {32'd0 , 32'd0 ,32'd0 , 32'd0 ,32'd0 , 32'd0 ,32'd0 , 32'd0 ,
                            32'd0 , 32'd0 ,32'd0 , 32'd0 ,32'd4 , 32'd3 ,32'd2 , 32'd1 } ; 
        opcode = 3'b100 ; 
        reg_addr = 2'b00 ; 
        #10
        $display("A1 : %h" , A1) ; 
        $display("A2 : %h" , A2) ; 
        $display("A3 : %h" , A3) ; 
        $display("A4 : %h" , A4) ; 

        opcode = 3'b010 ; 
        #10
        $display("A1 : %h" , A1) ; 
        $display("A2 : %h" , A2) ; 
        $display("A3 : %h" , A3) ; 
        $display("A4 : %h" , A4) ; 

        opcode = 3'b000 ; 
        #10
        $display("A1 : %h" , A1) ; 
        $display("A2 : %h" , A2) ; 
        $display("A3 : %h" , A3) ; 
        $display("A4 : %h" , A4) ; 


        $finish ; 
    end

endmodule
