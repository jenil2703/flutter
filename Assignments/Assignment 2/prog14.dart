import 'dart:io';

void main()
{
  print("Enter three number :");

  var num1 = double.parse(stdin.readLineSync()!);
  var num2 = double.parse(stdin.readLineSync()!);
  var num3 = double.parse(stdin.readLineSync()!);

  var max = (num1>=num2) ? (num1>=num3 ? num1:num3) : (num2>=num3 ? num2:num3);

  print('The maximum number is : $max');
}