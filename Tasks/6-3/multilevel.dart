class A
{
  a1()
  {
    print('A called');
  }
}

class B extends A
{
  b1()
  {
    print('B called');
  }
}

class C extends B
{
  c1()
  {
    print('C called');
  }
}

void main()
{
  var c = C();
  c.a1();
  c.b1();
  c.c1();
}