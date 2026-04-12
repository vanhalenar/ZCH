module moduleName (
    input clk, rst,
    input [4:0] in,
    input [4:0] key;
    output reg [4:0] addr
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            addr <= 0;
        else
            addr <= (in + key) % 26;
    end
endmodule