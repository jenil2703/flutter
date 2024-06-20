void main()
{
  var x = 10;
  var y = 20;
  var temp;

   temp = x;
   x = y;
   y = temp;

  print("X : $x");
  print("Y : $y");
}