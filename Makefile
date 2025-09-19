# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra -std=c99 -O3 -fstack-protector-strong -D_FORTIFY_SOURCE=2 \
         -fno-asynchronous-unwind-tables \
         -fomit-frame-pointer \
         -fmerge-constants \
         -fdata-sections \
         -ffunction-sections \
         -fvisibility=hidden \
         -fno-ident \
         -fno-dce \
         -fno-optimize-sibling-calls \
         -fno-tree-loop-optimize \
         -fno-unroll-loops \
         -fno-peel-loops \
         -fno-split-wide-types \
         -fno-var-tracking-assignments \
         -fno-lto \
         -fno-stack-check \
         -fno-builtin \
         -fno-trapping-math \
         -fno-signed-zeros \
         -fno-strict-overflow


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
