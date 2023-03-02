
// ignore_for_file: require_trailing_commas, unused_local_variable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../LANGUAGE/AppLocale.dart';
import 'notification_details.dart';

class MessageList extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _MessageList();
}

class _MessageList extends State<MessageList> {
  List<RemoteMessage> _messages = [];


 savePref(
    var   ne,
    var   notiBody,
 )async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
   
   
    preferences.setString("ne", ne);
    preferences.setString("notiBody", notiBody);

 }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {

      if (message.notification != null) {
         var ne= message.notification.title ; 
      }


        _messages = [..._messages, message];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_messages.isEmpty) {
      return  Text("${getLang(context, "TitleNoMessagesRecived")}");
    }

    return
    Directionality(textDirection: TextDirection.ltr , child:
    ListView.builder(
        shrinkWrap: true,
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          RemoteMessage message = _messages[index];
          return ListTile(
            title: Text(message.notification?.title ?? 'N/D',style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle:
            Text(message.sentTime?.toString() ?? DateTime.now().toString()),
            trailing:  Icon(Icons.notifications_active,color: Color.fromARGB(255, 128, 21, 13),),
            onTap: () { Navigator.pushNamed(context, 'message',
                arguments: MessageArguments(message, false));
            print("nnnnnnnnnnnnnnnnnnnnnn    "+message.notification.body  );
          });
        })
        );
  }
}







