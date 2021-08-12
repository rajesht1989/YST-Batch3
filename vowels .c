//REQUIREMENT:GET ENGLISH ALPHABET LETTER FROM USER AND FIND VOWELS AND PRINT ON CONSOLE
char getEnglishAlphabetFromUser(){
    char c;
    printf("Enter Any Alphabet Letter ");
    scanf("%c",&c);
    return c;
}
void findVowels(char c){
    if(c=='a'||c=='e'||c=='i'||c=='o'||c=='u'){
        printf("%c is Vowel ",c);
    }
    else{
        printf("%c is consonant",c);
    }
    
}
#include<stdio.h>
void main(){
    char c = getEnglishAlphabetFromUser();
    findVowels(c);
}
