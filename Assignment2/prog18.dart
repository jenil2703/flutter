// Write a Program of Addition, Subtraction ,Multiplication and Division using Switch case.(Must Be Menu Driven)

import 'dart:io';

void main()
{
  print('Enter two numbers :');
  var num1 = double.parse(stdin.readLineSync()!);
  var num2 = double.parse(stdin.readLineSync()!);

  print('Enter choice :');
  var choice = double.parse(stdin.readLineSync().toString());

  switch(choice)
  {
    case 1:
      var add = num1 + num2;
      print('Addition is : $add');
    break;

    case 2:
      var sub = num1 - num2;
      print('Substraction is : $sub');
      break;

    case 3:
      var mul = num1 * num2;
      print('Multiplication is : $mul');
      break;

    case 4:
      var div = num1 / num2;
      print('Division is : $div');
      break;
  }
}