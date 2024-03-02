//    A
//   AB
//  ABC
// ABCD
//ABCDE

import 'dart:io';

void main()
{
  for(int i=1;i<=5;i++)
  {
    for(int j=0;j<=5-i;j++)
    {
      stdout.write(' ');
    }
    for(int k=1;k<=i;k++)
    {
      stdout.write(String.fromCharCode(k+64));
    }
    print('');
  }
}