module input_rom (
  input [1:0] addr,
  output reg [7:0] data
);
  reg [7:0] rom [0:3];

  initial begin
    rom[0] = 8'h62;
    rom[1] = 8'h67;
    rom[2] = 8'h6b;
    rom[3] = 8'h79;
  end

  always @(*) begin
    data = rom[addr];
  end
endmodule