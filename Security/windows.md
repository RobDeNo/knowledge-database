xfreerdp /v:10.50.27.86 /u:student /p:password /dynamic-resolution +clipboard

# Reverse Engineering Workflow
# Portable Executable Patching / Software Analysis
- Perform Debugging and Disassembly
- Find the Success/Failure
- Adjust Instructions
- Apply Patch and Save
- Execute Patched Binary
# Ghidra
## Behavior Analysis
- run code and see what it ouput
  - outputs strings, ASCII, maybe ports/networking, processes opened.
SEARCH -> Search strings
- find string message and go to it in code
- highleight the green function next to it (X-REFERENCE)
  - double click the function and it will take you to where the function is location
  - now begin looking at assembly language
  - "FUN_00401130" Ghidra will call a function by its address

-----------------------------------------------------------------------------------------------
# Demo 1
```shell
  local_8 = DAT_0041a02c ^ (uint)&stack0xfffffffc; /////////////////////////////////////
  FUN_00401130((wchar_t *)s_Enter_Key:_0041a000); /////////////////////////////////////
  #GRabbing input from SOMWHERE and storeing it SOMWHERE else
  pFVar1 = (FILE *)___acrt_iob_func(0); /////////////////////////////////////
  FUN_00403308(local_1c,0x14,pFVar1); /////////////////////////////////////
  #FGET IS, type in n data HIT eneter. look for a CHOP of a newline see below
  #1 takes input and stores into location 1, 
  #2 how many chatacyers can i grab
  #3 where grabbing data from std input, data connection, file tec
  _strtok(local_1c,&DAT_0041a00c); /////////////////////////////////////
    #DAT points to 01A, ASCII = "new line"
    #the string tok has a newline being entered
  iVar2 = FUN_00401000(local_1c); /////////////////////////////////////
  #local 1 is getting passedinto the function, passing arugement into a function turns it into a parameter
    #return values stored in RAX******
    #This is just calling a function
    #go to this function and see what value is needed. what is stored in the registers needs to be equal to the decided value to get ge the sauccess message
  if (iVar2 == 0x34f3) /////////////////////////////////////
  #this will show a CMP statement in the assembly code
  #right click on the hex and convert to 
  {
    FUN_00401130((wchar_t *)s_Success!!._0041a010);
    Sleep(5000);
  }
  else {
    FUN_00401130((wchar_t *)s_Failed!!._0041a01c);
    Sleep(5000);
  }
  FUN_0040116a(local_8 ^ (uint)&stack0xfffffffc);
  return;
```
-----------------------------------------------------------------------------------------------
## Following
FUN_00401000
undefined4 __cdecl FUN_00401000(char *param_1)
```shell
{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = FID_conflict:_atoi(param_1);
  if (iVar1 == 0x7b) {
    uVar2 = 0x34f3;
  }
  else {
    uVar2 = 0xc;
  }
  return uVar2;
```
# Demo 2
```shell
undefined4 __cdecl FUN_00401000(char *param_1)

{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = _strcmp(param_1,&DAT_0041a000);
  #DAT is a data location which has strings, click to go to data location
  #strcmp, compares two strings with subtraction. and then STORES the value within the REX register
    #the same = 0
  #string compare is a c library function call
  #when a call is sent out a return has to come back
  if (iVar1 == 0) {
    uVar2 = 0x10080;
  }
  else {
    uVar2 = 0xc;
  }
  return uVar2;
```
# Demo 10
```shell
int __cdecl FUN_00401000(byte *param_1)

{
  int iVar1;
  
  iVar1 = FUN_00405f31(param_1);
  return iVar1 + 0x42;
```
fgets( var, size, area)

