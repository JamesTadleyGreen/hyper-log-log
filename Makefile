# Makefile for Haskell project

# Specify the name of the Cabal executable
EXECUTABLE = myapp

# Default target: build and run the executable
default: run

# Build the Haskell executable using Cabal
build:
	cabal build

# Run the executable
run: build
	cabal run $(EXECUTABLE)

# Clean the project
clean:
	cabal clean

.PHONY: default build run clean
