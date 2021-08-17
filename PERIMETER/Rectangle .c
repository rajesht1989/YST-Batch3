//REQUIREMENT:GET A LENGTH AND WIDTH FROM USER AND FIND PERIMETER OF RECTANGLE
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
int perimeterOfRectangle(int length,int width){
    return 2*(length+width);
}
#include<stdio.h>
void main(){
    int a=getLengthFromUser();
    int b=getWidthFromUser();
    int c=perimeterOfRectangle(a,b);
    printf("Perimeter Of Rectangle Is %d",c);
}
