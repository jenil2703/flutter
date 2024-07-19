// ignore_for_file: unnecessary_null_comparison, must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print, prefer_is_not_empty, no_logic_in_create_state, sort_child_properties_last

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

String _myCategory = "";

class AdminUpload extends StatefulWidget {
  const AdminUpload({super.key});

  @override
  State<StatefulWidget> createState() {
    return AdminUploadPage();
  }
}

class AdminUploadPage extends State<AdminUpload> {
  var size;

  var upload_category = TextEditingController();

  XFile? _imageFile;

  final String uploadUrl =
      'https://jenil2703.000webhostapp.com/API_project_1/upload_category_main_image.php';
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print("Image picker error $e");
    }
  }

  Future<String?> uploadImage(filepath, url) async {
    File file = File(filepath.path);
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['category_name'] = upload_category.text;
    request.files
        .add(await http.MultipartFile.fromPath('profile_pic', file.path));
    var res = await request.send();
    return res.reasonPhrase;
  }

  Future<List> getCategoryName() async {
    var data = await http.get(Uri.parse(
        "https://jenil2703.000webhostapp.com/API_project_1/category_view.php"));
    return json.decode(data.body);
  }

  XFile? _categoryImageFile;
  //PickedFile _categoryImageFile;
  final String categoryUploadUrl =
      'https://jenil2703.000webhostapp.com/API_project_1/upload_category_sub_image_insert.php';
  final ImagePicker _categoryPicker = ImagePicker();

  void _categoryPickImage() async {
    try {
      final pickedFile =
      await _categoryPicker.pickImage(source: ImageSource.gallery);
      setState(() {
        print("1");
        _categoryImageFile = pickedFile;
        print("2 $_categoryImageFile");
      });
    } catch (e) {
      print("Image picker error $e");
    }
  }

  Future<String?> categoryUploadImage(filepath, url) async {
    File file = File(filepath.path);
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['c_id'] = _myCategory.toString();
    request.files
        .add(await http.MultipartFile.fromPath('profile_pic', file.path));
    var res = await request.send();
    print(file.path);
    print(_myCategory.toString());
    return res.reasonPhrase;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      // _myCategory = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(size.width * 5 / 100,
                  size.height * 33 / 100, size.width * 5 / 100, 0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Colors.blueGrey,
                        title: const Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              "\tAdd Category",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        content: SizedBox(
                          height: size.height * 14 / 100,
                          child: Column(
                            children: [
                              TextField(
                                controller: upload_category,
                                decoration: const InputDecoration(
                                  hintText: "Input Category Name",
                                ),
                              ),
                              SizedBox(height: size.height * 1 / 100),
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: double.infinity,
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.all(16.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (!upload_category.text.isEmpty) {
                                      _pickImage();
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please Input Category Name",
                                          toastLength: Toast.LENGTH_LONG,
                                          timeInSecForIosWeb: 1);
                                    }
                                  },
                                  child: Text(
                                    "Select Image".toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                        color: Colors.blueGrey,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("Cancel",
                                style: TextStyle(color: Colors.blueGrey)),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (upload_category.text.isNotEmpty &&
                                  _imageFile != null) {
                                await uploadImage(_imageFile,
                                    "$uploadUrl?data=${upload_category.text}");
                                Fluttertoast.showToast(
                                    msg: "Category Added Successfully",
                                    toastLength: Toast.LENGTH_LONG,
                                    timeInSecForIosWeb: 1);
                                // ignore: use_build_context_synchronously
                                Navigator.of(ctx).pop();
                              } else {
                                if (upload_category.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please Input Category Name",
                                      toastLength: Toast.LENGTH_LONG,
                                      timeInSecForIosWeb: 1);
                                } else if (_imageFile == null) {
                                  Fluttertoast.showToast(
                                      msg: "Please Select Category Image",
                                      toastLength: Toast.LENGTH_LONG,
                                      timeInSecForIosWeb: 1);
                                }
                              }
                            },
                            child: const Text("Add",
                                style: TextStyle(color: Colors.blueGrey)),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "Upload Category".toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 2 / 100),
            Padding(
              padding: EdgeInsets.fromLTRB(size.width * 5 / 100, 0,
                  size.width * 5 / 100, size.height * 33 / 100),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: double.infinity,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Colors.blueGrey,
                        title: const Row(
                          children: [
                            Icon(
                              Icons.upload,
                              color: Colors.white,
                            ),
                            Text(
                              "\tUpload Images",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        content: SizedBox(
                          height: size.height * 14 / 80,
                          child: Column(
                            children: [
                              Expanded(
                                child: FutureBuilder<List>(
                                  future: getCategoryName(),
                                  builder: (ctx, ss) {
                                    if (ss.hasData) {
                                      print(ss.data);
                                      return Items(list_: ss.data!);
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: size.height * 1 / 100),
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: double.infinity,
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blueGrey,
                                    padding: const EdgeInsets.all(16.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_myCategory != null) {
                                      _categoryPickImage();
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please Select Category",
                                          toastLength: Toast.LENGTH_LONG,
                                          timeInSecForIosWeb: 1);
                                    }
                                  },
                                  child: Text(
                                    "Select Images".toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("Cancel",
                                style: TextStyle(color: Colors.blueGrey)),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_myCategory != null &&
                                  _categoryImageFile != null) {
                                await categoryUploadImage(
                                    _categoryImageFile, categoryUploadUrl);
                                Fluttertoast.showToast(
                                    msg: "Images Uploaded Successfully",
                                    toastLength: Toast.LENGTH_LONG,
                                    timeInSecForIosWeb: 1);
                                // ignore: use_build_context_synchronously
                                Navigator.of(ctx).pop();
                              } else {
                                if (_myCategory == null) {
                                  Fluttertoast.showToast(
                                      msg: "Please Select Category",
                                      toastLength: Toast.LENGTH_LONG,
                                      timeInSecForIosWeb: 1);
                                } else if (_categoryImageFile == null) {
                                  Fluttertoast.showToast(
                                      msg: "Please Select Images",
                                      toastLength: Toast.LENGTH_LONG,
                                      timeInSecForIosWeb: 1);
                                }
                              }
                            },
                            child: const Text("Upload",
                                style: TextStyle(color: Colors.blueGrey)),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "Upload Images".toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Items extends StatefulWidget {
  final List list_;
  const Items({super.key, required this.list_});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          DropdownMenu(
            width: MediaQuery.of(context).size.width * 0.67,
            hintText: "Select Category",
            dropdownMenuEntries: List.generate(
              widget.list_.length,
                  (index) => DropdownMenuEntry(
                value: widget.list_[index]['id'],
                leadingIcon: Image.network(
                  widget.list_[index]['category_image'],
                  width: 34,
                  height: 34,
                ),
                label: widget.list_[index]['category_name'],
              ),
            ),
            onSelected: (value) {
              setState(() {
                _myCategory = value;
                print("Mydata : $_myCategory");
              });
            },
          ),
        ],
      ),
    );
  }
}
