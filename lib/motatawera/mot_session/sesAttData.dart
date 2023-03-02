// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/compnent/CARD.dart';
import 'package:motatawera/list/com_session/sesAttDataList.dart';
import 'package:http/http.dart' as http;
import 'package:motatawera/services/api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motatawera/services/image.dart' as AppImage;


import '../../services/LANGUAGE/AppLocale.dart';



class SesAttData extends StatefulWidget {
  @override
  _SesAttDataState createState() => _SesAttDataState();
}

class _SesAttDataState extends State<SesAttData> {
  var stIDV;
  var SesNameV;
  var SesIDV ;
  var status;
  var sbID;
  var statusV;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    SesIDV= preferences.getString("SesID");
    stIDV = preferences.getString("stuID");
    sbID = preferences.getString("sbID");
    SesNameV = preferences.getString("SesName");
    statusV = preferences.getString("status");
    if (stIDV != null) {
      setState(() {
        SesIDV= preferences.getString("SesID");
        stIDV = preferences.getString("stuID");
        sbID = preferences.getString("sbID");
        SesNameV = preferences.getString("SesName");
        statusV = preferences.getString("status");
        print(stIDV,);
      });
    } else {
      print("empty");
    }
  }

  @override
  void initState() {
    getPref();
    getData();
    super.initState();
  }

  Future getData() async {
    var url = Uri.parse(api + "ses_attendance.php");
    var data = {"stID": "$stIDV", "SesName": "$SesNameV",};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }





  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final double screenWidth = MediaQuery.of(context).size.width;
       bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Bar(
      title: "${SesNameV}",
      
      child:  
      Container(
        child: Column(
          
          children: [
            ConAttHeder(
                          textdate:    "${getLang(context, "TxtYomMo7dra")}" ,
                          textNumber:  "${getLang(context, "TxtRkmMo7adra")}" ,
                          textCheck:   "${getLang(context, "TxtEl7ala")}" ,
                        ),
             Container(height: screenHeigh*0.6,
               child: FutureBuilder( 
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      // still waiting for data to come
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData && snapshot.data.isEmpty) {
                      // got data from snapshot but it is empty

                      return Center(
                          child: Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                            Container(
                              height: screenHeigh / 5,
                              child: Image.asset(isDark
                ?AppImage.imageNo_AttB
                :AppImage.imageNo_AttW),
                            ),

                          ])));
                    } else {
                      // got data and it is not empty
                      return ListView.builder(
                          physics:  BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return SesAttDataList(
                              SesID:      snapshot.data[i]['SesID'],
                              sbID:       snapshot.data[i]['sbID'],
                              SesName:    snapshot.data[i]['SesName'],
                              SesDate:    snapshot.data[i]['SesDate'],
                              SesNumber:  snapshot.data[i]['SesNumber'],
                              status:     snapshot.data[i]['status'],
                            );
                          });
                    }
                  },
                ),
             ),
            
          ],
        ),
      ),
    );
  }
}
