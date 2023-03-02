// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/MainContainer.dart';
import 'package:motatawera/services/color.dart' as AppColors;
import 'package:motatawera/services/font.dart'  as Font;

class ConH extends StatelessWidget {
  final Widget subtitle;
  final Widget title;
  final Function() onTap;
  var image = Image.asset("",);
  var text = '';
  ConH({
    this.title,
    this.subtitle,
    this.onTap,
    this.image,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
               margin: EdgeInsets.all(5),
               width: screenWidth/3,
               child: 
                Material(
                color: Colors.transparent,
                child: 
                 InkWell(
                 child:
                  Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child:
                   Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child:
                     Row(
                      children: <Widget>[
                       Expanded(
                        flex: 2,
                        child: 
                         Container(
                          width: screenWidth,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                          topLeft:     isDark ?  Radius.circular(150) : Radius.circular(20) ,
                          topRight:    isDark ?  Radius.circular(0)   : Radius.circular(20) ,
                          bottomLeft:  isDark ?  Radius.circular(100) : Radius.circular(20) ,
                          bottomRight: isDark ?  Radius.circular(150) : Radius.circular(20) ,),
                          boxShadow: [BoxShadow(
                          color: isDark
                          ? AppColors.ColorConShadowB
                          : AppColors.ColorConShadow,
                          blurRadius: 10.0),],
                          gradient:
                                     
                         LinearGradient(
                         begin:   isDark
                               ?  Alignment.topLeft  :  Alignment.center ,
                         end:  isDark
                               ?  Alignment.bottomRight  : Alignment.center,
                         colors:  isDark 
                         ? AppColors.ColorConB
                         : AppColors.ColorConW)),
                         child: 
                          Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                          
                            Container(child: image),
                                
                                    
                                      
                            Text(text,
                                   style: TextStyle(
                                   color: isDark 
                                   ? AppColors.ColorTextB 
                                   : AppColors.ColorText ,
                                   fontSize:  Font.FSConHome,
                                   fontWeight: FontWeight.bold),
                                   textAlign: TextAlign.center,),
                          
                         ])
                         )
                        )
                       ])
                      )
                    ),
               onTap: onTap,
              )
             )
           );
  }
}

class ConColor extends StatelessWidget {
  var txt = "";
  ConColor(this.txt);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return MainContainer(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(20),
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: isDark 
                ? AppColors.ColorLableB 
                : AppColors.ColorLable,
                child: 
                 Text(txt,
                  style: TextStyle(
                  fontSize: Font.FSConColor,
                  fontStyle: FontStyle.normal,
                  color: isDark 
                  ? AppColors.ColorTextB 
                  : AppColors.ColorText ,
                  fontWeight: FontWeight.bold))
            );
  }
}









class ConCarosel extends StatelessWidget {

 var  txt1 = "" ;
 var  margin  = EdgeInsets.only(bottom: 5);
 Widget child ;

 ConCarosel({
 
 this.txt1,
 this.margin,
 this.child
 
 });


  @override
  Widget build(BuildContext context) {
    
    final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
               margin: margin,
               padding: EdgeInsets.all(5),
               child: 
                Column(
                 children: [
                  Container(
                   margin: EdgeInsets.all(2),
                   decoration: BoxDecoration(
                   boxShadow: [ BoxShadow(
                   color: isDark
                   ? AppColors.ColorConShadowB
                   : AppColors.ColorConShadow ,
                   blurRadius: 10.0),],
                   borderRadius: BorderRadius.circular(20),
                   gradient: LinearGradient(
                   begin: Alignment.topRight,
                   end: Alignment.bottomLeft,
                   colors: isDark
                   ? AppColors.ColorCarouselLableB
                   : AppColors.ColorCarouselLable)),
                   child: 

                    Center(
                 child: 
                 Text(txt1,
                  style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color:  isDark
                  ? AppColors.ColorTextB
                  : AppColors.ColorText,
                  fontWeight: FontWeight.bold),)),
               ),

                   Container(
            child: child,
            height:screenHeigh/3,)


        ],
      ),
    );
  }
}










class ConCaroselImage extends StatelessWidget {
 var  txt2 = "" ;
 var  image  =Image.asset("");

 ConCaroselImage({
 
 this.txt2,
 this.image,
 
 });
  @override
  Widget build(BuildContext context) {
     final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return  Center(
             child: 
              Container(
               child: 
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
               
                 Container(
                  height: screenHeigh / 10,
                  child:image,),
                            
                Text(txt2,
                    style: TextStyle(
                    color: isDark
                    ? AppColors.ColorTextB
                    : AppColors.ColorText))
                           
              ])
             )
            );

                     
  }
}