//REQUIREMENT:GET A SIDE FROM USER AND FIND VALUE OF SQUARE PERIMETER
int getSideFromUser(){
    int side;
    printf("Enter A Value Of Side ");
    scanf("%d",&side);
    return side;
}
int perimeterOfSquare(int s){
    return 4*s;
}
#include <stdio.h>
int main(){
    int a=getSideFromUser(),b=perimeterOfSquare(a);
    printf("Perimeter Of Square %d",b);
}
