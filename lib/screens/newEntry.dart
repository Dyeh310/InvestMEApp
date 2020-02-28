//import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_app/screens/compareStocks.dart';
import 'package:flutter_app/widgets/reusableWidgets.dart';
import 'package:intl/intl.dart';
import 'confirmation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewEntryPage extends StatefulWidget {
  static const String id = 'new entry';

  NewEntryPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NewEntryPageState createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  /// Firestore Create Implementation
  final _firestore = Firestore.instance;

  String name, category, note;

  double amount;

  DateTime timeStampOfEntry, dateOfExpenditure;

  void createData() async {
    _firestore.collection('previous_expenditures').add(
      {
        'name': name,
        'note': note,
        'category': category,
        'amount': amount,
        'timestamp': timeStampOfEntry,
        'date of expenditure': dateOfExpenditure
      },
    );
  }

  /// Create a text controller and use it to retrieve the current value of the TextField.
  final myAmountController = TextEditingController();
  final myNameController = TextEditingController();
  final myNoteController = TextEditingController();

  /// dispose() is used to clear memory for unused data
  /// Note: This function is not currently needed, but will be used later.
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myAmountController.dispose();
    myNameController.dispose();
    myNoteController.dispose();
    super.dispose();
  }

  /// A dollar sign icon used to show the expenditure value input.
  static const IconData attach_money =
      IconData(0xe227, fontFamily: 'MaterialIcons');

  /// A calendar symbol that when pressed will bring up a date selection.
  static const IconData calendar_today =
      IconData(0xe935, fontFamily: 'MaterialIcons');

  /// A form key used to save the name and note of the expenditure.
  final _formKey1 = GlobalKey<FormState>();

  /// A form key used to save the value of the expenditure.
  final _formKey2 = GlobalKey<FormState>();

  /// DateTime object reference is used to hold the DateTime object prior to being formatted.
  DateTime _dateTime;
  String newDate;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    /// The currentDate reference now holds the current date.
    DateTime currentDate = DateTime.now();

    /// The formattedDate string now holds the current date formatted in a usable way.
    String formattedDate = DateFormat('MM-dd-yyyy').format(currentDate);

    // Date and time added to Firestore document "previous_expenditures" field "time"
    //var dateTime = new DateTime.now();
    timeStampOfEntry = currentDate;

    /// This TextFormField widget receives the input for the expenditure name.
    ///
    /// The expenditure name will be used as an easy way for the user to know
    /// what they spent money on. There are currently no requirements implemented in
    /// the widget and the user can choose anything that helps them recall the
    /// expenditure. This will be submitted along with the Expenditure Note and
    /// the Expenditure value.
    final expenditureName = TextFormField(
      controller: myNameController,
      onChanged: (value) {
        name = value;
      },
      obscureText: false,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        fillColor: Colors.grey[200],
        filled: true,
        hintText: "Expenditure",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
    );

    /// This TextFormField widget takes user input for the Expenditure Note
    ///
    /// The Expenditure Note is provided to allow users to add any extra details
    /// they feel is relevant to the particular expenditure. This is not a
    /// requirement.
    final expenditureNote = TextFormField(
      controller: myNoteController,
      onChanged: (value) {
        note = value;
      },

      // keyboardType: TextInputType.number,
      obscureText: false,
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        fillColor: Colors.grey[200],
        filled: true,
        hintText: "Note",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
    );

    /// A button pressed by users when they are ready to submit the expenditure.
    ///
    /// This button stays at the bottom of the the screen. Once pressed, it will
    /// take the user to the Confirmation Page and save the Expenditure Name,
    /// Expenditure Note (if applicable), and the Expenditure Value.
    final saveButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(0.0),
      color: Color(0xFF3ec28f),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        // TODO
        // Implementation: Log the user into the account.
        onPressed: () {
          // sends the data to firestore database
          createData();
          Navigator.pushNamed(context, ConfirmationPage.id);
        },
        child: Text("Save",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    /// This Scaffold Widget renders the entire screen.
    ///
    /// The widget is based around a SingleChildScrollView widget with a Center
    /// child. From here various Container and Column widgets allow for a
    /// sophisticated, but simple design where the user can easily input expenditures.
    /// In addition, icons such as attach_money and calendar_today provide the user
    /// clear hints on where to input expenditure values and how to properly
    /// timestamp inputs.
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: new Center(
          child: Text("Expenditure",
              style: TextStyle(
                color: Colors.red,
              ),
              textAlign: TextAlign.center),
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
                    "Enter Amount",
                    style: TextStyle(fontSize: 35.0),
                  ),
                  Text(_dateTime == null ? formattedDate : newDate),
                  IconButton(
                    icon: Icon(calendar_today),
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2222))
                          .then((date) {
                        // the _dateTime must be rendered again after the update
                        setState(() {
                          _dateTime = date;
                          dateOfExpenditure = date;
                          newDate =
                              new DateFormat('MM-dd-yyyy').format(_dateTime);
                        });
                      });
                    },
                  ),
                  Flexible(
                    child: Container(
                      // Icon widget and the form widget should be viewed side-by-side.
                      child: Row(
                        children: <Widget>[
                          Icon(
                            attach_money,
                            size: 150.0,
                          ),
                          Flexible(
                            child: Container(
                              child: Form(
                                key: _formKey2,
                                child: TextFormField(
                                  controller: myAmountController,
                                  onChanged: (value) {
                                    var convert = double.parse(value);
                                    amount = convert;
                                  },
                                  obscureText: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 100.0),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    fillColor: Colors.white70,
                                    filled: true,
                                    hintText: "--",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  getSizedBox(25.0),
                  Form(
                    key: _formKey1,
                    child: Column(
                      children: <Widget>[
                        expenditureName,
                        expenditureNote,
                        getSizedBox(15.0),
                        saveButton,
                      ],
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
