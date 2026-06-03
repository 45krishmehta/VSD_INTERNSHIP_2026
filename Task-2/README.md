# Task 2: SPIKE Simulation and Debugging using RISC-V GCC

## Overview

This task focuses on understanding the execution and debugging of a RISC-V program using the SPIKE simulator. After compiling the program using the RISC-V GCC cross-compiler, the generated executable is executed and debugged using SPIKE. The objective is to observe instruction execution, inspect register values, and understand how a RISC-V processor executes machine instructions.

---

# Objective

- Understand the purpose of the SPIKE simulator.
- Compile a C program using the RISC-V GCC toolchain.
- Execute the generated binary using SPIKE.
- Debug the executable using SPIKE debug mode.
- Observe register values during execution.
- Analyze instruction-level execution.
- Verify the correctness of the program output.

---

# What is SPIKE?

SPIKE is the official functional simulator for the RISC-V Instruction Set Architecture (ISA).

It acts as a virtual RISC-V processor capable of executing RISC-V binaries on a host machine. Instead of running the program on actual RISC-V hardware, SPIKE interprets and executes instructions in software.

SPIKE is commonly used for:

- Functional verification of RISC-V programs
- Testing compiled RISC-V binaries
- Instruction-level debugging
- Software development before hardware availability
- Processor verification and validation

It serves as a reference model for many RISC-V hardware implementations.

---

# Program Used

The same `sum1ton.c` program developed in Task 1 is used for simulation and debugging.

## Source Code

```c
#include <stdio.h>

int main()
{
    int i, sum = 0, n = 100;

    for(i = 1; i <= n; i++)
        sum = sum + i;

    printf("Sum from 1 to %d is %d\n", n, sum);

    return 0;
}
```

### Expected Output

```text
Sum from 1 to 100 is 5050
```

---

# Native GCC Execution

The source code is first compiled and executed using the native GCC compiler.

## Compilation Command

```bash
gcc sum1ton.c
```

## Execution Command

```bash
./a.out
```

### Output

```text
Sum from 1 to 100 is 5050
```

This output serves as the reference output.

---

# RISC-V Compilation

The source code is compiled using the RISC-V GCC cross-compiler.

## Compilation Command

```bash
riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c
```

This generates a RISC-V executable that can be executed using the SPIKE simulator.

---

# SPIKE Simulation

The generated executable is executed using SPIKE.

## Simulation Command

```bash
spike pk sum1ton.o
```

## Screenshot

![SPIKE Simulation Output](gcc_spike_outpt.png)

### Output

```text
Sum from 1 to 100 is 5050
```

---

# Verification

### GCC Output

```text
Sum from 1 to 100 is 5050
```

### SPIKE Output

```text
Sum from 1 to 100 is 5050
```

### Validation

```text
GCC Output = SPIKE Output
```

Since both outputs are identical, the generated RISC-V executable is functionally correct.

---

# Debugging using SPIKE

SPIKE provides an interactive debug mode that allows instruction-by-instruction execution of a RISC-V program. This helps in understanding how individual instructions affect processor registers and memory during runtime.

The debug mode is enabled using:

```bash
spike -d pk sum1ton.o
```

Once SPIKE enters debug mode, various commands can be used to inspect registers, monitor program execution, and stop execution at specific addresses.

---

# Examining the Generated Assembly

Before entering debug mode, the executable was disassembled to identify the instructions present inside the `main()` function.

## Command

```bash
riscv64-unknown-elf-objdump -d sum1ton.o
```

## Screenshot

![Assembly Reference](assembly_ref_debug.png)

### Observation

From the disassembly output:

- The `main()` function starts at address:

```text
0x100b0
```

- The first few instructions executed are:

```assembly
lui a2,0x1
lui a0,0x21
addi sp,sp,-16
addi a2,a2,954
li a1,100
```

These instructions initialize registers and prepare the execution environment before the program proceeds further.

The assembly listing serves as a reference during debugging because it allows us to identify the exact addresses where execution should be observed.

---

# Debugging Stack Pointer Modification

To observe stack allocation, SPIKE was instructed to execute until address:

```text
0x100b8
```

using:

```bash
until pc 0 100b8
```

The stack pointer register was then examined.

## Screenshot

![Stack Pointer Debugging](debug_2.png)

### Instruction Executed

```assembly
addi sp, sp, -16
```

### Register Observation

Before execution:

```text
sp = 0x000000007f7e9b50
```

After execution:

```text
sp = 0x000000007f7e9b40
```

### Analysis

The instruction:

```assembly
addi sp, sp, -16
```

subtracts 16 from the stack pointer.

This allocates 16 bytes of stack memory for the function. Such stack allocation is commonly performed at the beginning of a function to store local variables and save important register values.

This observation confirms that the processor correctly updates the stack pointer during function entry.

---

# Observing Register Updates

The debugger was next used to observe how registers change when instructions are executed.

SPIKE was instructed to stop at the beginning of the `main()` function and register values were inspected after each instruction.

## Screenshot

![Register Debugging](debug_thrgh_spike.png)

### Instruction 1

```assembly
lui a2,0x1
```

Before execution:

```text
a2 = 0x0000000000000000
```

After execution:

```text
a2 = 0x0000000000001000
```

### Analysis

The `lui` (Load Upper Immediate) instruction loads an immediate value into the upper bits of the register.

---

### Instruction 2

```assembly
lui a0,0x21
```

After execution:

```text
a0 = 0x0000000000021000
```

### Analysis

The register `a0` receives the upper immediate value specified by the instruction.

---

### Instruction 3

```assembly
addi sp,sp,-16
```

After execution:

```text
sp = 0x000000007f7e9b40
```

### Analysis

The stack pointer is updated by subtracting 16 bytes, allocating stack space for program execution.

---

# Overall Observation

Using SPIKE debug mode, it was possible to:

- Execute instructions one at a time.
- Observe changes in register values.
- Monitor stack allocation.
- Verify instruction behavior.
- Correlate assembly instructions with processor state changes.

The debugger provides a detailed view of how a RISC-V processor executes machine instructions internally.

---

# Final Verification

| Method | Output |
|----------|----------|
| GCC Execution | Sum from 1 to 100 is 5050 |
| SPIKE Execution | Sum from 1 to 100 is 5050 |
| SPIKE Debug Execution | Sum from 1 to 100 is 5050 |

```text
GCC = SPIKE = SPIKE Debug
```

All executions produce identical results.

---

# Conclusion

In this task, a RISC-V executable was successfully generated using the RISC-V GCC cross-compiler and executed using the SPIKE simulator. The output obtained from SPIKE matched the output generated by native GCC execution, confirming the correctness of the compiled program.

The SPIKE debug mode was then used to observe instruction-level execution, inspect register contents, monitor stack pointer updates, and trace program behavior. This demonstrated how SPIKE can be used not only for simulation but also for detailed debugging and verification of RISC-V applications.

The experiment highlights the importance of SPIKE as a powerful tool for understanding, validating, and debugging RISC-V software before deployment on actual hardware.
