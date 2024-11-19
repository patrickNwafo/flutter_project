import 'package:flutter/material.dart';
import 'package:ticket_app/base/bottom_nav_bar.dart';


void main() {

  runApp(const MyApp());
  var test = TestClass(x: 4, y: 10);
  // print(test.x);

  var newText = test.copyWith(x:30);
  // print(newText.y);

  var newTest2 = test.copyWith(y:100);
  // print(newTest2.y);
}


class TestClass{
  int x;
  int y;

  TestClass({required this.x, required this.y});

  TestClass copyWith({int? x, int? y}){
    return TestClass(x:x??this.x, y:y??this.y);
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}

