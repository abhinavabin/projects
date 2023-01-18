import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Future<Map<String,dynamic>> getdata() async {
    Response res = await get(Uri.parse("https://reqres.in/api/users?page=2"));
    var data = jsonDecode(res.body);
    return data['data'];

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }else{
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(snapshot.data!['avatar']())),
                    Text(snapshot.data!['id'].toString()),
                    Text(snapshot.data!["first_name"].toString()),
                    Text(snapshot.data!['last_name'].toString() ),
                    Text(snapshot.data!['email'].toString()),



                  ]);
            }

          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: getdata),
    );
  }
}

