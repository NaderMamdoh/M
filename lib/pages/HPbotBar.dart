
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:motatawera/pages/InBox.dart';
import 'package:motatawera/pages/home.dart';
import 'package:motatawera/pages/services.dart';
import 'package:motatawera/services/color.dart' as AppColors;







 class HomePage extends StatefulWidget {
  
 
   @override
   State<HomePage> createState() => _HomePageState();
 }
 
 class _HomePageState extends State<HomePage> {
   
   int index = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();




  @override
  Widget build(BuildContext context) {
   
 bool isDark = Theme.of(context).brightness == Brightness.dark;

 final screen = [
    
     Categories(),
 

     Home(),
    


    MailBox(),
   
   ]; 
  final  items = <Widget>[
         
         Icon(Icons.school_outlined, size: 30, color:  isDark
                  ? AppColors.ColorBottomNavBar
                  : AppColors.ColorBottomNavBarB,),

            Icon(Icons.home_outlined ,  size: 30,color:  isDark
                  ? AppColors.ColorBottomNavBar
                  : AppColors.ColorBottomNavBarB,),
          
                     Icon(Icons.inbox_outlined, size: 30,color:  isDark
                  ? AppColors.ColorBottomNavBar
                  : AppColors.ColorBottomNavBarB, ),
          ];

    return 
    SafeArea(
      top: false,
      child: 
    Scaffold(
      extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
       //  animationDuration: Duration(microseconds: 300),
        backgroundColor: Colors.transparent,
         color:  isDark
                  ? AppColors.ColorBottomNavBarB
                  : AppColors.ColorBottomNavBar,
                  
          index: index,
          key: _bottomNavigationKey,
          items: items,
          onTap: (index) {
          setState(() {
          this.index = index;
          });
         },
        ),
        body: screen[index],
       )   
     );
  }
  }