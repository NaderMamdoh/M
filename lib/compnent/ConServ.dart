// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:motatawera/services/color.dart' as AppColors;
import 'package:motatawera/services/font.dart' as AppFont;


class ConServR extends StatelessWidget {

final Widget child;
final Function() onTap;
var image = Image.asset("");
var text='';
ConServR({

  this.child,
  this.onTap,
  this.image,
  this.text,
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
Container(  width: MediaQuery.of(context).size.width,
               
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
      
         topLeft:     isDark ?  Radius.circular(100) : Radius.circular(20)  ,
         topRight:    isDark ?  Radius.circular(0)   : Radius.circular(20) ,
         bottomLeft:  isDark ?  Radius.circular(100) : Radius.circular(20)  ,
         bottomRight: isDark ?  Radius.circular(150) : Radius.circular(20) , ),
          boxShadow: [
         BoxShadow(
         color: isDark? AppColors.ColorConShadowB:AppColors.ColorConShadow,
         blurRadius: 10.0),],
            gradient: LinearGradient(
        begin:   isDark
               ?  Alignment.topLeft  :  Alignment.center ,
         end:  isDark
               ?  Alignment.bottomRight  : Alignment.center,
          colors: isDark 
        ? AppColors.ColorConB
        : AppColors.ColorConW
        )
      ),

     child:    Column(
    mainAxisAlignment: MainAxisAlignment.center,  
     children: <Widget> [
     Container(
     padding: EdgeInsets.only(top: 5),
     height: 65,
     child: image ),
     
     Container(
      padding: EdgeInsets.only(right: 5 ),
      child: 
     Text(text,style: TextStyle(
       fontSize: AppFont.FSConServ,
        color:  isDark 
        ? AppColors.ColorTextB 
        : AppColors.ColorText ,
         fontWeight: FontWeight.bold),
         textAlign: TextAlign.center,))
    
     
        ])))])
        )),
     onTap: onTap,
     
     )
     ));
    }
}









class ConServL extends StatelessWidget {
  
  final Widget child;
  final Function() onTap;
  var image= Image.asset('');
  var text='';
  ConServL({

  this.child,
  this.onTap,
  this.image,
  this.text,
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
         topLeft:     isDark ?  Radius.circular(0)   : Radius.circular(20) ,
         topRight:    isDark ?  Radius.circular(100) : Radius.circular(20) ,
         bottomLeft:  isDark ?  Radius.circular(150) : Radius.circular(20) ,
         bottomRight: isDark ?  Radius.circular(100) : Radius.circular(20) , ),
          boxShadow: [
         BoxShadow(
         color: isDark
         ? AppColors.ColorConShadowB
         :AppColors.ColorConShadow,
         blurRadius: 10.0),],
            gradient: LinearGradient(
          begin:   isDark
                ?  Alignment.topLeft  :  Alignment.center ,
          end:  isDark
                ?  Alignment.bottomRight  : Alignment.center,
          colors: isDark 
        ? AppColors.ColorConB 
        : AppColors.ColorConW, )),
      
    
     child:    Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: <Widget> [
     Container(
     padding: EdgeInsets.only(top: 5 ),
     height: 65,
     child: image ),
      Container(
      padding: EdgeInsets.only(left: 5 ),
      child: 
      Text(text,style: TextStyle(
         fontSize:AppFont.FSConServ,
       color:isDark 
       ? AppColors.ColorTextB 
       : AppColors.ColorText ,
        fontWeight: FontWeight.bold), 
        textAlign: TextAlign.center,))
    
     
        ])))])
        )),
     onTap: onTap,
     
     )
     ));
    }
}



