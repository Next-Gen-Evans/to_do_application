import 'package:hive/hive.dart';

class ToDoDatabase {
  // initialize default data
  List toDoList = [];

  // reference the box
  final _myBox = Hive.box('todo_box');

  // create initial data
  void createInitialData() {
    toDoList = [
      ['Welcome to your ToDo app!', false],
      ['Tap the + button to add a new task.', false],
      ['Tap the checkbox to mark a task as completed.', false],
    ];
  }

  // load data from database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  // update database
  void updateData() {
    _myBox.put('TODOLIST', toDoList);
  }
}
