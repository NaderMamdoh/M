import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/list/sec_session/secSesList.dart';
import 'package:motatawera/services/api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/LANGUAGE/AppLocale.dart';

class SecSession extends StatefulWidget {
  

  @override
  _SecSessionState createState() => _SecSessionState();
}

class _SecSessionState extends State<SecSession> {
  var squaID;
  getPref()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
 

  squaID    = preferences.getString("sqID");
  if(squaID != null){
 setState(() {
  squaID    = preferences.getString("sqID");
  print(squaID);
 });}
 else {
   print("empty");
 }
 }

 @override
   void initState() {
     getPref();
     getData();
     super.initState();
     
   }
 
 Future getData() async{

var url = Uri.parse
(api+"secSessions.php");
var data = {"sqID":"$squaID"};
var response = await http.post(url,body : data);
var responsebody = jsonDecode(response.body);
return responsebody;

 }
 
 
  @override
  Widget build(BuildContext context) {

     return  Bar(
      title: "${getLang(context, "TitleGdwalSection")}",
     
      child:
       FutureBuilder(
        future: getData(),
       
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
          return ListView.builder(
            physics:  BouncingScrollPhysics(
             parent: AlwaysScrollableScrollPhysics()),
            itemCount: snapshot.data.length,
            itemBuilder: (context , i)
      {
      return
    SecSesList(
    subSecID:      snapshot.data [i]['subSecID'],
    secID:         snapshot.data [i]['secID'],
    secName:       snapshot.data [i]['secName'],
    secNumber:     snapshot.data [i]['secNumber'],
    secDate:       snapshot.data [i]['secDate'],
    secStart_Time: snapshot.data [i]['secStart_Time'],
    secEnd_Time:   snapshot.data [i]['secEnd_Time'],
    sqID:          snapshot.data [i]['sqID'],
    instName:      snapshot.data [i]['instName'],
    locName :      snapshot.data [i]['locName']);
      }
      );
        }
return Center(child: CircularProgressIndicator());
        },
       ),
      );
  }
}
