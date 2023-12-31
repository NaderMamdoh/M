
// ignore_for_file: require_trailing_commas

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/services/image.dart' as AppImage;


/// Message route arguments.
class MessageArguments {
  /// The RemoteMessage
  final RemoteMessage message;

  /// Whether this message caused the application to open.
  final bool openedApplication;

  // ignore: public_member_api_docs
  MessageArguments(this.message, this.openedApplication);
}

/// Displays information about a [RemoteMessage].


class MessageView extends StatefulWidget {

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {


  @override
  Widget build(BuildContext context) {
    final MessageArguments args =
    ModalRoute.of(context).settings.arguments as MessageArguments;
    RemoteMessage message = args.message;
    RemoteNotification notification = message.notification;

    return

    Directionality(textDirection: TextDirection.rtl, child: 
      Bar(
        title: (message.notification.title.toString() ),
      
      child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                if (notification != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        img(
                          notification.android.imageUrl,
                        ),
                        // const Text(
                        //   'Notification Inf:',
                        //   style: TextStyle(fontSize: 18),
                        // ),
                        // viewData(
                        //   notification.title,
                        // ),
                        viewData(
                          notification.body,
                        ),
                        viewData( message.sentTime?.toString()),
                      ],
                    ),
                  )
                ],
              ],
            ),
          )),
      )
    );
  }

  /// A single data row.
  Widget viewData( String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              ' ',style: const TextStyle(fontWeight: FontWeight.bold)),

          Expanded(
            child: Text(value ?? 'N/A',),
          ),
        ],
      ),
    );
  }

  Widget img(String value) {
   
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Image.asset(
            value ?? isDark
                ?AppImage.imageNMB
                :AppImage.imageNMW,
            height: 200,
            width: 200,
            fit: BoxFit.contain,
          ),
        ),
    );
  }

  Widget appbar(String value) {
    return Text(value ?? 'N/A',);
  }

}





















/*
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MessageArguments {
  final RemoteMessage message;
  final bool openedApplication;
  MessageArguments(
    this.message,
    this.openedApplication
  );
}

class MessageView extends StatelessWidget {



  @override
  
  Widget build(BuildContext context) {
   final MessageArguments args = ModalRoute.of(context).settings.arguments as MessageArguments;
   RemoteMessage message = args.message;
   RemoteNotification notification = message.notification;

    return Scaffold(
      appBar: AppBar(
        title: appbar(message.data.toString()),
      ),
      body: SingleChildScrollView(child: Padding(
        padding:EdgeInsets.all(8),
        child: Column(
          children: [
          if (notification != null) ...[

            Padding(
              padding:EdgeInsets.only(top: 16),
              child: Column(
                
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Notification inf:',
          ),
          viewData(
            'Title',notification.title
          ),
          viewData(
            'Body',notification.body
          ),
          viewData(
            'Sent Time',message.sentTime.toString()
          ),
          ],
              ),
          
             )
          ]
 


        ]),
        )),
    );
  }
}


Widget viewData(String title, String value){
  return Padding(padding: EdgeInsets.only(left: 8, right: 8, top: 8),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('$title',),
      Expanded(child: Text(value ?? 'N/A'))
    ],
  ),);
}


Widget appbar(String value){
  return Text(value ?? 'N/A');
}*/