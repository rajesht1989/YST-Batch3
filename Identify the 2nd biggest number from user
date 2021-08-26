//Reg:Get 4 number From User And identify 2nd biggest number
int getNumberFromUser()
 {
     int number;
     printf("Enter A Number ");
     scanf("%d",&number);
     return number;
 }
 int biggestNumber(int a,int b,int c,int d)
 {
     if(a>b && a>c && a>d){
         return a;
     }
     else if(b>c && b>d){
         return b;
     }
     else if(c>d){
         return c;
     }
      else{
          return d;
      }
 }
int secondBiggestNumber(int a,int b,int c,int d)
 {
     int f=biggestNumber(a,b,c,d);
     if(f==a){
         return biggestNumber(0,b,c,d);
     }
     else if(f==b){
         return biggestNumber(a,0,c,d);
     }
     else if (f==c){
         return biggestNumber(a,b,0,d);
     }
     else if(f==d){
         return biggestNumber(a,b,c,0);
     }
 }
 #include<stdio.h>
 void main(){
     int a=getNumberFromUser (),
     b=getNumberFromUser (),
     c=getNumberFromUser (),
     d=getNumberFromUser ();
     int n=secondBiggestNumber(a,b,c,d);
     printf("2nd Biggest Number %d",n);
}
