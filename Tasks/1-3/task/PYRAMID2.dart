//A
//BB
//CCC
//DDDD
//EEEEE

import 'dart:io';

void main()
{
  for(int i=1;i<=5;i++)
  {
    for(int j=1;j<=i;j++)
    {
      stdout.write(String.fromCharCode(i+64));
    }
    print('');
  }
}