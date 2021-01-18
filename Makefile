# List of cpp file basenames to build
cppNames = main

F_CPU = 8000000UL

# Make compilation fail on first error
Build_Flags_Extra = -Wfatal-errors

TARGET = LEDDelay

MCU = attiny10
OPTIMIZATION = s

all: build asm size #run

run: avrdude-flash

# Load local settings
-include local.mk

uMakerPath ?= uMaker/
Source_Path ?= src/
INCLUDES ?= src

AVRpp_SRC = gccGuard


include $(uMakerPath)tools/paths.mk

# Generate list of source files from basenames
include $(uMakerPath)tools/source.mk

# Force setting certain make flags
include $(uMakerPath)tools/makeflags.mk

# Optional configuration testing for development
include $(uMakerPath)tools/checks.mk

# Defs for our setup
include $(uMakerPath)vars/AVR.mk

# Extra targets
#include $(uMakerPath)tools/nRF51/init-src.mk

# Library targets
include $(uMakerPath)tools/AVR/AVR++.mk
include $(uMakerPath)tools/libCameron.mk

# Build targets
include $(uMakerPath)tools/build.mk

# Intermediate assembly
include $(uMakerPath)tools/assembly.mk

# Programmer targets
#include $(uMakerPath)tools/dfu.mk
#include $(uMakerPath)tools/nrfjprog.mk
include $(uMakerPath)tools/AVR/avrdude.mk

# Directory creation targets
include $(uMakerPath)tools/mkdir.mk

.PHONY: all run
