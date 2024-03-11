class Person
{
  String call(int age,String name)
  {
    return 'The name of the person is $name and age is $age';
  }
}

void main()
{
  var p1 = Person();
  var msg = p1(21,'Jenil');
  print(msg);

  var msg2 = p1(20,'Jay');
  print(msg2);
}