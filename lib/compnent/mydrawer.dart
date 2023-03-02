// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/ButtonDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motatawera/services/color.dart' as AppColors;


import '../services/LANGUAGE/AppLocale.dart';


  class Mydrawer extends StatefulWidget {

 
   @override
   _MydrawerState createState() => _MydrawerState();
 }
 
 class _MydrawerState extends State<Mydrawer> {
   var stuName;
   var stuID;
   bool isSignIn = false;
getPref()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
 

  stuName = preferences.getString("stuName");
  stuID = preferences.getString("stuID");

  if(stuID != null){
 setState(() {
  stuName = preferences.getString("stuName");
  stuID = preferences.getString("stuID");
  isSignIn = true;
  });
  }
   }
     @override
   void initState() {
     getPref();
     super.initState();
     
   }
   @override
   Widget build(BuildContext context) {
    
    bool isDark = Theme.of(context).brightness == Brightness.dark;

     return Drawer(
      child:  Container(
      decoration: BoxDecoration(
        
      gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: isDark? AppColors.ColorDrawerB:AppColors.ColorDrawer,)),  
      child: Stack(children: [
      ListView(  
        physics:  BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics()),
        children: <Widget>[
         
      UserAccountsDrawerHeader(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: isDark
      ?AppColors.ColorDrawerHeaderB
      :AppColors.ColorDrawerHeader,
      )  ,
      
      accountName: isSignIn ? Text(stuName  , style: TextStyle(fontWeight: FontWeight.bold ),) : Text(""), 
      accountEmail:isSignIn ? Text(stuID , style: TextStyle(fontWeight: FontWeight.bold ),) : Text(""),
      currentAccountPicture:  
       

      Material(
       color: Colors.transparent,
       child: 
      InkWell(
       child: 
       Container( 
       alignment: Alignment.center,       
       margin:  EdgeInsets.only(bottom: 5),
       child:
       new DrawerHeader( child: new  CircleAvatar( radius: 100,   child: 
       Icon(Icons.person , color: isDark 
       ? AppColors.ColorIconPersonDrawerB
       : AppColors.ColorIconPersonDrawer ),

       backgroundColor: isDark 
       ? AppColors.ColorBGDrawerHeaderB
       : AppColors.ColorBGDrawerHeader,
       ),)),
        onTap: (){
        Navigator.of(context).pushNamed('student');
    
        },
       ),),
               
 ), 



    isDark?  

    ButD(
      child1:  Text("${getLang(context, "TitleHomePage")}",
        style: TextStyle(
        color:  isDark 
        ? AppColors.ColorTextBarB 
        : AppColors.ColorTextBar , 
        fontWeight: FontWeight.bold ),),
        child2:
        Icon(Icons.home_outlined, 
        color: isDark 
        ? AppColors.ColorTextBarB 
        : AppColors.ColorTextBar ,  ),
        onTap: () {
          Navigator.of(context).pushNamed('HomePage');
      },
    )

        :

    ButW( 
    title:  Text("${getLang(context, "TitleHomePage")}",
    style: TextStyle(color: isDark
      ? AppColors.ColorTextB
      : AppColors.ColorText ,
      fontWeight: FontWeight.bold ),),
    leading: Icon(Icons.home_outlined,color: isDark
      ? AppColors.ColorTextB
      : AppColors.ColorText ,  ),
    onTap: () {
      Navigator.of(context).pushNamed('HomePage');
      },
    ),


        



    isDark?

    ButD(
      child1: Text("${getLang(context, "Title5dmatTaleb")}",
      style: TextStyle(color:  isDark 
          ? AppColors.ColorTextBarB 
          : AppColors.ColorTextBar , 
          fontWeight: FontWeight.bold ),),
      child2:  Icon(Icons.school_outlined, 
      color:  isDark 
          ? AppColors.ColorTextBarB 
          : AppColors.ColorTextBar ,   ),
      onTap: (){
        Navigator.of(context).pushNamed('Categories');
      },
    )

    :

    ButW(
    title:  Text("${getLang(context, "Title5dmatTaleb")}",
      style: TextStyle(color: isDark
          ? AppColors.ColorTextB
          : AppColors.ColorText ,
            fontWeight: FontWeight.bold ),),
    leading:  Icon(Icons.school_outlined,
    color: isDark?
            AppColors.ColorTextB
          : AppColors.ColorText ,),
      onTap: (){
        Navigator.of(context).pushNamed('Categories');
      },
    ),





    isDark?

    ButD(
      child1:    Text( "${getLang(context, "TitleRoknTalabat")}",
      style: TextStyle(color: isDark 
          ? AppColors.ColorTextBarB 
          : AppColors.ColorTextBar ,
          fontWeight: FontWeight.bold ),),
      child2: Icon(Icons.mark_unread_chat_alt_outlined, 
      color: isDark 
          ? AppColors.ColorTextBarB 
          : AppColors.ColorTextBar ,   ),
      onTap: (){
        Navigator.of(context).pushNamed('Talabat');
      }
    )

    :

    ButW(
    title:   Text( "${getLang(context, "TitleRoknTalabat")}",
      style: TextStyle(color:  isDark 
          ? AppColors.ColorTextB
          : AppColors.ColorText ,
            fontWeight: FontWeight.bold ),),
      leading: Icon(Icons.mark_unread_chat_alt_outlined ,
      color: isDark 
          ? AppColors.ColorTextB
          : AppColors.ColorText ,  ),
      onTap: (){
        Navigator.of(context).pushNamed('Talabat');
      }
    ),






    isDark?


    ButD(
      child1:    Text("${getLang(context, "TiTleCallUs")}",
      style: TextStyle(color: isDark 
          ? AppColors.ColorTextBarB 
          : AppColors.ColorTextBar ,
            fontWeight: FontWeight.bold ),),
      child2: Icon(Icons.phone_enabled_outlined,
      color: isDark 
          ? AppColors.ColorTextBarB 
          : AppColors.ColorTextBar ,  ),
      onTap: (){
        Navigator.of(context).pushNamed('Callus');
      }
    )

    :

    ButW(
    title:   Text("${getLang(context, "TiTleCallUs")}",
      style: TextStyle(color: isDark 
          ? AppColors.ColorTextB
          : AppColors.ColorText ,
            fontWeight: FontWeight.bold ),),
      leading: Icon(Icons.phone_enabled_outlined ,
      color: isDark 
          ? AppColors.ColorTextB
          : AppColors.ColorText ,   ),
      onTap: (){
        Navigator.of(context).pushNamed('Callus');
      }
    ),






    isDark?


    ButD(
      child1:    Text( "${getLang(context, "TitleEl4kawa")}",
      style: TextStyle(color: isDark 
          ? AppColors.ColorTextBarB 
          : AppColors.ColorTextBar ,
          fontWeight: FontWeight.bold ),),
      child2: Icon(Icons.mail_outline_outlined, 
      color: isDark 
          ? AppColors.ColorTextBarB 
          : AppColors.ColorTextBar ,  ),
      onTap: (){
        Navigator.of(context).pushNamed("Complaints_And_Suggestions");
      }
    )

    :

    ButW(
    title:   Text( "${getLang(context, "TitleEl4kawa")}",
      style: TextStyle(color: isDark 
          ? AppColors.ColorTextB
          : AppColors.ColorText ,
            fontWeight: FontWeight.bold ),),
      leading: Icon(Icons.mail_outline_outlined,
      color: isDark 
          ? AppColors.ColorTextB
          : AppColors.ColorText ,  ),
      onTap: (){
        Navigator.of(context).pushNamed("Complaints_And_Suggestions");
      }
    ),






    isDark?


    ButD(
      child1:    Text("${getLang(context, "TitleAboutApp")}",
      style: TextStyle(color:  isDark 
          ? AppColors.ColorTextBarB 
          : AppColors.ColorTextBar ,
            fontWeight: FontWeight.bold ),),
      child2: Icon(Icons.info_outline, 
      color:  isDark 
          ? AppColors.ColorTextBarB 
          : AppColors.ColorTextBar ,   ),
      onTap: (){
        Navigator.of(context).pushNamed('About');
      }
    )

    :

    ButW(
    title:   Text("${getLang(context, "TitleAboutApp")}",
      style: TextStyle(color: isDark 
          ? AppColors.ColorTextB
          : AppColors.ColorText ,
            fontWeight: FontWeight.bold ),),
      leading: Icon(Icons.info_outline,color:  isDark 
          ? AppColors.ColorTextB
          : AppColors.ColorText ,   ),
      onTap: (){
        Navigator.of(context).pushNamed('About');
      }
    ),







    isDark?
    ButD(
      child1: Text("${getLang(context, "TitleLogOut")}",
      style: TextStyle(color: isDark 
          ? AppColors.ColorTextBarB 
          : AppColors.ColorTextBar ,
            fontWeight: FontWeight.bold ),),   
      child2: Icon(Icons.login_outlined, 
      color:  isDark 
          ? AppColors.ColorLogOutIconB
          : AppColors.ColorLogOutIcon ,   ),
      onTap: ()async{
        //Navigator.of(context).pushNamed('LogIn');
              SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.clear();
        Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
      }
    )

    :

    ButW(
      title: Text("${getLang(context, "TitleLogOut")}",
      style: TextStyle(color:  isDark 
          ? AppColors.ColorTextB
          : AppColors.ColorText , 
            fontWeight: FontWeight.bold ),),   
      leading: Icon(Icons.login_outlined, 
      color:  isDark 
          ? AppColors.ColorLogOutIconB
          : AppColors.ColorLogOutIcon ,  ),
      onTap: ()async{
              SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.clear();
        Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
      }
    ),



     ]
    )
      ],)

   )
  );
 }
}
   



