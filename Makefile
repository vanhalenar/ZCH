TB_SRC := tb_top.sv
SRCS := normalizer.sv offsetter.sv alphabet_mapper.sv top.sv
SIM_DIR := sim
SIM_BIN := $(SIM_DIR)/sim_icarus
VCD := $(SIM_DIR)/tb_top.vcd

.PHONY: all sim clean

all: sim

sim: $(VCD)

$(VCD): $(SIM_BIN)
	vvp $(SIM_BIN)

$(SIM_BIN): $(TB_SRC) $(SRCS) | $(SIM_DIR)
	iverilog -g2012 -Wall -o $@ $^

$(SIM_DIR):
	mkdir -p $(SIM_DIR)

clean:
	rm -f $(SIM_BIN) *.vcd