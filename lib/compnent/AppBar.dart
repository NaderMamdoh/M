// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/Painter.dart';
import 'package:motatawera/compnent/mydrawer.dart';
import 'package:motatawera/services/color.dart' as AppColors;
import 'package:motatawera/services/font.dart' as AppFont;

import '../pages/HPbotBar.dart';


 

class Bar extends StatelessWidget {
      final Function() onPressed;
      var drawer = Mydrawer();
      var  bottomNavigationBar = HomePage();
      var title = "";
      var fontSize = 30.0;
      var acction = [];
      //<Widget>[ IconButton(icon: Icon(Icons.qr_code_scanner_outlined),onPressed: () {},)];
      final Widget child;
     Bar({
      this.drawer,
      this.title,
      this.fontSize,
      this.acction,
      this.onPressed,
      this.child
      });

  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return  Scaffold(
              drawer: drawer,
 
              backgroundColor: isDark
              ? AppColors.ColorAppBarBackGraoundB
              : AppColors.ColorAppBarBackGraound,
              appBar: AppBar(
             
              title: 
              Text(title,
              style: TextStyle(
              fontSize: AppFont.FSBar,
              fontWeight: FontWeight.bold,
              color: isDark
              ? AppColors.ColorTextBarB
              : AppColors.ColorTextBar,),),

              centerTitle: true,
              
              toolbarHeight: screenHeigh / 13,
             
              actions: acction,
              
              backgroundColor: Colors.transparent,
             
              elevation: 0,
             
              shape: 
              RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),

              flexibleSpace: 
              Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDark
              ? AppColors.ColorAppBarB
              : AppColors.ColorAppBar,))),
             
              ),

              body:Stack(children: [  
               Container(
              decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDark
              ? AppColors.ColorBackGroundB
              : AppColors.ColorBackGround,
              )),
              child: child,),
         
         
            //  CustomPaint(
            //   painter: isDark? Painter2 ():  Painter1(),
            //   child: Container(
            //   height: 0),), 
              
              
              ])  
              );



  }
}
