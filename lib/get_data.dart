import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url/add_data.dart';

class ToDo2 extends StatefulWidget {
  const ToDo2({Key? key}) : super(key: key);

  @override
  State<ToDo2> createState() => _ToDo2State();
}

class _ToDo2State extends State<ToDo2> {
  GetNotes() async {
    Response res = await get(Uri.parse("http://192.168.29.175:8080/get_notes"));
    Notes = jsonDecode(res.body)["message"];

    return Notes;
  }


  RemoveNotes(int data) async {

    Response res1 = await delete(Uri.parse("http://192.168.29.175:8080/remove_note"),
        body: jsonEncode({'id': data,}));
    setState(() {

    });
  }

  List Notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("todo list"),
        ),
        body: FutureBuilder(
            future: GetNotes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Center(
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: Notes.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      borderRadius:
                                      BorderRadius.circular(35)),
                                    child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: ListTile(
                                            leading: Text(
                                                Notes[index]['id']
                                                    .toString()),
                                            title: Text(
                                              Notes[index]["title"],
                                            ),
                                            subtitle:
                                            Text(Notes[index]["content"]),
                                            trailing: Column(mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextButton(
                                                    onPressed: () {
                                                      RemoveNotes(Notes[index]["id"],
                                                      );
                                                    },
                                                    child: Text("delete")),
                                                TextButton(
                                                    onPressed: () {
                                                      RemoveNotes(Notes[index]["id"],
                                                      );
                                                    },
                                                    child: Text("edit")),
                                              ],
                                            ),

                                          ),
                                        )),

                                  ),
                                );
                              })),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FloatingActionButton(onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ToDo(),
                                  ));
                            }),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
