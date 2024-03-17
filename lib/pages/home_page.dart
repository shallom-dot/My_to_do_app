import 'package:flutter/material.dart';
import 'package:taskk/utilities/dialog_box.dart';
import 'package:taskk/utilities/to_do_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List of to do task
  List toDoList =[
    ['Fetch water', false],
    ['Read my books', false],
    ['Do Exercise', false]
  ];
  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  //creat a new task
  void createNewTask() {
    showDialog(context: context, builder: (context){
      return DialogBox();
    },
    );
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
        textStyle: TextStyle(
          color: Colors.red
        ),
        child: FloatingActionButton(onPressed:createNewTask,
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
        child: Icon(Icons.add),),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) => ToDoTile(
          taskName: toDoList[index] [0],
         taskCompleted: toDoList[index] [1], 
         onChanged: (value) => checkBoxChanged(value, index),
         ),
      )
    );
  }
}