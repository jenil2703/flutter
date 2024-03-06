    // .Write a program to find out the max from given number
    // (E.g. No: -1562 Max number is 6 )

import 'dart:io';

void main()
{
  int large=0,rem=0;
  print("Enter a number");
  int n = int.parse(stdin.readLineSync().toString());

  while(n > 0)
    {
      rem = n % 10;

      if(rem > large)
        {
          large = rem;
        }
      n = n ~/ 10;
    }
    print("Large number : $large");
}