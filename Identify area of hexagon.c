//Get sides from user and identify the area of hexagon and print on console

/*
A = 3^3/2 a^2
*/

#include<stdio.h>


int getSideFromUser(){
    int side;
    printf("Enter the side");
    scanf("%d", &side);
    return side;
}


float areaOfHexagon(int side){
    return  (3^3/2)  * side * side;
}


void main (){
    int side = getSideFromUser();
    printf("Area is %f",areaOfHexagon(side));
}
