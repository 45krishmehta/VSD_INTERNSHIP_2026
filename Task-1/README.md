---

# Assembly Generation and Optimization Analysis

To understand how compiler optimizations affect the generated RISC-V machine code, the same C program was compiled using two different optimization levels:

- `-O1`
- `-Ofast`

The generated binaries were then disassembled and compared.

---

## RISC-V Compilation with O1 Optimization

### Source Code Verification

Before compilation, the source code was verified using:

```bash
cat sum1ton.c
```

### Screenshot

![O1 Source Code](assembly_o1_code.png)

### Compilation Command

```bash
riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c
```

### Binary Verification

```bash
ls -ltr sum1ton.o
```

The successful generation of `sum1ton.o` confirms that the compilation process completed without errors.

---

### O1 Disassembly

The generated binary was disassembled using:

```bash
riscv64-unknown-elf-objdump -d sum1ton.o
```

### Screenshot

![O1 Disassembly](assembly_O1_soln.png)

### Analysis

At `-O1`, the compiler performs basic optimizations while preserving readability and debuggability.

Key observations:

- Stack space is allocated using:

```assembly
addi sp,sp,-16
```

- Return address is stored on the stack:

```assembly
sd ra,8(sp)
```

- The value `100` is loaded into a register:

```assembly
li a5,100
```

- A loop structure is still visible in the generated assembly:

```assembly
addiw a5,a5,-1
bnez a5,...
```

The compiler reduces some overhead while still keeping the overall loop implementation intact.

---

## RISC-V Compilation with Ofast Optimization

### Compilation Command

```bash
riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c
```

### Binary Verification

```bash
ls -ltr sum1ton.o
```

### Screenshot

![Ofast Compilation](ofast_code.png)

---

### Ofast Disassembly

The generated binary was disassembled using:

```bash
riscv64-unknown-elf-objdump -d sum1ton.o
```

### Screenshot

![Ofast Disassembly](ofast_asembly.png)

### Analysis

At `-Ofast`, the compiler applies aggressive optimization techniques.

Several observations can be made:

- The counting loop has been completely eliminated.
- The compiler recognizes that:

```text
1 + 2 + 3 + ... + 100 = 5050
```

is a constant result.

- Instead of generating instructions to perform 100 iterations, the compiler directly loads the final result.

Examples:

```assembly
li a1,100
```

and

```assembly
lui
addi
```

instructions are used to directly prepare values required by `printf()`.

No loop instructions are present in the final code.

---

## O1 vs Ofast Comparison

| Feature | O1 | Ofast |
|----------|----------|----------|
| Loop Present | Yes | No |
| Stack Usage | Present | Present |
| Runtime Computation | Yes | No |
| Code Size | Larger | Smaller |
| Execution Speed | Faster than O0 | Fastest |
| Optimization Aggressiveness | Moderate | Very High |

---

## Observation

The compiler optimization level has a significant impact on the generated assembly code.

For the O1 build, the compiler retains the loop structure and performs moderate optimizations.

For the Ofast build, the compiler recognizes that the result can be determined during compilation and replaces the entire loop with precomputed values, resulting in much shorter and more efficient assembly code.

---

## Validation

Even though the generated assembly code differs significantly between O1 and Ofast:

```text
O1 Output = Ofast Output
```

Both implementations produce the same functional result:

```text
Sum from 1 to 100 is 5050
```

This confirms that compiler optimizations improve efficiency without changing the intended behavior of the program.
