// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/CARD.dart';


class SecAttDataList extends StatelessWidget {
 

final subSecID;
final secName;
final secDate;
final sqID  ;
final secNumber;
final stuID ;
final status;


SecAttDataList({ 
this.stuID,
this.secNumber,
this.secName,
this.secDate,
this.sqID  ,
this.subSecID,
this.status,

});


  @override
  Widget build(BuildContext context) {
   
  return 
   AttCARD(
   
    textdate:   secDate,
    
    textNumber: secNumber,
        
  );
  }
}