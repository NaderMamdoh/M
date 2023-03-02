import 'package:flutter/material.dart';
import 'package:motatawera/compnent/ConMessage.dart';
import 'package:motatawera/services/color.dart' as AppColors;





class ComplaintAndSuggestList extends StatelessWidget {


final content ;
final reply ;


ComplaintAndSuggestList({ 

this.content ,
this.reply ,


});


  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;
    bool isTapped = false;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.all(20),
            alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(  
         topLeft:     Radius.circular(20),
         topRight:    Radius.circular(20),
         bottomLeft:  Radius.circular(20),
         bottomRight: Radius.circular(20), ),
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
      child: Column(children: [
        ConMessageContent(
          text1: content,
        ),
        ConReplyMessage(
          text2: reply,
        )
      ],),
    );
  }
}