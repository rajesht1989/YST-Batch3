//REQUIEMENT:GET NUMBER FROM USER AND DRAW HOLLOW SQUARE ON CONSOLE
int getNumberFromUser(){
    int number;
    printf("Enter a Number ");
    scanf("%d",&number);
    return number;
}
void draw(int a){
    for(int i=0;i<a;i++){
     for(int j=0;j<a;j++){
    //printf("+\t");
//printf("\n");
    if(i==0||j==0||i==a-1||j==a-1){
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
    draw(getNumberFromUser());
}
