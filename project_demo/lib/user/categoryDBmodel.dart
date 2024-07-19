
class Model1
{
  int? id;
  String url;

  Model1({this.id,required this.url});

  factory Model1.formMap(Map<String,dynamic> json) =>
      Model1(id: json["id"],url: json["url"]);

  Map<String,dynamic> toMap() =>{
    "id":id,
    "url":url,
  };
}
