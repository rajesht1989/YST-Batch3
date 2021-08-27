//REQUIREMENT:DESIGN TRYANGLE
void drawTryangle(int d){
    for(int i=0;i<d;i++){
        printf("*\t");
    }
    printf("\n");
}
void draw(int a){
    for(int b=0;b<a;b++){
        printf("*\t");
    }
    printf("\n");
}
void tryangle(int c){
    for(int d=0;d<c;d++){
        printf("*\t");
    }
}
#include<stdio.h>
void main(){
    drawTryangle(1);
    draw(2);
    tryangle(3);
}
