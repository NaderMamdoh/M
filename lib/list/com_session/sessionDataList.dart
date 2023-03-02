// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/CARD.dart';

import '../../services/LANGUAGE/AppLocale.dart';


class SesDataList extends StatelessWidget {

final SesID ;
final SesName;
final SesDate;
final SesStart_Time;
final SesEnd_Time;
final sbID ;
final locName  ;

SesDataList({ 

this.SesID ,
this.SesName,
this.SesDate,
this.SesStart_Time,
this.SesEnd_Time,
this.sbID ,
this.locName  ,

});


  @override
  Widget build(BuildContext context) {
 
  return 
    CARD(  
       textName:        SesName,
       textConverDate1: "${getLang(context, "TxtYomMo7dra")}",
       textConverDate2: SesDate,
       textStartTime1:  "${getLang(context, "TxtStimeMo7adra")}",
       textStartTime2:  SesStart_Time,
       textEndTime1:    "${getLang(context, "TxtEtimeMo7adra")}",
       textEndTime2:    SesEnd_Time,
       textLocName1:    "",
       textLocName2:    locName,
       textinstName1:   "",
       textinstName2:   "",
    );
    
  }
}



