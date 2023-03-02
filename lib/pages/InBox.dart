// ignore_for_file: unused_local_variable, unused_field, missing_return

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../services/LANGUAGE/AppLocale.dart';
import '../services/Notifications/notification_details.dart';
import '../services/Notifications/notification_list.dart';


class MailBox extends StatefulWidget {
  

  @override
  State<MailBox> createState() => _MailBoxState();
}

class _MailBoxState extends State<MailBox> {
  

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;






Future<String> getNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("notificationData");
  }






  @override
  void initState() {
    super.initState();  FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        Navigator.pushNamed(
          context,
          'message',
          arguments: MessageArguments(message, true),
        );
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // channel.description,

              icon: 'launch_background',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      Navigator.pushNamed(
        context,
        'message',
        arguments: MessageArguments(message, true),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
   
      bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Bar(
      title: "${getLang(context, "TitleMailBox")}",
      child:  SingleChildScrollView(
             physics:  BouncingScrollPhysics(
             parent: AlwaysScrollableScrollPhysics()),
        child: Center(
          child: Column(
            children:  [
              Padding(
                padding: EdgeInsets.all(16),
              ),
              MessageList(),
            ],
          ),
        ),
      ),
    );
  }
}