//ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:motatawera/services/color.dart' as AppColors;
import 'package:motatawera/services/font.dart' as AppFont;







class ConTalabat extends StatelessWidget {
  
  var text1='';
  var text2='';
  ConTalabat({


  this.text1,
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
     // padding: EdgeInsets.only(left: 5 ),
      child: 
      Text(text1,style: TextStyle( 
      fontSize:AppFont.FSConTalabat, 
      color:  isDark 
      ? AppColors.ColorTextB 
      : AppColors.ColorText ,
         fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,)),
         Container(
          padding: EdgeInsets.symmetric(vertical: 20),
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











class ConTalabatR extends StatelessWidget {

final Widget child;
final Function() onTap;
var image = Image.asset("",fit: BoxFit.cover,);
var text='';
ConTalabatR({

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
         topLeft:     Radius.circular(100),
         topRight:    Radius.circular(0),
         bottomLeft:  Radius.circular(100),
         bottomRight: Radius.circular(150), ),
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
    mainAxisAlignment: MainAxisAlignment.center,  
     children: <Widget> [
     
     Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: 
     Text(text,style: TextStyle( 
      fontSize:AppFont.FSConTalabat, 
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


