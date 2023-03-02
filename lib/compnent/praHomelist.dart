// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:motatawera/services/getDayName.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motatawera/services/color.dart' as AppColors;
import 'package:motatawera/services/font.dart' as AppFont;

import '../services/LANGUAGE/AppLocale.dart';


class PraHomeList extends StatelessWidget {

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

PraHomeList({ 

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

  }

  @override
  Widget build(BuildContext context) {
   

 bool isDark = Theme.of(context).brightness == Brightness.dark;

    return 

Container(  width: MediaQuery.of(context).size.width,


   child:
        
        Row(children: <Widget>[
        Expanded(flex: 2, child: 
        Container( alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(  
         topLeft:     Radius.circular(100),
         topRight:    Radius.circular(0),
         bottomLeft:  Radius.circular(100),
         bottomRight: Radius.circular(150), ),
       
      ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only( top: 2, bottom: 2 ),
            alignment: Alignment.center,
            child:   Text( praName, 
            style: TextStyle(
            color: isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
            fontSize: AppFont.FSHomeListTitle, 
            fontWeight: FontWeight.bold),
             textAlign: TextAlign.center,),
           ),

                      
    



   
                     
          Container(
              padding: EdgeInsets.only(bottom: 2) ,
              width: MediaQuery.of(context).size.width,
              child:Row( 
              mainAxisAlignment: MainAxisAlignment.center,     
              children: <Widget>[
              Text("${getLang(context, "TxtStimeM3ml")}", style: TextStyle
              (color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize: AppFont.FSHomeListTxt, 
             fontWeight: FontWeight.bold),),
              Text( getTime( praStart_Time ), style: TextStyle(
                color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize: AppFont.FSHomeListTxt , 
             fontWeight: FontWeight.bold),),
                ],),
          ),


         Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child: Row( 
              mainAxisAlignment: MainAxisAlignment.center,   
              children: <Widget>[
              Text("${getLang(context, "TxtEtimem3ml")}", style: TextStyle(
                color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize: AppFont.FSHomeListTxt , 
             fontWeight: FontWeight.bold),),
              Text( getTime(praEnd_Time) , style: TextStyle(
                color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize: AppFont.FSHomeListTxt ,
              fontWeight: FontWeight.bold),),
                  ],),
          ),
          
          Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child: Row( 
              mainAxisAlignment: MainAxisAlignment.center,   
              children: <Widget>[
               Text("${getLang(context, "TxtInstructorM3ml")}", style: TextStyle(
                color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize: AppFont.FSHomeListTxt ,
              fontWeight: FontWeight.bold),),
              Text( instName, style: TextStyle(
                color: isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize:AppFont.FSHomeListTxt ,
              fontWeight: FontWeight.bold),),
              ],),
          ),





                       
          Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child:Row(
              mainAxisAlignment: MainAxisAlignment.center,      
              children: <Widget>[
             Text("  ", style: TextStyle(color: isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize: AppFont.FSHomeListTxt ,
              fontWeight: FontWeight.bold),),
              Text( locName , style: TextStyle(
                color: isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize:AppFont.FSHomeListTxt ,
              fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
             ],),
          ), 
 
          
        ])
          )
          )
        ])
);

}
}



