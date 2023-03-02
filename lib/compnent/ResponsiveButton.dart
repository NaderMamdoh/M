import 'package:flutter/material.dart';
import 'package:motatawera/services/color.dart' as AppColor;

 
class ResponsiveButton extends StatefulWidget {
 

 
  @override
  _ResponsiveButtonState createState() => _ResponsiveButtonState();
}


class _ResponsiveButtonState extends State<ResponsiveButton>
    with TickerProviderStateMixin {

  bool isTapped = false;
 


  @override
  Widget build(BuildContext context) {
  
   bool isDark = Theme.of(context).brightness == Brightness.dark;

    
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onHighlightChanged: (value) {
            setState(() {
              isTapped = value;
            });
          },
          onTap: (){},
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.fastLinearToSlowEaseIn,
            height: isTapped ? 55 : 60,
            width: isTapped ? 150 : 160,
            decoration: BoxDecoration(
              color: isDark 
                  ? AppColor.ColorResponsiveButtonB 
                  : AppColor.ColorResponsiveButton ,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color:isDark 
                  ? AppColor.ColorResponsiveButtonShadowB 
                  : AppColor.ColorResponsiveButtonShadow ,
                  blurRadius: 30,
                  offset: Offset(3, 7),
                ),
              ],
            ),
            child: Center(
              child: Text(
               "",
                style: TextStyle(
                  color:isDark 
                  ? AppColor.ColorResponsiveButtonTxTB 
                  : AppColor.ColorResponsiveButtonTxTB ,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}





      
