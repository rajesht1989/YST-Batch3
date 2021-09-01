//.REQUIREMENT:GET NUMBER FROM USER AND DRAW LETTER "L" & "O" ON CONSOLE
int getNumberFromUser(){
    int number;
    printf("Enter a Number ");
    scanf("%d",&number);
    return number;
}
void drawL(int a){
    for(int i=0;i<a;i++){
     for(int j=0;j<a;j++){
    //printf("+\t");
//printf("\n");
    if(j==0||i==a-1){
        printf("*\t");
    }
    else{
        printf("\t");
    }
    }
    printf("\n");
}
}
void drawO(int a){
    for(int i=0;i<a;i++){
     for(int j=0;j<a;j++){
    //printf("+\t");
//printf("\n");
    if(j==0||i==0||i==a-1||j==a-1){
        printf("*\t");
    }
    else{
        printf("\t");
    }
    }
    printf("\n");
}
}

#include<stdio.h>
void main(){
    drawL(getNumberFromUser());
    drawO(getNumberFromUser());
}
