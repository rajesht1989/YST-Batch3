//REQUIREMENT:GET A RADIUS FROM USER AND PRINT VOLUME OF SPHERE
double getRadiusFromUser(){
    double volume;
    printf("Enter A Radius ");
    scanf("%lf",&volume);
    return volume;
}
#include<stdio.h>
void main(){
    double a=getRadiusFromUser();
    double b=4;
    double c=3;
    double d=(b/c)3.14(a*a*a);
    printf("Sphere Volume Is %lf",d);
}
