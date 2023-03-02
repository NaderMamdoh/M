// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/compnent/ConServ.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:motatawera/services/image.dart' as AppImage;

import '../services/LANGUAGE/AppLocale.dart';


const _url3 = 'https://maps.app.goo.gl/B6UQc3oJKYGHY4io7';
void _launcherURL3() async => await canLaunch(_url3)
    ? await launch(_url3)
    : throw 'Could not launch $_url3';



class Callus extends StatefulWidget {
 


  @override
  State<Callus> createState() => _CallusState();
}

class _CallusState extends State<Callus> {
  @override
  Widget build(BuildContext context) {
       bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Bar(
     
     title: "${getLang(context, "TiTleCallUs")}",
     child: Directionality(textDirection: TextDirection.rtl,
       child: GridView(
             physics:  BouncingScrollPhysics(
             parent: AlwaysScrollableScrollPhysics()),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 1, crossAxisCount: 2),
            children: <Widget>[
                ConServR(
                image: Image.asset(  isDark
                ?AppImage.imageNMB
                :AppImage.imageNMW ) ,
                text:"${getLang(context, "TitleMwk3Elm3hd")}",
                onTap: () {
                  Navigator.of(context).pushNamed('Website');
                },
              ),
     
     
               ConServL(
                image: Image.asset( isDark
                ?AppImage.imageFacebook
                :AppImage.imageFacebook ),
                text: "${getLang(context, "TitleSf7tElm3hd")}",
                onTap: () {
                  Navigator.of(context).pushNamed('FacebookPage');
                },
              ),
     
              ConServR(
                image: Image.asset(isDark
                ?AppImage.imageLocation
                :AppImage.imageLocation ),
                text: "${getLang(context, "TitleMkanElm3hd")}",
                onTap: () {
                  launch('https://maps.app.goo.gl/B6UQc3oJKYGHY4io7');
                },
              ),
            ]),
     ),
    );
  }
}


