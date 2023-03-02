// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:motatawera/services/getDayName.dart';
import 'package:motatawera/services/color.dart' as AppColors;
import 'package:motatawera/services/font.dart' as AppFont;




class CARD extends StatelessWidget {
  final Color shadowColor;
  var colors=  [ Colors.red , Colors.black, Colors.amber];
  var padding=EdgeInsets.only(bottom: 5) ;
  var textName='';
  var textConverDate1='';
  var textConverDate2='';
  var textStartTime1='';
  var textStartTime2='';
  var textEndTime1='';
  var textEndTime2='';
  var textinstName1='';
  var textinstName2='';
  var textLocName1='';
  var textLocName2='';
  CARD({
    this.shadowColor=Colors.black,
    this.colors,
    this.padding,
    this.textName,
    this.textConverDate1,
    this.textConverDate2,
    this.textStartTime1,
    this.textStartTime2,
    this.textEndTime1,
    this.textEndTime2,
    this.textinstName1,
    this.textinstName2,
    this.textLocName1,
    this.textLocName2,
  });


  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return
      Container(  width: MediaQuery.of(context).size.width,

          padding: EdgeInsets.fromLTRB(16, 100, 16, 50),
          child:
          Card(color: Colors.transparent,
           elevation: 0,
           child:
           Row(children: <Widget>[
           Expanded(flex: 2, child:
           Container( 
           alignment: Alignment.center,
           decoration: BoxDecoration(
           borderRadius: BorderRadius.only(
           topLeft:     isDark?   Radius.circular(100) : Radius.circular(50) ,   
           topRight:    isDark?   Radius.circular(000) : Radius.circular(50) , 
           bottomLeft:  isDark?   Radius.circular(100) : Radius.circular(50) , 
           bottomRight: isDark?   Radius.circular(150) : Radius.circular(50) ,  ),
           boxShadow: [
           BoxShadow(
           color:  isDark
           ?AppColors.ColorConShadowB
           :AppColors.ColorConShadow,
           blurRadius: 10.0),],
           gradient: LinearGradient(
           begin:   isDark
           ?  Alignment.topLeft  :  Alignment.center ,
           end:  isDark
           ?  Alignment.bottomRight  : Alignment.center,
           colors: isDark
           ? AppColors.ColorConB
           : AppColors.ColorConW,)),
           width: MediaQuery.of(context).size.width,
           child: Column(
           crossAxisAlignment:  CrossAxisAlignment.start,
           children: <Widget>[

          // Subject Name  
              Container(
              padding: EdgeInsets.only( top: 5 , bottom: 5 ),
              alignment: Alignment.center,
              child:   Text( textName,
              style: TextStyle(
              color: isDark
              ?AppColors.ColorTextB
              :AppColors.ColorText,
              fontSize: AppFont.FSCardTitle ,
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,),
              ),



         
         // Instructor Name
            Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(textinstName1, style: TextStyle(
              color: isDark
              ?AppColors.ColorTextB
              :AppColors.ColorText,
              fontSize: AppFont.FSCardTxt,
              fontWeight: FontWeight.bold),),

              Text( textinstName2, style: TextStyle(
              color: isDark
              ?AppColors.ColorTextB
              :AppColors.ColorText,
              fontSize: AppFont.FSCardTxt,
              fontWeight: FontWeight.bold),), ],),
            ),




         // Date
            Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(textConverDate1,
              style: TextStyle(
              color: isDark
              ?AppColors.ColorTextB
              :AppColors.ColorText,
              fontSize: AppFont.FSCardTxt,
              fontWeight: FontWeight.bold),),

              Text( getDayNameFromString(textConverDate2)  ,
              style: TextStyle(
              color: isDark
              ?AppColors.ColorTextB
              :AppColors.ColorText,
              fontSize: AppFont.FSCardTxt,
              fontWeight: FontWeight.bold),),],),
            ),



        
         // Start Time 
            Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(textStartTime1,
              style: TextStyle( 
              color: isDark
              ?AppColors.ColorTextB
              :AppColors.ColorText,
              fontSize: AppFont.FSCardTxt,
              fontWeight: FontWeight.bold),),
              
              Text( getTime (textStartTime2),
              style: TextStyle( 
              color:  isDark
              ?AppColors.ColorTextB
              :AppColors.ColorText,
              fontSize: AppFont.FSCardTxt,
              fontWeight: FontWeight.bold),),],),
            ),




         // End Time
            Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(textEndTime1,
              style: TextStyle( 
              color: isDark
              ?AppColors.ColorTextB
              :AppColors.ColorText,
              fontSize: AppFont.FSCardTxt,
              fontWeight: FontWeight.bold),),
            
              Text( getTime(textEndTime2),
              style: TextStyle(
              color: isDark
              ?AppColors.ColorTextB
              :AppColors.ColorText,
              fontSize: AppFont.FSCardTxt,
              fontWeight: FontWeight.bold),),],),
            ),




         // Location
            Container(
              padding: EdgeInsets.only(bottom: 5) ,
              width: MediaQuery.of(context).size.width,
              child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text( textLocName1,
              style: TextStyle(
              color: isDark
              ?AppColors.ColorTextB
              :AppColors.ColorText,
              fontSize: AppFont.FSCardTxt,
              fontWeight: FontWeight.bold),),
              Text( textLocName2 ,
              style: TextStyle(
              color: isDark
              ?AppColors.ColorTextB
              :AppColors.ColorText,
              fontSize: AppFont.FSCardTxt,
              fontWeight: FontWeight.bold),),],),
            ),



         ])
         )
        )
      ])
      )
    );
  }
}





class AttCARD extends StatelessWidget {
  var colors=  [];
  var textdate='';
  var textNumber='';
  var textCheck="Icon(Icons.close_rounded)";
  AttCARD({
  this.textNumber,
  this.textCheck,
  this.textdate,
});

  @override
  Widget build(BuildContext context) {

  bool isDark = Theme.of(context).brightness == Brightness.dark;

  return

      Container( width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      child:

      Card(color: Colors.transparent, elevation: 0,child:
      Row( children: <Widget>[
      Expanded(flex: 4 , child:
      Container( 
      alignment: Alignment.center, child: 

      Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: <Widget>[
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
     
     
     
      
      // Attendance  Date
        Container( 
            decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
            topLeft:     Radius.circular(10),
            topRight:    Radius.circular(10),
            bottomLeft:  Radius.circular(10),
            bottomRight: Radius.circular(10), ),
            boxShadow: [
            BoxShadow(
            offset:  Offset(0.5,0.5),
            color: isDark
            ?AppColors.ColorConShadowAttB
            :AppColors.ColorConShadowAtt,
            blurRadius: 10.0),],
            gradient: LinearGradient(
            begin:   isDark
            ?  Alignment.topLeft  :  Alignment.center ,
            end:  isDark
            ?  Alignment.bottomRight  : Alignment.center,
            colors: isDark
            ? AppColors.ColorConB
            : AppColors.ColorConW,  
            )),  
            padding: EdgeInsets.all(5),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
                                      
                                      
            Container(
            padding: EdgeInsets.all(5),
            child: Text( textdate,
            style: TextStyle( color: isDark
            ?AppColors.ColorTextB
            :AppColors.ColorText,
            fontSize: AppFont.FSCardTxt,
            fontWeight: FontWeight.bold),),),],),
        ),




      //Attendance Number
        Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
            topLeft:     Radius.circular(10),
            topRight:    Radius.circular(10),
            bottomLeft:  Radius.circular(10),
            bottomRight: Radius.circular(10), ),
            boxShadow: [
            BoxShadow(
            offset:  Offset(0.5,0.5),
            color: isDark
            ?AppColors.ColorConShadowAttB
            :AppColors.ColorConShadowAtt,
            blurRadius: 10.0),],
            gradient: LinearGradient(
            begin:   isDark
            ?  Alignment.topLeft  :  Alignment.center ,
            end:  isDark
            ?  Alignment.bottomRight  : Alignment.center,
            colors: isDark
            ? AppColors.ColorConB
            : AppColors.ColorConW,  
            )),  
            padding: EdgeInsets.all(5),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: <Widget>[
          
            Container(
            padding: EdgeInsets.all(10),
            child: Text( textNumber,
            style: TextStyle( color: isDark
            ?AppColors.ColorTextB
            :AppColors.ColorText,
            fontSize: AppFont.FSCardTxt,
            fontWeight: FontWeight.bold),),),],),
        ),




      //Check true
        Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
          BoxShadow(
          offset:  Offset(0.5,0.5),
          color: isDark
          ?AppColors.ColorConShadowAttB
          :AppColors.ColorConShadowAtt,
          blurRadius: 10.0),],
          color: 
          isDark
          ?AppColors.ColorStutesYesB
          :AppColors.ColorStutesYes,
          ),
          padding: EdgeInsets.all(10),
          child: Container(
          padding: EdgeInsets.all(0),
          child: 
          Icon(Icons.done_outline_rounded, 
          color: isDark
          ?AppColors.ColorTextBarB
          :AppColors.ColorTextBar,),),
          ),

        ],),
        ])
      ),
      ),
    ],),
     ),
    ); 
 }
}





class ConAttHeder extends StatelessWidget {
 
  var textdate='';
  var textNumber='';
  var textCheck='';

  ConAttHeder({
    this.textNumber,
    this.textCheck,
    this.textdate,

  });

  @override
  Widget build(BuildContext context) {
     
     bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [ BoxShadow(
            offset:  Offset(0.5,0.5),
            color: isDark
            ?AppColors.ColorConShadowB
            :AppColors.ColorShadow,
            blurRadius: 10.0),],
            gradient: LinearGradient(
            begin:   isDark
            ?  Alignment.topLeft  :  Alignment.center ,
            end:  isDark
            ?  Alignment.bottomRight  : Alignment.center,
            colors: isDark
            ? AppColors.ColorConB
            : AppColors.ColorConW,  
            )),  child: 
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            
            
            
          // Attendance Date
             Container(
               padding: EdgeInsets.all(5),
               child: Text(textdate,
               style: TextStyle( color: isDark
               ?AppColors.ColorTextB
               :AppColors.ColorText,
               fontSize: AppFont.FSCardTxt,
               fontWeight: FontWeight.bold),),
             ),
          
          
          
       
          // Attendance Numbe
             Container( 
               padding: EdgeInsets.all(5),
               child: Text(textNumber,
               style: TextStyle( color: isDark
               ?AppColors.ColorTextB
               :AppColors.ColorText,
               fontSize: AppFont.FSCardTxt,
               fontWeight: FontWeight.bold),),
             ),
            
            


          // Attendance Stutes
             Container(
               padding: EdgeInsets.all(5),
               child: Text(textCheck,
               style: TextStyle( color: isDark
               ?AppColors.ColorTextB
               :AppColors.ColorText,
               fontSize: AppFont.FSCardTxt,
               fontWeight: FontWeight.bold),),
              ),


                          
      ]),
     );
  }
}