// ignore_for_file: camel_case_types, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/list/pra_session/praAttDataList.dart';
import 'package:motatawera/services/api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motatawera/services/image.dart' as AppImage;

import '../../compnent/CARD.dart';
import '../../services/LANGUAGE/AppLocale.dart';


class PraAttData extends StatefulWidget {
  @override
  _PraAttDataState createState() => _PraAttDataState();
}

class _PraAttDataState extends State<PraAttData> {
  var stIDV;
  var praNameV;
  var status;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    stIDV = preferences.getString("stuID");
    praNameV = preferences.getString("praName");
    if (stIDV != null) {
      setState(() {
        stIDV = preferences.getString("stuID");
        praNameV = preferences.getString("praName");
        print(stIDV);
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
    var url = Uri.parse(api + "pra_attendance.php");
    var data = {"stuID": "$stIDV", "praName": "$praNameV","status": "$status"};
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
      title: "${praNameV}",
      child: Column(
        children: [
           ConAttHeder(
                        textdate:    "${getLang(context, "TxtYomM3ml")}" ,
                        textNumber:  "${getLang(context, "TxtRkmM3ml")}" ,
                        textCheck:   "${getLang(context, "TxtEl7ala")}" ,
                      ),
          Container( height: screenHeigh*0.6,
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
                        return PraAttDataList(
                          depPraID: snapshot.data[i]['depPraID'],
                          stuID: snapshot.data[i]['stuID '],
                          praName: snapshot.data[i]['praName'],
                          praDate: snapshot.data[i]['praDate'],
                          praNumber: snapshot.data[i]['praNumber'],
                          status: snapshot.data[i]['status'],
                        );
                      });
                }
                // return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
