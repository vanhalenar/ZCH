module alphabet_mapper (
    input clk, rst, vld_in,
    input [4:0] in_symbol,
    output reg vld_out,
    output reg [7:0] out_symbol
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            out_symbol <= 0;
        else
            out_symbol <= in_symbol + 'h61;
        vld_out <= vld_in;
    end
endmodule