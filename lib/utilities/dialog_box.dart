import 'package:flutter/material.dart';
import 'package:taskk/utilities/my_buttons.dart';
import 'package:taskk/utilities/dialog_box.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          children: [
            //get user input
            const TextField(
              decoration: InputDecoration(
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
            MyButton(text: 'Save', onPressed: () {} ),

            //cancel button
             MyButton(text: 'Cancel', onPressed: () {} ),

          ],)
          ],
        ),
      ),
    );
  }
}