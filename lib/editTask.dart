import 'package:flutter/material.dart';
import 'class.dart';

class Edittask extends StatefulWidget {
  final Function(Task, int) onEditTask;
  final Task initialTask;
  final int index;

  const Edittask({
    Key? key,
    required this.onEditTask,
    required this.initialTask,
    required this.index,
  }) : super(key: key);

  @override
  State<Edittask> createState() => _EdittaskState();
}

class _EdittaskState extends State<Edittask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.initialTask.title;
    _descriptionController.text = widget.initialTask.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Task"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: "Details"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final task = Task(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      dateTime: widget.initialTask.dateTime, // Pass the existing dateTime
                    );
                    widget.onEditTask(task, widget.index);
                    Navigator.pop(context);
                  },
                  child: Text("Update"),
                ),
                SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                  style: ElevatedButton.styleFrom(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
