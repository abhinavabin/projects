import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  
  String? img;
  getData()async{
    Response res= await get(Uri.parse("https://dog.ceo/api/breeds/image/random "));
    var data= jsonDecode(res.body);
    setState(() {
      img = data["message"];
    });
    
    
    
    



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed:getData,),
      body:  Center(
          child:img != null ? Image.network(img!):Container()



      ),
      
      
    );
  }
}



