void main()
{
  //fixed list
  List<int> numberlist = [1,2,3,4,5];
  numberlist.add(8);


  //growable list
  List<int> numberlist2 = [11,22,33,44,55];
  numberlist.addAll(numberlist2);

  numberlist2.remove(44); //remove object value
  numberlist.removeAt(3); //remove index value
  
  print('Total numbers are : ' +numberlist.length.toString());

  //using for loop we can print data in a column
  for(var data in numberlist)
    {
      print(data);
    }
}