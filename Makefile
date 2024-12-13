# Compiler and flags
IVERILOG = iverilog
VVPRUN = vvp
GTKWAVE = gtkwave

# Directories
SRC_DIR = src
TB_DIR = tb
SIM_DIR = sim

# Colors and formatting (using tput)
GREEN = $(shell tput setaf 2)
BRIGHT_GREEN = $(shell tput setaf 10)
PINK = $(shell tput setaf 5)
RED = $(shell tput setaf 1)
BLUE = $(shell tput setaf 4)
BOLD = $(shell tput bold)
NC = $(shell tput sgr0)

# Source files
ARITHMETIC_SRC = $(wildcard $(SRC_DIR)/arithmetic/*.v)
CONVERTERS_SRC = $(wildcard $(SRC_DIR)/converters/*.v)
LOGIC_SRC = $(wildcard $(SRC_DIR)/logic/*.v)

# Testbench files
ARITHMETIC_TB = $(wildcard $(TB_DIR)/arithmetic/*_tb.v)
CONVERTERS_TB = $(wildcard $(TB_DIR)/converters/*_tb.v)
LOGIC_TB = $(wildcard $(TB_DIR)/logic/*_tb.v)

# Output files
ARITHMETIC_OUT = $(patsubst $(TB_DIR)/arithmetic/%_tb.v,$(SIM_DIR)/%,$(ARITHMETIC_TB))
CONVERTERS_OUT = $(patsubst $(TB_DIR)/converters/%_tb.v,$(SIM_DIR)/%,$(CONVERTERS_TB))
LOGIC_OUT = $(patsubst $(TB_DIR)/logic/%_tb.v,$(SIM_DIR)/%,$(LOGIC_TB))

# Default target
all: arithmetic converters logic

$(SIM_DIR):
	@mkdir -p $(SIM_DIR)

# Arithmetic modules
arithmetic: $(ARITHMETIC_OUT)
	@echo -e "\n${BOLD}${BLUE}=== Running Arithmetic Tests ===${NC}"
	@for test in $(ARITHMETIC_OUT); do \
		echo -e "\n${PINK}▶ Running $$(basename $$test) test...${NC}"; \
		$(VVPRUN) $$test 2>&1 | grep -v "VCD info" | sed -e "s/Test completed/${BOLD}${BRIGHT_GREEN}Test completed${NC}/" -e "s/Error/${RED}Error${NC}/"; \
	done

# Converters modules
converters: $(CONVERTERS_OUT)
	@echo -e "\n${BOLD}${BLUE}=== Running Converter Tests ===${NC}"
	@for test in $(CONVERTERS_OUT); do \
		echo -e "\n${PINK}▶ Running $$(basename $$test) test...${NC}"; \
		$(VVPRUN) $$test 2>&1 | grep -v "VCD info" | sed -e "s/Test completed/${BOLD}${BRIGHT_GREEN}Test completed${NC}/" -e "s/Error/${RED}Error${NC}/"; \
	done

# Logic modules
logic: $(LOGIC_OUT)
	@echo -e "\n${BOLD}${BLUE}=== Running Logic Tests ===${NC}"
	@for test in $(LOGIC_OUT); do \
		echo -e "\n${PINK}▶ Running $$(basename $$test) test...${NC}"; \
		$(VVPRUN) $$test 2>&1 | grep -v "VCD info" | sed -e "s/Test completed/${BOLD}${BRIGHT_GREEN}Test completed${NC}/" -e "s/Error/${RED}Error${NC}/"; \
	done

# Compilation rules
$(SIM_DIR)/%: $(TB_DIR)/arithmetic/%_tb.v $(SRC_DIR)/arithmetic/%.v | $(SIM_DIR)
	@echo -e "${BLUE}⚡ Compiling $*...${NC}"
	@$(IVERILOG) -o $@ $^

$(SIM_DIR)/%: $(TB_DIR)/converters/%_tb.v $(SRC_DIR)/converters/%.v | $(SIM_DIR)
	@echo -e "${BLUE}⚡ Compiling $*...${NC}"
	@$(IVERILOG) -o $@ $^

$(SIM_DIR)/%: $(TB_DIR)/logic/%_tb.v $(SRC_DIR)/logic/%.v | $(SIM_DIR)
	@echo -e "${BLUE}⚡ Compiling $*...${NC}"
	@$(IVERILOG) -o $@ $^

# Clean generated files
clean:
	@echo -e "${BLUE}🧹 Cleaning up...${NC}"
	@rm -rf $(SIM_DIR)
	@rm -f *.vcd

# Create project structure
create_structure:
	@echo -e "${BLUE}Creating project structure...${NC}"
	@mkdir -p $(SRC_DIR)/arithmetic $(SRC_DIR)/converters $(SRC_DIR)/logic
	@mkdir -p $(TB_DIR)/arithmetic $(TB_DIR)/converters $(TB_DIR)/logic
	@mkdir -p $(SIM_DIR)

.PHONY: all arithmetic converters logic clean create_structure