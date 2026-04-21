// connects all modules together
module top (
    input clk, rst, cfg_we,
    input [4:0] in_key,
    output reg [7:0] out_symbol,
    output reg [1:0] rom_addr,
    output reg alphabet_mapper_vld_out
);
    wire [4:0] normalizer_out_symbol, offsetter_out_symbol;
    wire [4:0] key;
    wire [7:0] input_rom_out_byte;
    wire counter_vld_out;
    wire normalizer_vld_out;
    wire offsetter_vld_out;

    counter counter_inst (
        .clk (clk),
        .rst (rst),
        .vld_out (counter_vld_out),
        .data_pointer (rom_addr)
    );

    input_rom input_rom_inst (
        .data (input_rom_out_byte),
        .addr (rom_addr)
    );

    normalizer normalizer_inst (
        .clk (clk),
        .rst (rst),
        .vld_in (counter_vld_out),
        .in_byte (input_rom_out_byte),
        .out_symbol (normalizer_out_symbol),
        .vld_out (normalizer_vld_out)
    );

    key_register key_register_inst (
        .clk (clk),
        .rst (rst),
        .cfg_we (cfg_we),
        .in_key (in_key),
        .out_key (key)
    );

    offsetter offsetter_inst (
        .clk (clk),
        .rst (rst),
        .vld_in (normalizer_vld_out),
        .in_symbol (normalizer_out_symbol),
        .key (key),
        .out_symbol (offsetter_out_symbol),
        .vld_out (offsetter_vld_out)
    );

    alphabet_mapper alphabet_mapper_inst (
        .clk (clk),
        .rst (rst),
        .vld_in (offsetter_vld_out),
        .in_symbol (offsetter_out_symbol),
        .out_symbol (out_symbol),
        .vld_out (alphabet_mapper_vld_out)
    );

    
endmodule