class A
{
  a1()
  {
    print('A1 called');
  }
}

class B extends A
{
  b1()
  {
    print('A2 called');
  }
}

void main()
{
  var a = B();
  a.a1();
  a.b1();
}