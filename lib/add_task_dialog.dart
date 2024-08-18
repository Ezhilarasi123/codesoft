import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  final Function(String) addTask;

  AddTaskDialog({required this.addTask});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a new task'),
      backgroundColor: Colors.amber[100],
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Enter task here',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.addTask(_controller.text);
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
