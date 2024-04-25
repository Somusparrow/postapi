import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class postone extends StatefulWidget {
  const postone({super.key});

  @override
  State<postone> createState() => _postoneState();
}

class _postoneState extends State<postone> {
  TextEditingController clientName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController gst = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactPerson = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  Future<bool>? _success;
  Future<bool>? addcat(String name ,String number ,String am,String aml,String gma,String mad,String san,String num) async{
    var res = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Client/InsertClient"),
    headers: <String,String>{
      'Content-Type' : 'application/json; charset=utf-8'
    },
      body: jsonEncode(<String,dynamic>{
        "clientId": 0,
        "clientName": name,
        "phone": number,
        "address": am,
        "gst": aml,
        "website": gma,
        "email": mad,
        "contactPerson": san,
        "phoneNumber": num,
        "createdBy": 1
      })
    );
    return jsonDecode(res.body)["success"];

  }
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: (_success == null ? buildColumn() : buildFuturebuilder()) ,
          )
        ],
      ),
    );
  }
  Column buildColumn(){
    return Column(
      children: [
        TextFormField(
          controller: clientName ,
          decoration: InputDecoration(
            label: Text("enter category name"),
          ),
        ),
        TextFormField(
          controller: phone,
          decoration: InputDecoration(
            label: Text("enter description"),
          ),
        ),
        TextFormField(
          controller: address,
          decoration: InputDecoration(
            label: Text("enter description"),
          ),
        ),
        TextFormField(
          controller: gst,
          decoration: InputDecoration(
            label: Text("enter description"),
          ),
        ),
        TextFormField(
          controller: website,
          decoration: InputDecoration(
            label: Text("enter description"),
          ),
        ),
        TextFormField(
          controller: email,
          decoration: InputDecoration(
            label: Text("enter description"),
          ),
        ),
        TextFormField(
          controller: contactPerson,
          decoration: InputDecoration(
            label: Text("enter description"),
          ),
        ),
        TextFormField(
          controller: phoneNumber,
          decoration: InputDecoration(
            label: Text("enter description"),
          ),
        ),
        ElevatedButton(
            onPressed: (){
              setState(() {
                _success = addcat(clientName.text, phone.text, address.text, gst.text,
                    website.text,email.text,contactPerson.text,phoneNumber.text
                );
                print(_success);
              });
            },
            child: Text("save"))
      ],
    );
  }

  FutureBuilder buildFuturebuilder(){
    return FutureBuilder(
        future: _success,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Text("Added Succesfully");
          } else if(snapshot.hasError){
            return Text("error");
          } return CircularProgressIndicator();
        }
    );
  }
}
