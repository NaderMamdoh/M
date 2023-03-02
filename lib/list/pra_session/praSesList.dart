// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/CARD.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/LANGUAGE/AppLocale.dart';



class PraSesList extends StatelessWidget {

final praID  ;
final praName;
final praDate;
final praStart_Time;
final praEnd_Time;
final depID  ;
final locName   ;
final instName  ;
final praNumber;
final depPraID;

PraSesList({ 

this.praID ,
this.praName,
this.praDate,
this.praStart_Time,
this.praEnd_Time,
this.depID  ,
this.locName   ,
this.instName   ,
this.depPraID,
this.praNumber
});


savePref(var praName)
  async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString("praName", praName);
    // if(subID != null){
    // print(subID);
    // }

  }

  @override
  Widget build(BuildContext context) {
   
    return 


  CARD(
       textName: praName,
       textConverDate1: "${getLang(context, "TxtYomM3ml")}",
       textConverDate2: praDate,
       textStartTime1:  "${getLang(context, "TxtStimeM3ml")}",
       textStartTime2:  praStart_Time,
       textEndTime1:    "${getLang(context, "TxtEtimem3ml")}",
       textEndTime2:    praEnd_Time,
       textinstName1:   "${getLang(context, "TxtInstructorM3ml")}",
       textinstName2:   instName,
       textLocName1:    "",
       textLocName2:    locName,
  );

  }
}


