`timescale 1ns / 1ps

`include "offsetter.sv"

module tb_offsetter;
    reg clk;
    reg rst;
    reg [4:0] in;
    reg [4:0] key;
    wire [4:0] addr;

    offsetter dut
    (
        .in (in),
        .rst (rst),
        .clk (clk),
        .key (key),
        .addr (addr)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_offsetter.vcd");
        $dumpvars(0, tb_offsetter);
    end

    initial begin
        $monitor("time=%0t rst=%b input=%0d key=%0d addr=%0d", $time, rst, in, key, addr);
    end

    initial begin
        rst = 0;
        in = 0;
        key = 5;
        #10 in = 24;
        #10;
        $finish;
    end

endmodule