// ignore_for_file: unused_element, unused_local_variable, unused_import
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/compnent/ConServ.dart';
import 'package:motatawera/compnent/MainContainer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../compnent/mydrawer.dart';
import 'package:motatawera/services/image.dart' as AppImage;

import '../services/LANGUAGE/AppLocale.dart';


class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
  bool isDark = Theme.of(context).brightness == Brightness.dark;
  return  Bar(
           title: "${getLang(context, "Title5dmatTaleb")}",
           child: Directionality(textDirection: TextDirection.rtl,
           child: 
            GridView(
             physics:  BouncingScrollPhysics(
             parent: AlwaysScrollableScrollPhysics()),
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisSpacing: 1, crossAxisCount: 2),
             children: <Widget>[
              
 
              ConServR(
                image: Image.asset(
                  isDark
                ?AppImage.imageAttB
                :AppImage.imageAttW,),
                text: "${getLang(context, "TitleEl7dor")}",
                onTap: () {
                  Navigator.of(context).pushNamed('Attendance');
                },
              ),
 
 
              ConServL(
                image: Image.asset(isDark
                ?AppImage.imageSesB
                :AppImage.imageSesW,),
                text: "${getLang(context, "TitleGdwalMo7drat")}",
                onTap: () {
                  Navigator.of(context).pushNamed('Subjects');
                },
              ),
             
              depName != "0"
                  ? 
              ConServR(
                image: Image.asset(isDark
                ?AppImage.imageLapB
                :AppImage.imageLapW),
                text: "${getLang(context, "TitleGdwalM3amel")}",
                onTap: () {
                  Navigator.of(context).pushNamed('PraSession');
                },
              )
                
 
              : Text(""),
 
 
              ConServL(
                image: Image.asset(isDark
                ?AppImage.imageSecB
                :AppImage.imageSecW,),
                text: "${getLang(context, "TitleGdwalSection")}",
                onTap: () {
                  Navigator.of(context).pushNamed('SecSession');
                },
              ),
 
 
              ConServR(
                image: Image.asset(isDark
                ?AppImage.imageTableB
                :AppImage.imageTableW),
                text: "${getLang(context, "TitleElgdawel")}",
                onTap: () {
                  Navigator.of(context).pushNamed('Tables');
                },
              ),
 
 
              ConServL(
                image: Image.asset(isDark
                ?AppImage.imageQuestB
                :AppImage.imageQuestW ),
                text: "${getLang(context, "TitleElestbyan")}",
                onTap: () {
                  Navigator.of(context).pushNamed('Questionnaire');
                  },
              ),
 
 
              ]),
            ) ,
           );
  }
}


