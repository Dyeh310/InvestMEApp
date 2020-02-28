import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/reusableWidgets.dart';
import 'package:flutter_app/screens/newEntry.dart';
import 'home.dart';

/// The Confirmation Page acts as a way for users to confirm visually that their
/// expenditure was saved to the database.
///
/// The page acts as a transition between the New Entry Page and the Home Page
/// It employs the use of pre-made icons, TextInputFields, Forms, Material
/// Buttons, among other widgets.


class ConfirmationPage extends StatefulWidget {
  static const String id = 'confirmation';

  ConfirmationPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  /// An icon used to visually confirm for the user that the entry has been
  /// saved to the account.
  static const IconData check = IconData(0xe5ca, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    TextStyle captionStyle =
        TextStyle(color: Colors.grey, fontFamily: 'Montserrat', fontSize: 12.0);

    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    /// This Scaffold Widget renders the entire screen.
    /// The Scaffold begins by setting up the AppBar widget and providing a
    /// a close icon and page title. The close icon should return to
    /// the user to the HomePage. The actual screen's contents are displayed
    /// within a SingleChildScrollview widget. The immediate child is a Center
    /// widget to render the contents on the center of the screen. The Column
    /// widget contains the contents. The "Another Entry" button at the bottom
    /// of the page navigates the user to the other.
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon:Icon(Icons.close, 
            color:Colors.black),
            onPressed: (){Navigator.pushNamed(context, HomePage.id);  },
            ),
        title: new Center(
        //centerTitle: true,
        //automaticallyImplyLeading: true,
        child: new Text(
          "Confirmation",
          textAlign: TextAlign.center,
                style: TextStyle(color:Colors.red),)
        ),
        actions:<Widget>[
            Padding( 
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 15.0, 0.0),
              child: Text("InvestME", 
                style: TextStyle(color: Colors.black, 
                fontFamily: 'Montserrat', 
                fontSize: 15)),
                ),
              ]
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    // TODO
                    // This should only appear as 'Confirming' while the app
                    // is processing the information. Future implementation
                    // should use a ternary expression to check for this.
                    // Depending on the condition, setState() will be necessary.
                    "Confirming ...",
                    style: TextStyle(fontSize: 25),
                  ),
                  getSizedBox(35),
                  Material(
                    elevation: 8.0,
                    child: Icon(
                      Icons.check,
                      size: 200,
                    ),
                  ),
                  getSizedBox(15),
                  Text(
                    // This should use a ternary expression and change depending
                    // on the status of the recording of the expenditure.
                    "Your entry has been recorded",
                    style: captionStyle,
                  ),
                  getSizedBox(60),

                  /// This button is meant to take users back to the NewEntry Page.
                  /// This button is a convenient way to allow users to add multiple
                  /// entries during one session. If the user does not want to add
                  /// another entry, they would click the "X" button at the top-
                  /// left of the page.
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(0.0),
                    color: Color(0xFF3ec28f),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      // TODO
                      /// Returns the user to the new entry page.
                      /// @param context is the current position within the widget tree
                      /// @param '/new entry' is a string reference to NewEntryPage.
                      onPressed: () {
                      Navigator.popAndPushNamed(context, NewEntryPage.id);
                      },
                      child: Text("Another Entry?",
                          textAlign: TextAlign.center,
                          style: style.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
