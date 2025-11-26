`timescale 1ns / 1ps

    module tb_Version1;


    reg [7:0] Data;
    reg [5:0] Read_addr;
    reg [5:0] Write_addr;
    reg Write_en;
    reg Clk;
    wire [7:0] Output;

    Version1 uut (
        .Data(Data),
        .Read_addr(Read_addr),
        .Write_addr(Write_addr),
        .Write_en(Write_en),
        .Clk(Clk),
        .Output(Output)
    );

    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;
    end

    initial begin

        Data = 0;
        Read_addr = 0;
        Write_addr = 0;
        Write_en = 0;
        #10;

        Write_en = 1;
        Write_addr = 6'd5;
        Data = 8'hA5;
        Read_addr = 6'd5;
        #10;

        Write_en = 0;
        Read_addr = 6'd5;
        #10;

        Write_en = 1;
        Write_addr = 6'd10;
        Data = 8'h3C;
        Read_addr = 6'd5;
        #10;

        Write_en = 0;
        Read_addr = 6'd10;
        #10;

        Write_en = 1;
        Write_addr = 6'd20;
        Data = 8'hFF;
        Read_addr = 6'd20;
        #10;

        Write_en = 0;
        Read_addr = 6'd20;
        #10;

        $stop;
    end

endmodule
