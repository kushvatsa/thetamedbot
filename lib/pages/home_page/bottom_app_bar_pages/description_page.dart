import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../drag_drop/malaria_prediction.dart';
//import '../../drag_drop/skin_cancer_prediction.dart';
import '../../drag_drop/skin_cancer_prediction.dart';



class DescriptionPage extends StatefulWidget{

  _DescriptionPage createState()=>_DescriptionPage();
}



class _DescriptionPage extends State<DescriptionPage>{

  Widget build(BuildContext context){
  return Scaffold(
 body: /*Container(child: ,)*/ ListView(
          children: <Widget>[
            GestureDetector(onTap:(){
              Navigator.push(context, MaterialPageRoute(builder:(context){
                return MalariaDiagnosis();
              }));
            },child:Container(
              margin: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 30, left: 30.0),
              height: 210,
              width: 100,
              child: Stack(children:<Widget>[Positioned(bottom: 0,child:Center(
                child: Text("Malaria Diagnosis",
                    style: GoogleFonts.oswald(backgroundColor:Colors.white, 
                        fontWeight: FontWeight.bold, fontSize: 14.5)),
              ))]),
              decoration: BoxDecoration( image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/malaria_image.jpg")),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(3, 3),
                        blurRadius: 1.0,
                        spreadRadius: 1.0)
                  ],
                  border: Border.all(color: Colors.black, width: 3),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
            )),
            Container(
              margin: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 30, left: 30.0),
              height: 210,
              width: 100,
              child: Stack(children:<Widget>[Positioned(bottom: 0,child:Center(
                child: Text("Pneumothrax Diagnosis",
                    style: GoogleFonts.oswald(backgroundColor:Colors.white, 
                        fontWeight: FontWeight.bold, fontSize: 14.5)),
              ))]),
              decoration: BoxDecoration( image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/pneumothorax_image.jpg")),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(3, 3),
                        blurRadius: 1.0,
                        spreadRadius: 1.0)
                  ],
                  border: Border.all(color: Colors.black, width: 3),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
            ),
           GestureDetector(onTap:(){
              Navigator.push(context, MaterialPageRoute(builder:(context){
                return SkinDiagnosis();
              }));

           },
           child:Container(
              margin: EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 30, left: 30.0),
              height: 210,
              width: 100,
              child: Stack(children:<Widget>[Positioned(bottom: 0,child:Center(
                child: Text("Skin Cancer Diagnosis",
                    style: GoogleFonts.oswald(backgroundColor:Colors.white, 
                        fontWeight: FontWeight.bold, fontSize: 14.5)),
              ))]),
              decoration: BoxDecoration( image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/skin_cancer_image.jpg")),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(3, 3),
                        blurRadius: 1.0,
                        spreadRadius: 1.0)
                  ],
                  border: Border.all(color: Colors.black, width: 3),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
            ),
           )],
        ));}}