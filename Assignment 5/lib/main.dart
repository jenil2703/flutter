import 'package:flutter/material.dart';
import 'package:module_5/dbhelper.dart';
import 'package:module_5/form.dart';
import 'package:module_5/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Perform> tasks = [];
  final db = dbHelper();

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqflite CRUD"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: TaskSearchDelegate(tasks));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          Perform task = tasks[index];
          return Card(
            color: task.isCompleted ? Colors.green.shade100 : Colors.purple.shade50,
            child: ListTile(
              title: Row(
                children: [
                  Text('Name: '),
                  Text(
                    task.name,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Desc: ${task.desc}'),
                  Text('Date: ${task.date}'),
                  Text('Time: ${task.time}'),
                  Text('Priority: ${_Priority(task.priority)}', style: TextStyle(color: _PriorityColor(task.priority))),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormScreen(onSave: (updatedTask) {
                              db.update(updatedTask);
                              _refreshList();
                            },
                            task: task,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Delete Alert.!'),
                            content: Text('Are you sure you want to delete?'),
                            actions: [
                              MaterialButton(
                                  onPressed: (){
                                Navigator.of(context).pop();
                                },child: Text("CANCLE"),
                              ),

                              MaterialButton(
                                  onPressed: (){
                                _delete(task.id!);
                                Navigator.of(context).pop();
                                },child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Complete the Task'),
                      content: Text('Mark this task as completed?'),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Complete'),
                          onPressed: () {
                            setState(() {
                              task.isCompleted = true;
                            });
                            db.update(task);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen(onSave: (task) {
                  db.insert(task);
                  _refreshList();
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  String _Priority(int priority) {
    switch (priority) {
      case 0:
        return 'Low';
      case 1:
        return 'Average';
      case 2:
        return 'High';
      default:
        return '';
    }
  }

  _refreshList() async {
    List<Perform> x = await db.get();
    setState(() {
      tasks = x;
    });
  }

  _delete(int id) async {
    await db.delete(id);
    _refreshList();
  }

  Color _PriorityColor(int priority) {
    switch (priority) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.red;
      default :
        return Colors.black;
    }
  }
}


//search
class TaskSearchDelegate extends SearchDelegate {

  final List<Perform> p;
  TaskSearchDelegate(this.p);

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    //throw UnimplementedError();
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    //throw UnimplementedError();
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //throw UnimplementedError();
    final results = p.where((task) => task.name.contains(query)).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].name),
          subtitle: Text(results[index].desc),
        );
      },
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //throw UnimplementedError();
    final suggestions = p.where((task) => task.name.contains(query)).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].name),
          subtitle: Text(suggestions[index].desc),
        );
      },
    );

  }
}


