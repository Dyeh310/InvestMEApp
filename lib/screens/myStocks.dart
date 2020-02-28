import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/home.dart' as prefix0;
import 'package:flutter_app/models/stock.dart';
import 'package:flutter_app/methods/reusableMethods.dart';

class MyStocksPage extends StatefulWidget {
  static const String id = 'my stocks';
  final List<int> selections;

  MyStocksPage({Key key, this.title, this.selections}) : super(key: key);
  final String title;

  @override
  _MyStocksPageState createState() => _MyStocksPageState();
}

class _MyStocksPageState extends State<MyStocksPage> {
  /// A list of Stock objects that is updated whenever the user selects a new favorite.
  ///
  /// The list is initialized to be an empty List<Stock>. With each press,
  /// a Stock object is added to the list. This data can then be transferred to
  /// another page.
  List<Stock> selections = [];

  // TODO DELETE
  // This is strictly used for visualize and will be completely replaced by the
  // selections list once functional.
  List<Stock> stocks = populateStocks(25);

  /// A List of Stock objects that is populated from the Alpha Vantage API.
  ///
  /// The user will "check" certain stocks and this will be sent to the selections
  /// List.
  List<Stock> newStocks = populateStocks(4);

  /// Used to control which ListTile is checked and added to the selections
  /// list.
  ///
  /// @param is an Stock object that represents the selected ListTile. This is ultimately
  /// added into the selections list or removed from the selections list. List
  /// functions MUST be called within setState() to update the UI.
  _onSelected(Stock indexStock, List<Stock> stocks) {
    if (selections.contains(indexStock)) {
      setState(() => selections.remove(indexStock));
    } else {
      setState(() => selections.add(indexStock));
    }
  }

  @override
  Widget build(BuildContext context) {
    /// This method is used so that users can delete stocks from "My Favorites."
    ///
    /// The AlertDialog box has two buttons: Return leaves the AlertDialog box and
    /// Delete Stock removes the stock from "My Favorites."
    void _deleteStockChoice(currentIndex) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Delete Stock"),
            content: new Text(
                "Are you sure you want to remove this stock from your selections?"),
            actions: <Widget>[
              MaterialButton(
                child: Text("Return"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              MaterialButton(
                  child: Text("Delete"),
                  onPressed: () {
                    _onSelected(currentIndex, selections);
                    Navigator.pop(context);
                  }),
              // deleteSelected
            ],
          );
        },
      );
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
            'My Stocks',
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
            /// The following section contains the upper-half of the screen.
            ///
            /// Within this section there exists a TextFormField that is used so
            /// the user can search the Alpha Vantage API for a stock
            ///
            /// Depending on the query, the response should appear on the lower
            /// half of the screen. The following selection represents the currently
            /// selected favorites. Any stocks "checked" should appear under the My Favourites section.
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 5.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 13,
                child: TextFormField(
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 20.0),
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    hintText: 'Search Stocks',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 3.0,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: selections.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: GestureDetector(
                        onLongPress: () {
                          _deleteStockChoice(selections[index]);
                        },
                        child: Card(
                          elevation: 10.0,
                          child: ListTile(
                            leading: IconButton(
                              icon: Icon(Icons.star),
                            ),
                            title: Text(selections[index].getName()),
                            trailing: Text(selections[index].getCurrentPrice()),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            /// This is the lower-half of the screen.
            ///
            /// This section shows any stocks that fall within the query from
            /// the TextInputField. From here, the user can "check" the stock,
            /// which will cause it to be brought into the My Favorites section.
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, top: 15.0, right: 0.0, bottom: 0.0),
              child: Text(
                'Add New Stocks?',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: newStocks.length,
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
                                    selections.contains(newStocks[index])
                                ? Icon(Icons.check)
                                : Icon(Icons.add),
                            onPressed: () {
                              _onSelected(newStocks[index], newStocks);
                            },
                          ),
                          title: Text(newStocks[index].getName()),
                          trailing: Text(newStocks[index].getCurrentPrice()),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
