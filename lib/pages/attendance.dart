// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/compnent/ConAtt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motatawera/services/image.dart' as AppImage;

import '../services/LANGUAGE/AppLocale.dart';
class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  var depID;
  var depName;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    depID = preferences.getString("depID");
    depName = preferences.getString("depName");

    if (depName != null) {
      setState(() {
        depName = preferences.getString("depName");
        depID = preferences.getString("depID");
        print(depName);
      });
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Bar(
      title:   "${getLang(context, "TitleEl7dor")}" ,
      child: ListView(
       physics:  BouncingScrollPhysics(
       parent: AlwaysScrollableScrollPhysics()),
        children: <Widget>[
        ConAtt(
          image: Image.asset(isDark
                ?AppImage.imageSesB
                :AppImage.imageSesW ),
          text: "${getLang(context, "Title7dorMo7adrat")}",
          onTap: () {
            Navigator.of(context).pushNamed('sesAttendance');
          },
        ),
        ConAtt(
          image: Image.asset(isDark
                ?AppImage.imageSecB
                :AppImage.imageSecW  ),
          text: "${getLang(context, "Title7dorSection")}",
          onTap: () {
            Navigator.of(context).pushNamed('SecAttendance');
          },
        ),
        depName != "0"
            ?
             ConAtt(
                image: Image.asset(isDark
                ?AppImage.imageLapB
                :AppImage.imageLapW ),
                text: "${getLang(context, "Title7dorM3amel")}",
                onTap: () {
                  Navigator.of(context).pushNamed('PraAttendance');
                },
              )
            : Text(""),
       
      ]),
    );
  }
}
