`timescale 1ns / 1ps

`include "normalizer.sv"

module tb_normalizer;
    reg clk;
    reg rst;
    reg [7:0] in;
    wire [4:0] index;

    normalizer dut
    (
        .in (in),
        .rst (rst),
        .clk (clk),
        .index (index)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_normalizer.vcd");
        $dumpvars(0, tb_normalizer);
    end

    initial begin
        $monitor("time=%0t rst=%b input=%0d index=%0d", $time, rst, in, index);
    end

    initial begin
        rst = 0;
        in = 'h68;
        #10 in = 'h69;
        #10;
        $finish;
    end

endmodule