# Compiler and flags
CC := clang
CFLAGS := -Wall -Wextra -pedantic -g -std=c23

# Directories
BIN_DIR := bin

# Default target
.DEFAULT_GOAL := build

# Phony targets
.PHONY: all build run clean

# Ensure the bin directory exists
$(BIN_DIR):
	mkdir -p $@

# Build target: Compiles the given C source file and places the binary in the bin directory
build: $(BIN_DIR)
	$(if $(SRC),,$(error SRC is not set. Usage: make build SRC=source.c))
	$(CC) $(CFLAGS) $(SRC) -o $(BIN_DIR)/$(basename $(notdir $(SRC)))

# Run target: Compiles and then runs the binary
run: build
	$(if $(SRC),,$(error SRC is not set. Usage: make run SRC=source.c))
	./$(BIN_DIR)/$(basename $(notdir $(SRC)))

# Clean target: Removes the bin directory and its contents
clean:
	rm -rf $(BIN_DIR)
