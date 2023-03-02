import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/list/pra_session/praSesList.dart';
import 'package:http/http.dart' as http ;
import 'package:motatawera/services/api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/LANGUAGE/AppLocale.dart';

class PraSession extends StatefulWidget {

  @override
  _PraSessionState createState() => _PraSessionState();
}

class _PraSessionState extends State<PraSession> {
 
  var ss;
  getPref()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
 

  ss    = preferences.getString("depID");
  if(ss != null){
 setState(() {
  ss    = preferences.getString("depID");
  print(ss);
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
(api+"praSessions.php");
var data = {"depID":"$ss"};
var response = await http.post(url,body : data);
var responsebody = jsonDecode(response.body);
return responsebody;

 }
 
 
  @override
  Widget build(BuildContext context) {
 
     return Bar(
       title: "${getLang(context, "TitleGdwalM3amel")}",
      
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
    PraSesList(
    depPraID:       snapshot.data [i]['depPraID'],
    praID:          snapshot.data [i]['praID'],
    praName:        snapshot.data [i]['praName'],
    praNumber:      snapshot.data [i]['praNumber'],
    praDate:        snapshot.data [i]['praDate'],
    praStart_Time:  snapshot.data [i]['praStart_Time'],
    praEnd_Time:    snapshot.data [i]['praEnd_Time'],
    depID:          snapshot.data [i]['depID'],
    instName:       snapshot.data [i]['instName'],
    locName :       snapshot.data [i]['locName']);
      }
      );
        }
return Center(child: CircularProgressIndicator());
        },
      ),
      );
  }
}
