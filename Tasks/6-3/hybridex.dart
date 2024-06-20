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

class C extends A
{
  c1()
  {
    print('C called');
  }
}

class D implements B,C
{
  d1()
  {
    print('D called');
  }

  @override
  a1() {
    // TODO: implement a1
    print('A called');
  }

  @override
  b1() {
    // TODO: implement b1
    print('B called');
  }

  @override
  c1() {
    // TODO: implement c1
    print('C called');
  }
}
void main()
{
  var d = D();
  d.a1();
  d.b1();
  d.c1();
  d.d1();
}