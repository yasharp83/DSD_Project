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

        //initializing A1 with initialize_value
        initialize_value = {32'd1048576 , 32'd15 ,32'd14 , 32'd13 ,32'd12 , 32'd11 ,32'd10 , 32'd9 ,
                            32'd8 , 32'd7 ,32'd6 , 32'd5 ,32'd4 , 32'd3 ,32'd2 , 32'd1 } ; 
        opcode = 3'b100 ; // initialize register
        reg_addr = 2'b00 ; 
        mem_address = 9'd10 ; 

        #10
        $display("initializing A1 with initialize_value") ; 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  A1[32*(i+1)-1-:32]) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  A2[32*(i+1)-1-:32]) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end

        //initializing A2 with initialize_value
        initialize_value = {32'd0 , 32'd0 ,32'd0 , 32'd0 ,32'd0 , 32'd0 ,32'd0 , 32'd0 ,
                            32'd128 , 32'd64 ,32'd32 , 32'd16 ,32'd8 , 32'd4 ,32'd2 , 32'd1 } ; 
        reg_addr = 2'b01 ; 

        #10
        $display("initializing A2 with initialize_value") ; 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  A1[32*(i+1)-1-:32]) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  A2[32*(i+1)-1-:32]) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end


        //store A1 to mem[10]
        opcode = 3'b001 ; 
        reg_addr = 2'b00 ; 
        
        #10 
        $display("store A1 to mem[10]") ; 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  A1[32*(i+1)-1-:32]) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  A2[32*(i+1)-1-:32]) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end


        //load A2 with mem[10]
        opcode = 3'b000 ; 
        reg_addr = 2'b01 ; 

        #10
        $display("load A2 with mem[10]") ; 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  A1[32*(i+1)-1-:32]) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  A2[32*(i+1)-1-:32]) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end

        //multiplying (A4A3 = A1*A2)
        opcode = 3'b011 ; 

        #10
        $display("multiplying (A4A3 = A1*A2)") ; 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  A1[32*(i+1)-1-:32]) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  A2[32*(i+1)-1-:32]) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end


        //adding (A4A3 = A1 + A2)
        opcode = 3'b010 ; 

        #10
        $display("adding (A4A3 = A1 + A2)") ; 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  A1[32*(i+1)-1-:32]) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  A2[32*(i+1)-1-:32]) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end

        //storing A3 in mem[26]
        opcode = 3'b001 ; 
        mem_address = 9'd26 ; 
        reg_addr = 2'b10 ; 


        #10
        $display("storing A3 in mem[26]") ; 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  A1[32*(i+1)-1-:32]) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  A2[32*(i+1)-1-:32]) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end

        //load A1 with mem[26]
        opcode = 3'b000 ; 
        mem_address = 9'd26 ; 
        reg_addr = 2'b00 ; 
        

        #10
        $display("load A1 with mem[26]") ; 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  A1[32*(i+1)-1-:32]) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  A2[32*(i+1)-1-:32]) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end


        //load A3 with mem[18]
        opcode = 3'b000 ; 
        mem_address = 9'd18 ; 
        reg_addr = 2'b10; 
        

        #10
        $display("load A3 with mem[18]") ; 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  A1[32*(i+1)-1-:32]) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  A2[32*(i+1)-1-:32]) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end 
        

        //load A2 with initialize to test negative
        opcode = 3'b100 ; 
        reg_addr = 2'b01 ; 
        initialize_value = {-32'd1048576 , 32'd15 ,-32'd14 , 32'd13 ,32'd12 , 32'd11 ,32'd10 , 32'd9 ,
                            32'd8 , 32'd7 ,32'd6 , -32'd5 ,32'd4 , 32'd3 ,32'd2 , -32'd1 } ;


        #10
        $display("load A2 with initialize to test negative") ; 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  $signed(A1[32*(i+1)-1-:32])) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  $signed(A2[32*(i+1)-1-:32])) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end 
 

        //multiplying (A4A3 = A1*A2)
        opcode = 3'b011 ; 

        #10
        $display("multiplying (A4A3 = A1*A2)") ; 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  $signed(A1[32*(i+1)-1-:32])) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  $signed(A2[32*(i+1)-1-:32])) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end


        //adding (A4A3 = A1 + A2)
        opcode = 3'b010 ; 

        #10
        $display("adding (A4A3 = A1 + A2)") ; 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  $signed(A1[32*(i+1)-1-:32])) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  $signed(A2[32*(i+1)-1-:32])) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end
        


        $finish ; 
    end

endmodule
