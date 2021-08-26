//REQUIREMENT:GET LETTER FROM USER AND IDENTIFY VOWELS AND PRINT ON CONSOLE(USE if....else..)
char getLetterFromUser(){
    char a;
    printf("Enter a Letter ");
    scanf("%c",&a);
    return a;
}
void findVowel(char v){
    if(v=='a'||v=='A'||v=='e'||v=='E'||v=='i'||v=='I'||v=='o'||v=='O'||v=='u'||v=='U'){
        printf("'%c' Is Vowel",v);
    }
    else{
        printf("THIS LETTER CAN'T IDENTIFY😕SORRY ");
    }
    }
#include<stdio.h>
int main(){
   findVowel(getLetterFromUser());
}
