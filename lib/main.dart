import 'package:flutter/material.dart';
import 'Hello/HelloWorld.dart';

void main() =>  runApp(new MyApp());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("My text "),
      ),
    )
    );

  }

}
