import 'package:flutter/material.dart';

//Page Color
Color backgroundColor = Color(0xFFFFFFFF);

class SupportUsPage extends StatefulWidget{
  static const String id = 'supportus?';

  SupportUsPage({ Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SupportUsState createState() => _SupportUsState();
}

class _SupportUsState extends State<SupportUsPage>{
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
        child:new Text("Support Us?", 
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
            //supportUs(context),
            
          ],
        ),
      );
  }
// Page icon
Widget pageIcon(context){
  return Padding(
      padding: const EdgeInsets.fromLTRB(355.0, 0.0, 0.0, 0.0),
      child: Icon(Icons.card_giftcard, color: Colors.grey, size: 30.0)
  );
}


}