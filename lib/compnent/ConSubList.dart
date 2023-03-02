// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:motatawera/services/color.dart' as AppColors;
import 'package:motatawera/services/font.dart' as AppFont;




class ConSubList extends StatelessWidget {
  final Function() ontap;
  var leading = Icon(
    Icons.menu_book_rounded,
    color: Colors.white,
    size: 30,
  );
  var colors = [Colors.red, Colors.black, Colors.amber];
  final Color shadowColor;
  var textSubName1 = '';
  var textSubName2 = '';
  var textDoc1 = '';
  var textDoc2 = '';
  ConSubList({
    this.ontap,
    this.leading,
    this.colors,
    this.shadowColor = Colors.black,
    this.textSubName1,
    this.textSubName2,
    this.textDoc1,
    this.textDoc2,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Container(
          margin: EdgeInsets.all(30),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: isDark
                            ? AppColors.ColorConShadowAttB
                            : AppColors.ColorConShadowAtt,
                        blurRadius: 10.0),
                  ]),
              child: Stack(children: <Widget>[
                InkWell(
                  onTap: ontap,
                  child: AnimatedContainer(
                    duration: Duration(microseconds: 500),
                    curve: Curves.bounceIn,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                     begin:   isDark
                          ?  Alignment.topLeft  :  Alignment.center ,
                          end:  isDark
                          ?  Alignment.bottomRight  : Alignment.center,
                          colors: isDark
                              ? AppColors.ColorConB
                              : AppColors.ColorConW,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                        topRight: Radius.circular(200),
                        bottomLeft: Radius.circular(200),
                        bottomRight: Radius.circular(200),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: ListTile(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(
                                style: TextStyle(
                                    fontSize: AppFont.FSConSubList,
                                    fontWeight: FontWeight.bold,
                                    color: isDark 
                                    ? AppColors.ColorTextB 
                                    : AppColors.ColorText,
                                    fontFamily: 'Cairo'),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: (textSubName1),
                                  ),
                                  TextSpan(
                                    text: (textSubName2),
                                  ),
                                ],
                              ))
                            ]),
                        leading: leading,
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(textDoc1,
                                style: TextStyle(
                                    color: isDark 
                                    ? AppColors.ColorTextB
                                    : AppColors.ColorText,
                                    fontSize: AppFont.FSConSubList,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              textDoc2,
                              style: TextStyle(
                                  color: isDark 
                                  ? AppColors.ColorTextB 
                                  : AppColors.ColorText,
                                 fontSize: AppFont.FSConSubList,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class ConSubjectList extends StatelessWidget {
  final Function() ontap;
  var leading = Icon(
    Icons.menu_book_rounded,
    color: Colors.white,
    size: 30,
  );
  var colors = [Colors.red, Colors.black, Colors.amber];
  final Color shadowColor;
  var textSubName1 = '';
  var textSubName2 = '';
  var textDoc1 = '';
  var textDoc2 = '';
  ConSubjectList({
    this.ontap,
    this.leading,
    this.colors,
    this.shadowColor = Colors.black,
    this.textSubName1,
    this.textSubName2,
    this.textDoc1,
    this.textDoc2,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return 
    
    Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(top: 8),
          child: Container(
            margin: EdgeInsets.all(30),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: isDark
                              ? AppColors.ColorConShadowB
                              : AppColors.ColorConShadow,
                          blurRadius: 10.0),
                    ]),
                child: Stack(children: <Widget>[
                  InkWell(
                    onTap: ontap,
                    child: AnimatedContainer(
                      duration: Duration(microseconds: 500),
                      curve: Curves.bounceIn,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                         begin:   isDark
                          ?  Alignment.topLeft  :  Alignment.center ,
                          end:  isDark
                          ?  Alignment.bottomRight  : Alignment.center,
                          colors: isDark
                              ? AppColors.ColorConB
                              : AppColors.ColorConW,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft:     isDark ?   Radius.circular(200)  : Radius.circular(50) ,
                          topRight:    isDark ?   Radius.circular(200)  : Radius.circular(50) ,
                          bottomLeft:  isDark ?   Radius.circular(200)  : Radius.circular(50) ,
                          bottomRight: isDark ?   Radius.circular(200)  : Radius.circular(50) , 
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: ListTile(
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                    text: TextSpan(
                                  style: TextStyle(
                                      fontSize: AppFont.FSConSubList,
                                      fontWeight: FontWeight.bold,
                                      color: isDark 
                                      ? AppColors.ColorTextB 
                                      : AppColors.ColorText,
                                      fontFamily: 'Cairo'),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: (textSubName1),
                                    ),
                                    TextSpan(
                                      text: (textSubName2),
                                    ),
                                  ],
                                ))
                              ]),
                          leading: leading,
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(textDoc1,
                                  style: TextStyle(
                                      color: isDark 
                                    ? AppColors.ColorTextB 
                                    : AppColors.ColorText , 
                                      fontSize: AppFont.FSConSubList,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                textDoc2 ,
                                style: TextStyle(
                                    color: isDark 
                                    ? AppColors.ColorTextB
                                    : AppColors.ColorText ,
                                    fontSize: AppFont.FSConSubList,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
