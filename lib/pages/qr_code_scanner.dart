// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http ;
import 'package:flutter/material.dart';
import 'package:motatawera/services/api.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motatawera/services/color.dart' as AppColors;

import '../services/LANGUAGE/AppLocale.dart';


void main() => runApp(MaterialApp(home: QRscanner()));

class QRscanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRscannerState();
}

class _QRscannerState extends State<QRscanner> {
  Barcode result;
  
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
 
  
  var stID_d = "";
  var SesID_d="";
  var SesName_d="";
  var QrID;
  var studID;
  var sqIDv;
  var SesNumber_d  ="";
  var SesDate_d  ="";

  var depID;
  var depPraID;
  var praName_d="";
  var praNumber_d="";
  var praDate_d="";
  var qrPraID;
 
  var stuID_d = "";
  var subSecID_d="";
  var secName_d="";
  var subSecID;
  var secNumber_d  ="";
  var secDate_d  ="";

  var loading=0;
  var SesType="";

  var stuName;
  var status = "1" ; 
  var token ; 



    insertData() async{

      SharedPreferences preferences = await SharedPreferences.getInstance();
        depID     = preferences.getString("depID");
        depPraID  = preferences.getString("depPraID");
        studID    = preferences.getString("stuID");
        sqIDv     = preferences.getString("sqID");
        stuName   = preferences.getString("stuName");
        token     = preferences.getString("token");

          if(SesType=="0")
            {
            var urlGetData = Uri.parse(api+"sessionQR.php");
            var GetData  = {"SesID":"$QrID","sqID":"$sqIDv"};
            var responseGetData = await http.post(urlGetData,body : GetData);
            var responsebodyGetData = await jsonDecode(responseGetData.body);
            if (responsebodyGetData.length > 0) {
              
            var url = Uri.parse(api+"addAttendance22.php");
            var data = {    "stID"     :studID,
                            "stuName"  :stuName,
                            "status"   :status, 
                            "token"    :token,
                            "SesID"    :responsebodyGetData[0] ["SesID"],
                            "SesName"  :responsebodyGetData[0] ["SesName"],
                            "SesDate"  :responsebodyGetData[0] ["SesDate"],
                            "SesNumber":responsebodyGetData[0] ["SesNumber"],
                        
            };
            var response = await http.post(url,body : data);
            var responsebody = jsonDecode(response.body);
            if (responsebody['statuss'] == "success") {     
            controller.pauseCamera();
            Navigator.of(context).pushReplacementNamed('HomePage');
            bool isDark = Theme.of(context).brightness == Brightness.dark;
            AwesomeDialog(context: context,  
            autoHide: Duration(seconds: 5),
            dialogType: DialogType.SUCCES,

            dialogBackgroundColor:   isDark 
                ? AppColors.ColorAwseomeDialogBGB 
                : AppColors.ColorAwseomeDialogBG ,
            title: "titel",
            dismissOnTouchOutside: true,
            body: 
            Center(child: Text("${getLang(context, "TitleTmTsgel7dorMo7adra")}",
            style: TextStyle(
            color: isDark 
                ? AppColors.ColorAwseomeDialogTxtB 
                : AppColors.ColorAwseomeDialogTxt ,
            fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,))).show();

            }
        }
      }


          else if(SesType=="1")
                {
            var urlGetData = Uri.parse(api+"secSessionQR.php");
            var GetData  = {"subSecID":"$QrID","sqID":"$sqIDv"};
            var responseGetData = await http.post(urlGetData,body : GetData);
            var responsebodyGetData = await jsonDecode(responseGetData.body);
            if (responsebodyGetData.length > 0) {
         
            var url = Uri.parse(api+"addsecAtt.php");
            var data = {"stuID"       :studID,
                        "stuName"     :stuName,
                        "token"       :token,
                        "status"      :status,
                        "subSecID"    :responsebodyGetData[0] ["subSecID"],
                        "secName"     :responsebodyGetData[0] ["secName"],
                        "secDate"     :responsebodyGetData[0] ["secDate"],
                        "secNumber"   :responsebodyGetData[0] ["secNumber"],

                    
                };
            var response = await http.post(url,body : data);
            var responsebody = jsonDecode(response.body);
            if (responsebody['statuss'] == "success") {     
            controller.pauseCamera();
            Navigator.of(context).pushReplacementNamed('HomePage');
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
            Center(child: Text("${getLang(context, "TitleTmTsgel7dorSection")}" ,
            style: TextStyle(
            color: isDark 
                ? AppColors.ColorAwseomeDialogTxtB 
                : AppColors.ColorAwseomeDialogTxt ,
            fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,))).show();

        }
      } 
    }


   
          else if(SesType=="2")
            {
           var urlGetData = Uri.parse(api+"praSessionQR.php");
           var GetData  = {"depPraID":"$QrID","depID":"$depID"};
           var responseGetData = await http.post(urlGetData,body : GetData);
           var responsebodyGetData = await jsonDecode(responseGetData.body);
           if (responsebodyGetData.length > 0) {

           var url = Uri.parse(api+"addPraAtt.php");
           var data = { "stuID"    :studID,
                        "stuName"  :stuName,
                        "status"   :status,
                        "token"    :token,
                        "depPraID" :responsebodyGetData[0] ["depPraID"],
                        "praName"  :responsebodyGetData[0] ["praName"],
                        "praDate"  :responsebodyGetData[0] ["praDate"],
                        "praNumber":responsebodyGetData[0] ["praNumber"],

            };
           var response = await http.post(url,body : data);
           var responsebody = jsonDecode(response.body);
           if (responsebody['statuss'] == "success") {     
           controller.pauseCamera();
           Navigator.of(context).pushReplacementNamed('HomePage');
           bool isDark = Theme.of(context).brightness == Brightness.dark;
          
            AwesomeDialog(context: context,  
            autoHide: Duration(seconds: 5),
            dialogType: DialogType.SUCCES,

            dialogBackgroundColor:   isDark 
                ? AppColors.ColorAwseomeDialogBGB 
                : AppColors.ColorAwseomeDialogBG ,
            title: "titel",
            dismissOnTouchOutside: true,
            body: 
            Center(child: Text("${getLang(context, "TitleTmTsgel7dorM3ml")}",
            style: TextStyle(
            color: isDark 
                ? AppColors.ColorAwseomeDialogTxtB 
                : AppColors.ColorAwseomeDialogTxt ,
            fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,))).show();

          }
        } 
      }

 }


       var sqIDs;

       getpref() async{
       SharedPreferences preferences = await SharedPreferences.getInstance();
       sqIDs      = preferences.getString("sqID");

       if(sqIDs != null){
         setState((){ 
         sqIDs      = preferences.getString("sqID");
     
         });
       }
       }

       @override
         void initState() {
         getpref();
         super.initState();
         
       }
     

       @override
       void reassemble() {
       
         super.reassemble();
         if (Platform.isAndroid) {
         controller.pauseCamera();
         }
       controller.resumeCamera();
       }

       @override
       Widget build(BuildContext context) {

       if(loading==1)
       {
         insertData();
       }
     
  
         return Scaffold(
         backgroundColor: Colors.grey,
         body: 
         Column(
         children: <Widget>[
         Expanded(flex: 6, child: _buildQrView(context)),

         ],
         ),
       );
       }

       

       Widget _buildQrView(BuildContext context) {
       
       var scanArea = (MediaQuery.of(context).size.width < 400 ||
         MediaQuery.of(context).size.height < 400)
         ? 150.0
         : 300.0;
       
         return QRView(
           key: qrKey,
           onQRViewCreated: _onQRViewCreated,
           overlay: QrScannerOverlayShape(
           borderColor:AppColors.ColorQRCodeScannerFrame,
           borderRadius: 10,
           borderLength: 30,
           borderWidth: 10, 
           cutOutSize: scanArea),
         );
       }

       void _onQRViewCreated(QRViewController controller) {
         setState(() {
           this.controller = controller;
         });
           controller.scannedDataStream.listen((scanData) {
           
            if(loading==0){

            var result=scanData.code.split(',');
              setState(() {
                loading=1;
                SesType=result[0];
                QrID=result[1];

              });
            }
            }
         );
       }

       @override
       void dispose() {
         controller?.dispose();
         super.dispose();
       }
     }  