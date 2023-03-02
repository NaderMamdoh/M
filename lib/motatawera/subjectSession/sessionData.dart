// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/list/com_session/sessionDataList.dart';
import 'package:http/http.dart' as http ;
import 'package:motatawera/services/api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/LANGUAGE/AppLocale.dart';



class SessionData extends StatefulWidget {

  @override
  _SessionDataState createState() => _SessionDataState();
}

class _SessionDataState extends State<SessionData> {
 
  var ss;
  getPref()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
 

  ss    = preferences.getString("subID");
  if(ss != null){
 setState(() {
  ss    = preferences.getString("subID");
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
(api+"session.php");
var data = {"sbID":"$ss"};
var response = await http.post(url,body : data);
var responsebody = jsonDecode(response.body);
return responsebody;

 }
 
 
  @override
  Widget build(BuildContext context) {

     return  Bar(
       title:"${getLang(context, "TitleSessionData")}",
  

      child:FutureBuilder(
        future: getData(),
       
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
          return ListView.builder(
                physics:  BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: snapshot.data.length,
            itemBuilder: (context , i)
     {   return
    SesDataList(
    SesID:          snapshot.data [i]['SesID'],
    SesName:        snapshot.data [i]['SesName'],
    SesDate:        snapshot.data [i]['SesDate'],
    SesStart_Time:  snapshot.data [i]['SesStart_Time'],
    SesEnd_Time:    snapshot.data [i]['SesEnd_Time'],
    sbID:           snapshot.data [i]['sbID'],
    locName:        snapshot.data [i]['locName']);
      }
      );
        }
return Center(child: CircularProgressIndicator());
        },
      ),
      );
  }
}
