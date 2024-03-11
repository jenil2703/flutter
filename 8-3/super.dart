class Mycolor
{
  var color = 'white';
}

class Mycolor2 extends Mycolor
{
  var color = 'black';

  void display()
  {
    print(color);
    print(super.color);
  }
}

void main()
{
  var m2 = Mycolor2();
  m2.display();
}