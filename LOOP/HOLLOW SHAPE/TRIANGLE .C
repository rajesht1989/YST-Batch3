//REQUIREMENT:GET NUMBER FROM USER AND PRINT HOLLOW TRIANGLE
int getNumberFromUser(){
    int number;
    printf("Enter a Number ");
    scanf("%d",&number);
    return number;
}
void draw(int a){
    for(int i=0;i<a;i++){
        for(int j=i;j<a;j++){
            if(i==0||j==i||j==a-1){
        printf("*\t");
            }
            else{
                printf("\t");
            }
    }
    printf("\n");
    }
}
#include<stdio.h>
void main(){
    draw(getNumberFromUser());
}
