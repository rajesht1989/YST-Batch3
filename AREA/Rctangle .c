//REQUIREMENT:GET A LENGTH AND WIDTH FROM USER AND FIND AREA OF RECTANGLE
int getLengthFromUser(){
    int length;
    printf("Enter A Value Of Length ");
    scanf("%d",&length);
    return length;
}
int getWidthFromUser(){
    int width;
    printf("Enter A Value Of Width ");
    scanf("%d",&width);
    return width;
}
int areaOfRectangle(int length,int width){
    return length*width;
}
#include<stdio.h>
void main(){
    int a=getLengthFromUser();
    int b=getWidthFromUser();
    int c=areaOfRectangle(a,b);
    printf("Area Of Rectangle Is %d",c);
}
