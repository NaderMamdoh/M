// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/CARD.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/LANGUAGE/AppLocale.dart';

class SecSesList extends StatelessWidget {

final secID  ;
final secName;
final secDate;
final secStart_Time;
final secEnd_Time;
final sqID  ;
final locName   ;
final instName  ;
final secNumber;
final subSecID;

SecSesList({ 

this.secID ,
this.secName,
this.secDate,
this.secStart_Time,
this.secEnd_Time,
this.sqID  ,
this.locName   ,
this.instName   ,
this.subSecID,
this.secNumber
});


savePref(var praName)
  async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString("praName", praName);

  }

  @override
  Widget build(BuildContext context) {
    return 

    CARD(
      textName:           secName ,
      textConverDate1:    "${getLang(context, "TxtYomSec")}",
      textConverDate2:    secDate,
      textStartTime1:     "${getLang(context, "TxtStimeSec")}",
      textStartTime2:     secStart_Time,
      textEndTime1:       "${getLang(context, "TxtEtimeSec")}",
      textEndTime2:       secEnd_Time,
      textinstName1:      "${getLang(context, "TxtInstructorSec")}",
      textinstName2:      instName,
      textLocName1:       "",
      textLocName2:       locName,
    );

  }
}
















