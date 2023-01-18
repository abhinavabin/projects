import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}
class _PostsState extends State<Posts> {
  Future<dynamic> post() async {
    Response res = await get(Uri.parse("https://dummyjson.com/posts"));
    var pst = jsonDecode(res.body);

    return pst["posts"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Center(
      child: FutureBuilder(
        future: post(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
          }else{
            return
              ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,  index) {
                  return
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(style: TextStyle(fontSize: 20), snapshot.data!["id"].toString()),
                        ],
                      ),
                    );
                }


                  // );








              );
          }

        },
      ),
    ),

    );
  }
}
