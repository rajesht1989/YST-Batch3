//REQUIREMENT:GET NUMBER FROM USER AND PRINT  INVERSAL TRIANGLE
int getNumberFromUser(){
    int number;
    printf("Enter a Number ");
    scanf("%d",&number);
    return number;
}
void draw(int a){
    for(int i=0;i<a;i++){
        for(int j=0;j<a;j++){
         if(j>=i){
              printf("*");
         }
         printf("\t");
    }
    printf("\n");
    }
}
#include<stdio.h>
void main(){
    draw(getNumberFromUser());
    
}
