lex.yy.c is obtained by flex demirgokhan-hw1.flx

g can be obtained by gcc -std=c99 -o g lex.yy.c -lfl or gcc -std=gnu99 -o g lex.yy.c -lfl

-lfl means link flex library

input.txt and input2.txt can be used for testing with ./g < input.txt or ./g < input2.txt commands.
