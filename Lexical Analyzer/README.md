lex.yy.c is obtained by flex demirgokhan-hw1.flx command.

g can be obtained by gcc -std=c99 -o g lex.yy.c -lfl command or gcc -std=gnu99 -o g lex.yy.c -lfl command.

-lfl means link flex library

input.txt and input2.txt can be used for testing with ./g < input.txt and ./g < input2.txt commands.
