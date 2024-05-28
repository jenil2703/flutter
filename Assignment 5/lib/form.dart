import 'package:flutter/material.dart';
import 'model.dart';

class FormScreen extends StatefulWidget {
  final Function(Perform) onSave;
  final Perform? task;

  FormScreen({required this.onSave, this.task});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _desc;
  late String _date;
  late String _time;
  late int _priority;

  @override
  void initState() {
    super.initState();
    _name = widget.task?.name ?? '';
    _desc = widget.task?.desc ?? '';
    _date = widget.task?.date ?? '';
    _time = widget.task?.time ?? '';
    _priority = widget.task?.priority ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? 'Add' : 'Edit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 10),

                TextFormField(
                  initialValue: _name,
                  decoration: InputDecoration(labelText: 'Name',border: OutlineInputBorder()),
                  onSaved: (val) => _name = val!,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                      {
                        return 'Name is required';
                      }
                    return null;
                  },
                ),
                SizedBox(height: 20),
          
                TextFormField(
                  initialValue: _desc,
                  decoration: InputDecoration(labelText: 'Description',border: OutlineInputBorder()),
                  onSaved: (val) => _desc = val!,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Description is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
          
                TextFormField(
                  initialValue: _date,
                  decoration: InputDecoration(labelText: 'Date',border: OutlineInputBorder()),
                  onSaved: (val) => _date = val!,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Date is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
          
                TextFormField(
                  initialValue: _time,
                  decoration: InputDecoration(labelText: 'Time',border: OutlineInputBorder()),
                  onSaved: (val) => _time = val!,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Time is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
          
                DropdownButtonFormField<int>(
                  value: _priority,
                  items: [
                    DropdownMenuItem(child: Text('Low'), value: 0),
                    DropdownMenuItem(child: Text('Average'), value: 1),
                    DropdownMenuItem(child: Text('High'), value: 2),
                  ],
                  onChanged: (value)
                  {
                    setState(() {
                      _priority = value!;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Priority',border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
          
                MaterialButton(
                  color: Colors.purple.shade50,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.onSave(Perform(
                        id: widget.task?.id,
                        name: _name,
                        desc: _desc,
                        date: _date,
                        time: _time,
                        priority: _priority,
                        isCompleted: widget.task?.isCompleted ?? false,
                      ));
                      Navigator.pop(context);
                    }
                  },child: Text("Insert"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
