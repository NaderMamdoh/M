// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/ConSubList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motatawera/services/color.dart' as AppColor;

import '../../services/LANGUAGE/AppLocale.dart';



class SesAttList extends StatelessWidget {

final SesID ;
final SesName;
final SesDate;
final SesTime;
final sbID  ;
final locName;
final sqID;

SesAttList({ 

this.SesID ,
this.SesName,
this.SesDate,
this.SesTime,
this.sbID  ,
this.locName,
this.sqID
});

savePref(var SesName , var SesID)
  async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("SesID", SesID);
    prefs.setString("SesName", SesName);
  }
  @override
  Widget build(BuildContext context) {
    
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return 
      ConSubList(
           ontap:(){
          
            savePref('$SesName','$SesID');
            Navigator.of(context).pushNamed('SesAttData');
            print(SesID);
            },

            shadowColor:    isDark?  AppColor.ColorConShadowAttB : AppColor.ColorConShadowAtt,
            textSubName1:   "${getLang(context, "TxtMokarar")}" ,
            textSubName2:   SesName,
            leading:        Icon( Icons.library_books_outlined , color: Colors.teal,size: 25,),
            textDoc1:       "",
            textDoc2:       "",

           
        );
  }
}










