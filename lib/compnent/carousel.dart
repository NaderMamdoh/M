// ignore_for_file: unrelated_type_equality_checks, unnecessary_statements
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/ConHome.dart';
import 'package:motatawera/compnent/sesHOMElist.dart';
import 'package:motatawera/compnent/praHomelist.dart';
import 'package:motatawera/compnent/secHOMElist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:motatawera/services/api.dart';
import 'dart:convert';
import 'package:motatawera/services/image.dart' as AppImage;

import '../services/LANGUAGE/AppLocale.dart';


class CarSes extends StatefulWidget {
  @override
  _CarSesState createState() => _CarSesState();
}

class _CarSesState extends State<CarSes> {
  var ss;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    ss = preferences.getString("sqID");
  }

  @override
  void initState() {
    getPref();
    getsesData();
    super.initState();
  }

  Future getsesData() async {
    var url = Uri.parse(api + "sessionHome.php");
    var data = {"sqID": "$ss"};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return 
    ConCarosel(
        margin: EdgeInsets.only(top: 5),
        txt1:   "${getLang(context, "TitleMo7adra")}" ,
        child:
        PageView(children: [
        FutureBuilder(
         future: getsesData(),
         builder: (BuildContext context, AsyncSnapshot snapshot) {
           if (!snapshot.hasData) {
             return Center(child: CircularProgressIndicator());
           } else if (snapshot.hasData && snapshot.data.isEmpty) {

             return ConCaroselImage(
               image: Image.asset(isDark
                       ?AppImage.imageScssB
                       :AppImage.imageScssW,),
               txt2: "${getLang(context, "TxtNoSessions")}",);
           } else {
             return ListView.builder(
                     physics:  BouncingScrollPhysics(
                     parent: AlwaysScrollableScrollPhysics()),
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     itemExtent: screenWidth / 1.4,
                     itemCount: snapshot.data.length,
                     itemBuilder: (context, i) {
             return SesHomeList(
                     SesName: snapshot.data[i]['SesName'],
                     SesDate: snapshot.data[i]['SesDate'],
                     SesStart_Time: snapshot.data[i]['SesStart_Time'],
                     SesEnd_Time: snapshot.data[i]['SesEnd_Time'],
                     locName: snapshot.data[i]['locName']);
                 });
           }
                    },
                  ),
            ]),
    );
  }
}










class Carsec extends StatefulWidget {
  @override
  _CarsecState createState() => _CarsecState();
}

class _CarsecState extends State<Carsec> {
  var ss;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    ss = preferences.getString("sqID");
  }

  @override
  void initState() {
    getPref();
    getsecData();
    super.initState();
  }

  Future getsecData() async {
    var url = Uri.parse(api + "secSessionsHome.php");
    var data = {"sqID": "$ss"};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return  
       ConCarosel( 
        margin: EdgeInsets.only(top: 5),
        txt1:  "${getLang(context, "TitleSection")}", 
        child:  
        PageView(children: [
        FutureBuilder(
         future: getsecData(),
         builder: (BuildContext context, AsyncSnapshot snapshot) {
         if (!snapshot.hasData) {
           return Center(child: CircularProgressIndicator());
         } else if (snapshot.hasData && snapshot.data.isEmpty) {
           return ConCaroselImage(
             image: Image.asset(isDark
                ?AppImage.imageScssB
                :AppImage.imageScssW),
             txt2: "${getLang(context, "TxtNoSection")}",);
         } else {
           return ListView.builder(
                      physics:  BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemExtent: screenWidth / 1.3,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
           return SeCHomeList(
                      secName: snapshot.data[i]['secName'],
                      secNumber: snapshot.data[i]['secNumber'],
                      secDate: snapshot.data[i]['secDate'],
                      secStart_Time: snapshot.data[i]['secStart_Time'],
                      secEnd_Time: snapshot.data[i]['secEnd_Time'],
                      instName: snapshot.data[i]['instName'],
                      locName: snapshot.data[i]['locName']);
           });
         }},
         )
      ])
    );
  }
}








class CarPra extends StatefulWidget {
  @override
  _CarPraState createState() => _CarPraState();
}

class _CarPraState extends State<CarPra> {
  var depID;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    depID = preferences.getString("depID");
  }

  @override
  void initState() {
    getPref();
    getpraData();
    super.initState();
  }

  Future getpraData() async {
    var url = Uri.parse(api + "praSessionsHome.php");
    var data = {"depID": "$depID"};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }



  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return
    
      ConCarosel(
        margin: EdgeInsets.only(bottom: 5),
        txt1:  "${getLang(context, "TitleM3ml")}",
        child:
        PageView( children: [
        FutureBuilder(
        future: getpraData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            // still waiting for data to come
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data.isEmpty) {
                        // got data from snapshot but it is empty
            return ConCaroselImage(
                        image: Image.asset(isDark
                              ?AppImage.imageNo_LapB
                              :AppImage.imageNo_LapW),
                        txt2: "${getLang(context, "TxtNoLap")}",  );
         } else {
                        // got data and it is not empty
            return  ListView.builder(
                     physics:  BouncingScrollPhysics(
                     parent: AlwaysScrollableScrollPhysics()), 
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     itemExtent: screenWidth / 1.3,
                     itemCount: snapshot.data.length,
                     itemBuilder: (context, i) {
            return PraHomeList(
                     praName: snapshot.data[i]['praName'],
                     praNumber: snapshot.data[i]['praNumber'],
                     praDate: snapshot.data[i]['praDate'],
                     praStart_Time: snapshot.data[i]['praStart_Time'],
                     praEnd_Time: snapshot.data[i]['praEnd_Time'],
                     instName: snapshot.data[i]['instName'],
                     locName: snapshot.data[i]['locName']);
                     });
         }
       },
      )
     ],),
    );
    
  }
}
