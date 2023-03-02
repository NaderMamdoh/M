// ignore_for_file: non_constant_identifier_names, unused_field, missing_return, unused_local_variable

import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:motatawera/services/api.dart';
import 'package:motatawera/services/color.dart' as AppColors;
import 'package:shared_preferences/shared_preferences.dart';

import '../services/LANGUAGE/AppLocale.dart';



class LogIn extends StatefulWidget {

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> with TickerProviderStateMixin{
  AnimationController controller1;
  AnimationController controller2;
  Animation<double> animation1;
  Animation<double> animation2;
  Animation<double> animation3;
  Animation<double> animation4;

  var mytoken;
  var email;
  var phone1;
  var phone2;
  var address;
  var studId ;



 
 TapGestureRecognizer   _changesigin ;
 bool showsignin = true;
 @override
 void initState() {
    _changesigin = new TapGestureRecognizer().. onTap = () {
       setState(() {
         showsignin = !showsignin;
       });
    } ;
    
   super.initState();
    Firebase.initializeApp();
 
 
  controller1 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  
 
 }
 


 
  bool isLoding = false;

  TextEditingController stuID = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  TextEditingController _phone1 = new TextEditingController();
  TextEditingController _phone2 = new TextEditingController();



  GlobalKey<FormState>  formStateLogin = new GlobalKey<FormState>();
  GlobalKey<FormState>  formStateReg   = new GlobalKey<FormState>();






 String confirmpasswordvalidate(String val) {
    if (val != password.text ) {
      
      return "${getLang(context, "Txtconfirmpasswordvalidate1")}" ;
    }

    if (val.trim().isEmpty ) {
      return "${getLang(context, "Txtconfirmpasswordvalidate2")}" ;
    }

  }

  
 String codevalidate(String val) {
    if (val.trim().isEmpty) {
      return "${getLang(context, "Txtcodevalidate1")}";
    }

    if (val.length < 8) {
      return "${getLang(context, "Txtcodevalidate2")}";
    }

    if (val.length > 8) {
      return "${getLang(context, "Txtcodevalidate3")}";
    }
  }





  String passwordvalidate(String val) {
    if (val.trim().isEmpty) {
      
      return "${getLang(context, "Txtpasswordvalidate1")}";
    }

    if (val.length < 5) {
      return "${getLang(context, "Txtpasswordvalidate2")}";
    }

    if (val.length > 5) {
      return "${getLang(context, "Txtpasswordvalidate3")}";
    }
  }




  String emailvalidate(String val) {
    if (val.trim().isEmpty) {
      return "${getLang(context, "Txtemailvalidate1")}";
    }

    if (val.length < 8) {
      return "${getLang(context, "Txtemailvalidate2")}";
    }

    if (val.length > 40) {
      return "${getLang(context, "Txtemailvalidate3")}";
    }
  }



  String phonevalidate(String val) {
    if (val.trim().isEmpty) {
      return "${getLang(context, "Txtphonevalidate1")}";
    }

    if (val.length < 11) {
      return "${getLang(context, "Txtphonevalidate2")}";
    }

  }


  String addressvalidate(String val) {
    if (val.trim().isEmpty) {
      return "${getLang(context, "Txtaddressvalidate1")}";
    }

    if (val.length < 8) {
      return "${getLang(context, "Txtaddressvalidate2")}";
    }

  }



  savePref(
    var    stuID,
    String password,
    String stuName,
    String email,
    String stu_BDate,
    String gender,
    String address,
    String phone1,
    String phone2,
    String nationalID,
    String vaccine,
    String depID,
    String depName,
    String sqID,
    String squadName,
    var    token,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
   
    String token = await FirebaseMessaging.instance.getToken();
   
    preferences.setString("stuID", stuID);
    preferences.setString("password", password);
    preferences.setString("stuName", stuName);
    preferences.setString("email", email);
    preferences.setString("stu_BDate", stu_BDate);
    preferences.setString("gender", gender);
    preferences.setString("address", address);
    preferences.setString("phone1", phone1);
    preferences.setString("phone2", phone2);
    preferences.setString("nationalID", nationalID);
    preferences.setString("vaccine", vaccine);
    preferences.setString("depID", depID);
    preferences.setString("depName", depName);
    preferences.setString("sqID", sqID);
    preferences.setString("squadName", squadName);
    preferences.setString("token", token);
    print(preferences.getString("stuID"));
    print(preferences.getString("password"));


  }




 singin() async {

              String token = await FirebaseMessaging.instance.getToken();
                if (token!=null) {
                    mytoken = token;
              }
              print( "the token is :  " + token);
              HapticFeedback.lightImpact();
                                
                                
      var formdata = formStateLogin.currentState ; 
      if (formdata.validate()) {
         formdata.save();

      var data = {"stuID": stuID.text, "password": password.text ,  "token" : mytoken };
      var url = Uri.parse(api + "LogIn11.php");
      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      if (responsebody['status'] == "success") {
        print(responsebody['stuID']);

        Navigator.of(context).pushReplacementNamed('HomePage');

        savePref(
          responsebody['stuID'],
          responsebody['password'],
          responsebody['stuName'],
          responsebody['email'],
          responsebody['stu_BDate'],
          responsebody['gender'],
          responsebody['address'],
          responsebody['phone1'],
          responsebody['phone2'],
          responsebody['nationalID'],
          responsebody['vaccine'],
          responsebody['depID'],
          responsebody['depName'],
          responsebody['sqID'],
          responsebody['squadName'],
          responsebody['token'],
        );
      }
     else {
      print("LoGiN FaileD");
    }
      }

   }





    
  insert() async {  
           String token = await FirebaseMessaging.instance.getToken();
                if (token!=null) {
                    mytoken = token;
              }
              setState(() {
      
            if (_email!=null) {
              email = _email;
          }
            if (_phone1!=null) {
              phone1 = _phone1;
          }
            if (_phone2!=null) {
              phone2 = _phone2;
          }
            if (_address!=null) {
              address = _address;
          }
               
      });

   HapticFeedback.lightImpact();
     
      var formdata = formStateReg.currentState ; 
      if (formdata.validate()) {
         formdata.save();

      var data = {
       "email":     email.text ,
       "address" :  address.text,
       "phone1" :   phone1.text,
       "phone2" :   phone2.text,
       "password" : password.text ,
       "stuID":     stuID.text ,
       "token" :    mytoken };
      var url = Uri.parse(api + "Registration.php");
      var response = await http.post(url, body: data);
     var responsebody = jsonDecode(response.body);
     if (responsebody['status'] == "success") {
       print(responsebody);
   
            Navigator.of(context).pushNamed('LogIn');
            bool isDark = Theme.of(context).brightness == Brightness.dark;
            AwesomeDialog(context: context,  
            autoHide: Duration(seconds: 5),
            dialogType: DialogType.SUCCES,

            dialogBackgroundColor:   isDark 
                ? AppColors.ColorAwseomeDialogBGB 
                : AppColors.ColorAwseomeDialogBG ,
            title: "",
            dismissOnTouchOutside: true,
            body: 
            Center(child: Text( "${getLang(context, "TitleTmT3delElbyanat")}" ,
            style: TextStyle(
            color: isDark 
                ? AppColors.ColorAwseomeDialogTxtB 
                : AppColors.ColorAwseomeDialogTxt ,
            fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,))).show();

    }
      print( " ERROR  " );
  
     } 
 }



   
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
   bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark 
                ? AppColors.ColorBackGroundLoginB 
                : AppColors.ColorBackGroundLogin ,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Positioned(
                  top: size.height * (animation2.value + .58),
                  left: size.width * .21,
                  child: CustomPaint(
                    painter: MyPainter(50),
                  ),
                ),


              isDark ?

                Positioned(
                  top: size.height * .98,
                  left: size.width * .1,
                  child: CustomPaint(
                    painter: MyPainter(animation4.value - 30),
                  ),
                )
                // ,
                  :  Text(""),


                Positioned(
                  top: size.height * .5,
                  left: size.width * (animation2.value + .8),
                  child: CustomPaint(
                    painter: MyPainter(30),
                  ),
                ),
                Positioned(
                  top: size.height * animation3.value,
                  left: size.width * (animation1.value + .1),
                  child: CustomPaint(
                    painter: MyPainter(60),
                  ),
                ),
            
                 
          isDark ?
                Positioned(
                  top: size.height * .1,
                  left: size.width * .8,
                  child: CustomPaint(
                    painter: MyPainter(animation4.value),
                  ),
                ) 
                // ,
                 : Text(""),


                Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * .1),
                        child: Text(
                          showsignin? "${getLang(context, "TitleTsgeEldo5ol")}"  :   "${getLang(context, "TitleTkmltElbyanat")}"   ,
                          style: TextStyle(
                            color: isDark
                            ? AppColors.ColorTxtFieldinputLogB
                            :AppColors.ColorTxtFieldinputLog,
                            fontWeight: FontWeight.bold,
                          //  letterSpacing: 1,
                          //  wordSpacing: 4,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 16,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        
                        children: [

                       showsignin? formLogin()  : formReg(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                         
                         showsignin?
                              component3(
                               "${getLang(context, "TitleTsgeEldo5ol")}",
                                2.58,
                                () {
                                   singin();
                                }
                                )
                              
                              
                              :

                              

                        component3(
                                "${getLang(context, "TitleTsgelElbyanat")}",
                                2.58,
                        (){
                          insert();
                        } 
                                 ) ,
                              

                                
                                  

                                    

                              SizedBox(width: size.width / 50),
                           
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          component3(
                          showsignin?   "${getLang(context, "TitleLestkmlalElbyanat")}"  : "${getLang(context, "TitleLtsgelEldo5ol")}",
                            2,
                             
                            () {
                           
                            setState(() {
                               showsignin = !showsignin;
                            });
                              HapticFeedback.lightImpact();
                           
                            },
                          ),
                          SizedBox(height: size.height * .05),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }




         Widget  formLogin(){
            Size size = MediaQuery.of(context).size;
                 return  Center(
                   child: Form(
                     key: formStateLogin,         
                  
                     child:  Container(
                
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      
                      children: [
           Container(
          
            padding: EdgeInsets.symmetric(vertical: 10),
             child: component1(Icons.account_circle_outlined,
                                  "${getLang(context, "TxtCodeTaleb")}"  , false, true ,  stuID, codevalidate ),
           ),

           Container(
             padding: EdgeInsets.symmetric(vertical: 10),
             child: component1( Icons.lock_outline,
                                 "${getLang(context, "TxtPassword")}"  , true, false,  password, passwordvalidate),
           ),
                  
               ],)  
               
              ),
                  ) );
          }
            



  Widget component1(
       IconData icon,
       String hintText, 
       bool isPassword,
       bool isCode,
      //  int maxLength, 
       TextEditingController mycontroller, 
       myvalid) {
    
     Size size = MediaQuery.of(context).size;
     bool isDark = Theme.of(context).brightness == Brightness.dark;

    return  
    Container(
      

       height: size.width / 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter( 
          filter: ImageFilter.blur(
            tileMode: TileMode.mirror,
            sigmaY: 15,
            sigmaX: 15,

          ),

          child: Container(
            height: size.width / 9,
            width: size.width / 1.3,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top:2),
            decoration: BoxDecoration(
              color:isDark
              ? AppColors.ColorTxtFieldBoxDecB
              :AppColors.ColorTxtFieldBoxDecB,
              borderRadius: BorderRadius.circular(25),
            ),
          
   
              child: TextFormField(
                            
                
                style: TextStyle(
                  
                  color:isDark
                ? AppColors.ColorTxtFieldinputLogB
                :AppColors.ColorTxtFieldinputLog),
                cursorColor: isDark
                ? AppColors.ColorTxtFieldinputLogB
                :AppColors.ColorTxtFieldinputLog,
                obscureText: isPassword,
                controller: mycontroller , 
                validator: myvalid,
                keyboardType:
                    isCode ? TextInputType.number : TextInputType.text,
                decoration: InputDecoration(
                  
                  
                  prefixIcon: Icon(
                    icon,
                    color: isDark
                ? AppColors.ColorTxtFieldinputLogB
                :AppColors.ColorTxtFieldinputLog,
                  ),
                  border: InputBorder.none,
                  hintMaxLines: 1,
                  hintText: hintText,
                  filled: true,
                  fillColor: Colors.transparent,
                  hintStyle:
                      TextStyle( color:isDark
                ? AppColors.ColorTxtFieldinputLogB
                :AppColors.ColorTxtFieldinputLog, height: 1 ),
                ),
              ),
            ),
          ),
        ),);
  }







  Center  formReg(){
      
     Size size = MediaQuery.of(context).size;
                 return 
                 
                  Center(
                   child: Form(
                     key: formStateReg,         
                     child: Container(
                      
                       height: size.width / 0.8,
                       width: size.width / 1.3,
                      child:

                     ListView(
                      physics:  BouncingScrollPhysics(
                       parent: AlwaysScrollableScrollPhysics()),
                      children: [
               Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                 child: component2(Icons.account_circle_outlined,
                              "${getLang(context, "TxtCodeTaleb")}"  ,false, false ,  stuID, codevalidate ),
               ),
               Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                 child: component2(
                                Icons.email_outlined,
                               "${getLang(context, "TxtEmail")}" , false,true   ,  _email , emailvalidate),
               ),
               Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                 child: component2(
                               Icons.lock_outline,
                                "${getLang(context, "TxtPassword")}" , true, false, password, passwordvalidate),
               ), 
               Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                 child: component2(
                               Icons.lock_outline,
                                "${getLang(context, "TxtConfirmPassword")}" , false, false, confirmpassword , confirmpasswordvalidate ),
               ), 
               Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                 child: component2(
                                Icons.phone_android_outlined,
                                "${getLang(context, "TxtPhone1")}" , false, false,   _phone1 , phonevalidate ),
               ),
               Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                 child: component2(
                                Icons.phone_android_outlined,
                              "${getLang(context, "TxtPhone2")}" , false, false, _phone2 , null),
               ), 
               Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                 child: component2(
                                Icons.location_on_outlined,
                                "${getLang(context, "TxtAddress")}" , false, false,   _address , addressvalidate),
               ),

               ],)  
               ) 
              ),
            );
          }



  Widget component2(
      IconData icon, 
      String hintText, 
      bool isPassword, 
      bool isEmail,
      TextEditingController mycontroller,
      myvaild) {
    
     Size size = MediaQuery.of(context).size;
     bool isDark = Theme.of(context).brightness == Brightness.dark;

    return  
    Container(
        height: size.width / 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter( 
          filter: ImageFilter.blur(
            sigmaY: 15,
            sigmaX: 15,
          ),
          child: Container(
            height: size.width / 9,
            width: size.width / 1.3,
            alignment: Alignment.center,
            padding:    EdgeInsets.only(top: 5) ,
            decoration: BoxDecoration(
              color:isDark
              ? AppColors.ColorTxtFieldBoxDecB
              :AppColors.ColorTxtFieldBoxDecB,
              borderRadius: BorderRadius.circular(15),
            ),
          
 
              child: TextFormField(

                style: TextStyle(color:isDark
                ? AppColors.ColorTxtFieldinputLogB
                :AppColors.ColorTxtFieldinputLog),
                cursorColor: isDark
                ? AppColors.ColorTxtFieldinputLogB
                :AppColors.ColorTxtFieldinputLog,
                obscureText: isPassword,
                controller: mycontroller ,
                validator: myvaild,
                keyboardType:
                    isEmail ? TextInputType.emailAddress : TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    icon,
                    color: isDark
                ? AppColors.ColorTxtFieldinputLogB
                :AppColors.ColorTxtFieldinputLog,
                  ),
                  border: InputBorder.none,
                  hintText: hintText,
                  filled: true,
                  fillColor: Colors.transparent,

                  hintStyle:
                      TextStyle( color:isDark
                ? AppColors.ColorTxtFieldinputLogB
                :AppColors.ColorTxtFieldinputLog , height: 1  ),
                ),
              ),
            ),
          ),
        ),);

      }



  Widget component3(String string, double width, VoidCallback voidCallback , ) {
    Size size = MediaQuery.of(context).size;
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor:  isDark
            ? AppColors.ColorsplashColorLoginButtonB
            : AppColors.ColorsplashColorLoginButton,
          onTap: voidCallback,
          
          child: Container(
            margin: EdgeInsets.all(10),
            height: size.width / 9,
            width: size.width / width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isDark
            ? AppColors.ColorTxtFieldBoxDecB
            :AppColors.ColorTxtFieldBoxDecB,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text( string,
         //     recognizer: recognizer,
              style: TextStyle(color: isDark
            ? AppColors.ColorTxtFieldinputLogB
            :AppColors.ColorTxtFieldinputLog,),
            ),  
        ),
      ),
     ) );
  }
}




class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override  
  void paint(Canvas canvas, Size size) {
 

    final paint = Paint()

      ..shader = LinearGradient(
              colors: 
            AppColors.ColorAnimationBalls,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: Offset(0, 0),
        radius: radius,
        
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class MyBehavior extends ScrollBehavior {

  @override
  Widget buildViewportChrome(
  
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}


