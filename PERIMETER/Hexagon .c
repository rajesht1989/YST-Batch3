//REQUIREMENT:GET A SIDE FROM USER AND FIND VALUE OF HEXAGON PERIMETER
int getSideFromUser(){
    int side;
    printf("Enter A Value Of Side ");
    scanf("%d",&side);
    return side;
}
int perimeterOfHexagon(int s){
    return 6*s;
}
#include <stdio.h>
int main(){
    int a=getSideFromUser(),b=perimeterOfHexagon(a);
    printf("Perimeter Of Hexagon %d",b);
}
