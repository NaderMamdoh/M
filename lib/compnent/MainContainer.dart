// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:motatawera/services/color.dart' as AppColor;


class MainContainer extends StatelessWidget {
  final Widget child;
  var padding =  EdgeInsets.all(3);
  var height;
  var margin;
  var width;
  var borderRadius = BorderRadius.circular(20);
  var colors=  [ Colors.red , Colors.black, Colors.amber];
  var begin= Alignment.topCenter;
  var end= Alignment.bottomCenter ;
 
   
   MainContainer({    
  this.colors,
  this.begin,
  this.end ,
  this.child,
  this.padding,
  this.margin,
  this.borderRadius,
  this.height,
  this.width,
  });
  
  @override
  Widget build(BuildContext context) {
  
   bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      
      width: width ,
      margin: margin ,
      height: height ,
      padding: padding,
      decoration: BoxDecoration(
      boxShadow: [
              BoxShadow(
                  color: isDark
                      ? AppColor.ColorShadowB
                      : AppColor.ColorShadow ,
                  blurRadius: 10.0),
            ],
        borderRadius: borderRadius,
      gradient: LinearGradient(
      
      begin:  begin,
      end:    end,
      colors: colors,       
      )),
      child: child,
     
      );
  }
}