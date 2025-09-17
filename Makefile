# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra -std=c99 -O2 -fstack-protector-strong -D_FORTIFY_SOURCE=2

# Source and object directories
SRCDIR = src
OBJDIR = obj

# Find all .c files in src directory
SOURCES = $(wildcard $(SRCDIR)/*.c)

# Generate corresponding .o file names
OBJECTS = $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

# Executable name
TARGET = program

# Default target
.PHONY: all clean run

all: $(TARGET)

# Link objects to create executable
$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

# Compile .c files to .o files
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean build artifacts
clean:
	rm -rf $(OBJDIR)/*
	rm -f $(TARGET)

# Run the program
run: $(TARGET)
	./$(TARGET)
