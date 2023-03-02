import 'dart:io';

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/LANGUAGE/AppLocale.dart';

class Tables extends StatefulWidget {

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
 
   void initState() {
     super.initState();
     // Enable virtual display.
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }

     @override
  Widget build(BuildContext context) {
    return Bar(
            title: "${getLang(context, "TitleElgdawel")}",
            child: WebView( 
            initialUrl: 'https://www.advancedacademy.edu.eg/Katamia/Serves_Stud/Lec_Schedule.aspx',
           javascriptMode:  JavascriptMode.unrestricted,)
          );
  }
}

