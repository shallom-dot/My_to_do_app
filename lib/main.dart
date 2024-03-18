import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskk/pages/home_page.dart';

void main() async{
  // initializing hive
 await Hive.initFlutter();
 
 //open a box
 var box = await Hive.openBox('mybox');

  runApp(const MyTaskk());
}
class MyTaskk extends StatelessWidget {
  const MyTaskk({super.key});
  
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      title: 'My To Do',
    home: const Homepage(),
    );
  }
}