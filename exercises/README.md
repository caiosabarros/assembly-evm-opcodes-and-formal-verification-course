# Glossary of New Terms

- Function dispatching: the EVM algorithm that chooses which function to call given the calldata.

### Function Dispatch in HUFF:
PUSH0 onto the stack, read calldata (CALLDATALOAD) from offset 0, PUSH1 0xe0 to the stack,
SHR to get the function selector. In HUFF, there's a syntax sugar that works like the following:
- Once a function selector is at the top of the stack, we push the actual function selector onto the stack and compare both (EQ). Then, JUMPI (jump if true) is called if selectors match. Then, a pointer to another `macro` in HUFF is pushed onto the stack and JUMPDEST validates whether that is a "valid" call. The associated bytecode inside the macro is then executed.

## OPCODES:

### SHR:
Explanation: You get the decimal, convert to hex, convert to binary and then remove the last
2 bits from the right, which is the same as the Solidity operation `>> 2` (divide by 2**2).

Example:
 1216  cast --to-dec 0xff // 255 = 63.75 = integer 63.
 1217  cast --to-base 0xff bin // 0b11111111 in bits 
 1218  cast --to-hex 0b111111 // remove the last 2 bits (2) = 63 = 255/2**2 in Solidity
 1219  cast --to-dec 0x3f // 63

To get a function selector on the top of the stack, the following must be done:

PUSH0 // PUSH the offset from which the calldata is to be read.
CALLDATALOAD // read the calldata from offset 0 (entire calldata).
0xe0 // = 28 * 8 = get rid of last 28 bytes = e(14)*16 + 0*16 bc e = 14, f = 15...  
SHR // it will get the last 28 bytes (offset) from calldata and throw away, leaving the function selector only.

