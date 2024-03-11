void main()
{
  //set removes duplicate values
  Set<int> numberset = {11,12,13,12,11};
  numberset.add(14);

  Set<int> numberset2 = {21,22,23,24,25,26};
  numberset2.remove(26);
  numberset.addAll(numberset2);

  print('Total numbers are :' +numberset.length.toString());

  for(var data in numberset)
    {
      print(data);
    }
}