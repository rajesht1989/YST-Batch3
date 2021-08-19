//REQUIREMENT:GET AN CHARACTER FROM USER AMONG A,B,C,D AND PRINT IT'S WORD ON CONSOLE
char getCharacterFromUser(){
    char a;
    printf("Enter A Character ");
    scanf("%c",&a);
    return a;
}
char Word(char a){
    if(a=='a'){
       printf(" The Word Is apple");
    }
    else{
        if(a=='b'){
            printf("The Word Is ball");
        }
    }
    if(a=='c'){
        printf("The Word Is Camal");
    }
    else{
        if(a=='d'){
            printf("The Word Is Dream ");
        }
    }
}
#include<stdio.h>
void main(){
    char a=getCharacterFromUser();
    char b=Word(a);
    printf("%c",b);
}
