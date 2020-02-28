import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///REAL TIME: This API returns the realtime exchange rate for any pair of digital
///currency or a physical currency.

const apiKey = 'F3UWSGVY6Q5GS0GB';

class Crypto extends StatefulWidget {
  static const String id = 'crypto';

  @override
  _CryptoState createState() => _CryptoState();
}

class _CryptoState extends State<Crypto> {
  void getTime() async {
    //make the request
    http.Response response = await http.get(
        'https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=BTC&to_currency=USD&apikey=$apiKey');
    Map data = jsonDecode(response.body);

    ///testing get properties from data, by separating and parsing data.

    ///From currency codes
    dynamic fromCurrencyCode =
        data['Realtime Currency Exchange Rate']['1. From_Currency Code'];
    dynamic fromCurrencyName =
        data['Realtime Currency Exchange Rate']['2. From_Currency Name'];

    ///To currency codes
    dynamic toCurrencyCode =
        data['Realtime Currency Exchange Rate']['3. To_Currency Code'];
    dynamic toCurrencyName =
        data['Realtime Currency Exchange Rate']['4. To_Currency Name'];

    ///Exchange rate
    dynamic exchangeRate =
        data['Realtime Currency Exchange Rate']['5. Exchange Rate'];

    ///Last refreshed
    dynamic mostRecentTime =
        data['Realtime Currency Exchange Rate']['6. Last Refreshed'];

    ///Time zone
    dynamic timeZone = data['Realtime Currency Exchange Rate']['7. Time Zone'];

    ///Bid price
    dynamic bidPrice = data['Realtime Currency Exchange Rate']['8. Bid Price'];

    ///Ask price
    dynamic askPrice = data['Realtime Currency Exchange Rate']['9. Ask Price'];

    ///Print to test
    print(fromCurrencyCode);
    print(fromCurrencyName);

    print(toCurrencyCode);
    print(toCurrencyName);

    print(exchangeRate);

    print(mostRecentTime);
    print(timeZone);

    print(bidPrice);
    print(askPrice);

    //print(function);
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
import 'package:flutter_app/api/base.dart';
import 'package:flutter_app/api/jsonObject.dart';
import 'dart:async';

class CryptoCurrencies extends Base {
  String _INTRADAY = "DIGITAL_CURRENCY_INTRADAY";
  String _DAILY = "DIGITAL_CURRENCY_DAILY";
  String _WEEKLY = "DIGITAL_CURRENCY_WEEKLY";
  String _MONTHLY = "DIGITAL_CURRENCY_MONTHLY";

  CryptoCurrencies(String key) : super(key);

  Future<JSONObject> getIntraday(String symbol, String market) {
    return this.getRequest(function: _INTRADAY, market: market);
  }

  Future<JSONObject> getDaily(String symbol, String market) {
    return this.getRequest(function: _DAILY, market: market);
  }

  Future<JSONObject> getWeekly(String symbol, String market) {
    return this.getRequest(function: _WEEKLY, market: market);
  }

  Future<JSONObject> getMonthly(String symbol, String market) {
    return this.getRequest(function: _MONTHLY, market: market);
  }
}
*/
