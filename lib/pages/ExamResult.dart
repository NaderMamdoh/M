import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/compnent/ConExamResult.dart';

import '../services/LANGUAGE/AppLocale.dart';


class ExamResult extends StatefulWidget {

  @override
  State<ExamResult> createState() => _ExamResultState();
}

class _ExamResultState extends State<ExamResult> {

   var stuID;
   var stuName;
   var squadName;


getPref()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  
   stuName    = preferences.getString("stuName");
   squadName  = preferences.getString("squadName");

  if(stuName != null){
 setState(() {
  
  stuName    = preferences.getString("stuName");
  squadName  = preferences.getString("squadName");


  });
  
   }
}

 @override
   void initState() {
     getPref();
     super.initState(
     );


   }
  @override
  Widget build(BuildContext context) {
    
    return 
     Bar(
      title: "${getLang(context, "TitleElnatega")}",
      child:
      ListView(
       physics:  BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics()),
        children: [
          Column(
            children: [
    
              ConStudentResult(
                textName:  stuName ,
                textSquad: squadName,
              ),
          
          ConExamResult(
            text1: "نظم معلومات محاسبية ",
            text2: "م",
          ) 
           ],
          ),
        ],)
        ); 
  }
}