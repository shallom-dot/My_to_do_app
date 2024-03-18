import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskk/data/database.dart';
import 'package:taskk/utilities/dialog_box.dart';
import 'package:taskk/utilities/to_do_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // referencing the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

    @override
  void initState() {
    //if this is the first time opening the app, then create default data
    if (_myBox.get('TODOLIST')== null) {
      db.createInitialData();
    }else{
      // there already exist data
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();
  // List of to do task
  // List toDoList =[
  //   ['Fetch water', false],
  //   ['Read my books', false],
  //   ['Do Exercise', false]
  // ];
  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //creat a new task
  void createNewTask() {
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller, 
        onSave: saveNewTask, 
        onCancel: () => Navigator.of(context).pop(),
      );
    },
    );
  }
// delete task

void deleteTask(int index) {
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateDataBase();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Center(child: Text('TO DO')),
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: Tooltip(
        message: 'Tap to add task',
        textStyle: const TextStyle(
          color: Colors.red
        ),
        child: FloatingActionButton(onPressed:createNewTask,
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
        child: const Icon(Icons.add),),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) => ToDoTile(
          taskName: db.toDoList[index] [0],
         taskCompleted: db.toDoList[index] [1], 
         onChanged: (value) => checkBoxChanged(value, index),
         deleteFunction: (context) => deleteTask(index),
         ),
      )
    );
  }
}