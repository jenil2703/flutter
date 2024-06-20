// d .write a program you have to find the factorial of given number.
// 5!=5*4*3*2*1

import 'dart:io';

void main()
{
  print("Enter any number to find factorial:");
  int N = int.parse(stdin.readLineSync().toString());

  var result = 1;
  for(var i=1;i<=N;i++)
    {
      result = result*i;
    }

  print("Factorial of $N");
  print(result);
}