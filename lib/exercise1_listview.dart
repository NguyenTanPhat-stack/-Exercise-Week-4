import 'package:flutter/material.dart';

class Exercise1ListView extends StatelessWidget {
  // Tạo data giả lập cho danh bạ
  final List<String> contacts = List.generate(20, (index) => 'Contact ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bài 1: List View")),
      body: ListView.builder( // Sử dụng ListView.builder cho danh sách dài
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              // Placeholder avatar image 
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(contacts[index]),
            subtitle: Text("Phone number: 0909000$index"),
          );
        },
      ),
    );
  }
}