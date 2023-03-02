// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/ConSubList.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/LANGUAGE/AppLocale.dart';

class SecAttList extends StatelessWidget {

final secID  ;
final secName;
final secDate;
final secTime;
final sqID  ;
final locName   ;
final instName  ;
final secNumber;
final subSecID;

SecAttList({ 

this.secID ,
this.secName,
this.secDate,
this.secTime,
this.sqID  ,
this.locName   ,
this.instName   ,
this.subSecID,
this.secNumber,

});


savePref(var secName , var secID)
  async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString("secName", secName);
    prefs.setString("secID", secID);
  

  }

  @override
  Widget build(BuildContext context) {
   
    return 


           ConSubList(
            ontap: (){
          
            savePref('$secName', '$secID');
             Navigator.of(context).pushNamed('secAttData');
            },
            textSubName1: "" ,
            textSubName2:  secName,
            leading: Icon( Icons.paste_rounded , color: Colors.teal,size: 25,),
            textDoc1:     "${getLang(context, "TxtInst")}",
            textDoc2:     instName ,      
           );
        
        
  }
}


























