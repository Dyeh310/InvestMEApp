import 'package:flutter/material.dart';

//Page Color
Color backgroundColor = Color(0xFFFFFFFF);

class TermsandPoliciesPage extends StatefulWidget{
  static const String id = 'TermsandPolicies';

  TermsandPoliciesPage({ Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TermsandPoliciesState createState() => _TermsandPoliciesState();
}

class _TermsandPoliciesState extends State<TermsandPoliciesPage>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      //App bar elevation
      elevation: 0.0, 
      iconTheme: new IconThemeData(color: Colors.black),

     // AppBar background color - set to transparent to remove bar shadow 
      backgroundColor: Colors.transparent,
     // Home Page Appbar title
        title: new Center(
        child:new Text("Terms and Policies", 
            textAlign: TextAlign.center,
            style: TextStyle(color:Colors.red),)
        ),
        //InvestME Title on AppBar
      actions:<Widget>[
        Padding( //Padding for InvestME text
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 15.0, 0.0),
          child: Text("InvestME", 
            style: TextStyle(color: Colors.black, 
            fontFamily: 'Montserrat', 
            fontSize: 15)),
            ),
          ]
      ),

      body: Stack(
        children: <Widget>[
            pageIcon(context),
            //reportProblem(context),
          ],
        ),
    );
  }
  Widget pageIcon(context){
  return Padding(
      padding: const EdgeInsets.fromLTRB(355.0, 0.0, 0.0, 0.0),
      child: Icon(Icons.insert_drive_file, color: Colors.grey, size: 30.0)
  );
 }
}