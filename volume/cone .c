//REQUIREMENT:GET A RADIUS FROM USER AND PRINT VOLUME OF CONE
double getRadiusFromUser(){
    double volume;
    printf("Enter A Radius ");
    scanf("%lf",&volume);
    return volume;
}
double getHightFromUser(){
    double v;
    printf("Enter A Hight ");
    scanf("%lf",&v);
    return v;
}
#include<stdio.h>
void main(){
    double a=getRadiusFromUser();
    double b=getHightFromUser();
    double c=3.14*(a*a)*(b/3);
    printf("Cone Volume Is %lf",c);
}
