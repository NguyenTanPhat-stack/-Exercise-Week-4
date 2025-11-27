import 'package:flutter/material.dart';

class Exercise4Async extends StatefulWidget {
  @override
  _Exercise4AsyncState createState() => _Exercise4AsyncState();
}

class _Exercise4AsyncState extends State<Exercise4Async> {
  String _status = "Loading user..."; // [cite: 39]

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    // Waits for 3 seconds [cite: 40]
    await Future.delayed(Duration(seconds: 3));
    if (mounted) {
      setState(() {
        _status = "User loaded successfully!"; // [cite: 41]
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bài 4: Async Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             // Nếu đang loading thì hiện vòng quay, xong thì hiện icon check
            _status.contains("Loading") 
                ? CircularProgressIndicator() 
                : Icon(Icons.check_circle, color: Colors.green, size: 50),
            SizedBox(height: 20),
            Text(_status, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}