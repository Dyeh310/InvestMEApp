///TO BE IMPLEMENTED IF THERE IS TIME
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/searchStocks.dart';
import 'package:flutter_app/screens/searchStocksTest.dart';
import 'package:flutter_app/services/location.dart';
import 'package:flutter_app/services/networking.dart';
import 'package:flutter_app/services/symbolInfo.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///api key will never change
const apiKey = 'F3UWSGVY6Q5GS0GB';

class LoadingPage extends StatefulWidget {
  static const String id = 'loading';

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  //String searchSymbol;
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=api=$apiKey');

    var stockData = await networkHelper.getData();

    ///Passing from loading screen to searchStocksTest page
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchStocksTestPage(
        searchStockData: stockData,
      );
    }));
  }

  /*void getSymbolInfo() async {
    Symbol symbol = Symbol();

    await symbol.getCurrentSymbolInformation();

    print(symbol.symbol);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.tealAccent,
          size: 70.0,
        ),
      ),
    );
  }
}
