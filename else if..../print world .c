//REQUIREMENT:GET NUMBER FROM USER AND PRINT NUMBER SPELLING ON CONSOLE
int getNumberFromUser(){
    int number;
    printf("Enter A Number ");
    scanf("%d",&number);
    return number;
}
void printWord(int a){
    if(a==1){
        printf("ONE");
    }
    else if(a==2){
        printf("TWO");
    }
    else if(a==3){
        printf("THREE");
    }
    else if(a==4){
        printf("FOUR");
    }
    else if(a==5){
        printf("FIVE");
    }
    else if(a==6){
        printf("SIX");
    }
    else{
        printf("CAN'T BE IDENTIFY😔SORRY");
    }
    
}
#include<stdio.h>
void main(){
    printWord(getNumberFromUser());
}
