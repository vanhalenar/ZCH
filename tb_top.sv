`timescale 1ns / 1ps

module tb_top;
    reg clk, rst, cfg_we;
    reg [4:0] key;
    wire [7:0] out_symbol;
    wire [1:0] rom_addr;
    wire alphabet_mapper_vld_out;

    top dut
    (
        .clk (clk),
        .rst (rst),
        .cfg_we (cfg_we),
        .in_key (key),
        .out_symbol (out_symbol),
        .rom_addr (rom_addr),
        .alphabet_mapper_vld_out (alphabet_mapper_vld_out)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(0, tb_top);
    end

    initial begin
        $monitor("time=%0t rst=%b cfg_we=%b key=%0d out=%0d rom_addr=%0d vld_out=%b", $time, rst, cfg_we, key, out_symbol, rom_addr, alphabet_mapper_vld_out);
    end

    initial begin
        // input rom contains:
        // 0x77 (w)
        // 0x78 (x)
        // 0x79 (y)
        // 0x7a (z)

        rst = 1;

        #10 rst = 0;

        // Test 1: set caesar cipher key to 3, check output
        cfg_we = 1;
        key = 3;
        #15 cfg_we = 0;

        // expected output: 0x7a (z), 0x61 (a), 0x62 (b), 0x63 (c)
        #25 assert (out_symbol == 'h7a)
        else   $error("out_symbol expected 0x7a, got 0x%0h", out_symbol);

        #10 assert (out_symbol == 'h61)
        else   $error("out_symbol expected 0x61, got 0x%0h", out_symbol);

        #10 assert (out_symbol == 'h62)
        else   $error("out_symbol expected 0x62, got 0x%0h", out_symbol);

        #10 assert (out_symbol == 'h63)
        else   $error("out_symbol expected 0x63, got 0x%0h", out_symbol);
        
        #50 rst = 1;

        // Test 2: change key in the same program run, rerun with same input, check output
        #10 rst = 0;
        cfg_we = 1;
        key = 5;
        #15 cfg_we = 0;

        // expected output: 0x62 (b), 0x63 (c), 0x64 (d), 0x65 (e)
        
        #25 assert (out_symbol == 'h62)
        else   $error("out_symbol expected 0x62, got 0x%0h", out_symbol);

        #10 assert (out_symbol == 'h63)
        else   $error("out_symbol expected 0x63, got 0x%0h", out_symbol);

        #10 assert (out_symbol == 'h64)
        else   $error("out_symbol expected 0x64, got 0x%0h", out_symbol);

        #10 assert (out_symbol == 'h65)
        else   $error("out_symbol expected 0x65, got 0x%0h", out_symbol);

        #100;
        $finish;
    end

endmodule