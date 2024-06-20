import 'dart:io';

class Details
{
  var fullname,mob,aadharcard,technology;

  display()
  {
    print("Enter your full name :");
    var fullname = stdin.readLineSync().toString();

    print("Enter your mobile no :");
    var mob = stdin.readLineSync().toString();

    print("Enter your aadhar card number :");
    var aadharcard = stdin.readLineSync().toString();

    print("Enter your technology :");
    var technology = stdin.readLineSync().toString();

    print("Your full name is : $fullname");
    print("Your mobile no is : $mob");
    print("Your aadhar card number is : $aadharcard");
    print("Your technology is : $technology \n\n\n");

  }
}

void main()
{
  var d1 = Details();
  var d2 = Details();

  d1.fullname;
  d1.mob;
  d1.aadharcard;
  d1.technology;

  d2.fullname;
  d2.mob;
  d2.aadharcard;
  d2.technology;

  d1.display();
  d2.display();

}