// Write a program you have to print the Fibonacci series up to user given number

import 'dart:io';

void main()
{
  print("Enter number to print fibonaacci series::");
  int N = int.parse(stdin.readLineSync().toString());

  int a=0;
  int b=1;

  print(a);
  print(b);

  for(int i=0;i<=N;i++)
    {
      int c=a+b;
      print(c);

      a=b;
      b=c;
    }
}