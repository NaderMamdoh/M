// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/CARD.dart';




class PraAttDataList extends StatelessWidget {
 

final depPraID;
final praName;
final praDate;
final depID  ;
final praNumber;
final stuID ;
final status;

PraAttDataList({ 
this.stuID,
this.praNumber,
this.praName,
this.praDate,
this.depID  ,
this.depPraID,
this.status,

});


  @override
  Widget build(BuildContext context) {
   
  return 
   AttCARD(
    
    textdate:   praDate,
   
    textNumber: praNumber,
  

   );
  }
}