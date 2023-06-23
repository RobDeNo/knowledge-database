# X86_64 Assembly
- 16 general purpose 64-Bit registers
- %rax(64) - The first return registers (erx-32 Bit)
  - getting the return values from functions
- %rbp the base pointer the keeps track of the base of the stack
  - BASE POINTER
- %rsp
  - STACK POINTER
# Common Terms
- HEAP , memory that can be allocated and deallocated
- STACK , contigouse section of memory used for passing arguments
- GENERAL REGISTER , A multipurpose register that can be used by either programmer or user to store data or memmory location address
- CONTROL REGISTER ,  a processor register that changes or control the behavior of CPU
- FLAGS REGISTER , contains the curent state of the processor
# Common Instruction Pointers
```Assembly
mov - move source to destination
PUSH - push source onto STACK
POP - Pop top of stack destination
INC - increment source by 1
DEC - decrement source by 1
ADD - add source to destination
SUB - substract source from destination
CMP - compare two vaules bu sutraction them and setting the %RFLAGS register, Zeroflas set ,means they are the same 
JLE - Jump if less than or equal 
JE  - Jump if equal
---------------------------------------------------------------------------------
Bit     name                    Symbol
0       Cary flag               cf #  carry flag : Set on high-order bit carry or borrow; cleared otherwise
2       Parity flag             pf # Set if low-order eight bits of result contain an even number of "1" bits; cleared
otherwise
4       Auzilliary Carry flag   af
6       Zero flag               zf #  Set if result is zero; cleared otherwise
7       Sign flag               sf #  Set equal to high-order bit of result (0 if positive 1 if negative)
8       Trace flag              tf
9       Interrupt flag          if
10      Direction flag          df
11      Overflow flag           of #   Set  if  result  is  too  large  a  positive  number  or  too  small  a  negative  number (excluding sign bit) to fit in destination operand; cleared otherwise
---------------------------------------------------------------------------------
mov RCX, RAX - this will move the value of RAX and store it into RCX
RCX = 10
RAX = 10
- a move is a type of copy
---------------------------------------------------------------------------------
ADD RAX,RCX now RAX = 20 # This will add the value of RCX to RAX, RAX =20
---------------------------------------------------------------------------------
SUB RCX, 10 = RCX = 10 # This will subtract the value of 10 from RCX, RCX = 0
# Value is "0" so this means the ZF(Zero bit) is set to 1
---------------------------------------------------------------------------------
LOOP1 # This is the name of the loop, always runs top to bottom
    MOV RAX, RCX
    ADD RAX, RCX
    SUB RCX, RAX
    CMP RCX, [INPUT] # This will compare RCX with the input value
                     # Does not store the value in RCX, only compares it
                     # Always does a ubstract from given source to the destination
    JE LOOP1 # IF the code = "0", the code repeats itself. Zero flag bit will be set(zf)
             # JE is walsy looking for a zerio flag(zf)
    JMP # This only jumps to a location
---------------------------------------------------------------------------------
PUSH RAX # Will pushed to top of stack
PUSH RBX # Will be pushed to top of stack
# Stack pointer is always pointing to the "top" bottom of the stack , closest to the core of the stack
--------------
ff  5 -- RBP # BASE POINTER
--------------
    10
--------------
    3
--------------
    20 -- RSP # STACK POINTER
--------------
POP RCX # This looked at top of stack (where RSP is pointing to) for POPPING
POP RAX # This looked at top of stack (where RSP is pointing to) for POPPING
MOV RAX, 16 # This will put 16 into RAX
PUSH RAX # Push 16 ontop the top of the stack
main:
    mov rax, 16     # 16 moved into rax
    Push rax        # push value of rax (16) onto stack. RSP is pushed up 8 bytes (64 bits)
    jmp mem2        # jmp to mem2 memory location
mem1:           # Subroutine
    mov rax, 0      # move 0 (error free) exit code to rax
    ret             # return out of code
mem2:               # Subroutine
    pop r8          # pop value on the stack (16) into r8. RSP falls 8 bytes
    cmp rax, r8     # compare rax register value (16) to r8 register value (16)
    je mem1         # jump if comparison has zero bit set to mem1
# Example 2
main:
    mov rcx, 25     # store the value 25 in rcx register
    mov rbx, 62     # store the value 62 in rbx register
    jmp mem1        # jumps to mem1 location
mem1:               # Subroutine
    sub rbx, 40     # subtract 40 from rbx
    mov rsi, rbx    # copy rbx value to rsi
    cmp rcx, rsi    # compare the values in rcx and rsi
    jmple mem2      # jumps to mem2 location if value is less than or equal
mem2:               # Subroutine
    mov rax, 0      # store 0 in rax
    ret             # return out of code
10
---------------------------------------------------------------------------------
POP R12, # This will pop the vlaue at the top of the stack and put it into R12
POP R13, # This will pop the vlaue at the top of the stack and put it into R12
R12: 0x2
R13: 0x5
CMP R12,R13(R12# - R13#//2 - 5)
# The SIGN flag will be set, and the register values will not change
JL # Jump is LESS than
