//REQUIEMENT:GET AN AGE FROM USER AND IDENTIFY ELIGIBLE FOR VOTE
int getAgeFromUser(){
    int age;
    printf("Get Age From User ");
    scanf("%d",&age);
    return age;
}
int findEligipleForVote(int a){
    if(a>18||a==18){
        printf("Your EligiBle For Vote ");
    }
    else{
        printf("Your Not EligiBle For Vote ");
    }
}
#include<stdio.h>
int main(){
    int a=getAgeFromUser();
    findEligipleForVote(a);
}

//REQUIEMENT:GET AN AGE FROM USER AND IDENTIFY ELIGIBLE FOR MARRIAGE
int getAgeFromUser(){
    int age;
    printf("Get Age From User ");
    scanf("%d",&age);
    return age;
}
int findEligibleForMarriage(int a){
    if(a>24&&a<30){
        printf("Your EligiBle For Marriage ");
    }
    else{
        if(a<24){
            printf("You Are Kid");
        }
    }
    if(a>30){
        printf("very funny .You have passed the age of marriage  ");
    }
}
#include<stdio.h>
int main(){
    int a=getAgeFromUser();
    findEligibleForMarriage(a);
}
