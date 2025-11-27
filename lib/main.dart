import 'package:flutter/material.dart';
import 'exercise1_listview.dart';
import 'exercise2_gridview.dart';
import 'exercise3_sharedpref.dart';
import 'exercise4_async.dart';
import 'exercise5_isolate.dart';

void main() {
  runApp(MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bài tập Tuần 4")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Bài 1: List View"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Exercise1ListView())),
            ),
            ElevatedButton(
              child: Text("Bài 2: Grid View"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Exercise2GridView())),
            ),
            ElevatedButton(
              child: Text("Bài 3: Shared Preferences"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Exercise3SharedPref())),
            ),
            ElevatedButton(
              child: Text("Bài 4: Async Demo"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Exercise4Async())),
            ),
            ElevatedButton(
              child: Text("Bài 5: Isolate UI"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Exercise5Isolate())),
            ),
            Text("(Chạy file bin/isolate_console.dart cho Challenge 2)", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}