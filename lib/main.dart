import 'package:flutter/material.dart';
import 'package:taskk/pages/home_page.dart';

void main() {
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