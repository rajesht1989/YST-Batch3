//REQUIREMENT:GET A SIDE FROM USER AND FIND AREA OF HEXAGON
int getAreaFromUser(){
    int area;
    printf("Enter A Value Of Side ");
    scanf("%d",&area);
    return area;
}
float  areaOfHexagon(float side){
    return (3*1.732/2)*side*side;
}
#include<stdio.h>
int main(){
    int a=getAreaFromUser();
    float b=areaOfHexagon(a);
        printf("Area Of Hexagon %f",b);
}
