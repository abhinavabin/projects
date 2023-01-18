import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url/get_data.dart';

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  AddNotes() async {
    await post(Uri.parse("http://192.168.29.175:8080/add_note"),
        body: jsonEncode({'title': title.text, 'content': data.text}));
  }

  TextEditingController title = TextEditingController();
  TextEditingController data = TextEditingController();
  List notesx = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todo"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "enter your title"),
                controller: title,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "enter your data"),
                controller: data,
              ),
              ElevatedButton(
                  onPressed: () {
                    AddNotes();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ToDo2(),
                        ));
                  },
                  child: Text("enter")),
            ],
          ),
        ),
      ),
    );
  }
}
