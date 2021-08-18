//Get the width,length of  from user, identify the area of rectangle and print on console 
/*
A=wl
*/
#include <stdio.h>

int getWidthFromUser() {
    int width;
    printf("Enter the Width");
    scanf("%d", &width);
    return width;
}

int getLengthFromUser() {
    int length;
    printf("Enter the Length");
    scanf("%d", &length);
    return length;
}

int areaOfRectangle(int width, int length) {
    return  width * length;
}

void main() {
    int width = getWidthFromUser();
    int length = getLengthFromUser();
    printf("Area is %d", areaOfRectangle(width, length));
}
