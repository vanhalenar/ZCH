module normalizer (
    input clk, rst,
    input [7:0] in,
    output reg [4:0] index
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            index <= 0;
        else
            index <= in - 'h61;
    end
endmodule