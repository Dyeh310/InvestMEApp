import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/routing_constants.dart';
import 'package:flutter_app/screens/help.dart';
import 'package:flutter_app/screens/newEntry.dart';
import 'package:flutter_app/screens/previous_expenditures.dart';
import 'package:flutter_app/screens/settings.dart';
import 'package:flutter_app/screens/support_us.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'previous_expenditures.dart';
import 'compareStocks.dart';
import 'introTutorial.dart';
import 'settings.dart';
import 'myStocks.dart';
import 'newEntry.dart';

Color backgroundColor = Color(0xFFFFFFFF);

class HomePage extends StatefulWidget {
  static const String id = 'home';

  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        print(loggedInUser.displayName);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: new Center(
          child: new Text(
            "Home",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 20.0, 15.0, 0.0),
            child: Text(
              "InvestME",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Montserrat', fontSize: 15),
            ),
          ),
        ],
      ),

      drawer: new Drawer(
        child: new Container(
          color: Color(0xFF3ec28f),
          // Options on menu dashboard
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Menu',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 25.0),
                ),
              ),

              /// TODO: To be implemented or removed at a later date
              // Search Text Field
              ListTile(
                leading: Icon(Icons.search, color: Colors.white, size: 30),
                title: TextFormField(
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 20.0),
                  decoration: new InputDecoration(
                    //Box dimensions
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
              ),

              // New Entry
              ListTile(
                leading: Icon(Icons.add_circle, color: Colors.white, size: 30),
                title: Text(
                  'New Entry',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.pushNamed(context, NewEntryPage.id);
                }, //change route
              ),

              // Previous Expenditure
              ListTile(
                leading: Icon(Icons.date_range, color: Colors.white, size: 30),
                title: Text(
                  'Previous Expenditures',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.pushNamed(context, PreviousExpendituresPage.id);
                }, //change route
              ),

              // Compare Stock Data
              ListTile(
                //Button action - Routes to Compare Stock Data page
                leading: Icon(Icons.assessment, color: Colors.white, size: 30),
                title: Text(
                  'Compare Stock Data',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.pushNamed(context, CompareStocksPage.id);
                }, //change route
              ),

              // Collections
              ListTile(
                //Button action - Routes to Collections page
                //change route
                leading: Icon(Icons.description, color: Colors.white, size: 30),
                title: Text(
                  'My Stocks',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.pushNamed(context, MyStocksPage.id);
                },
              ),

              // Help
              ListTile(
                //Button action - Routes to Help page
                leading: Icon(Icons.help, color: Colors.white, size: 30),
                title: Text(
                  'Need Help?',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.pushNamed(context, IntroTutorialPage.id);
                }, //change route
              ),

              // Settings
              ListTile(
                //Button action - Routes to Settings page
                leading: Icon(Icons.perm_data_setting,
                    color: Colors.white, size: 30),
                title: Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.pushNamed(context, SettingsPage.id);
                }, //change route
              ),
            ],
          ),
        ),
      ),
      //Column Format
      body: Stack(
        children: <Widget>[
          welcome(context),
          username(context),
          newEntryButton(context),
        ],
      ),
    );
  } // End of scaffold and appbar settings

  //  Welcome Message
  Widget welcome(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 350.0),
      child: Center(
        child: Text('Welcome, ',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Montserrat', fontSize: 45.0)),
      ),
    );
  } // End welcome message

  // retrieves email address from Firebase. The futurebuilder uses an Async connection to retreive the email address from Firebase.
  Widget username(context) {
    return Center(
      child: Padding(
        //padding for UID display.
        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 230.0),
        child: FutureBuilder(
          future: FirebaseAuth.instance.currentUser(),
          builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
            // getting UID from Firebase
            if (snapshot.hasData) {
              // auto adjusts the size of the username, will only take up one line.
              return AutoSizeText(
                snapshot.data.email,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 45.0), //font will adjust based on username length
                stepGranularity:
                    1, //amount of text size decrease (45, 44, 43, ..... n)
                maxFontSize: 45.0, //max font size capped at 45.0
                maxLines: 1,
              );
            } else {
              //if returning username takes a long time the user will see "Loading..." where the UID should be
              return Text('Loading...');
            }
          },
        ),
      ),
    );
  } // End username placeholder

  // New Entry Button
  Widget newEntryButton(context) {
    return Center(
      //Padding to offset new entry button
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 125.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(height: 50),
              // Button dimensions
              ButtonTheme(
                minWidth: 325.0,
                height: 50.0,
                child: RaisedButton(
                    // how dimensional the button is (high up it is)
                    elevation: 15.0,
                    color: Color(0xFF3ec28f),
                    onPressed: () {
                      //Route to New Entry Page
                      Navigator.pushNamed(context, NewEntryPage.id);
                    },
                    child: const Text(
                      "New Entry",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 20.0),
                      textAlign: TextAlign.center,
                    )),
              ),
            ]),
      ),
    );
  } //End Entry Button
}
