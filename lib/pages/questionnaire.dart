import 'dart:io';

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/LANGUAGE/AppLocale.dart';


class Questionnaire extends StatefulWidget {

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  @override


   void initState() {
     super.initState();
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }

     @override
  Widget build(BuildContext context) {
    return  Bar(
              title: "${getLang(context, "TitleElestbyan")}",
              child: WebView( 
              initialUrl: 'http://motatawera.com/SurveyLogin.aspx',
              javascriptMode:  JavascriptMode.unrestricted,)
            );

  }
}

