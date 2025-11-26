`timescale 1ns / 1ps

module Version_3(
    input [7:0]Data,
    input [5:0]Read_addr,
    input [5:0]Write_addr,
    input Write_en,
    input Clk,
    output [7:0]Output
    );
    
    reg [7:0] ram[63:0];
    reg [5:0] Read_addr_reg;
    
    always @(posedge Clk)begin
        if(Write_en)
            ram[Write_addr] <= Data;
        Read_addr_reg <= Read_addr;
    end            
    
    assign Output = ram[Read_addr_reg];
    
endmodule
