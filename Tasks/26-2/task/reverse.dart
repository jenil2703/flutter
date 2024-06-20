// Write a program to print the number in reverse order.

import 'dart:io';

void main()
{
  int reverse = 0;
  print("Enter any number:");
  int n = int.parse(stdin.readLineSync().toString());
  while(n > 0)
    {
       int rem = n % 10;
       reverse = (reverse*10) + rem;
       n = n ~/ 10;
    }
  print(reverse);
}