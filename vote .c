//REQUIEMENT:GET AN AGE FROM USER AND IDENTIFY ELIGIPLE FOR VOTE
int getAgeFromUser(){
    int age;
    printf("Get Age From User ");
    scanf("%d",&age);
    return age;
}
int findEligipleForVote(int a){
    if(a>18||a==18){
        printf("Your Eligiple For Vote ");
    }
    else{
        printf("Your Not Eligiple For Vote ");
    }
}
#include<stdio.h>
int main(){
    int a=getAgeFromUser();
    findEligipleForVote(a);
}
