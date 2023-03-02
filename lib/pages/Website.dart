import 'dart:io';

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/LANGUAGE/AppLocale.dart';


class Website extends StatefulWidget {

  @override
  State<Website> createState() => _WebsiteState();
}

class _WebsiteState extends State<Website> {
  @override


   void initState() {
     super.initState();
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }

     @override
  Widget build(BuildContext context) {
    return  Bar(
              title: "${getLang(context, "TitleMwk3Elm3hd")}",
              child: WebView( 
              initialUrl: 'https://www.advancedacademy.edu.eg/Katamia/RootPages/Default.aspx',
              javascriptMode:  JavascriptMode.unrestricted,)
           );
  }
}

