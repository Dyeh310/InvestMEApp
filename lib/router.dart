import 'package:flutter/material.dart';
import 'package:flutter_app/routing_constants.dart';
import 'package:flutter_app/screens/myStocks.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/newEntry.dart';
import 'package:flutter_app/screens/login.dart';
import 'package:flutter_app/screens/previous_expenditures.dart';
import 'package:flutter_app/screens/signup.dart';
import 'package:flutter_app/screens/confirmation.dart';
import 'package:flutter_app/screens/introTutorial.dart';
import 'package:flutter_app/screens/compareStocks.dart';
import 'package:flutter_app/screens/searchStocks.dart';
import 'package:flutter_app/screens/settings.dart';
import 'package:flutter_app/screens/loading.dart';

///testing
import 'package:flutter_app/screens/searchStocksTest.dart';
import 'package:flutter_app/screens/loadingTest.dart';
import 'package:flutter_app/api/crypto.dart';
import 'package:flutter_app/api/timeSeries.dart';
import 'package:flutter_app/api/search.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginPageRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());

    case SignUpPageRoute:
      return MaterialPageRoute(builder: (context) => SignUpPage());

    case HomePageRoute:
      return MaterialPageRoute(builder: (context) => HomePage());

    case NewEntryPageRoute:
      return MaterialPageRoute(builder: (context) => NewEntryPage());

    case PreviousExpendituresPageRoute:
      return MaterialPageRoute(
          builder: (context) => PreviousExpendituresPage());

    case ConfirmationPageRoute:
      return MaterialPageRoute(builder: (context) => ConfirmationPage());

    case IntroTutorialPageRoute:
      return MaterialPageRoute(builder: (context) => IntroTutorialPage());

    case CompareStocksPageRoute:
      return MaterialPageRoute(builder: (context) => CompareStocksPage());

    case MyStocksPageRoute:
      return MaterialPageRoute(builder: (context) => MyStocksPage());

    case SearchStocksPageRoute:
      return MaterialPageRoute(builder: (context) => SearchStocksPage());

    case SearchStocksTestPageRoute:
      return MaterialPageRoute(builder: (context) => SearchStocksTestPage());

    case SettingsPageRoute:
      return MaterialPageRoute(builder: (context) => SettingsPage());

    case LoadingPageRoute:
      return MaterialPageRoute(builder: (context) => LoadingPage());

    case LoadingTestPageRoute:
      return MaterialPageRoute(builder: (context) => LoadingTestPage());

    case CryptoRoute:
      return MaterialPageRoute(builder: (context) => Crypto());

    case TimeSeriesRoute:
      return MaterialPageRoute(builder: (context) => TimeSeries());
      
    case SearchRoute:
      return MaterialPageRoute(builder: (context) => Search());
      
    default:
      return MaterialPageRoute(builder: (context) => LoginPage());
  }
}
