// ignore_for_file: non_constant_identifier_names, unused_local_variable
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/compnent/ConStudent.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:motatawera/services/color.dart' as AppColor;
import '../services/LANGUAGE/AppLocale.dart';


class StudentDetails extends StatefulWidget {
  
  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {

   var stuID;
   var password;
   var stuName;
   var email;
   var phone1;
   var phone2;
   var gender;
   var address;
   var nationalID;
   var vaccine;
   var depID;
   var depName;
   var sqID;
   var squadName;
   var stu_BDate;
   var Barcode ;
   var Code;
   bool isSignIn = false;

   
getPref()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
 

  stuID      = preferences.getString("stuID");
  password   = preferences.getString("password");
  stuName    = preferences.getString("stuName");
  email      = preferences.getString("email");
  phone1     = preferences.getString("phone1");
  phone2     = preferences.getString("phone2");
  gender     = preferences.getString("gender");
  address    = preferences.getString("address");
  nationalID = preferences.getString("nationalID");
  vaccine    = preferences.getString("vaccine");
  depID      = preferences.getString("depID");
  depName    = preferences.getString("depName");
  sqID       = preferences.getString("sqID");
  squadName  = preferences.getString("squadName");
  stu_BDate  = preferences.getString("stu_BDate");

  if(stuID != null){
 setState(() {
  stuID      = preferences.getString("stuID");
  password   = preferences.getString("password");
  stuName    = preferences.getString("stuName");
  email      = preferences.getString("email");
  phone1     = preferences.getString("phone1");
  phone2     = preferences.getString("phone2");
  gender     = preferences.getString("gender");
  address    = preferences.getString("address");
  nationalID = preferences.getString("nationalID");
  vaccine    = preferences.getString("vaccine");
  depID      = preferences.getString("depID");
  depName    = preferences.getString("depName");
  sqID       = preferences.getString("sqID");
  squadName  = preferences.getString("squadName");
  stu_BDate  = preferences.getString("stu_BDate");
  isSignIn   = true;
  Barcode =  SfBarcodeGenerator(
     symbology: Code128(),
     value: stuID,
     barColor: AppColor.ColorBarCodebarColor, 
     backgroundColor: AppColor.ColorBarCodeBackGroundColor);
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
    final double screenHeigh = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

     return  Bar(
      title: "${getLang(context, "TitleByanatEltaleb")}",
     

      child: new ListTile(
      title: new ListView(
      physics:  BouncingScrollPhysics(
      parent: AlwaysScrollableScrollPhysics()),  
      children: <Widget>[ new Center(
      child: Column(
      children: <Widget>[
            
     
    Container(
         margin: EdgeInsets.symmetric(vertical: 10),
         height: 110, 
         width: screenWidth*0.95 ,
         color: isDark
         ? AppColor.ColorTextB
         : AppColor.ColorTextB, 
         alignment: Alignment.center,
         child:  
         Container(   width: screenWidth*0.85 ,  height: 90,  child: Barcode,)
        ),
   
      
      ConStudent(
           text1:  "${getLang(context, "TitleEsmEltaleb")}",
           text2: stuName,
      ), 


      ConStudent(
           text1: "${getLang(context, "TitleCodeEltaleb")}",
           text2: stuID,
      ),
 
      ConStudent(
           text1:  "${getLang(context, "TitleEmailEltaleb")}",
           text2: email,
      ),

      ConStudent(
           text1:  "${getLang(context, "TitleMiladEltaleb")}"  ,
           text2: stu_BDate,
      ),
 

      ConStudent(
           text1:  "${getLang(context, "Title3nwamEltaleb")}",
           text2: address,
      ),
 

      ConStudent(
           text1: "${getLang(context, "TitleMobileEltaleb")}",
           text2: phone1,
      ),
 
       ConStudent(
           text1: "${getLang(context, "TitleMobileEltaleb")}",
           text2: phone2,
      ),

      ConStudent(
           text1: "${getLang(context, "TitleRkmKwmeEltaleb")}",
           text2: nationalID,
      ),


      ConStudent(
           text1: "${getLang(context, "TitleNo3Eltaleb")}",
           text2: gender,
      ),


      ConStudent(
           text1: "${getLang(context, "TitleLoka7Eltaleb")}",
           text2: vaccine,
      ),
 

      ConStudent(
           text1: "",
           text2: squadName,
      ),
 

      ConStudent(
           text1: "",
           text2: depName,
      ),

      
      ConStudent(
            text1: "${getLang(context, "TitlePasswordEltaleb")}", 
            text2: password,
      ),
      


    ], 
    ),
    )]
    ),
    ),
    );
  }
}



