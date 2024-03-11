class Rbi
{
  rate()
  {
    return 0;
  }
}

class Boi extends Rbi
{
  rate()
  {
    return 7;
  }
}

class Sbi extends Rbi
{
  rate()
  {
    return 8;
  }
}

class Axis extends Rbi
{
  rate()
  {
    return 9;
  }
}

void main()
{
  // var s1 = Sbi();
  // var b1 = Boi();
  // var a1 = Axis();
  //
  // print(s1.rate());
  // print(b1.rate());
  // print(a1.rate());


  //method overriding
  var r = Rbi();
  r = Boi();
  print(r.rate());

  r = Sbi();
  print(r.rate());

  r = Axis();
  print(r.rate());
}