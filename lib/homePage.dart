import 'package:flutter/material.dart';

import 'addTask.dart';
import 'editTask.dart';
import 'class.dart';
import 'completedTask.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Task> tasks = [];
  final List<Task> completedTasks = [];
  int _selectedIndex = 0;

  void _addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void _editTask(Task task, int index) {
    setState(() {
      tasks[index] = task;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      Task task = tasks.removeAt(index);
      task.isCompleted = !task.isCompleted;
      completedTasks.add(task);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return _buildTaskList();
      case 1:
        return Completedtask(completedTasks: completedTasks);
      default:
        return _buildTaskList();
    }
  }

  Widget _buildTaskList() {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            title: Text(tasks[index].title),
            subtitle: Text(tasks[index].description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.mode_edit_outlined),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Edittask(
                          initialTask: tasks[index],
                          onEditTask: _editTask,
                          index: index,
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () {
                    _deleteTask(index);
                  },
                ),
                IconButton(
                  icon: Icon(
                    tasks[index].isCompleted
                        ? Icons.check_circle_outline
                        : Icons.radio_button_unchecked,
                  ),
                  onPressed: () {
                    _toggleTaskCompletion(index);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO APP"),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {

            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: _buildPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Completed',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Task? newTask = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Addtask(
                onAddTask: _addTask,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
