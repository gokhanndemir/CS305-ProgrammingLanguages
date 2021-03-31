lex.yy.c is obtained by flex demirgokhan-hw2.flx command.

.tab.h and .tab.c can be obtained by bison -d demirgokhan-hw2.y command.

demirgokhan can be obtained by gcc -o demirgokhan-hw2 lex.yy.c demirgokhan-hw2.tab.c -lfl command.

-lfl means link flex library

test17.JISP can be used for testing with demirgokhan-hw2 < test17.JISP command.
