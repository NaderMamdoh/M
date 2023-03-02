// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:motatawera/services/getDayName.dart';
import 'package:motatawera/services/color.dart' as AppColors;
import 'package:motatawera/services/font.dart' as AppFont;

import '../services/LANGUAGE/AppLocale.dart';



class SesHomeList extends StatelessWidget {

final SesID ;
final SesName;
final SesDate;
final SesStart_Time;
final SesEnd_Time;
final sbID ;
final sqID;
final locName  ;

SesHomeList({ 

this.SesID ,
this.SesName,
this.SesDate,
this.SesStart_Time,
this.SesEnd_Time,
this.sbID ,
this.sqID,
this.locName  ,

});


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
            child:   Text( SesName, 
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
              Text("${getLang(context, "TxtStimeMo7adra")}", style: TextStyle(
                color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize: AppFont.FSHomeListTxt , 
             fontWeight: FontWeight.bold), 
             textAlign: TextAlign.center,),
             Text(  getTime(SesStart_Time) , style: TextStyle(
              color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
            fontSize: AppFont.FSHomeListTxt ,
             fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
              ],),
          ),


         Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child: Row( 
              mainAxisAlignment: MainAxisAlignment.center,   
              children: <Widget>[
         Text("${getLang(context, "TxtEtimeMo7adra")}", style: TextStyle(
          color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize: AppFont.FSHomeListTxt ,
             fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
         Text(  getTime (SesEnd_Time), style: TextStyle(
          color: isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize: AppFont.FSHomeListTxt ,
              fontWeight: FontWeight.bold), 
              textAlign: TextAlign.center,), 
              ],),
          ),








                       
          Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child:Row(
              mainAxisAlignment: MainAxisAlignment.center,      
              children: <Widget>[
              Text("  ", style: TextStyle(
                color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize: AppFont.FSHomeListTxt ,
              fontWeight: FontWeight.bold), 
              textAlign: TextAlign.center,),
              Text( locName, style: TextStyle(
                color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize: AppFont.FSHomeListTxt ,
              fontWeight: FontWeight.bold),
               textAlign: TextAlign.center,),
              ],),
          ), 
 
          
        ])
          )
          )
        ])
);

}
}