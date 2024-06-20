class Employee
{
  var _name;
  var _salary;

  get name => _name;

  set name(value) {
    _name = value;
  }


  get salary => _salary;

  set salary(value) {
    _salary = value;
  }
}

void main()
{
  var e1 = Employee();

  e1._name = 'Jenil';
  e1._salary = 50000;

  print(e1._name);
  print(e1._salary);
}