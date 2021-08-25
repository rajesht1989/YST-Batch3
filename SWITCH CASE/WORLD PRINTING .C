//REQUIREMENT:GET NUMBER FROM USER AND PRINT NUMBER SPELLING ON CONSOLE
int getNumberFromUser(){
    int number;
    printf("Enter A Number ");
    scanf("%d",&number);
    return number;
}
int printWord(int a){
switch(a){
    case 1:
    printf("ONE");
    break;
    case 2:
    printf("TWO");
    break;
    case 3:
    printf("THREE");
    break;
    case 4:
    printf("FOUR");
    break;
    case 5:
    printf("FIVE");
    break;
    case 6:
    printf("SIX");
    break;
    default:
    printf("Can't be Identifyed");
    break;
}
}
#include<stdio.h>
int main(){
printWord(getNumberFromUser());
}
