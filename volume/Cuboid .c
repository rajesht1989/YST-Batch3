//REQUIREMENT:GET A HEIGHT,LENGTH,BREADTH AND FIND THE VOLUME OF CUBOID
int getHeightFromUser(){
    int height;
    printf("Enter a Height ");
    scanf("%d",&height);
    return height;
}
int getLengthFromUser(){
    int length;
    printf("Enter a Length ");
    scanf("%d",&length);
    return length;
}
int getBreadthFromUser(){
    int breadth;
    printf("Enter a Breadth ");
    scanf("%d",&breadth);
    return breadth;
}
int volumeOfCuboid(int height,int length,int breadth){
    return height*length*breadth;
}
#include<stdio.h>
int main(){
    int a=getHeightFromUser(),
    b=getLengthFromUser(),
    c=getBreadthFromUser(),
    d=volumeOfCuboid(a,b,c);
    printf("Volume Of Cuboid Id %d",d);
}
