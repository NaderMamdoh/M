// ignore_for_file: camel_case_types, missing_return

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/compnent/ConTextField.dart';
import 'package:motatawera/list/Complaint&Suggest/ComplaintAndSuggestList.dart';
import 'package:motatawera/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:motatawera/services/color.dart' as AppColors;


import '../services/LANGUAGE/AppLocale.dart';





class Complaints_And_Suggestions extends StatefulWidget {

  @override
  State<Complaints_And_Suggestions> createState() => _Complaints_And_SuggestionsState();
}

class _Complaints_And_SuggestionsState extends State<Complaints_And_Suggestions> with TickerProviderStateMixin {
 
  var stuID;
   var stuName;
   var content  ;

  String compvalidate(String val) {
    if (val.trim().isEmpty) {
      return  "${getLang(context, "Txtcompvalidate")}" ;
    }
  }

   TextEditingController _content = new TextEditingController();
  
   GlobalKey<FormState>  formStateComp   = new GlobalKey<FormState>();



 
      Future insert() async {
       var formdata = formStateComp.currentState;
       if (formdata.validate()) {
       
      var data = {"stuID": stuID, "stuName": stuName ,  "content" : content.text };
      var url = Uri.parse(api + "complaints_And_Suggestions.php");
      var response = await http.post(url, body: data);
     var responsebody = jsonDecode(response.body);
     if (responsebody['status'] == "success") {
        print(responsebody);
      
      //  Navigator.of(context).pushReplacementNamed('HomePage');
       bool isDark = Theme.of(context).brightness == Brightness.dark;
        // Navigator.of(context).pushNamed('HomePage');
        AwesomeDialog(context: context,  
        autoHide: Duration(seconds: 5),
        dialogType: DialogType.SUCCES,

        dialogBackgroundColor:   isDark 
            ? AppColors.ColorAwseomeDialogBGB 
            : AppColors.ColorAwseomeDialogBG ,
        title: "",
        dismissOnTouchOutside: true,
         body: 
        Center(child: Text("${getLang(context, "TitleTmErsalElresala")}",
        style: TextStyle(
        color: isDark 
            ? AppColors.ColorAwseomeDialogTxtB 
            : AppColors.ColorAwseomeDialogTxt ,
         fontWeight: FontWeight.bold),
         textAlign: TextAlign.center,))).show();

    }
    else {
      print("Not Send");
    }
     }   
      }




  Future getMessages() async {
    var url = Uri.parse(api + "SelectComplaints_And_Suggestions.php");
    var data = {"stuID": "$stuID"};
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }






 
    getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
     setState(() {

       if (_content!=null) {
          content = _content;
        }
  stuID      = preferences.getString("stuID");
  stuName    = preferences.getString("stuName");
 
  });
    }
 @override
   void initState() {
     getPref();
     getMessages();
     super.initState(
     );
   }
  
 @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;
    bool isTapped = false;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Bar(
      title: "${getLang(context, "TitleEl4kawaWElmoktr7at")}",
      child: 
      
      SafeArea(
       
        child: 
      ListView(
          children: [ Column(
      
          children: [
          
          
        
      
          Container(
            height: screenHeigh/2.1,
            child: FutureBuilder(
            future: getMessages(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    physics:  BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return ComplaintAndSuggestList(
                        content: snapshot.data[i]['content'],
                        reply:   snapshot.data[i]['reply'],
                      );
                    });
              }
              return Center(child: CircularProgressIndicator());
            },
        ),
          ),
          
          
          
          
          
          
          
          
            Container(
             margin: EdgeInsets.all(10),
              child: 
              
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                      children: [
                        SizedBox(),
                     
                    Form(
                      key: formStateComp ,
                      child: Center(
                    
                        child: Container(
                         child:
                         ConGlassTxtField(
                       
                           controller:  _content ,
                           hintText:    "${getLang(context, "TitleEktbEl4akwaAwElektra7")}" ,
                           myValid:     compvalidate ,
                         )
                    
                              ),
                      ),
                    ),
      
                    
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical:  5 , horizontal: 5),
                  child: Center(
                    
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onHighlightChanged: (value) {
                      setState(() {
                        isTapped = value;
                      });
                    },
                    onTap: ()async {
                          
                       
                           insert();  
      
                      } ,
      
                    child: AnimatedContainer(
                      
                      duration: Duration(milliseconds: 300),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: isTapped ? 65 : 70,
                      width: isTapped ? 60 : 70,


                      // height: isTapped ? 55 : 60,  
                      // width: isTapped ? 150 : 160,


                      decoration: BoxDecoration(
                        color: isDark 
                            ? AppColors.ColorResponsiveButtonB 
                            : AppColors.ColorResponsiveButton ,
                        borderRadius: BorderRadius.all(
                          Radius.circular(200),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:isDark 
                            ? AppColors.ColorResponsiveButtonShadowB 
                            : AppColors.ColorResponsiveButtonShadow ,
                            blurRadius: 30,
                            offset: Offset(3, 7),
                          ),
                        ],
                      ),
                      child: Center(
                        
                        
                      child:Icon(Icons.send_rounded, 
                      color:isDark 
                            ? AppColors.ColorResponsiveButtonTxTB 
                            : AppColors.ColorResponsiveButtonTxTB ,) 
                        
                        
                        
                        
                        
                        // Text(
                        //  "${getLang(context, "TitleSend")}",
                        //   style: TextStyle(
                        //     color:isDark 
                        //     ? AppColors.ColorResponsiveButtonTxTB 
                        //     : AppColors.ColorResponsiveButtonTxTB ,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),



                      ),
                    ),
                  ),
              ),
                    )
                    ]
                    )
                    ),
          ],
        ),
      ])
              )
              );


  }
} 
         