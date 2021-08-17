//REQUIREMENT:GET A RADIUS FROM USER AND FIND VALUE OF CIRCLE  PERIMETER
int getRadiusFromUser(){
    int radius;
    printf("Enter A Value Of Radius ");
    scanf("%d",&radius);
    return radius;
}
float perimeterOfCircle(float r){
    return 2*3.14*r;
}
#include <stdio.h>
int main(){
    int a=getRadiusFromUser();
    float b=perimeterOfCircle(a);
    printf("Perimeter Of Circle %f",b);
}
