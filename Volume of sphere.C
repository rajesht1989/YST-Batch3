//Get radius from user and identify the volume of sphere and print on console


#include <stdio.h>

float getRadiusFromUser(){
    float radius;
    printf("Enter the Radius");
    scanf("%f",&radius);
    return radius;
}


float volumeOfSphere(float radius){
    return 3.14 * radius * radius * radius * 4/3;
}


void main(){
    float radius=getRadiusFromUser();
    printf("Volume is %f",volumeOfSphere(radius));
}
