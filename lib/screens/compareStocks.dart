import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/charts/line_charts.dart' as prefix1;
import 'package:flutter_app/screens/home.dart' as prefix0;
import 'package:flutter_app/charts/line_charts.dart';
import 'package:flutter_app/models/stock.dart';
import 'package:flutter_app/methods/reusableMethods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/expenditure.dart';

class CompareStocksPage extends StatefulWidget {
  static const String id = 'compare stocks';
  CompareStocksPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CompareStocksState createState() => _CompareStocksState();
}

class _CompareStocksState extends State<CompareStocksPage> {
  final myDatabase = Firestore.instance;

  List<Expenditure> expenditureList = new List<Expenditure>();
  var previousExpenditures =
      Firestore.instance.collection('previous_expenditures');

  /// This method prints the contents of the list passed to it, and does not return a value.
  /// It is used for testing output, and can be deleted.
  void printExpenditureList(List<dynamic> expList) {
    for (int i = 0; i < expList.length; i++) {
      print(expList[i].getAmount());
      print(expList[i].getName());
      print(expList[i].getNote());
      print(expList[i].getDateTime());
    }
  }

  /// Retrieves expenditures from Firestore
  /// and stores Expenditure objects into a dynamic list.
  ///
  /// @return: An Expenditure list with all expenditures stored in Firebase.
  List<dynamic> getExpenditures() {
    String name, note;
    double amount;
    DateTime dateTime;
    // Retrieve previous_expenditures collection
    // obtain field data in previous_expenditure collection
    previousExpenditures.getDocuments().then((data) {
      if (data.documents.length > 0) {
        for (int i = 0; i < data.documents.length; i++) {
          setState(() {
            name = data.documents[i].data['name'];
            note = data.documents[i].data['note'];
            dateTime = data.documents[i].data['timestamp'].toDate();
            try {
              amount = data.documents[i].data['amount'];
            } catch (e) {
              amount = double.parse(data.documents[i].data['amount']);
            }
            Expenditure expenditure =
                new Expenditure(name, note, amount, dateTime);
            // Append the expenditure to expenditureList
            expenditureList.add(expenditure);
            // Create a new expenditure object and populate attributes
          });
        }
      }
    });
    return expenditureList;
  }

  /// Retrieves expenditures from the past day.
  ///
  /// @return: A dynamic Expenditure list.
  List<dynamic> expendituresToday(List<dynamic> expList) {
    DateTime now = new DateTime.now();
    // Set today to equal 12:00am
    DateTime today = new DateTime(now.year, now.month, now.day);
    // Create a new list to store specified elements
    List<Expenditure> todayList = new List<Expenditure>();
    for (int i = 0; i < expList.length; i++) {
      if (expList[i].getDateTime().isAfter(today)) {
        todayList.add(expList[i]);
      }
    }
    // Print elements in searchList to test results
    printExpenditureList(todayList); // Used for testing: TO DELETE
    expenditureList = [];
    return todayList;
  }

  List<dynamic> expendituresLastWeek(List<dynamic> expList) {
    DateTime now = new DateTime.now();
    DateTime lastWeek = now.add(new Duration(days: -7));
    // Create a new list to store specified elements
    List<Expenditure> lastWeekList = new List<Expenditure>();
    for (int i = 0; i < expList.length; i++) {
      if (expList[i].getDateTime().isAtSameMomentAs(lastWeek) ||
          expList[i].getDateTime().isAfter(lastWeek)) {
        lastWeekList.add(expList[i]);
      }
    }
    // Print elements in searchList to test results
    printExpenditureList(lastWeekList); // Used for testing: TO DELETE
    expenditureList = [];
    return lastWeekList;
  }

  List<dynamic> expendituresLastMonth(List<dynamic> expList) {
    DateTime now = new DateTime.now();
    DateTime lastMonth = now.add(new Duration(days: -30));
    // Create a new list to store specified elements
    List<Expenditure> lastMonthList = new List<Expenditure>();
    for (int i = 0; i < expList.length; i++) {
      if (expList[i].getDateTime().isAtSameMomentAs(lastMonth) ||
          expList[i].getDateTime().isAfter(lastMonth)) {
        lastMonthList.add(expList[i]);
      }
    }
    // Print elements in searchList to test results
    printExpenditureList(lastMonthList); // Used for testing: TO DELETE
    expenditureList = [];
    return lastMonthList;
  }

  // TODO
  // DELETE this upon actual implementation. This is currently just being used
  // to demonstrate the graph.
  final seriesList = SegmentsLineChart.withSampleData();

  /// A list of Stock objects that is updated whenever the user selects a new favorite.
  ///
  /// The list is initialized to be an empty List<Stock>. With each press,
  /// a Stock object is added to the list. This data will be used for comparison
  /// with the user's expenditures.
  List<Stock> selections = [];

  /// A list of Stock objects that is used to populate the favorite list.
  ///
  /// This data will be taken from the MyStocksPage's selections list and passed
  /// into this list.
  List<Stock> stocks = populateStocks(30);

  /// Used to control which ListTile is highlighted and added to the selections
  /// list for future comparisons.
  ///
  /// @param is an Stock object that represents the selected ListTile. This is ultimately
  /// added into the selections list or removed from the selections list.
  _onSelected(Stock indexStock, List<Stock> stocks) {
    if (selections.contains(indexStock)) {
      setState(() => selections.remove(indexStock));
    } else {
      setState(() => selections.add(indexStock));
    }
  }

  Widget build(BuildContext context) {
    //-----------
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    /// Button Widgets used with the AlertDialogue Widget.
    ///
    /// These will allow the user to select a date range and subsequently
    /// generate a graph using the users expenditures along with the selections list.
    Widget today = MaterialButton(
      child: Text("Today"),
      onPressed: () {
        expendituresToday(getExpenditures());
        Navigator.pop(context);
      },
    );
    Widget lastWeek = FlatButton(
      child: Text("Last Week"),
      onPressed: () {
        expendituresLastWeek(getExpenditures());
        Navigator.pop(context);
      },
    );
    Widget lastMonth = FlatButton(
      child: Text("Last Month"),
      onPressed: () {
        expendituresLastMonth(getExpenditures());
        Navigator.pop(context);
      },
    );

    /// This function creates an alert box used to select a date range for user Expenditures.
    ///
    /// The function is the onPressed() for the Compare Button.
    /// @return AlertDialog with three separate buttons.
    void _showDateChoices() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Expenditures"),
            content: new Text("Please select how far back"
                "you would like to view your expenditures."),
            actions: <Widget>[
              today,
              lastWeek,
              lastMonth,
            ],
          );
        },
      );
    }

    // TODO
    // This function is currently being used to generate dummy data. It needs to be completely reworked.
    generateGraph() {
      return prefix1.SegmentsLineChart.withSampleData();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, prefix0.HomePage.id);
          },
        ),
        title: Container(
          padding: const EdgeInsets.only(right: 25.0),
          child: new Text(
            'Compare Stock Data',
            style: TextStyle(color: Colors.deepOrangeAccent),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 20.0, 15.0, 0.0),
            child: Text("InvestME",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 15)),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /// This sections contains the upper-half of the screen.
            ///
            /// This is populated form the stocks List and contains the data from
            /// the MyStockPage's selections. Any selection made here will be
            /// employed when the user compares the stocks on the graph. The user
            /// presses the star icon to make the selection.
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, top: 15.0, right: 0.0, bottom: 0.0),
              child: Text(
                'My Favorites',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: stocks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: Colors.black),
                    ),
                    child: Card(
                      elevation: 10.0,
                      child: ListTile(
                        leading: IconButton(
                          icon: selections.isNotEmpty &&
                                  selections.contains(stocks[index])
                              ? Icon(Icons.star)
                              : Icon(Icons.star_border),
                          onPressed: () {
                            _onSelected(stocks[index], stocks);
                          },
                        ),
                        title: Text(stocks[index].getName()),
                        trailing: Text(stocks[index].getCurrentPrice()),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// This section contains the lower-half of the screen.
            ///
            /// The Compare button will produce an alert box that allows the user
            /// to select a date range for comparison. This range will be generated
            /// by comparing the DateTime values for the user's expenditures. This
            /// List, will then be matched against the selections List form the
            /// user's favorites. This will create a comparison graph at the bottom
            /// of the screen.
            Container(
              padding: const EdgeInsets.all(0.0),
              height: MediaQuery.of(context).size.height / 2.4,
              child: Column(
                children: <Widget>[
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular((0.0)),
                    color: Color(0xFF3ec28f),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        _showDateChoices();
                      },
                      child: Text("Compare",
                          textAlign: TextAlign.center,
                          style: style.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  // TODO
                  // IMPLEMENT
                  // This needs to be created and controlled by the alert dialogue box.
                  Expanded(
                    child: generateGraph(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
