//REQUIREMENT:GET A SIDE FROM USER AND FIND AREA OF SQUARE
int getSideFromUser(){
    int side;
    printf("Enter A Value Of Side ");
    scanf("%d",&side);
    return side;
}
int areaOfSquare(int side){
    return side*side;
}
#include<stdio.h>
int main(){
    int a=getSideFromUser();
    int b=areaOfSquare(a);
        printf("Area Of Square %d",b);
}
