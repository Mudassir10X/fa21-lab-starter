#include <stdio.h>

int sub(int a, int b)
{
    return a - b;
}
int compare(int a, int b)
{

    if (sub(a, b) >= 0)

        return 1;

    else

        return 0;
}

void dataArray(int num)
{

    int i;

    int array[10];

    for (i = 0; i < 10; i = i + 1)
    {
        array[i] = compare(num, i);
    }
}

void main()
{
    dataArray(5);
}







