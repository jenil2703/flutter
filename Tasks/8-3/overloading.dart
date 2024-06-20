//method overloading is not supported in dart

class Student
{
  int add(int a,int b)
  {
    return a + b;
  }
  // int add(int a,int b,int c)
  // {
  //   return a*b*c;
  // }
}

void main()
{
  var s = Student();
  print(s.add(10, 15));

}