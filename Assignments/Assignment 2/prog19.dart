// Write a program of to find out the Area of Triangle, Rectangle and Circle using If Condition.(Must Be Menu Driven)


import 'dart:io';
import 'dart:math';

void main()
{
  print("Enter choice :");
  var choice = double.parse(stdin.readLineSync().toString());

  switch(choice)
  {
    case 1 :
      print('-----Area of circle-----');
      var pi = 3.14;
      print('Enter radius :');
      var r = double.parse(stdin.readLineSync().toString());

      var area = pi * r * r;
      print('Area of circle : $area');

    case 2:
      print('-----Area of triangle-----');
      print('Enter height and base :');
      var h = double.parse(stdin.readLineSync()!);
      var b = double.parse(stdin.readLineSync()!);

      var area = (h * b) / 2;
      print('Area of triangle : $area');

    case 3:
      print('-----Area of Rectangle-----');
      print('Enter Length and Width :');
      var l = double.parse(stdin.readLineSync()!);
      var w = double.parse(stdin.readLineSync()!);

      var area = l * w;
      print('Area of Rectangle : $area');
  }
}