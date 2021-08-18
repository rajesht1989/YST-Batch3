//Get radius from user and identify the area of circle and print on console


#include <stdio.h>

float getRadiusFromUser(){
    float radius;
    printf("Enter the Radius");
    scanf("%f",&radius);
    return radius;
}


float areaOfCircle(float radius){
    return 3.14 * radius * radius;
}


void main(){
    float radius=getRadiusFromUser();
    printf("Area is %f",areaOfCircle(radius));
}
