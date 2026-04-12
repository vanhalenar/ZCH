`timescale 1ns / 1ps

`include "alphabet_mapper.sv"

module tb_alphabet_mapper;
    reg clk;
    reg rst;
    reg [4:0] addr;
    wire [7:0] symbol;

    alphabet_mapper dut
    (
        .addr (addr),
        .rst (rst),
        .clk (clk),
        .symbol (symbol)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_alphabet_mapper.vcd");
        $dumpvars(0, tb_alphabet_mapper);
    end

    initial begin
        $monitor("time=%0t rst=%b addr=%0d symbol=%0d", $time, rst, addr, symbol);
    end

    initial begin
        rst = 0;
        addr = 0;
        #10 addr = 5;
        #10;
        $finish;
    end

endmodule