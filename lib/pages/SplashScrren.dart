import 'dart:async';
import 'package:flutter/material.dart';
import 'package:motatawera/pages/HPbotBar.dart';
import 'package:motatawera/pages/LogIn.dart';
import 'package:motatawera/services/image.dart' as AppImage;
import 'package:motatawera/services/color.dart' as AppColor;
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  var loading=0;
  double _fontSize = 2.5;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  AnimationController _controller;
  Animation<double> animation1;
  void navigate () async {
  try{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     var stuID=  preferences.getString("stuID");
     if(stuID != null && stuID !="")
       { 
         setState(() {
           loading=1;
         });
      }
      else
        setState(() {
           loading=2;
         });     
    }catch(ex){
         setState(() {
           loading=2;
         });
    }
  
}
  @override
  void initState() {
    super.initState();
    loading=0;
    navigate();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(Duration(seconds: 3), () {
      setState(() {
        _fontSize = 1.25;
      });
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
      Navigator.pushReplacement(context, PageTransition(loading==1? HomePage():LogIn()));
          });
    });
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:isDark
              ?AppColor.ColorAppBarBackGraoundB
              :AppColor.ColorAppBarBackGraound,
      body: Stack(
        children: [
          Column( 
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Flex(direction: Axis.horizontal),
              Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height / _fontSize,
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: 
               Image.asset( isDark
                ?AppImage.imageNNHMMB
                :AppImage.imageNNHMMW,)
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: _width / _containerSize,
                width: _width / _containerSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(isDark
                ?AppImage.imageNMB
                :AppImage.imageNMW,)
                ),
              ),
            ),
        ],
      ),
    );
  }
}



class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
              
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );


}







      
