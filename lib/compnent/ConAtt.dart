// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:motatawera/services/color.dart' as AppColors;

// ignore: must_be_immutable
class ConAtt extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  var image = Image.asset(
    "",
    fit: BoxFit.cover,
  );
  var text = '';

  ConAtt({
    @required this.onTap,
    this.child,
    this.image,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return 
    Container(
      width: MediaQuery.of(context).size.width,
      child:
      Material(color: Colors.transparent, 
      child: InkWell(
     
      child: Container(
      width:screenWidth,
      margin: EdgeInsets.only(top: 1),
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      
      child: Card(
      color: Colors.transparent,
      elevation: 50,
      child: Row(
      children: <Widget>[
      Expanded(
      flex: 2,
     
      child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
      topLeft:     isDark ?  Radius.circular(100) : Radius.circular(20) ,
      topRight:    isDark ?  Radius.circular(0)   : Radius.circular(20) ,
      bottomLeft:  isDark ?  Radius.circular(100) : Radius.circular(20) ,
      bottomRight: isDark ?  Radius.circular(100) : Radius.circular(20) , ),
      boxShadow: [ BoxShadow(
      color: isDark
      ? AppColors.ColorConShadowB
      : AppColors.ColorConShadow,
      blurRadius: 10.0),],
      gradient: LinearGradient(
      begin:  isDark
              ?  Alignment.topLeft  :  Alignment.center ,
      end:    isDark
              ?  Alignment.bottomRight  : Alignment.center,
      colors: isDark 
      ? AppColors.ColorConB
      : AppColors.ColorConW)),
                     
      child: Column( 
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
                       
       Container(
        height: screenHeigh / 5,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: image,
        ),
      

       Text( text,
        style: TextStyle(
        color: isDark 
        ? AppColors.ColorTextB 
        : AppColors.ColorText ,
        fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,)
                        
                        ],
                      ),
                    ))
              ]),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
