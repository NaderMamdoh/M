// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/CARD.dart';



class SesAttDataList extends StatelessWidget {

final SesID ;
final stID ;
final SesName;
final SesDate ;
final SesNumber;
final status;
final sbID ;

SesAttDataList({ 
this.SesID ,
this.stID ,
this.SesName,
this.SesDate ,
this.SesNumber,
this.status,
this.sbID

});


  @override
  Widget build(BuildContext context) {
   
   return 
    AttCARD(   
    textdate:   SesDate,
    textNumber: SesNumber,
    );
  }
}





