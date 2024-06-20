void main()
{
  Map<String,int> countrycode =
      {
        'USA' : 1,
        'INDIA' : 91,
        'AKISTAN' : 92
      };


  for(var data in countrycode.entries)
    {
      print(data);
    }

  print('--------------------------------------');

  Map<String,String> fruits =
      {
        'APPLE' : 'RED',
        'BANANA' : 'YELLOW',
        'GUAVA' : 'GREEN'
      };
  
  print(fruits.containsKey('BANANA'));
  print(fruits['APPLE']);
  fruits.update('APPLE', (value) => 'BLACK');
  print(fruits.isEmpty);
  print(fruits.length);
  print(fruits.containsValue('GREEN'));

  print('-----------------------------------');

  for(var data in fruits.entries)
    {
      print(data);
    }
}