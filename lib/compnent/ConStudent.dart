// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:motatawera/services/color.dart' as AppColors;




class ConStudent extends StatelessWidget {
  final Widget child;
  var text1 = "";
  var text2 = "";
  ConStudent({
  this.child, 
  this.text1,
  this.text2,
  });
  @override
 Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return 
        Container( height:110, width: double.infinity,  
      margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.fromLTRB(5, 12, 5, 15),
        child:
        Card(color: Colors.transparent,
        elevation: 0,
        child:      
        Row(children: <Widget>[
        Expanded(flex: 2, child: 
        Container(
        height: 110,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(  
        topLeft:      Radius.circular(0),
        topRight:     Radius.circular(100),
        bottomLeft:   Radius.circular(150),
        bottomRight:  Radius.circular(0), ),
        boxShadow: [
        BoxShadow(
        offset:  Offset(2.5,2.5),
        color: isDark
        ?AppColors.ColorConShadowB
        :AppColors.ColorConShadow,
        blurRadius: 10.0),],
        gradient: LinearGradient(
        begin:    isDark
        ?  Alignment.topLeft  :  Alignment.center ,
        end:  isDark
        ?  Alignment.bottomRight  : Alignment.center,
        colors: isDark
        ? AppColors.ColorConStudentB
        : AppColors.ColorConW,)),
        child: 
        Container(
         margin: EdgeInsets.only(right: 10, left: 10), 
        padding: EdgeInsets.only(right: 15, left: 15),
        alignment: Alignment.center,
        child:      
        Row(children: <Widget>[
        RichText(text: 
        TextSpan( style: TextStyle(
        fontWeight: FontWeight.bold,
        color: isDark 
        ? AppColors.ColorTextB 
        : AppColors.ColorText ,),
        children: <TextSpan>[
        TextSpan(text:  text1, ),
        TextSpan(text:  text2,)]),
     ), ])
    
        ),
        
        ))])
        )
        );
  }
}






