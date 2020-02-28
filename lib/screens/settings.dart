import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login.dart';

//Page Color
Color backgroundColor = Color(0xFFFFFFFF);

class SettingsPage extends StatefulWidget {
  static const String id = 'settings';

  SettingsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //App bar elevation
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Colors.black),

          // AppBar background color - set to transparent to remove bar shadow
          backgroundColor: Colors.transparent,
          // Home Page Appbar title
          title: new Center(
              child: new Text(
            "Settings",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          )),

          //InvestME Title on AppBar
          actions: <Widget>[
            Padding(
              //Padding for InvestME text
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 15.0, 0.0),
              child: Text("InvestME",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 15)),
            ),
          ]),
      body: Stack(
        children: <Widget>[
          pageIcon(context),
          account(context),
          otherSettings(context),
        ],
      ),
    );
  }

// Page icon
  Widget pageIcon(context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(355.0, 0.0, 0.0, 0.0),
        child: Icon(Icons.settings, color: Colors.grey, size: 30.0));
  }

// Account settings section
  Widget account(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 0.0),
            child: Text('Account',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Montserrat',
                    fontSize: 20.0)),
          ),

          ListTile(
            leading: Icon(Icons.face, color: Colors.black, size: 30.0),
            title: Text(
              'Name',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 20.0),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.grey, size: 20.0),
            onTap: () {}, // Add function
          ),

          ListTile(
            leading: Icon(Icons.lock, color: Colors.black, size: 30.0),
            title: Text(
              'Change Password',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 20.0),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.grey, size: 20.0),
            onTap: () {}, // Add function
          ),

          ListTile(
            leading: Icon(Icons.account_box, color: Colors.black, size: 30.0),
            title: Text(
              'Advanced Account Settings',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 20.0),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.grey, size: 20.0),
            onTap: () {}, // Add function
          ),

          // For red divider
          Container(
            child: Divider(
              color: Colors.red,
              thickness: 0.0,
              indent: 15.0,
              endIndent: 15.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget otherSettings(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 220.0, 10.0, 0.0),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 0.0),
            child: Text('Other Settings',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Montserrat',
                    fontSize: 20.0)),
          ),
          ListTile(
            leading:
                Icon(Icons.insert_drive_file, color: Colors.black, size: 30.0),
            title: Text(
              'Terms and Policies',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 20.0),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.grey, size: 20.0),
            onTap: () {
              //Navigator.pushNamed(context, TermsandPoliciesPage.id);
            }, // Add function
          ),
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.black, size: 30.0),
            title: Text(
              'Help',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 20.0),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.grey, size: 20.0),
            onTap: () {
              //Navigator.pushNamed(context, HelpPage.id);
            },
          ),
          ListTile(
            leading:
                Icon(Icons.report_problem, color: Colors.black, size: 30.0),
            title: Text(
              'Report a Problem',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 20.0),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.grey, size: 20.0),
            onTap: () {
              //Navigator.pushNamed(context, ReportProblemPage.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet,
                color: Colors.red, size: 30.0),
            title: Text(
              'Sign Out',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 20.0),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.grey, size: 20.0),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text("Are you sure you want to sign out?",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 20.0)),
                      actions: <Widget>[
                        // Yes option to sign out
                        new RaisedButton(
                            color: Color(0xFF3ec28f),
                            child: Text('Yes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                )),
                            onPressed: () {
                              _auth.signOut();
                              Navigator.popAndPushNamed(context, LoginPage.id);
                            }),

                        // No Option to sign out
                        RaisedButton(
                          color: Color(0xFF3ec28f),
                          child: Text('No',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                              )),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });
            }, // Add signout function
          ),
        ],
      ),
    );
  }
}
