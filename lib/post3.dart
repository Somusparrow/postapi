import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class postthree extends StatefulWidget {
  const postthree({super.key});

  @override
  State<postthree> createState() => _postthreeState();
}

class _postthreeState extends State<postthree> {

  TextEditingController clientId=TextEditingController();
  TextEditingController categoryId=TextEditingController();
  TextEditingController description=TextEditingController();
  TextEditingController scheduledDate=TextEditingController();
  TextEditingController dueDate=TextEditingController();
  TextEditingController status=TextEditingController();
  TextEditingController startedDate=TextEditingController();
  TextEditingController completedDate=TextEditingController();
  TextEditingController uploadsPath=TextEditingController();
  TextEditingController createdBy=TextEditingController();

  Future<bool>?_success;

  Future<bool>? addcat(String name,String num,String fvd,String bddf,String ghn,String mnh,String ghb,String jgf,String cfg,String fgf)async{
    var res = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Allocation/InsertAllocation"),
    headers: <String,String>{
      'Content-Type' : 'application/json; charset=utf-8'
    },
      body: jsonEncode(<String,dynamic>{
        "allocationId": 0,
        "clientId": name,
        "categoryId": num,
        "employeeId":fvd,
        "description": bddf,
        "scheduledDate": ghn,
        "dueDate": mnh,
        "status": ghb,
        "startedDate":jgf,
        "completedDate":cfg,
        "uploadsPath": fgf,
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
            child: (_success==null ? buildColumn() : buildFuturebulider()),
          )
        ],
      ),
    );
  }
  Column buildColumn(){
    return Column(
      children: [
        TextFormField(
          controller: clientId ,
          decoration: InputDecoration(
            label: Text('clientId')
          ),
        ),
        TextFormField(
          controller: categoryId ,
          decoration: InputDecoration(
            label: Text('categoryId ')
          ),
        ),
        TextFormField(
          controller: description ,
          decoration: InputDecoration(
            label: Text('description')
          ),
        ),
        TextFormField(
          controller: scheduledDate ,
          decoration: InputDecoration(
            label: Text('scheduledDate')
          ),
        ),
        TextFormField(
          controller: dueDate ,
          decoration: InputDecoration(
            label: Text('dueDate')
          ),
        ),
        TextFormField(
          controller: status ,
          decoration: InputDecoration(
            label: Text('status')
          ),
        ),
        TextFormField(
          controller: startedDate ,
          decoration: InputDecoration(
            label: Text('startedDate')
          ),
        ),
        TextFormField(
          controller: completedDate ,
          decoration: InputDecoration(
            label: Text('completedDate')
          ),
        ),
        TextFormField(
          controller: uploadsPath ,
          decoration: InputDecoration(
            label: Text('uploadsPath ')
          ),
        ),
        TextFormField(
          controller: createdBy ,
          decoration: InputDecoration(
            label: Text('createdBy')
          ),
        ),

        ElevatedButton(onPressed: (){
          setState(() {
            _success=addcat(clientId.text, categoryId.text,description.text,scheduledDate.text,dueDate.text,
                status.text,startedDate.text,completedDate.text,uploadsPath.text,createdBy.text
            );
          });
        }, child: Text('save'))
      ],
    );
  }
  FutureBuilder buildFuturebulider(){
    return FutureBuilder(
        future: _success,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Text('Added succesfully');
          } else if(snapshot.hasError){
            return Text('error');
          }return CircularProgressIndicator();
        }
    );
  }
}
