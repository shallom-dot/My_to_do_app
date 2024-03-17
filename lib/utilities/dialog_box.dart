import 'package:flutter/material.dart';
import 'package:taskk/utilities/my_buttons.dart';
//import 'package:taskk/utilities/dialog_box.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
    DialogBox({super.key, 
    required this.controller,
     required this.onSave,
      required this.onCancel,
      });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          children: [
            //get user input
             TextField(
              controller: controller ,
              decoration: const InputDecoration(
                hintText: 'Add a new task'
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //buttons -> save + cancel
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //save button
            MyButton(text: 'Save', onPressed: onSave ),
            // SizedBox(width: 8,),
            //cancel button
             MyButton(text: 'Cancel', onPressed: onCancel ),

          ],)
          ],
        ),
      ),
    );
  }
}