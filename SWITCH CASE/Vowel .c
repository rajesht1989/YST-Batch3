//REQUIREMENT:GET LETTER FROM USER AND IDENTIFY VOWELS AND PRINT ON CONSOLE(USE SWITCH CASE)
char getLetterFromUser(){
    char a;
    printf("Enter a Letter ");
    scanf("%c",&a);
    return a;
}
void findVowel(char v){
    switch(v){
        case 'a':
        printf("%c Is Vowel",v);
        break;
        case 'A':
        printf("%c Is Vowel",v);
        break;
        case 'e':
        printf("%c Is Vowel",v);
        break;
        case 'E':
        printf("%c Is Vowel",v);
        break;
        case 'i':
        printf("%c Is Vowel",v);
        break;
        case 'I':
        printf("%c Is Vowel",v);
        break;
        case 'o':
        printf("%c Is Vowel",v);
        break;
        case 'O':
        printf("%c Is Vowel",v);
        break;
        case 'u':
        printf("%c Is Vowel",v);
        break;
        case 'U':
        printf("%c Is Vowel",v);
        break;
        default:
        printf("CAN'T IDENTIFY THIS LETTER😕SORRY");
        break;
    }
}
#include<stdio.h>
int main(){
   findVowel(getLetterFromUser());
}
