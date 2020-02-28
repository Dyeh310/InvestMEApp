import 'package:flutter/material.dart';
import 'package:flutter_app/screens/newEntry.dart';

Widget getTitle() {
  return Text(
    "InvestME",
    style: TextStyle(
      color: Colors.white,
      fontSize: 50,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w300,
    ),
  );
}

Widget getTextCaption() {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "Spending too much? Invest it.",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

Widget getSizedBox(double h) {
  return SizedBox(height: h);
}

Widget getSearchField() {
  return TextFormField(
    obscureText: false,
    style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      fillColor: Colors.white,
      filled: true,
      hintText: "Search for a Stock",
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1.0),
      ),
    ),
  );
}

Widget getEmailField() {
  return TextFormField(
    obscureText: false,
    style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      // Background color
      fillColor: Colors.white,
      filled: true,
      hintText: "Email address",
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1.0),
      ),
    ),
  );
}

Widget newEntryButton(context) {
  return Center(
    //Padding to offset new entry button
    child: Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(height: 50),
          // Button dimensions
          ButtonTheme(
            minWidth: 250.0,
            height: 50.0,
            child: RaisedButton(
              // how dimensional the button is (high up it is)
              elevation: 5.0,
              color: Color(0xFF3ec28f),
              onPressed: () {
                //Route to New Entry Page
                Navigator.pushNamed(context, NewEntryPage.id);
              },
              child: InkWell(
                child: const Text(
                  "New Entry",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
