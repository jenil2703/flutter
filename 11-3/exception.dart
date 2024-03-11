void main()
{
  try
  {
    int num = 10;
    var num2 = num ~/ 0;
    print(num2);
  }
  catch(e)
  {
    print(e.toString());
  }
  finally
  {
    print('Success');
  }
}