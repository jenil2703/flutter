//     1
//    12
//   123
//  1234
// 12345

import 'dart:io';

void main()
{
  for(int i=1;i<=5;i++)
  {
    for(int j=0;j<=(5-i);j++)
    {
      stdout.write(' ');
    }
    for(int k=1;k<=i;k++)
    {
      stdout.write(k);
    }
    print('');
  }
}