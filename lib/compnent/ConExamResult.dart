// ignore_for_file: must_be_immutable, unused_local_variable
import 'package:flutter/material.dart';
import 'package:motatawera/services/color.dart' as AppColors;

import '../services/LANGUAGE/AppLocale.dart';





class ConStudentResult extends StatelessWidget {
  var textName  = "";
  var textSquad = "";
  ConStudentResult({
  this.textName,
  this.textSquad,
  });
  @override
 Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return 
           Container( 
            alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 10,  horizontal: 20),
              padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
              child:
              Card(color: Colors.transparent,
              elevation: 0,
              child:      
              Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only(  
              topLeft:      Radius.circular(20),
              topRight:     Radius.circular(0),
              bottomLeft:   Radius.circular(0),
              bottomRight:  Radius.circular(20), ),
              boxShadow: [
              BoxShadow(
              offset:  Offset(2.5,2.5),
              color: isDark
              ?AppColors.ColorConShadowB
              :AppColors.ColorConShadow,
              blurRadius: 10.0),],
              gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
              ?AppColors.ColorConStudentB
              :AppColors.ColorConStudent,)),
              child: 
            
             Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child:   
              Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                   
               Container(
                 padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                 child: Text(  "$textName" ,style: TextStyle(
                 fontWeight: FontWeight.bold ,
                 color: isDark 
                 ? AppColors.ColorTextBarB 
                 : AppColors.ColorTextBar ) , ),
               ),

                          
               Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  child: Text(  "$textSquad" ,style: TextStyle(
                  fontWeight: FontWeight.bold ,
                  color: isDark 
                  ? AppColors.ColorTextBarB 
                  : AppColors.ColorTextBar ) , ),
               ),

             ]) ,
             ),
            )
          )
         );

  }
}












class ConExamResult extends StatelessWidget {
  var text1 = "";
  var text2 = "";
  ConExamResult({
  this.text1,
  this.text2,
  });
  @override
 Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return               
           Container(
            child: 
             Container( width: double.infinity,  
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
              child:
               Card(color: Colors.transparent,
                elevation: 0,
                child:      
                 Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(  
                  topLeft:      Radius.circular(0),
                  topRight:     Radius.circular(0),
                  bottomLeft:   Radius.circular(30),
                  bottomRight:  Radius.circular(30), ),
                  boxShadow: [
                  BoxShadow(
                  offset:  Offset(2.5,2.5),
                  color: isDark
                  ?AppColors.ColorConShadowB
                  :AppColors.ColorConShadow,
                  blurRadius: 10.0),],
                  gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark
                  ?AppColors.ColorConStudentB
                  :AppColors.ColorConStudent,)),
                  child:
                   Column(
                    children: [
                    Container(
                     padding: EdgeInsets.symmetric(vertical: 10),
                     alignment: Alignment.center,
                     child:      
                      Row( 
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: <Widget>[
                           
                       Text("${getLang(context, "TxtElmada")}" ,style: TextStyle(
                       fontWeight: FontWeight.bold ,
                       color: isDark 
                       ? AppColors.ColorTextBarB 
                       : AppColors.ColorTextBar ) , ),
                        
                       Text(  "${getLang(context, "TxtElta2der")}" ,style: TextStyle(
                       fontWeight: FontWeight.bold ,
                       color: isDark 
                       ? AppColors.ColorTextBarB 
                       : AppColors.ColorTextBar ) , )
                   
                      ]) ,
                      ),
   
                      Divider(thickness: 2,
                     color: isDark
                     ? AppColors.ColorTextBarB 
                     : AppColors.ColorTextBarB ),
                                  
                       Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child:  
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                          
                           Text( text1 ,style: TextStyle(
                         fontWeight: FontWeight.bold ,
                         color: isDark 
                         ? AppColors.ColorTextBarB 
                         : AppColors.ColorTextBar ) , ),
                
                           Text( text2 ,style: TextStyle(
                         fontWeight: FontWeight.bold ,
                         color: isDark 
                         ? AppColors.ColorTextBarB 
                         : AppColors.ColorTextBar ) , )
                            
                      ]),
                      ),
                      ]),
                      )
                      ),
                    ),
                  );
   
  }
}








