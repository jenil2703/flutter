// Write a Program to check the given year is leap year or not.

import 'dart:io';

void main()
{
  print('Enter year :');
  var year = int.parse(stdin.readLineSync().toString());

  if(year % 4 == 0)
    {
      print('$year is a leap year');
    }
  else
    {
      print('$year is not a leap year');
    }
}