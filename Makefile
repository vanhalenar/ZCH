TB_SRC := tb_alphabet_mapper.sv
SIM_DIR := sim
SIM_BIN := $(SIM_DIR)/sim_icarus
VCD := $(SIM_DIR)/tb_normalizer.vcd

.PHONY: all sim clean

all: sim

sim: $(VCD)

$(VCD): $(SIM_BIN)
	vvp $(SIM_BIN)

$(SIM_BIN): $(TB_SRC) | $(SIM_DIR)
	iverilog -g2012 -Wall -o $@ $^

$(SIM_DIR):
	mkdir -p $(SIM_DIR)

clean:
	rm -f $(SIM_BIN) *.vcd