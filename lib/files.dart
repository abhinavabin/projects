import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Profiles extends StatefulWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {


 Future<dynamic> getdata() async {
    Response res = await get(Uri.parse("https://reqres.in/api/users?page=2"));
    var data = jsonDecode(res.body);
    print(data);
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
              return
              ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,  index) {
                  return
                    // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child:
                    ListTile(
                      leading:CircleAvatar(
                          radius: 40,
                          backgroundImage:
                          NetworkImage(snapshot.data![index]['avatar'])),
                      title:Text("${snapshot.data![index]["first_name"]} ${snapshot.data![index]['last_name']}"),
                      subtitle:Text(snapshot.data![index]['email'].toString()),
                      trailing: TextButton.icon(onPressed:(){}, icon: Icon(
                        Icons.download,
                        size: 24.0,
                      ), label:Column())

                    );

                  // );

                  },






                  );
            }

          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: getdata),
    );
  }
}
