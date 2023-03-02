// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:motatawera/compnent/ConTalabat.dart';
import 'package:motatawera/motatawera/mot_talabat/talabatData.dart';
import 'package:shared_preferences/shared_preferences.dart';



class TalabatList extends StatelessWidget {

final talabID ;
final talabName;
final talabContent;
TalabatList({ 

this. talabID ,
this.talabName,
this.talabContent,

});

savePref(var talabName)
  async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString("talabName", talabName);
  }
  @override
  Widget build(BuildContext context) {
    
    return 
      ConTalabatR(

           text: talabName,

           onTap:(){
          
            
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return TalabatData( talabNameD: talabName , talabContentD: talabContent,);
            }));
            },


           
        );
  }
}










