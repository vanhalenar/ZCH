module alphabet_mapper (
    input clk, rst,
    input [4:0] addr,
    output reg [7:0] symbol
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            symbol <= 0;
        else
            symbol <= addr + 'h61;

    end
endmodule