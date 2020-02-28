import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiKey = 'F3UWSGVY6Q5GS0GB';

class LoadingTestPage extends StatefulWidget {
  static const String id = 'loading test';

  @override
  _LoadingTestPageState createState() => _LoadingTestPageState();
}

class _LoadingTestPageState extends State<LoadingTestPage> {
  void getTime() async {
    //make the request
    http.Response response = await http.get(
        'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=MSFT&apikey=$apiKey');
    Map data = jsonDecode(response.body);

    //get properties from data
    String symbol = data['Meta Data']['2. Symbol'];

    String function = data['Time Series (Daily)']['2019-11-29']['1. open'];

    print(symbol);
    print(function);
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
