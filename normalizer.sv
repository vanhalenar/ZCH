// transforms the input from ASCII representation to 5 bit alphabet mapping by subtracting 0x61
// expects only lowercase ASCII symbols a-z
// a = 0  = 00000
// z = 25 = 11001
module normalizer (
    input clk, rst, vld_in,
    input [7:0] in_byte,
    output reg vld_out,
    output reg [4:0] out_symbol
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            out_symbol <= 0;
        else
            out_symbol <= in_byte - 'h61;
        vld_out <= vld_in;
    end
endmodule