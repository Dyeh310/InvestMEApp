/*import 'package:flutter_app/screens/searchStocks.dart';
import 'package:http/http.dart' as http;

class SearchStocksTestPage extends StatefulWidget {
  static const String id = 'search stocks';

  SearchStocksTestPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SearchStocksTestState createState() => _SearchStocksTestState();
}

class _SearchStocksTestState extends State<SearchStocksTestPage> {
  String searchStock;

  void getData() async {
    Response response = await http.get(
        'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=MSFT&apikey=demo');
    print(response);
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

class SearchStocksTestPage extends StatefulWidget {
  static const String id = 'search stocks test';

  SearchStocksTestPage({this.searchStockData});

  ///pass this
  final searchStockData;

  @override
  _SearchStocksTestPageState createState() => _SearchStocksTestPageState();
}

class _SearchStocksTestPageState extends State<SearchStocksTestPage> {
  String symbol;
  String name;
  String matchScore;

  @override
  void initState() {
    super.initState();

    ///tapping into widget in order to gain access to SearchStocksTestPage
    ///stateful widget and it's properties.
    updateUI(widget.searchStockData);
  }

  void updateUI(dynamic stockData) {
    ///pass values into json
    symbol = stockData['bestMatches'][0]['1. symbol'];
    name = stockData['bestMatches'][0]['2. name'];
    matchScore = stockData['bestMatches'][0]['9. matchScore'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$symbol',
                      style: TempTextStyle,
                    ),
                    Text(
                      '$name',
                      style: ConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$matchScore',
                  textAlign: TextAlign.right,
                  style: MessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
