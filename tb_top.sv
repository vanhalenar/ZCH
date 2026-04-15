`timescale 1ns / 1ps

module tb_top;
    reg clk, rst, cfg_we;
    reg [4:0] key;
    reg [7:0] out_symbol;
    wire done;
    wire [1:0] rom_addr;
    wire alphabet_mapper_vld_out;
    wire [4:0] normalizer_out_symbol, offsetter_out_symbol;

    top dut
    (
        .clk (clk),
        .rst (rst),
        .cfg_we (cfg_we),
        .in_key (key),
        .out_symbol (out_symbol),
        .done (done),
        .rom_addr (rom_addr),
        .alphabet_mapper_vld_out (alphabet_mapper_vld_out),
        .normalizer_out_symbol (normalizer_out_symbol),
        .offsetter_out_symbol (offsetter_out_symbol)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(0, tb_top);
    end

    initial begin
        $monitor("time=%0t rst=%b cfg_we=%b key=%0d out=%0d rom_addr=%0d done=%b vld_out=%b normalizer_out_symbol=%0d offsetter_out_symbol=%0d", $time, rst, cfg_we, key, out_symbol, rom_addr, done, alphabet_mapper_vld_out, normalizer_out_symbol, offsetter_out_symbol);
    end

    initial begin
        rst = 1;
        //key = 1;
        /*#7 in = 'h77;
        #10 in = 'h78;
        #10 in = 'h79;*/
        #10;

        rst = 0;
        cfg_we = 1;
        key = 3;
        #15 cfg_we = 0;

        /*#10 assert (out == 'h7a)
        else   $error("out expected 0x7a, got 0x%0h", out);

        #10 assert (out == 'h61)
        else   $error("out expected 0x61, got 0x%0h", out);

        #10 assert (out == 'h62)
        else   $error("out expected 0x62, got 0x%0h", out);*/
        
        /*#20;

        cfg_we = 1;
        #7 key = 4;

        #10 in = 'h77;
        #10 in = 'h78;
        #10 in = 'h79;     */  

        #100;
        $finish;
    end

endmodule