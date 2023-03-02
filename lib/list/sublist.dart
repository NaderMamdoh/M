// ignore_for_file: non_constant_identifier_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/ConSubList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motatawera/services/color.dart' as AppColors;

import '../services/LANGUAGE/AppLocale.dart';


class SubList extends StatelessWidget {

  double width=150;
  double topRight=0;
  double topLeft=120;
  double bottomLeft=120;
  double bottomRight=300;

final subID;
final subName;
final squadID;
final DocName ;
final term_ID ;
SubList({ 
this.subID,
this.subName,
this.squadID,
this.DocName ,
this.term_ID ,
});

savePref(var subID)
  async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString("subID", subID);
    // if(subID != null){
    // print(subID);
    // }

  }
  @override
  Widget build(BuildContext context) {
       bool isDark = Theme.of(context).brightness == Brightness.dark;

    return 
             
           ConSubjectList(
            ontap:(){
            savePref(
            '$subID',
            );
            Navigator.of(context).pushNamed("SessionData");
            },
           
            textSubName1: "${getLang(context, "TxtMokarar")}",
            textSubName2:  subName,
            leading:  Icon( Icons.menu_book_rounded , color: isDark 
                                      ? AppColors.ColorTextB 
                                      : AppColors.ColorText,),
            textDoc1:     "${getLang(context, "TxtDoctor")}",
            textDoc2:      DocName,

           
        );
                 
  }
}


