//Get sides from user and identify the perimeter of hexagon and print on console

/*
P = 6 a
*/

#include<stdio.h>


int getSideFromUser(){
    int side;
    printf("Enter the side");
    scanf("%d", &side);
    return side;
}


int perimeterOfHexagon(int side){
    return  6 * side;
}


void main (){
    int side = getSideFromUser();
    printf("Perimeter is %d",perimeterOfHexagon(side));
}
