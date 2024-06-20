class Student
{
  var fname,lname,email;

  Student(var f,var l,var e)
  {
    fname = f;
    lname = l;
    email = e;
  }

  void display()
  {
    print('Your firstname : $fname');
    print('Your lname : $lname');
    print('Your email : $email');
  }
}

void main()
{
  var s1 = Student('Jenil', 'Dobariya', 'jenil@gmail.com');
  var s2 = Student('Jay', 'Patel', 'jay@gmail.com');

  s1.display();
  s2.display();
}