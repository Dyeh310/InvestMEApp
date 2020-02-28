import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///REAL TIME: This API returns the realtime exchange rate for any pair of digital
///currency or a physical currency.

const apiKey = 'F3UWSGVY6Q5GS0GB';

class Search extends StatefulWidget {
  static const String id = 'search';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  void getTime() async {
    //make the request
    http.Response response = await http.get(
        'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=$apiKey');
    Map data = jsonDecode(response.body);

    ///testing get properties from data, by separating and parsing data.

    ///Search symbol
    dynamic symbol = data['bestMatches'][0]['1. symbol'];

    ///Search name
    dynamic name = data['bestMatches'][0]['2. name'];

    ///Stock/equity type
    dynamic type = data['bestMatches'][0]['3. type'];

    ///Region
    dynamic region = data['bestMatches'][0]['4. region'];

    ///Market open price
    dynamic marketOpen = data['bestMatches'][0]['5. marketOpen'];

    ///Market close price
    dynamic marketClose = data['bestMatches'][0]['6. marketClose'];

    ///Time zone
    dynamic timeZone = data['bestMatches'][0]['7. timezone'];

    ///Currency type
    dynamic currency = data['bestMatches'][0]['8. currency'];

    ///Match score
    dynamic matchScore = data['bestMatches'][0]['9. matchScore'];

    ///Print to test
    print(symbol);

    print(name);

    print(type);

    print(region);

    print(marketOpen);

    print(marketClose);

    print(timeZone);

    print(currency);

    print(matchScore);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('loading screen'));
  }
}
