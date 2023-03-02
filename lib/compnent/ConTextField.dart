// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:motatawera/services/color.dart' as AppColors;

class ConTextField extends StatelessWidget {

var  controller =  TextEditingController();
var  hintText   = "";

ConTextField({

this.controller,
this.hintText,


});



  @override
  Widget build(BuildContext context) {

  bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      child: TextFormField(
               controller: controller ,
               decoration: InputDecoration( 
               contentPadding: EdgeInsets.all(5),
               hintText: hintText,
               filled: true,
               enabledBorder: OutlineInputBorder(borderSide: BorderSide(
               color:  isDark 
               ? AppColors.ColorTextFieldInputB 
               : AppColors.ColorTextFieldInput , style: BorderStyle.solid , width: 1)) ,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(
               color: isDark 
               ? AppColors.ColorTextFieldBorderB 
               : AppColors.ColorTextFieldBorder , style: BorderStyle.solid , width: 1)) ,
              ),
          ),
    );
  }
}



class ConGlassTxtField extends StatelessWidget {
 var  controller =  TextEditingController();
 var  hintText   = "";
 var  myValid;

ConGlassTxtField({

this.controller,
this.hintText,
this.myValid


});

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return 
    ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter( 
        filter: ImageFilter.blur(
          sigmaY: 20,
          sigmaX: 20,
        ),
        child: Container(
          height: size.width / 5,
          width: size.width / 2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
             boxShadow:[
         BoxShadow(
         color: isDark 
         ? AppColors.ColorResponsiveButtonShadowB 
         : AppColors.ColorResponsiveButtonShadow  ,
         blurRadius: 30.0),],
            color:isDark
            ? AppColors.ColorTxtFieldBoxDecB
            :AppColors.ColorTxtFieldBoxDecB,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
           maxLines: null,
           validator: myValid,
            
            style: TextStyle(color:isDark
            ? AppColors.ColorTxtFieldinputLogB
            :AppColors.ColorTxtFieldinputLog),
            cursorColor: isDark
            ? AppColors.ColorTxtFieldinputLogB
            :AppColors.ColorTxtFieldinputLog,
            controller: controller ,
   

            decoration: InputDecoration(
              
              isDense: true,
              contentPadding: EdgeInsets.all(10),
              
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              
              hintStyle:
                  TextStyle( color:isDark
            ? AppColors.ColorTxtFieldinputLogB
            :AppColors.ColorTxtFieldinputLog),
            ),
          ),
        ),
      ),
    );

  }
  }