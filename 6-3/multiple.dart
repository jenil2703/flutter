abstract class M
{
  m()
  {
    print('m called');
  }
}

abstract class N
{
  n()
  {
    print('n called');
  }
}

class Y implements M,N
{
  y()
  {
    print('y called');
  }

  @override
  m() {
    // TODO: implement m
    print('m called');
  }

  @override
  n() {
    // TODO: implement n
    print('n called');
  }
}

void main()
{
  var y = Y();
  y.m();
  y.n();
  y.y();
}