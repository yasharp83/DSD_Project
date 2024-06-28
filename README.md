# Vector Processor
This is an implementation of a 512-bit vector processor capable of performing basic arithmetic operations on vectors and handling memory loading and storing.

## Tools

**ModelSim**: for simulating verilog code .

## Implementation Details
Project includes 4 main modules and a testBench module :
- [Cpu.v](https://github.com/yasharp83/DSD_Project/blob/main/Cpu.v)
- [Alu.v](https://github.com/yasharp83/DSD_Project/blob/main/Alu.v)
- [RegisterFile.v](https://github.com/yasharp83/DSD_Project/blob/main/RegisterFile.v)
- [memory.v](https://github.com/yasharp83/DSD_Project/blob/main/memory.v)
- [test_bench.v](https://github.com/yasharp83/DSD_Project/blob/main/test_bench.v)

[RegisterFile.v](https://github.com/yasharp83/DSD_Project/blob/main/RegisterFile.v)

```
module RegisterFile(
    input clk , write ,
    input [2:0] write_address , 
    input [1023:0] write_data , 
    output [511:0] A1_out , A2_out , A3_out , A4_out 
);
```
This module holds the values of registers and can also perform assignment to them using inputs write_address and write_data .

[Alu.v](https://github.com/yasharp83/DSD_Project/blob/main/Alu.v)
```
module Alu(
    input mul_add,
    input [511:0] in1 , in2 , 
    output [1023:0] out
);
```
This module is capable of adding and multiplying two 512 bit vector and assigning result to wire out (1024 bit) .

[memory.v](https://github.com/yasharp83/DSD_Project/blob/main/memory.v)
```
module memory(
    input clk , write , read ,
    input [8:0] address ,
    input [511:0] in_data , 
    output [511:0] out_data
);
```
consisting of 512 words , each word 32 bit .

[Cpu.v](https://github.com/yasharp83/DSD_Project/blob/main/Cpu.v)
```
module Cpu(
    input clk ,
    input [2:0] instruction ,
    input [1:0] reg_addr , 
    input [8:0] mem_address , 
    input [511:0] initialize_value , 
    output [511:0] A1_out , A2_out , A3_out , A4_out
);
```
The main module handling assignments between memory, ALU, and RegisterFile.

Cpu is capable of handling 4 + 1 instructions : 
- load with opcode 000
- store with opcode 001
- add with opcode 010
- multiply with opcode 011
- initialize with opcode 100 (this instruction is only for testing)

[test_bench.v](https://github.com/yasharp83/DSD_Project/blob/main/test_bench.v)

in This part we test correctness of Cpu .
first we make an instance of Cpu and then for running a instruction we set inputs and then wait for a posedge clock .
after that we can see changes in registers using these lines : 
```
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A1[%d] = %d ," ,i ,  A1[32*(i+1)-1-:32]) ; 
        end 
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A2[%d] = %d ," ,i ,  A2[32*(i+1)-1-:32]) ; 
        end
        for (i = 0 ; i < 16 ; i = i + 1)begin
            $display("A4A3[%d] = %d ," ,i ,  $signed({A4[32*(i+1)-1-:32] , A3[32*(i+1)-1-:32]})) ; 
        end
```
you can add more instructions to test_bench.v .
for example for running instruction  R4 <- mem[120]
we need to set inputs of Cpu this way : 
```
        opcode = 3'b000 ; 
        reg_addr = 2'b11 ; 
        mem_address = 9'd120 ;
```

**more details are given in the [doc](https://github.com/yasharp83/DSD_Project/blob/main/doc/dsd_project(vector_processor).pdf)**

## How to Run

#### Step 1: Open ModelSim and create a New Project

#### Step 2: Add Source Files
  - [Cpu.v](https://github.com/yasharp83/DSD_Project/blob/main/Cpu.v)
  - [Alu.v](https://github.com/yasharp83/DSD_Project/blob/main/Alu.v)
  - [RegisterFile.v](https://github.com/yasharp83/DSD_Project/blob/main/RegisterFile.v)
  - [memory.v](https://github.com/yasharp83/DSD_Project/blob/main/memory.v)
  - [test_bench.v](https://github.com/yasharp83/DSD_Project/blob/main/test_bench.v)

#### Step 3: Compile the Design

1. In the **Library** window, right-click on your project library (usually `work`) and select **Add to Library > Native**.
2. Then in the **Workspace** window , select all 5 files, right-click, and choose **Compile > Compile Selected**.

#### Step 4: Set up the simulation

1. **Simulate > start simulation**
2. In the **Library** tab, expand your project library (work) .
3. Select `test_bench` and click `OK`.

#### Step 5: Run the simulation and see the result

## Results

you can see results of running test_bench.v in [testBenchResult.txt](https://github.com/yasharp83/DSD_Project/blob/main/testBenchResult.txt.txt)

## Authors

[yashar paymai](https://github.com/yasharp83)

student number : 401100325
