//REQUIREMENT:GET 3 NUMBER FROM USER AND IDENTIFY BIGGEST NUMBER AND PRINT ON CONSOLE
int getNumberFromUser(){
    int n;
    printf("Enter a Number ");
    scanf("%d",&n);
    return n;
}
int biggestNumber(int a,int b,int c){
    if(a>b&&a>c){
        return a;
    }
    else{
        if(b>c){
            return b;
        }
        else{
            return c;
        }
    }
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=getNumberFromUser();
    printf("Biggest Value Is %d",biggestNumber(a,b,c));
}
//REQUIREMENT:GET 4 NUMBER FROM USER AND IDENTIFY BIGGEST NUMBER AND PRINT ON CONSOLE
int getNumberFromUser(){
    int n;
    printf("Enter a Number ");
    scanf("%d",&n);
    return n;
}
int biggestNumber(int a,int b,int c,int d){
    if(a>b&&a>c&&a>d){
        return a;
    }
    else{
        if(b>c&&b>d){
            return b;
        }
    }
    if(c>d){
        return c;
    }
    else{
        return d;
    }
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=getNumberFromUser();
    int d=getNumberFromUser();
    printf("Biggest Value Is %d",biggestNumber(a,b,c,d));
}
///REQUIREMENT:GET 2 NUMBER FROM USER AND IDENTIFY SMALlEST NUMBER AND PRINT ON CONSOLE
int getNumberFromUser(){
    int n;
    printf("Enter a Number ");
    scanf("%d",&n);
    return n;
}
int smallestNumber(int a,int b){
    if(a<b){
        return a;
    }
    else{
        return b;
    }
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    printf("Smallest Value Is %d",smallestNumber(a,b));
}
//REQUIREMENT:GET 3 NUMBER FROM USER AND IDENTIFY SMALlEST NUMBER AND PRINT ON CONSOLE
int getNumberFromUser(){
    int n;
    printf("Enter a Number ");
    scanf("%d",&n);
    return n;
}
int smallestNumber(int a,int b,int c){
    if(a<b&&a<c){
        return a;
    }
    else{
        if(b>c){
            return c;
        }
        else{
          return b;  
        }
    }
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=getNumberFromUser();
    printf("Smallest Value Is %d",smallestNumber(a,b,c));
}
//REQUIREMENT:GET 2 NUMBER FROM USER AND IDENTIFY SMALlEST NUMBER AND PRINT ON CONSOLE
float getNumberFromUser(){
    float n;
    printf("Enter a Number ");
    scanf("%f",&n);
    return n;
}
float smallestNumber(float a,float b){
    if(a<b){
        return a;
    }
    else{
        return b;
    }
}
#include<stdio.h>
int main(){
    float a=getNumberFromUser();
    float b=getNumberFromUser();
    printf("Smallest Value Is %f",smallestNumber(a,b));
}
//REQUIREMENT:GET 3 NUMBER FROM USER AND IDENTIFY SMALlEST NUMBER AND PRINT ON CONSOLE
float getNumberFromUser(){
    float n;
    printf("Enter a Number ");
    scanf("%f",&n);
    return n;
}
float smallestNumber(float a,float b,float c){
    if(a<b&&a<c){
        return a;
    }
    else{
        if(b>c){
            return c;
        }
        else{
            return b;
        }
    }
}
#include<stdio.h>
int main(){
    float a=getNumberFromUser();
    float b=getNumberFromUser();
    float c=getNumberFromUser();
    printf("Smallest Value Is %f",smallestNumber(a,b,c));
}
//REQUIREMENT:GET 4 NUMBER FROM USER AND IDENTIFY SMALlEST NUMBER AND PRINT ON CONSOLE
int getNumberFromUser(){
    int n;
    printf("Enter a Number ");
    scanf("%d",&n);
    return n;
}
int smallestNumber(int a,int b,int c,int d){
    if(a<b&&a<c&&a<d){
        return a;
    }
    else{
        if(b<c&&b<d){
            return b;
        }
        if(c<d){
            return c;
        }
        else{
            return d;
        }
    }
}
#include<stdio.h>
int main(){
    int a=getNumberFromUser();
    int b=getNumberFromUser();
    int c=getNumberFromUser();
    int d=getNumberFromUser();
    printf("Smallest Value Is %d",smallestNumber(a,b,c,d));
}
//REQUIREMENT:GET 4 NUMBER FROM USER AND IDENTIFY SMALlEST NUMBER AND PRINT ON CONSOLE
float getNumberFromUser(){
    float n;
    printf("Enter a Number ");
    scanf("%f",&n);
    return n;
}
float smallestNumber(float a,float b,float c,float d){
    if(a<b&&a<c&&a<d){
        return a;
    }
    else{
        if(b<c&&b<d){
            return b;
        }
        if(c<d){
            return c;
        }
        else{
            return d;
        }
    }
}
#include<stdio.h>
int main(){
    float a=getNumberFromUser();
    float b=getNumberFromUser();
    float c=getNumberFromUser();
    float d=getNumberFromUser();
    printf("Smallest Value Is %f",smallestNumber(a,b,c,d));
}
