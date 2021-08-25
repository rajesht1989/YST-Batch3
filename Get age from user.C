//Get age from user and identify the nature of ones age and give an innovative messege and print it on console


#include<stdio.h>


int getAgeFromUser(){
    int value;
    printf("Enter the Age ");
    scanf("%d", &value);
    return value;
}


int natureOfOnesAge(int age){
    if(age <= 18)
    {
        printf("school students \n" );
        printf("Education is the most powerful weapon which we can use to change the world");
    }
    else if(age >= 18 && age <= 25)
    {
    printf("Higher studies \n");
    printf("Make their responsibilities by their own");
}
else if(age >= 25 && age <= 35)
{
    printf("Marrige \n");
    printf("The responsibilities of life is more higher after marriage");
}
else if(age >= 35 && age <= 55)
{
    printf("After marriage \n");
    printf("You will take the desire to work hard for your life");
}
else
{
    printf("Retired \n");
    printf("The life has going to an end and dont be disturbance to anyone live your own ");
}
}


void main(){
int a= getAgeFromUser();
int n= natureOfOnesAge(a);

}
