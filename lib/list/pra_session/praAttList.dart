// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/ConSubList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motatawera/services/color.dart' as AppColors;

import '../../services/LANGUAGE/AppLocale.dart';



class PraAttList extends StatelessWidget {

final praID  ;
final praName;
final praDate;
final praTime;
final depID  ;
final locName   ;
final instName  ;
final praNumber;
final depPraID;
PraAttList({ 

this.praID ,
this.praName,
this.praDate,
this.praTime,
this.depID  ,
this.locName   ,
this.instName   ,
this.depPraID,
this.praNumber
});


savePref(var praName ,var praID)
  async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString("praName", praName);
    prefs.setString("praID", praID);
    // if(subID != null){
    // print(subID);
    // }

  }

  @override
  Widget build(BuildContext context) {
   bool isDark = Theme.of(context).brightness == Brightness.dark;

    return 
          ConSubList(
            ontap: (){
          
            savePref('$praName','$praID');

             Navigator.of(context).pushNamed('praAttData');
            },
            textSubName1: "" ,
            textSubName2: praName,
            leading:      Icon( Icons.menu_book_rounded , color: isDark 
                                      ? AppColors.ColorTextB 
                                      : AppColors.ColorText,),
            textDoc1:     "${getLang(context, "TxtInst")}",
            textDoc2:     instName ,      
           );
        
  }
}





