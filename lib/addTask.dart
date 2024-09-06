import 'package:flutter/material.dart';
import 'class.dart';

class Addtask extends StatefulWidget {
  final Function(Task) onAddTask;

  const Addtask({Key? key, required this.onAddTask}) : super(key: key);

  @override
  _AddtaskState createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a title";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Details'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter details";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final task = Task(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      dateTime: DateTime.now(),
                    );
                    widget.onAddTask(task);
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Task'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
