// Write a Program to check the given number is prime or not prime.

import 'dart:io';

var flag = 0;
primeNum(var num)
{

  if(num <= 1)
    {
      flag = 0;
    }
  for(var i=2;i<=num;i++)
    {
      if(num%i==0){
        flag = 1;
        break;
      }
    }
}

void main()
{
  print('Enter a number :');
  var num = double.parse(stdin.readLineSync().toString());

  if(flag == 0)
    {
      print('$num is prime number');
    }
  else
    {
      print('$num is not prime');
    }
}