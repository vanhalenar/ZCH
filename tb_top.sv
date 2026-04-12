`timescale 1ns / 1ps

module tb_top;
    reg clk, rst, start, cfg_we;
    reg [4:0] key;
    reg [7:0] in;
    reg [7:0] out;
    wire done;

    top dut
    (
        .clk (clk),
        .rst (rst),
        .start (start),
        .cfg_we (cfg_we),
        .key (key),
        .in (in),
        .out (out),
        .done (done)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(0, tb_top);
    end

    initial begin
        $monitor("time=%0t rst=%b start=%b cfg_we=%b key=%0d in=%0d out=%0d done=%b", $time, rst, start, cfg_we, key, in, out, done);
    end

    initial begin
        rst = 0;
        key = 2;
        in = 'h68;
        #10 in = 'h69;
        #10 in = 'h61;
        #50;
        $finish;
    end

endmodule