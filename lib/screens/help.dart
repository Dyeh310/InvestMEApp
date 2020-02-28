import 'package:flutter/material.dart';

//Page Color
Color backgroundColor = Color(0xFFFFFFFF);

class HelpPage extends StatefulWidget{
  static const String id = 'help';

  HelpPage({ Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<HelpPage>{
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
        child:new Text("Help", 
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
            helpList(context)
            //helpItems(context),
        ],
      ),
    );
  }
 // Page icon
  Widget pageIcon(context){
        return Padding(
        padding: const EdgeInsets.fromLTRB(355.0, 0.0, 0.0, 0.0),
        child: Icon(Icons.help_outline, color: Colors.grey, size: 30.0)
  );
}

Widget helpList(context){
  return Padding(
    padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
    child: ListView(
      children: <Widget>[
        Card(        
          child: ListTile(
           leading: Icon(Icons.help, color: Colors.black, size: 60.0),
                  title: Text('Previous Expenditures',
                  style: TextStyle( 
                  color: Colors.black, 
                  fontFamily: 'Montserrat', 
                  fontSize: 20.0),),
                  subtitle: Text('Some other Texr'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,),),
       Card(
        child: ListTile(
         leading: Icon(Icons.help, color: Colors.black, size: 60.0),
                  title: Text('Previous Expenditures',
                  style: TextStyle( 
                  color: Colors.black, 
                  fontFamily: 'Montserrat', 
                  fontSize: 20.0),),
                  subtitle: Text('Some other Texr'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,),),
        Card(
         child: ListTile(
          leading: Icon(Icons.help, color: Colors.black, size: 60.0),
                  title: Text('Previous Expenditures',
                  style: TextStyle( 
                  color: Colors.black, 
                  fontFamily: 'Montserrat', 
                  fontSize: 20.0),),
                  subtitle: Text('Some other Texr'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,),),
       Card(
        child: ListTile(
         leading: Icon(Icons.help, color: Colors.black, size: 60.0),
                  title: Text('Previous Expenditures',
                  style: TextStyle( 
                  color: Colors.black, 
                  fontFamily: 'Montserrat', 
                  fontSize: 20.0),),
                  subtitle: Text('Some other Texr'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,),),
       Card(
        child: ListTile(
         leading: Icon(Icons.help, color: Colors.black, size: 60.0),
                  title: Text('Previous Expenditures',
                  style: TextStyle( 
                  color: Colors.black, 
                  fontFamily: 'Montserrat', 
                  fontSize: 20.0),),
                  subtitle: Text('Some other Texr'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,),),
      Card(
        child: ListTile(
         leading: Icon(Icons.help, color: Colors.black, size: 60.0),
                  title: Text('Previous Expenditures',
                  style: TextStyle( 
                  color: Colors.black, 
                  fontFamily: 'Montserrat', 
                  fontSize: 20.0),),
                  subtitle: Text('Some other Texr'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,),),

      ],   
    ),
  );
 }
}