// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:motatawera/compnent/AppBar.dart';
import 'package:motatawera/list/Talabat/talabatList.dart';
import 'package:http/http.dart' as http;
import 'package:motatawera/services/api.dart';
import 'dart:convert';

import '../services/LANGUAGE/AppLocale.dart';



class Talabat extends StatefulWidget {
  @override
  _TalabatState createState() => _TalabatState();
}

class _TalabatState extends State<Talabat> {
  // var talabID;


  @override
  void initState() {
     getData();
    super.initState();
  }

  Future getData() async {
    var url = Uri.parse(api + "talabat.php");
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return Bar(
           title: "${getLang(context, "TitleRoknEltalabat")}",
           child: FutureBuilder(
           future: getData(),
           builder: (BuildContext context, AsyncSnapshot snapshot) {
           if (snapshot.hasData) {
            return ListView.builder(
               physics:  BouncingScrollPhysics(
               parent: AlwaysScrollableScrollPhysics()),
                     itemCount: snapshot.data.length,
                     itemBuilder: (context, i) {
                      return TalabatList(
                       talabName:     snapshot.data[i]['talabName'],
                       talabContent:  snapshot.data[i]['talabContent'],);
                   });
         }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
