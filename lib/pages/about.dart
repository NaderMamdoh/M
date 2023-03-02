import 'package:flutter/material.dart';
import 'package:motatawera/services/image.dart' as AppImage;
import 'package:motatawera/services/color.dart' as AppColor;

import '../services/LANGUAGE/AppLocale.dart';



class About extends StatefulWidget {
 
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  Widget build(BuildContext context) {
   
   bool isDark = Theme.of(context).brightness == Brightness.dark;

   return Scaffold(
    backgroundColor:  isDark
    ? AppColor.ColorAboutAppB 
    : AppColor.ColorAboutApp,
    appBar:  AppBar(  title:  Text( "${getLang(context, "TitleAboutApp")}",
    style: TextStyle( fontWeight: FontWeight.bold ,
    color:isDark
    ? AppColor.ColorTextBarB
    : AppColor.ColorTextBar,),),
    centerTitle: true,
    toolbarHeight: 60,
    backgroundColor:  isDark
    ? AppColor.ColorAboutAppB 
    : AppColor.ColorAboutApp, ),
   // drawer: Mydrawer(),
    body: Container(  
      
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage(isDark
                ?AppImage.imageNMB
                :AppImage.imageNMW,),
          fit: BoxFit.cover )
          ),
        

          
   )   ) ;
    
  }
}