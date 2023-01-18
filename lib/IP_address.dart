import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class IpAddress extends StatefulWidget {
  const IpAddress({Key? key}) : super(key: key);

  @override
  State<IpAddress> createState() => _IpAddressState();
}

class _IpAddressState extends State<IpAddress> {
  Future<dynamic> GiveIp() async {
    Response res = await get(Uri.parse("https://api.ipify.org/?format=json"));
    var Ip = jsonDecode(res.body);
    print(Ip);
    Response res2 = await get(Uri.parse("https://ipinfo.io/${Ip['ip']}/geo"));
    var Ip2 = jsonDecode(res2.body);
    print(Ip2);
    return Ip2;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text("IP")),
      body: FutureBuilder( future: GiveIp(),

      builder:
        (context,  snapshot) {
    if(snapshot.connectionState==ConnectionState.waiting){
    return Center(child: CircularProgressIndicator());
    }else {
    return
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          // color: Colors.cyan,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start
            ,
            children: [
              Text(style: TextStyle(fontSize: 20),snapshot.data!["ip"].toString()),
              Text(style: TextStyle(fontSize: 20),snapshot.data!["city"].toString()),
              Text(style: TextStyle(fontSize: 20),snapshot.data!["region"].toString()),
              Text(style: TextStyle(fontSize: 20),snapshot.data!["country"].toString()),
              Text(style: TextStyle(fontSize: 20),snapshot.data!["loc"].toString()),
              Text(style: TextStyle(fontSize: 20),snapshot.data!["postal"].toString()),
              Text(style: TextStyle(fontSize: 20),snapshot.data!["timezone"].toString()),
              // Text(snapshot.data!["readme"].toString()),
            ],
          ),
        ),
      );

    }}),



    );


  }
}
