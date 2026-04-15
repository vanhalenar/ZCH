module key_register (
    input clk, rst, cfg_we,
    input [4:0] in_key,
    output reg [4:0] out_key
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            out_key <= 0;
        else if (cfg_we)
            out_key <= in_key;
    end
    
endmodule