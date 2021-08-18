//Get the radius and height from user, identify the volume of cylinder and print on console 
/*
V=πr^2h
*/
#include <stdio.h>

float getRadiusFromUser() {
   float radius;
    printf("Enter Radius");
    scanf("%f", &radius);
    return radius;
}

float getHeightFromUser() {
    float height;
    printf("Enter Height");
    scanf("%f", &height);
    return height;
}

float volumeOfCylinder(float radius, float height) {
    return 3.14 * radius * radius * height;
}

void main() {
    float radius = getRadiusFromUser();
    float height = getHeightFromUser();
    printf("Volume is %f", volumeOfCylinder(radius,height));
}
