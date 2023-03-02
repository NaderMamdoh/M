// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/list/subLIst.dart';
import 'package:http/http.dart' as http;
import 'package:motatawera/services/api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/LANGUAGE/AppLocale.dart';

class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  savePref(var subID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("subID", subID);
  }

  var squadID;
  bool isSignIn = false;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    squadID = preferences.getString("sqID");
    if (squadID != null) {
      setState(() {
        squadID = preferences.getString("sqID");
        isSignIn = true;
      });
    }
  }

  @override
  void initState() {
    getPref();
    getData();
    super.initState();
  }

  Future getData() async {
    var url = Uri.parse(api + "subject.php");
    var data = {"squadID": "$squadID"};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return Bar(
      title: "${getLang(context, "TitleMokararat")}",
      child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics:  BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return SubList(
                    subID:   snapshot.data[i]['subID'],
                    subName: snapshot.data[i]['subName'],
                    DocName: snapshot.data[i]['DocName'],
                    squadID: snapshot.data[i]['squadID'],
                    term_ID: snapshot.data[i]['term_ID'],
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
