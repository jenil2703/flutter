class Bank
{
  bank()
  {
    print('banking');
  }
}

class Saving extends Bank
{
  saving()
  {
    print('saving');
  }
}

class Current extends Bank
{
  current()
  {
    print('current');
  }
}

void main()
{
  var s = Saving();
  var c = Current();

  s.saving();
  c.current();
  s.bank();
  c.bank();
}