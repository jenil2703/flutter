// Write a program user enter the 5 subjects mark. You have to make a
// total and find the percentage. percentage > 75 you have to print
// “Distinction” percentage > 60 and percentage <= 75 you have to
// print “First class” percentage >50 and percentage <= 60 you have to
// print “Second class” percentage > 35 and percentage <= 50 you have to
// print “Pass class” Otherwise print “Fail”

import 'dart:io';

void main()
{
  print('Enter five numbers :');

  var n1 = double.parse(stdin.readLineSync()!);
  var n2 = double.parse(stdin.readLineSync()!);
  var n3 = double.parse(stdin.readLineSync()!);
  var n4 = double.parse(stdin.readLineSync()!);
  var n5 = double.parse(stdin.readLineSync()!);

  var total = n1 + n2 + n3 + n4 + n5;
  print('Total : $total');

  var per = total / 5;
  print('Percentage : $per');

  if(per>75)
    {
      print('Distiction');
    }
  else if(per>60 && per<=75)
    {
      print('First class');
    }
  else if(per>50 && per<=60)
    {
      print('Second class');
    }
  else if(per>35 && per<=50)
    {
      print('Pass class');
    }
  else
    {
      print('Fail');
    }
}