import 'package:flutter/material.dart';
import 'package:hive/hive.dart' show Hive;
import 'package:to_do_application/database/database.dart';
import 'package:to_do_application/widgets/dialog_box.dart';
import 'package:to_do_application/widgets/to_do_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // reference to hive box
  final _myBox = Hive.box('todo_box');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if this is the first time ever opening the app, then create default data
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      // else load data from database
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  // save new task

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          text: "Add Task",
          onSave: saveNewTask,
          contoller: _controller,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text('To-Do'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.tealAccent,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) {
              setState(() {
                db.toDoList.removeAt(index);
              });
              db.updateData();
            },
          );
        },
      ),
    );
  }
}
