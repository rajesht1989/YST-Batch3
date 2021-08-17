//REQUIREMENT:GET A RADIUS FROM USER AND FIND AREA OF CIRCLE
int getRadiusFromUser(){
    int r;
    printf("Enter A Value Of Radius ");
    scanf("%d",&r);
    return r;
}
float  areaOfCircle(float radius){
    return 3.14*radius*radius;
}
#include<stdio.h>
int main(){
    int a=getRadiusFromUser();
    float b=areaOfCircle(a);
        printf("Area Of Circle %f",b);
}
