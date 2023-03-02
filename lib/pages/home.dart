// ignore_for_file: unused_element, unused_local_variable, missing_return
import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/compnent/ConHome.dart';
import 'package:motatawera/compnent/carousel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../compnent/mydrawer.dart';
import 'package:motatawera/services/image.dart' as AppImage;
import 'package:motatawera/services/color.dart' as AppColor;

import '../main.dart';
import '../services/LANGUAGE/AppLocale.dart';





class Home extends StatefulWidget {
  State<StatefulWidget> createState()  {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var depID;
  var depName;
  


 @override
  void initState() {
    getPref();
    super.initState();


    var initializationSettingsAndroid =
        new AndroidInitializationSettings('ic_launcher');
    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                icon: "@mipmap/ic_launcher",
              ),
            ));
      }
    });
 
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
    

      bool isDark = Theme.of(context).brightness == Brightness.dark;
            AwesomeDialog(context: context,  
            autoHide: Duration(seconds: 5),
            dialogType: DialogType.WARNING,

            dialogBackgroundColor:   isDark 
                ? AppColor.ColorAwseomeDialogBGB 
                : AppColor.ColorAwseomeDialogBG ,
            title: "",
            dismissOnTouchOutside: true,
            body: 
            Center(child: Column(
              children: [
                 Text( notification.title,
                style: TextStyle(
                color: isDark 
                    ? AppColor.ColorAwseomeDialogTxtB 
                    : AppColor.ColorAwseomeDialogTxt ,
                fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
                Text( notification.body,
                style: TextStyle(
                color: isDark 
                    ? AppColor.ColorAwseomeDialogTxtB 
                    : AppColor.ColorAwseomeDialogTxt ,
                fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
              ],
            ))).show();

      }
    });

  }



  
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    depID = preferences.getString("depID");
    depName = preferences.getString("depName");

    if (depName != null) {
      setState(() {
        depName = preferences.getString("depName");
        depID = preferences.getString("depID");
        print(depName);
      });
    }

 
  }
 
 
// var data = Navigator.restorablePushReplacementNamed(context, 'HomePage') ;

Future refresh() async{
   setState(() {
      Navigator.restorablePushReplacementNamed(context, 'HomePage') ; 
  });
  // return data;


}



// List data = NumberG





  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Bar(
      drawer: Mydrawer(),
      title: "${getLang(context, "TitleMotatawera")}",
      acction: <Widget>[
        IconButton(
            icon: Icon(Icons.qr_code_scanner_outlined),
            color: Colors.white,
           
            onPressed: () {
              Navigator.of(context).pushNamed('QRscanner');
            })
      ],
      child: RefreshIndicator(
        onRefresh: 
             refresh,
         
        
       
       
       
        // () async {
        //  await Future.delayed( Duration(seconds: 2 ));
        //    updateData(); 
        // } ,
        
        
        
        child: ListView(

           physics:  BouncingScrollPhysics(
           parent: AlwaysScrollableScrollPhysics()),


          children: [
            ConColor("${getLang(context, "Title5dmatTaleb")}"),
            Divider(thickness: 2,
             color: isDark
             ? AppColor.ColorDividerB 
             : AppColor.ColorDivider ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              height: screenHeigh/6.6,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ConH(
                    image: Image.asset(
                       isDark
                  ?AppImage.imageAttB
                  :AppImage.imageAttW,
                      width: 40,
                    ),
                    text: "${getLang(context, "TitleEl7dor")}",
                    onTap: () {
                      Navigator.of(context).pushNamed('Attendance');
                    },
                  ),
                  ConH(
                    image: Image.asset(
                        isDark
                  ?AppImage.imageSesB
                  :AppImage.imageSesW,
                      width: 40,
                    ),
                    text: "${getLang(context, "TitleElmo7adrat")}",
                    onTap: () {
                      Navigator.of(context).pushNamed('Subjects');
                    },
                  ),
                  depName != "0"
                      ? ConH(
                          image: Image.asset(
                             isDark
                  ?AppImage.imageLapB
                  :AppImage.imageLapW ,
                            width: 40,
                          ),
                          text: "${getLang(context, "TitleElm3amel")}",
                          onTap: () {
                            Navigator.of(context).pushNamed('PraSession');
                          },
                        )
                      : Text(""),
                  ConH(
                    image: Image.asset(
                    isDark
                  ?AppImage.imageSecB
                  :AppImage.imageSecW ,
                      width: 40,
                    ),
                    text: "${getLang(context, "TitleElsection")}",
                    onTap: () {
                      Navigator.of(context).pushNamed('SecSession');
                    },
                  ),
                  ConH(
                    image: Image.asset(
                        isDark
                  ?AppImage.imageQuestB
                  :AppImage.imageQuestW ,
                       width: 40,
                    ),
                    text:"${getLang(context, "TitleElestbyan")}",
                    onTap: () {
                       Navigator.of(context).pushNamed('Questionnaire');
                    },
                  ),
                  ConH(
                    image: Image.asset(
                       isDark
                  ?AppImage.imageResultB
                  :AppImage.imageResultW ,
                      width: 40,
                    ),
                    text: "${getLang(context, "TitleElnatega")}",
                    onTap: () {
                      
                     Navigator.of(context).pushNamed('ExamResult');
                    },
                  ),
                ],
              ),
            ),
            Divider(thickness: 2,
             color:  isDark
            ? AppColor.ColorDividerB 
            : AppColor.ColorDivider ),
      
            ConColor("${getLang(context, "TitleGadwalElyom")}"),
      
            Column(
              
              children: [
                
                CarSes(),
                Carsec(),
                depName != "0" ? CarPra() : Text(""),
              ],
            ),
          ],
        ),
      ),
    );


    
  }

  

//   void updateData() { updateData() {
//   new Timer.periodic(
//   Duration(seconds: 1),
//   (Timer  timer ){
//   int i =  data.length+1 ;
//   data.add ( "flutter $i " );
//   timer.cancel();
  
//   });
//   setState(() {
// Home();
//   });
 

// }

  }
  