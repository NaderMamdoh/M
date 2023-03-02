// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/list/com_session/SesAttList.dart';
import 'package:http/http.dart' as http;
import 'package:motatawera/services/api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/LANGUAGE/AppLocale.dart';



class Session extends StatefulWidget {
  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<Session> {
  var ss;
  var SesName_d;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    ss = preferences.getString("sqID");
    if (ss != null) {
      setState(() {
        ss = preferences.getString("sqID");
        print(ss);
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
    var url = Uri.parse(api + "session2.php");
    var data = {"sqID": "$ss"};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return Bar(
      title: "${getLang(context, "Title7dorMo7adrat")}",
      child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics:  BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return SesAttList(
                    SesID: snapshot.data[i]['SesID'],
                    SesName: snapshot.data[i]['SesName'],
                    SesDate: snapshot.data[i]['SesDate'],
                    SesTime: snapshot.data[i]['SesTime'],
                    sbID: snapshot.data[i]['sbID'],
                    locName: snapshot.data[i]['locName'],
                    sqID: snapshot.data[i]['squadID'],
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
