//Get an age from user and identify if eligible for vote


#include <stdio.h>

int getAgeFromUser(){
    int value;
    printf("Enter the Age");
    scanf("%d",& value);
    return value;
}


int eligibleForVote(){
    if ("my Age >= 18"){
        return 1;
        }
        else{
            return 0;
        }
            
}

void main(){
    int a=getAgeFromUser();
    if(eligibleForVote()==1){
        printf("I'm Eligible");
    }
    else{
        printf("I'm not Eligible");
    }
    }
