import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/settings.dart';

//Page Color
Color backgroundColor = Color(0xFFFFFFFF);

class ReportProblemPage extends StatefulWidget{
  static const String id = 'reportproblem';

  ReportProblemPage({ Key key, this.title}) : super(key: key);
  final String title;
  
  @override
  _ReportProblemState createState() => _ReportProblemState();
}

class _ReportProblemState extends State<ReportProblemPage>{
    final _nameformKey = GlobalKey<FormState>();
    final _emailformKey = GlobalKey<FormState>();
    final _phoneformKey = GlobalKey<FormState>();
    final _problemformKey = GlobalKey<FormState>();

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
        child:new Text("Report a Problem", 
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
            sentence(context),
            nameformField(context),
            emailFormField(context),
            phoneFormField(context),
            reportProblem(context),
            buttonRow(context)
          ],
        ),
    );
  }
  Widget pageIcon(context){
  return Padding(
      padding: const EdgeInsets.fromLTRB(355.0, 0.0, 0.0, 0.0),
      child: Icon(Icons.report_problem, color: Colors.grey, size: 30.0)
  );
 }

 Widget sentence(context){
   return Padding(
     padding: const EdgeInsets.fromLTRB(25.0, 0.0, 10.0, 550.0),
     child: Center(
       child: Text('If you are expereincing issues with the InvestME App or have a question not answered in the help section '
                    'you can use the form below to request assistance.', 
                    
                style: TextStyle(color: Colors.black, 
                fontSize: 20.0, 
                fontFamily: 'Montserrat', 
                fontWeight: FontWeight.bold)),
     ),
   );
 }

 Widget nameformField(context){
   return Padding(
     padding: const EdgeInsets.fromLTRB(20.0, 225.0, 20.0, 0.0),
      key: _nameformKey,
      child: TextFormField(
        validator: (value){
          if(value.isEmpty){
            return 'Please enter your name.';
          }
          return null;
        },
        obscureText: false,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
      fillColor: Colors.white,
      filled: true,
      hintText: "Enter Name",
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 1.0),),),
      )
    );
  }

  Widget emailFormField(context){
    return Padding(
     padding: const EdgeInsets.fromLTRB(20.0, 280.0, 20.0, 0.0),
      key: _emailformKey,
      child: TextFormField(
        validator: (value){
          if(value.isEmpty){
            return 'Please enter your email address.';
          }
          return null;
        },
        obscureText: false,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
      fillColor: Colors.white,
      filled: true,
      hintText: "Enter Email Address",
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 1.0),),),
      )
    );
  }

  Widget phoneFormField(context){
    return Padding(
     padding: const EdgeInsets.fromLTRB(20.0, 335.0, 20.0, 0.0),
     key: _phoneformKey,
      child: TextFormField(
        obscureText: false,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
      fillColor: Colors.white,
      filled: true,
      hintText: "Enter Phone Number (Optional)",
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 1.0),),),
      )
    );
  }
  Widget reportProblem(context){
    return Padding(
     padding: const EdgeInsets.fromLTRB(20.0, 390.0, 20.0, 0.0),
     key: _problemformKey,
      child: TextFormField(
        autocorrect: true,
        textCapitalization: TextCapitalization.sentences,
        validator: (value){
          if(value.isEmpty){
            return 'Required field.';
          }
          return null;
        },
        obscureText: false,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 200.0),
      fillColor: Colors.white,
      filled: true,
      hintText: 'Describe your issue',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 1.0),),),
     ),
    );
  }
  Widget buttonRow(context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(170.0, 625.0, 0.0, 0.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new RaisedButton(
            color: Color(0xFF3ec28f),
            onPressed: (){Navigator.popAndPushNamed(context, SettingsPage.id);},
            child: Text('Cancel',
            style: TextStyle(
              color: Colors.white, 
              fontSize: 20.0,),),
            ), 
          new RaisedButton(
            color: Color(0xFF3ec28f),
            onPressed: (){ 
             showDialog(
               context: context,
               builder:(BuildContext context){
             return AlertDialog(
                content: Text('Thank you, a member of the user support team will contact you to '
                              'resolve your issue.', 
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, 
                  fontFamily: 'Montserrat', 
                  fontSize: 20.0),
                ),
                actions: <Widget>[
                            // Option to edit expenditure
                            new RaisedButton(
                              color: Color(0xFF3EC28F),
                              child: Text('Ok',
                                style: TextStyle(
                                color: Colors.white, 
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,)),
                                onPressed:(){Navigator.popAndPushNamed(context, HomePage.id);}
                              ),
                ]
                );
               }
             ); 
            },
            child: Text('Submit', 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 20.0)),
             ),
        ],
      ),
    );
  }
}