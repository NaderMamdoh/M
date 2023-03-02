// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:motatawera/services/color.dart' as AppColor;



















   class ButW extends StatelessWidget {
     final Widget child1;
     final Widget child2;
     var title = Text("Home");
     var leading =  Icon(Icons.abc_outlined,);
     final Function() onTap;
     ButW({
       this.onTap,
       this.child1,
       this.child2,
       this.title,
       this.leading
     });
   
     @override
     Widget build(BuildContext context) {
       
      return  Material(  color: Colors.transparent, child:
              Container( child:
              Padding(   padding: const   EdgeInsets.all(15),  child:
              ListTile(
              title:title,
              leading:leading , 
              onTap: onTap ),
              )
              )
              );

     }
   }













   class ButD extends StatelessWidget {
     final Widget child1;
     final Widget child2;
     final Function() onTap;
     ButD({
       this.onTap,
       this.child1,
       this.child2,
     });
   
     @override
     Widget build(BuildContext context) {
      
       bool isDark = Theme.of(context).brightness == Brightness.dark;

       return  
       Material(color: Colors.transparent, child:
       InkWell(child: 
       Container(child:
       Row( children: [
      
       Container( padding: EdgeInsets.all(5), child: child2),  

       Container( padding: EdgeInsets.all(15), child:
      
       Container( 
        height:60 ,
        decoration: BoxDecoration(color: Colors.grey[1000],
        borderRadius: BorderRadius.circular(50),
        boxShadow: [ BoxShadow(
        color: isDark 
        ? AppColor.ColorButtonDrawerShadowB 
        : AppColor.ColorButtonDrawerShadow  ,
        blurRadius: 30.0),]),child:
        
        AnimatedContainer(
        duration:  Duration(microseconds: 10000),
        curve: Curves.bounceIn,
        width: 200, height: 90,
        decoration: BoxDecoration(
        gradient: LinearGradient (
        begin: Alignment.topCenter,
        colors:isDark 
        ? AppColor.ColorButtonDrawerB 
        : AppColor.ColorButtonDrawer ) ,
        borderRadius: BorderRadius.only(  
        topLeft: Radius.circular(200),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(200),
        bottomRight: Radius.circular(400), ) ),  child:
        
        Center( child: child1, )
         
        )
        ),
        ),
        ]),
        ),
        
       onTap: onTap,
       
        ) 
        );
              
      }
     }









