import 'dart:io';

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/LANGUAGE/AppLocale.dart';


class FacebookPage extends StatefulWidget {

  @override
  State<FacebookPage> createState() => _FacebookPageState();
}

class _FacebookPageState extends State<FacebookPage> {
  @override


   void initState() {
     super.initState();
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }

     @override
  Widget build(BuildContext context) {
    return 
    
       Bar(
        
         title: "${getLang(context, "TitleSf7tElm3hd")}",
         child: WebView( 
          initialUrl: 'https://m.facebook.com/101559471798613/',
          javascriptMode:  JavascriptMode.unrestricted,
        )
       );

  }
}

