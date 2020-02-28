import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///REAL TIME: This API returns the daily time series  (date, daily open, daily high,
///daily low, daily close, daily volume) of the global equity specified.

const apiKey = 'F3UWSGVY6Q5GS0GB';

class TimeSeries extends StatefulWidget {
  static const String id = 'time series';

  @override
  _TimeSeriesState createState() => _TimeSeriesState();
}

class _TimeSeriesState extends State<TimeSeries> {
  void getTime() async {
    ///Make the request
    ///
    ///Testing purposes change the symbol, e.g. 'MSFT' to something else should you want to compare
    ///to a different symbol
    http.Response response = await http.get(
        'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=MSFT&apikey=$apiKey');
    Map data = jsonDecode(response.body);

    ///Testing get properties from data, by separating and parsing data.
    ///
    ///META DATA

    ///Symbol requested
    String symbol = data['Meta Data']['2. Symbol'];

    ///Date
    String date = data['Meta Data']['3. Last Refreshed'];

    ///Time zone
    String timeZone = data['Meta Data']['5. Time Zone'];

    ///Testing get properties from data, by separating and parsing data.
    ///
    ///TIME SERIES (DAILY); GIVEN DATE.
    ///
    ///Daily open price
    String open = data['Time Series (Daily)']['2019-11-29']['1. open'];

    ///Daily high price
    String high = data['Time Series (Daily)']['2019-11-29']['2. high'];

    ///Daily low price
    String low = data['Time Series (Daily)']['2019-11-29']['3. low'];

    ///Daily close price
    String close = data['Time Series (Daily)']['2019-11-29']['4. close'];

    ///Daily volume price
    String volume = data['Time Series (Daily)']['2019-11-29']['5. volume'];

    print(symbol);
    print(date);
    print(timeZone);

    print(open);
    print(high);
    print(low);
    print(close);
    print(volume);
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

/*
import 'dart:async';
import 'package:flutter_app/api/base.dart';
import 'package:flutter_app/api/jsonObject.dart';

class TimeSeries extends Base {
  var _intraday = "TIME_SERIES_INTRADAY";
  var _daily = "TIME_SERIES_DAILY";
  var _dailyAdjusted = "TIME_SERIES_DAILY_ADJUSTED";
  var _weekly = "TIME_SERIES_WEEKLY";
  var _weeklyAdjusted = "TIME_SERIES_WEEKLY_ADJUSTED";
  var _monthly = "TIME_SERIES_MONTHLY";
  var _monthlyAdjusted = "TIME_SERIES_MONTHLY_ADJUSTED";
  var _batchStockQuotes = "BATCH_STOCK_QUOTES";

  TimeSeries(String key) : super(key);

  Future<JSONObject> getIntraday(String symbol,
      {String interval = "1min", String outputsize}) async {
    return this.getRequest(
        function: _intraday,
        symbol: symbol,
        interval: interval,
        outputsize: outputsize);
  }

  Future<JSONObject> getDaily(String symbol, {String outputsize}) async {
    return this
        .getRequest(function: _daily, symbol: symbol, outputsize: outputsize);
  }

  Future<JSONObject> getDailyAdjusted(String symbol,
      {String outputsize}) async {
    return this.getRequest(
        function: _dailyAdjusted, symbol: symbol, outputsize: outputsize);
  }

  Future<JSONObject> getWeekly(String symbol, {String outputsize}) async {
    return this
        .getRequest(function: _weekly, symbol: symbol, outputsize: outputsize);
  }

  Future<JSONObject> getWeeklyAdjusted(String symbol,
      {String outputsize}) async {
    return this.getRequest(
        function: _weeklyAdjusted, symbol: symbol, outputsize: outputsize);
  }

  Future<JSONObject> getMonthly(String symbol, {String outputsize}) async {
    return this
        .getRequest(function: _monthly, symbol: symbol, outputsize: outputsize);
  }
}
*/
