#include"stdio.h"
struct test
{
    int i;
    char *c;
};
int main(void)
{
    struct test *t = malloc(sizeof(struct test));
    //t = (struct test) { .i = 10, .c = "hello world\n" };
    t->i = 10;
    t->c = "hello world\n";

    printf(t->c);
    return 0;
}
