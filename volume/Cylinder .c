//REQUIREMENT:GET AN RADIUS AND HEIGHT FROM USER AND FIND VOLUME OF CYLINTER
float getRadiusFromUser(){
     float radius;
     printf("Enter A Value Of Radius ");
     scanf("%f",&radius);
     return radius;
}
float getHeightFromUser(){
     float height;
     printf("Enter A Value Of Height ");
     scanf("%f",&height);
     return height;
}
float volumeOfCylinter(float radius,float height){
    return 3.14*radius*radius*height;
}
#include<stdio.h>
void main(){
    float a=getRadiusFromUser();
    float b=getHeightFromUser();
    float c=volumeOfCylinter(a,b);
    printf("Volume Of Cylinter Is %f",c);
}
