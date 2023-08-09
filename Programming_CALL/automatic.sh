#!/bin/bash
riscv64-unknown-elf-gcc -march=rv32g -mabi=ilp32 -nostdlib -nostartfiles -T link.ld test.S -o test.elf
riscv64-unknown-elf-objdump -D test.elf
spike -l --log-commits --isa=rv32gc test.elf 2>test.log

