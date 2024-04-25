import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class posttwo extends StatefulWidget {
  const posttwo({super.key});

  @override
  State<posttwo> createState() => _posttwoState();
}

class _posttwoState extends State<posttwo> {
  TextEditingController employeeName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();


  Future<bool>? _success;
  Future<bool>? addcat(String qwe ,String rty ,String uio,String opw,String ert,) async{
    var res = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Employee/InsertEmployee"),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=utf-8'
        },
        body: jsonEncode(<String,dynamic>{
          "employeeId": 0,
          "employeeName": qwe,
          "mobile": rty,
          "userName": uio,
          "password": opw,
          "confirmPassword": ert,
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
          controller: employeeName ,
          decoration: InputDecoration(
            label: Text("enter category name"),
          ),
        ),
        TextFormField(
          controller: mobile,
          decoration: InputDecoration(
            label: Text("enter description"),
          ),
        ),
        TextFormField(
          controller: userName,
          decoration: InputDecoration(
            label: Text("enter description"),
          ),
        ),
        TextFormField(
          controller: password,
          decoration: InputDecoration(
            label: Text("enter description"),
          ),
        ),
        TextFormField(
          controller: confirmPassword,
          decoration: InputDecoration(
            label: Text("enter description"),
          ),
        ),

        ElevatedButton(
            onPressed: (){
              setState(() {
                _success = addcat(employeeName.text, mobile.text, userName.text, password.text, confirmPassword.text
                );
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
