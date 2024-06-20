class Animal
{
  var color="";

  Animal(var color)
  {
    this.color = color;
    print('Animal class constructor');
  }

  Animal.MyAnimal(var color)
  {
    print('Animal class named constructor');
  }
}

class dog extends Animal
{
  var breed="";
  dog(var breed, var color):super(color)
  {
    this.breed = breed;
    print('Dog class constructor');
  }

  dog.myDog(var breed, var color):super.MyAnimal(color)
  {
    this.breed = breed;
    print('Dog class named constructor');
  }
}

void main()
{
  var d = dog('Germen','black');
  print(d.breed);
  print(d.color);
  
  print('====================');

  var d1 = dog('Pug','white');
  print(d1.breed);
  print(d1.color);

  print('====================');

  var d2 = dog.myDog('Labrador','black-white');
  print(d2.breed);
  print(d2.color);
}