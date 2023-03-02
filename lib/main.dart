// ignore_for_file: must_be_immutable
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:motatawera/motatawera/mot_talabat/talabatData.dart';
import 'package:motatawera/pages/ExamResult.dart';
import 'package:motatawera/pages/FacebookPage.dart';
import 'package:motatawera/pages/HPbotBar.dart';
import 'package:motatawera/pages/LogIn.dart';
import 'package:motatawera/pages/SplashScrren.dart';
import 'package:motatawera/pages/Tables.dart';
import 'package:motatawera/pages/Website.dart';
import 'package:motatawera/pages/callus.dart';
import 'package:motatawera/pages/complaints_And_Suggestions.dart';
import 'package:motatawera/motatawera/mot_pra/praAtt.dart';
import 'package:motatawera/motatawera/mot_pra/praSession.dart';
import 'package:motatawera/motatawera/mot_session/sesAttData.dart';
import 'package:motatawera/motatawera/mot_session/Session.dart';
import 'package:motatawera/motatawera/subjectSession/sessionData.dart';
import 'package:motatawera/pages/about.dart';
import 'package:motatawera/pages/attendance.dart';
import 'package:motatawera/pages/qr_code_scanner.dart';
import 'package:motatawera/pages/questionnaire.dart';
import 'package:motatawera/services/LANGUAGE/AppLocale.dart';
import 'package:motatawera/services/theme/Theme_Manager.dart';
import 'package:motatawera/services/theme/theme_cons.dart';
import './pages/home.dart';
import 'motatawera/mot_pra/praAttData.dart';
import 'motatawera/mot_session/Session.dart';
import 'pages/talabat.dart';
import 'motatawera/mot_section/secAtt.dart';
import 'motatawera/mot_section/secAttData.dart';
import 'motatawera/mot_section/secSession.dart';
import 'motatawera/subjectSession/subject.dart';
import 'pages/studentDetails.dart';
import 'pages/services.dart';
import 'services/Notifications/firebase_config.dart';
import 'services/Notifications/notification_details.dart';




Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
 AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
 FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
      options:  FirebaseOptions(
      apiKey: 'AIzaSyCeE9EtgeXQzSGVK8VFno6Haeo9jAEfp9U',
      appId: '1:235056887436:android:c7310f2ca219e2a94e2da9',
      messagingSenderId: '235056887436',
      projectId: 'motatawera-f2ce1',
    
    ),
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel =  AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      // 'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  runApp( MyApp());

}


ThemeManager _themeManager = ThemeManager();


class MyApp extends StatefulWidget {

 @override
State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }
  
  @override
  void initState() {
   _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {  
      });
    }
  }

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Motatawera",     
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,


        localizationsDelegates: [
         AppLocale.delegate,
         GlobalMaterialLocalizations.delegate,
         GlobalWidgetsLocalizations.delegate,  
        ],
        supportedLocales: [
         Locale("en" , ""),
         Locale("ar" , ""),
        ],
        locale: Locale("ar" , ""),
        localeResolutionCallback: ( currentLang , supportLang ){
          if (currentLang != null) {
             for( Locale locale in supportLang){
                if ( locale.languageCode == currentLang.languageCode ) {
                   return currentLang;
              }
            }
          }
          return supportLang.first ;
        }, 
              
        home: SplashScreen(),     
     
        routes: { 
          'Categories': (context) {
            return Categories();
          },
          'Home': (context) {
            return Home();
          },
          'Attendance': (context) {
            return Attendance();
          },
          'Subjects': (context) {
            return Subjects();
          },
          'PraSession': (context) {
            return PraSession();
          },
          'About': (context) {
            return About();
          },
          'Callus': (context) {
            return Callus();
          },
          'Talabat': (context) {
            return Talabat();
          },
          'TalabatData': (context) {
            return TalabatData();
          },
          'student': (context) {
            return StudentDetails();
          },
          'SessionData': (context) {
            return SessionData();
          },
          'sesAttendance': (context) {
            return Session();
          },
          'SesAttData': (context) {
            return SesAttData();
          },
          'PraAttendance': (context) {
            return PraAttendance();
          },
          'praAttData': (context){
            return PraAttData();
          },    
          'QRscanner': (context){
            return QRscanner();
          },
          'SecSession': (context){
            return SecSession();
          },
          'SecAttendance': (context){
            return SecAttendance();
          },
          'secAttData' : (context){
            return SecAttData();
          },
          'HomePage': (context) {
            return HomePage();
          },
          'Complaints_And_Suggestions': (context) {
            return Complaints_And_Suggestions();
          },
          'Questionnaire': (context) {
            return Questionnaire();
          },
          'ExamResult': (context){
            return ExamResult();
          },
          'FacebookPage': (context){
            return FacebookPage();
          },
          'Website': (context){
            return Website();
          },
          'Tables': (context){
            return Tables();
          },
          'LogIn': (context){
            return LogIn();
          },
          'message': (context){
            return MessageView();
          }
      }
    );
  }
}





