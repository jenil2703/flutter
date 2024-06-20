//1
//01
//010
//1010
//10101

import 'dart:io';

void main()
{
  int count=1;
  for(int i=1;i<=5;i++)
  {
    for(int j=1;j<=i;j++,count++)
    {
      stdout.write(count%2);

    }
    print(' ');
  }
}