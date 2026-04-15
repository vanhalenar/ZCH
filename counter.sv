module counter (
    input clk, rst,
    output reg vld_out,
    output reg [1:0] data_pointer
);
    reg [2:0] cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_pointer <= 3;
            vld_out <= 0;
            cnt <= 0;
        end
        else begin
            if (cnt < 4) begin
                vld_out <= 1;
                data_pointer <= cnt[1:0];
                cnt <= cnt + 1;
            end
            else begin
                vld_out <= 0;
            end
        end
    end 
endmodule