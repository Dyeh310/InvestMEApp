import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'newEntry.dart';

Color backgroundColor = Color(0xFFFFFFFF);
final databaseReference = Firestore.instance;

class PreviousExpendituresPage extends StatefulWidget {
  static const String id = 'previous expenditures';

  PreviousExpendituresPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PreviousExpendituresState createState() => _PreviousExpendituresState();
}

class _PreviousExpendituresState extends State<PreviousExpendituresPage> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
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
              "Previous Expenditures",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          ),
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
          sliderSettings(context),
          calendar(context),
          readFirestoreData(context),
          newEntryButton(context),
        ],
      ),
    );
  } // Centers the body of the widget

  // Daily title, current date, dividers (red/green)
  Widget sliderSettings(context) {
    // format to display current date
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM d, yyyy').format(now);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text('Daily',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 25.0)),
          ),
          Container(
            //Divider 1 properties
            padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
            child: Divider(
              color: Colors.green,
              thickness: 2.0,
              indent: 150.0,
              endIndent: 150.0,
            ),
          ), // End divider 1
          Container(
              child: Text(
            formattedDate,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontFamily: 'Montserrat', fontSize: 15.0),
          )),
          Container(
            // Divider 2 properties
            padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
            child: Divider(
              color: Colors.red,
              thickness: 1.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
          ), // End Divider 2
        ],
      ),
    );
  }

  // Calendar widget
  Widget calendar(context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15.0, 75.0, 15.0, 0.0),
      child: StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return TableCalendar(
            initialCalendarFormat: CalendarFormat.month,
            calendarStyle: CalendarStyle(
                todayColor: Colors.green, selectedColor: Colors.redAccent),
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
            ),
            calendarController: _controller,
          );
        },
      ),
    );
  }

  Widget readFirestoreData(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 425.0, 15.0, 125.0),
      child: new StreamBuilder(
        stream:
            Firestore.instance.collection('previous_expenditures').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return new Text(
              "Retrieving Data...",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 25.0),
            );
          return new ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: _buildList(context, snapshot.data.documents[index]),
              );
            },
          );
        },
      ),
    );
  }

  Widget newEntryButton(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 625.0, 0.0, 0.0),
      child: new Center(
        child: InkWell(
          child: Icon(Icons.add_circle, color: Color(0xFF3ec28f), size: 80.0),
          onTap: () {
            Navigator.pushNamed(context, NewEntryPage.id);
          },
        ),
      ),
    );
  }
}

/* This widget is used to pull the data into the Streambuilder from FireStore. It is called below within the
** readFirestoreData Widget. It can be modified to pull other data types, you'll just need to change
** the documents being referenced.
** Note: Right now the Firestore database allows any authenticated user to access the data. Prior to Demo 2 we should
** change the permissions to access data generated by a particular user. We are for the most part in Test Mode.
*/

Widget _buildList(BuildContext context, DocumentSnapshot document) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(
      height: 60.0,
      decoration: new BoxDecoration(
        color: Color(0xFF3EC28F),
        borderRadius: new BorderRadius.circular(7.0),
      ),
      child: ListTile(
        leading: Container(
          child: Icon(Icons.cloud_circle, size: 55.0, color: Colors.white),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              document['name'],
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 20.0),
            ),
            Text(
              '\$' + document['amount'].toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: 20.0),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //Text(document ['category'],
            //style: TextStyle(color: Colors.black45, fontFamily: 'Montserrat', fontSize: 15.0)
            //),
            Text(
              document['note'],
              style: TextStyle(
                  color: Colors.black45,
                  fontFamily: 'Montserrat',
                  fontSize: 15.0),
            ),
          ],
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.black45, size: 20.0),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(
                  "You can edit or delete the expenditure below",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 20.0),
                ),
                actions: <Widget>[
                  // Option to edit expenditure
                  new RaisedButton(
                    color: Color(0xFF3EC28F),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      //showDialog();
                    },
                  ),

                  // Option to delete expenditure
                  RaisedButton(
                    color: Color(0xFF3ec28f),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              );
            },
          );
        },
      ),
    ),
  );
}
