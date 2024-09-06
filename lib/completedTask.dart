import 'package:flutter/material.dart';
import 'class.dart';

class Completedtask extends StatefulWidget {
  final List<Task> completedTasks;
  const Completedtask({super.key, required this.completedTasks});

  @override
  State<Completedtask> createState() => _CompletedtaskState();
}

class _CompletedtaskState extends State<Completedtask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.purple,
      //   title: Text("Completed Task"),
      // ),
      body: ListView.builder(
        itemCount: widget.completedTasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(widget.completedTasks[index].title),
              subtitle: Text(widget.completedTasks[index].description),
            ),
          );
        },
      ),
    );
  }
}
