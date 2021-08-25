// Get 1 to 15 numbers from user and  print the number in words on console



#include <stdio.h>

int getNumberFromUser(){
    int value;
    printf("Enter the Number");
    scanf("%d", &value);
    return value;

}



int numberIs(int a)
{
    if(a == 1)
{
      printf("One");
}
else if (a == 2)
    {
        printf("Two");
    }
   else if (a == 3)
    {
        printf("Three");
    }
    else if (a == 4)
        {
            printf("Four");
        }
        else if (a == 5)
        {
            printf("Five");
        }
        else if (a == 6)
        {
            printf("Six");
        }
        else if (a == 7)
        {
            printf("Seven");
        }
        else if (a == 8)
        {
            printf("Eight");
        }
        else if (a == 9)
        {
            printf("Nine");
        }
        else if (a == 10)
        {
            printf("Ten");
        }
        else if (a == 11)
        {
            printf("Eleven");
        }
        else if (a == 12)
        {
            printf("Twelve");
        }
        else if (a == 13)
        {
            printf("Thirteen");
        }
        else if (a == 14)
        {
            printf("Fourteen");
        }
        else if (a == 15)
        {
            printf("Fifteen");
        }
        else
{
    printf("invalid value");
}
}

void main()
{
    
    int a = getNumberFromUser(); 
    int n = numberIs(a);

}
