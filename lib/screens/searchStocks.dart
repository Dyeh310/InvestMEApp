import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/constants.dart';
//import 'package:flutter_app/widgets/reusableWidgets.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchStocksPage extends StatefulWidget {
  static const String id = 'search stocks';

  SearchStocksPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchStocksState createState() => _SearchStocksState();
}

class _SearchStocksState extends State<SearchStocksPage> {
  final _firestore = Firestore.instance;

  String searchStock;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              //stockComparison = value;
            },
          ),
        ],
        title: new Center(
          child: new Text(
            'Search Stock Name',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.deepOrangeAccent),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: MessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(
                          Icons.search,
                          color: Color(0xFF3ec28f),
                        ),
                        hintText: 'Enter Stock Name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        searchStock = value;
                      },
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //Navigator.pop(context, searchStocks)
                      _firestore.collection('search_stocks').add(
                        {
                          'stockname': searchStock,
                        },
                      );
                    },
                    child: Text(
                      'Search',
                      style: ButtonTextStyle,
                    ),
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
