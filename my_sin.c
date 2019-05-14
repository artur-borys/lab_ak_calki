#include <stdio.h>

extern double my_sin(double rad);

int main() {
    double x, sinus;
    printf("Program obliczajacy sin(x*pi)\n");
    printf("Podaj x: ");
    scanf("%lf", &x);
    sinus = my_sin(x);
    printf("sin(%g*pi): %.10g\n", x, sinus);
    return 0;
}