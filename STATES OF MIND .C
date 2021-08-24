//REQUIREMENT:😍😍GET AGE FROM USER AND FIND USER HUMAN STAGE OR NATURE OF HUMAN AND PRINT ANYONE INTERESTED FACT OR ADVOICE😍😍
int getAgeFromUser(){
    int age;
    printf("Enter A Age ");
    scanf("%d",&age);
    return age;
}
int ageOfUser(int a){
    if(a < 6){
        printf("You are Baby \n");
        printf("My advice:🎈Enjoy your life🎈");
    }
    else if(a < 10){
        printf("you are child\n");
        printf("My advice:🎈Enjoy your life🎈");
    }
    else if(a < 18){
        printf("You Are Kid \n");
        printf("My advice:😎🎈😎Get used to respecting adults😎🎈😎");
    }
    else if(a > 18 && a < 30){
        printf("You Are 18+ and very intested person\n");
        printf("My advice:😀😀🎈To be a pioneer for others🎈😀😀");
    }
    else if(a > 30 && a < 50){
        printf("you are Married Person\n");
        printf("My advice:🤗🎈Children need to learn to be role models and children to act like brothers🎈🤗");
    }
    else if(a > 50){
        printf("You are First Citizen \n");
        printf("My advice:🤩🎈You are the root of the family🎈🤩");
    }
}
#include<stdio.h>
int main(){
    ageOfUser (getAgeFromUser());
}
