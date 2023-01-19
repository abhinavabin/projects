import 'package:flutter/material.dart';

class EditData extends StatefulWidget {
  const EditData({Key? key}) : super(key: key);

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("edit data")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Column(
            children: [
              Container(height:100 ,
                width: 400,
                color: Colors.cyan,
              ),Container(height:100 ,
                width: 400,
                color: Colors.cyan,
              )

            ],
          ),
        ),
      ),
      floatingActionButton:FloatingActionButton(onPressed: (){}),
    );
  }
}

