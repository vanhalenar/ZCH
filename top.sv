module top (
    input clk, rst, start, cfg_we,
    input [4:0] key,
    input [7:0] in, //temporary, there should be a module for reading data from input ROM
    output reg [7:0] out, //also temporary?
    output reg done
);
    wire [4:0] index, addr;

    normalizer normalizer_inst (
        .clk (clk),
        .rst (rst),
        .in (in),
        .index (index)
    );

    offsetter offsetter_inst (
        .clk (clk),
        .rst (rst),
        .in (index),
        .key (key),
        .addr (addr)
    );

    alphabet_mapper alphabet_mapper_inst (
        .clk (clk),
        .rst (rst),
        .addr (addr),
        .symbol (out)
    );

    
endmodule