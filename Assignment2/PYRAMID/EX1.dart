//10 6 3 1
// 9 5 2
// 8 4
// 7

import 'dart:io';

void main()
{
  var rows = 4;
  var current = 10;

  for(int i=rows;i>=1;i--)
    {
      var temp = current;
      for(int j=0;j<i;j++)
       {
         stdout.write(' $temp');
         temp -= (rows - j);
       }
      print('');
      current -= 1;
    }
}