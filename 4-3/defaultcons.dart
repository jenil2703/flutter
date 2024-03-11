class Count
{
  static var count = 0;
  //default cons

  Count()
  {
    count++;
    print(count);
  }
}

void main()
{
  var c1 = Count();
  var c2 = Count();
  var c3 = Count();
}