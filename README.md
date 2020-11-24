# Libasm (@42Paris)

Assembly yourself!

![Alt text](https://github.com/lucaslefrancq/42-04_libasm/blob/main/libasm_example.png)

## About

Libasm is the 6th project of the mandatory part of the cursus.
It's only made in assembly and the main goal was to understand how registers, stack, systems calls and memory work.
 
- For this we had to code in assembly 10 different functions :
    - Mandatory part was : strlen, strcpy, strcmp, write and read (using syscall)
    - Bonus part was : atoi_base, and 4 functions for chainlists

- Here is the [subject][1]

`This project was code for MACOS`

### Building and running the program

1. Download/Clone this repo

        git clone https://github.com/lucaslefrancq/42-04_libasm

2. `cd` into the root directory, and run `make`

        cd 42-04_libasm
        make

3.  compile your main.c or the main.c in this repo with `libasm.a` 
    
## Sources

- [Langage assembleur (FR)][2]
- [Assembly language][4]
- [Nasm tutorial][8]
- [Using stack : push and pop][3]
- [Flags register][5]
- [Introduction aux buffer overflows (FR)][6]
- [Introduction à la rétroingénierie des binaires (FR)][7]

[1]: https://github.com/lucaslefrancq/42-04_libasm/blob/main/libasm.en.subject.pdf
[2]: https://www.lacl.fr/tan/asm
[3]: https://stackoverflow.com/questions/13091987/x64-nasm-pushing-memory-addresses-onto-the-stack-call-function
[4]: https://software.intel.com/content/www/us/en/develop/articles/introduction-to-x64-assembly.html
[5]: https://www.youtube.com/watch?v=oQKa5q-jVzY&ab_channel=BeNew
[6]: https://zestedesavoir.com/articles/100/introduction-aux-buffer-overflows/
[7]: https://zestedesavoir.com/articles/97/introduction-a-la-retroingenierie-de-binaires/#fn-6-e1__RVmdu
[8]: https://cs.lmu.edu/~ray/notes/nasmtutorial/