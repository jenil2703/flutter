// 13. Write a program to find the Max number from the given three number using Nested If

import 'dart:io';

void main()
{
  print("Enter three numbers : ");

  var num1 = double.parse(stdin.readLineSync()!);
  var num2 = double.parse(stdin.readLineSync()!);
  var num3 = double.parse(stdin.readLineSync()!);

  var max;

  if(num1>=num2)
    {
      if(num1 >= num3)
        {
          max = num1;
        }
      else
      {
        max= num3;
      }
    }
  else
    {
      if(num2 >= num3)
        {
          max = num2;
        }
      else
        {
          max = num3;
        }
    }
  print('The maximum number is : $max');
}