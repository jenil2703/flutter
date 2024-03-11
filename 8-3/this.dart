class Student
{
  var id;
  var name;

  Student(var id,var name)
  {
    this.id = id;
    this.name = name;
  }

  void display()
  {
    print('Your id is : $id');
    print('Your name is :$name \n\n');
  }
}

void main()
{
  var s1 = Student(01, 'Jenil');
  var s2 = Student(02, 'Jay');
  s1.display();
  s2.display();
}