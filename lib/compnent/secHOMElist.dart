// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:motatawera/services/getDayName.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motatawera/services/color.dart' as AppColors;
import 'package:motatawera/services/font.dart' as AppFont;

import '../services/LANGUAGE/AppLocale.dart';


class SeCHomeList extends StatelessWidget {

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

SeCHomeList({ 

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
    // if(subID != null){
    // print(subID);
    // }

  }

  @override
  Widget build(BuildContext context) {
   

 bool isDark = Theme.of(context).brightness == Brightness.dark;

    return 

  Container(  width: MediaQuery.of(context).size.width,
               
  //   padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
   child:
    // Card(color: Colors.transparent,
    //    elevation: 0,
    //    child:      
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
            child:   Text( secName, 
            style: TextStyle(
              color:isDark 
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
              Text("${getLang(context, "TxtStimeSec")}", style: TextStyle(
                color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize:  AppFont.FSHomeListTxt , 
             fontWeight: FontWeight.bold),),
              Text( getTime (secStart_Time) 
              , style: TextStyle(
                color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize:  AppFont.FSHomeListTxt ,
              fontWeight: FontWeight.bold),),
              ],),
          ),


         Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child: Row( 
              mainAxisAlignment: MainAxisAlignment.center,   
              children: <Widget>[
              Text("${getLang(context, "TxtEtimeSec")}", style: TextStyle(
                color: isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize: AppFont.FSHomeListTxt,
              fontWeight: FontWeight.bold),),
              Text( getTime(secEnd_Time)  , style: TextStyle(
                color: isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize:  AppFont.FSHomeListTxt , 
             fontWeight: FontWeight.bold),),
                 ],),
          ),
          
          Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child: Row( 
              mainAxisAlignment: MainAxisAlignment.center,   
              children: <Widget>[
              Text("${getLang(context, "TxtInstructorSec")}", style: TextStyle(
                color: isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize:  AppFont.FSHomeListTxt ,
              fontWeight: FontWeight.bold),),
              Text( instName, style: TextStyle(
                color:isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize:  AppFont.FSHomeListTxt , 
             fontWeight: FontWeight.bold),),
              ],),
          ),





                       
          Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child:Row(
              mainAxisAlignment: MainAxisAlignment.center,      
              children: <Widget>[
             Text("  ", style: TextStyle(
              color: isDark 
            ? AppColors.ColorTextB
            : AppColors.ColorText ,
             fontSize:  AppFont.FSHomeListTxt,
              fontWeight: FontWeight.bold),),
              Text( locName , style: TextStyle(
                color: isDark 
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



/*




                    
       





                     
   


                       



*/















