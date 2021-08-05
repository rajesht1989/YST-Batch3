//REQUIREMENT:FIND AREA OF SQUARE                   //AREA OF SQUARE FORMULA=a*a
//RETURN & ARQUIMENT FUNCTION
int findAreaOfSquare(int a){      
    return a*a;
}

#include<stdio.h>
int main(){
    int a=findAreaOfSquare(6);
    printf("RESULT %d",a);
}

//REQUIREMENT:FIND PERIMETER OF SQUARE
//RETURN & ARQUIMENT FUNCTION                       //PERIMETER OF SQUARE FORMULA=4*a
int fintPerimeterOfSquare(int a){
    return 4*a;
}
#include<stdio.h>
int main(){
    int p=fintPerimeterOfSquare(9);
    printf("VALUE OF PERIMETER %d",p);
}

//REQUIREMENT:FIND AREA OF RECTANGLE
//RETURN & ARQUIMENT FUNCTION                       //AREA OF RECTANGLE FORMULA=l*b
int findAreaOfRectangle(int l,int b){
    return l*b;
}
#include<stdio.h>
int main(){
    int v=findAreaOfRectangle(5,8);
    printf("VALUE OF RECTANGLE AREA %d",v);
}

//REQUIREMENT:FIND PERIMETER OF RECTANGLE
//RETURN & ARQUIMENT FUNCTION                         //PERIMETER OF RECTANGLE FORMULA=2*(l+b)
int fintPerimeterOfRectangle(int l,int b){
    return 2*(l+b);
}
#include<stdio.h>
int main(){
    int r=fintPerimeterOfRectangle(7,9);
    printf("VALUE OF RECTANGLE PERIMETER %d",r);
}

//REQUIREMENT:FIND AREA OF CIRCLE
//RETURN & ARQUIMENT FUNCTION                         //AREA OF CIRCLE FORMULA=πr2
float findAreaOfCircle(float r){
    return 3.14*r*r;
}
#include<stdio.h>
int main(){
    float c=findAreaOfCircle(4.5);
    printf("VALUE OF CIRCLE AREA %f",c);
}

//REQUIREMENT:FIND PERIMETER OF CIRCLE
//RETURN & ARQUIMENT FUNCTION                       //PERIMETER OF CIRCLE FORMULA=2πR
float fintPerimeterOfCircle(float a){
    return 2*3.14*a;
}
#include<stdio.h>
int main(){
    float c=fintPerimeterOfCircle(6.5);
    printf("VALUE OF CIRCLE PERIMETER %f",c);
}
 
//REQUIREMENT:FIND AREA OF TRIANGLE
//RETURN & ARQUIMENT FUNCTION                      //AREA OF TRIANGLE FORMULA=1/2*b*h
int findAreaOfTriangle(int b,int h){
    return b*h*1/2;
}
#include<stdio.h>
int main(){
    int t=findAreaOfTriangle(6,6);
    printf("VALUE OF TRIANGLE AREA %d",t);
}

//REQUIREMENT:FIND PERIMETER OF TRIANGLE
//RETURN & ARQUIMENT FUNCTION                      //PERIMETER OF TRIANGLE FORMULA=a+b+c
int fintPerimeterOfTriangle(int a,int b,int c){
    return a+b+c;
}
#include<stdio.h>
int main(){
    int s=fintPerimeterOfTriangle(20,30,20);
    printf("VALUE OF TRIANGLE PERIMETER %d",s);
}

//REQUIREMENT:FIND AREA OF HEXAGON
//RETURN & ARQUIMENT FUNCTION                       //AREA OF HEXAGON FORMULA=(3*1.73205080757/2)*a*a
float findAreaOfHexagon(float a){
    return (3*1.73205080757/2)*a*a;
}
#include<stdio.h>
int main(){
    float g=findAreaOfHexagon(6);
    printf("VALUE OF HEXAGON AREA %f",g);
}

//REQUIREMENT:FIND PERIMETER OF HEXAGON
//RETURN & ARQUIMENT FUNCTION                       //PERIMETER OF HEXAGON FORMULA=6*a
int findPerimeterOfHexagon(int a){
    return 6*a;
}
#include<stdio.h>
int main(){
    int g=findPerimeterOfHexagon(9);
    printf("VALUE OF HEXAGON PERIMETER %i",g);
}

//REQUIREMENT:FIND PERIMETER OF PENTAGON
//RETURN & ARQUIMENT FUNCTION                      //PERIMETER OF PENTAGON FORMULA=5*a
int findPerimeterOfPentagon(int a){
    return 5*a;
}
#include<stdio.h>
int main(){
    int v=findPerimeterOfPentagon(8);
    printf("VALUE OF PENTAGON PERIMETER %d",v);
}




