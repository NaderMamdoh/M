// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:motatawera/services/color.dart' as AppColors;
import 'package:motatawera/services/font.dart' as AppFont;


class ConMessageContent extends StatelessWidget {
  
  var text1='';
  ConMessageContent({


  this.text1,
  
});

  @override
  Widget build(BuildContext context) {
   bool isDark = Theme.of(context).brightness == Brightness.dark;
   return 
  
  
Container(
  width: MediaQuery.of(context).size.width,
child:
Material(
color: Colors.transparent,
child:
InkWell(child:
Container( width: MediaQuery.of(context).size.width,
               
    padding: EdgeInsets.all(10),
   child:
    Card(color: Colors.transparent,
       elevation: 0,
       child:      
        Row(children: <Widget>[
        Expanded(flex: 2, child: 
        Container(
          width: MediaQuery.of(context).size.width,
           alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(  
         topLeft:     Radius.circular(0),
         topRight:    Radius.circular(100),
         bottomLeft:  Radius.circular(150),
         bottomRight: Radius.circular(100), ),
          boxShadow: [
         BoxShadow(
         color: isDark  
         ?AppColors.ColorCarDTalabatShadowB
          :AppColors.ColorCarDTalabatShadow,
         blurRadius: 10.0),],
            gradient: LinearGradient(
            begin:   isDark
                          ?  Alignment.topLeft  :  Alignment.center ,
                          end:  isDark
                          ?  Alignment.bottomRight  : Alignment.center,
                          colors: isDark
                              ? AppColors.ColorConB
                              : AppColors.ColorConW,  
        )
      ),
      
    
     child:    Column(
     mainAxisAlignment: MainAxisAlignment.start,
     children: <Widget> [

        
        
        
         Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: 
         RichText(
            text: TextSpan(
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: AppFont.FSConTalabat,
            fontFamily: 'cairo',
            color:  isDark 
            ? AppColors.ColorTextB 
            : AppColors.ColorText ,),
            children: <TextSpan>[
            TextSpan(text: text1),
           
             ]
             )
             ),
          )
     
        ])))])
        )),
     
     )
     ));
    }
}









class ConReplyMessage extends StatelessWidget {

  var text2='';
  ConReplyMessage({


  
  this.text2,
});

  @override
  Widget build(BuildContext context) {
   bool isDark = Theme.of(context).brightness == Brightness.dark;
   return 
  
  
Container(
  width: MediaQuery.of(context).size.width,
child:
Material(
color: Colors.transparent,
child:
InkWell(child:
Container( width: MediaQuery.of(context).size.width,
               
    padding: EdgeInsets.all(10),
   child:
    Card(color: Colors.transparent,
       elevation: 0,
       child:      
        Row(children: <Widget>[
        Expanded(flex: 2, child: 
        Container(
          width: MediaQuery.of(context).size.width,
           alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(  
         topLeft:     Radius.circular(100),
         topRight:    Radius.circular(0),
         bottomLeft:  Radius.circular(100),
         bottomRight: Radius.circular(150), ),
          boxShadow: [
         BoxShadow(
         color: isDark  
         ?AppColors.ColorReplyMessageTxtB
          :AppColors.ColorReplyMessageTxt,
         blurRadius: 10.0),],
            gradient: LinearGradient(
            begin:   isDark
                          ?  Alignment.topLeft  :  Alignment.center ,
                          end:  isDark
                          ?  Alignment.bottomRight  : Alignment.center,
                          colors: isDark
                              ? AppColors.ColorConB
                              : AppColors.ColorConW,  
        )
      ),
      
    
     child:    Column(
     mainAxisAlignment: MainAxisAlignment.start,
     children: <Widget> [
   

         Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: 
         RichText(
            text: TextSpan(
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: AppFont.FSConTalabat,
            fontFamily: 'cairo',
            color:  isDark 
            ?AppColors.ColorReplyMessageTxtB
          :AppColors.ColorReplyMessageTxt,),
            children: <TextSpan>[
            TextSpan(text: text2),
           
             ]
             )
             ),
          )
     
        ])))])
        )),
    // onTap: onTap,
     
     )
     ));
    }
}
