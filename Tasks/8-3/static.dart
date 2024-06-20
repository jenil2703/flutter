class Student
{
  var id;
  var name;
  static var collage = 'Marwadi';//static value

  Student(var id,var name)//parameterized
  {
    this.id = id;
    this.name = name;
  }

  void display()
  {
    print('Your id is $id');
    print('Your name is $name');
    print('Your collage is $collage');
  }

  static change()
  {
    collage = 'Atmiya';
  }
}

void main()
{
  Student.change(); // parameterized


  var s1 = Student(01, 'Jenil');
  var s2 = Student(02, 'Jay');

  s1.display();
  s2.display();
}
