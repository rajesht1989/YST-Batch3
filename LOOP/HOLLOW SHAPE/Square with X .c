//.REQUIREMENT:GET NUMBER FROM USER AND DRAW SQUARE WITH ONESIDE SLASH
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
    if(j==0||i==a-1||i==0||j==a-1||i==j||j==a-1-i){
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
