`timescale 1ns / 1ps

module Version_2(
    input [7:0]Data,
    input [5:0]Address,
    input Write_en,
    input Clk,
    output [7:0]Output
    );

    reg [7:0] ram[63:0];
    reg [5:0] Address_reg;
    
    always @(posedge Clk)begin
        if(Write_en)
            ram[Address] <= Data;
        Address_reg <= Address;
    end
    
    assign Output = ram[Address_reg];
                        
endmodule
