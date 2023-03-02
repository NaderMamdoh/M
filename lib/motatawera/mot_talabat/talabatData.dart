// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/compnent/ConTalabat.dart';


import '../../services/LANGUAGE/AppLocale.dart';



class TalabatData extends StatefulWidget {

  final talabNameD;
  final talabContentD;  
  TalabatData ({
    this.talabNameD,
    this.talabContentD,
  });

  @override
  _TalabatDataState createState() => _TalabatDataState();


}

class _TalabatDataState extends State<TalabatData> {
  


  @override
  Widget build(BuildContext context) {
 
    return Bar(
      title: "${getLang(context, "TitleElawra2Elmtloba")}",
      child: ConTalabat(
        text1:   widget.talabNameD,
        text2:   widget.talabContentD,

      )
    );
  }
}
