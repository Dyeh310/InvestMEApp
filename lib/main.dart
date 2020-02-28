import 'package:flutter/material.dart';
import 'package:flutter_app/router.dart' as router;
import 'package:flutter_app/screens/myStocks.dart';
import 'package:flutter_app/screens/confirmation.dart';
import 'package:flutter_app/screens/help.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/introTutorial.dart';
import 'package:flutter_app/screens/previous_expenditures.dart';
import 'package:flutter_app/screens/report_problem.dart';
import 'package:flutter_app/screens/settings.dart';
import 'package:flutter_app/screens/signup.dart';
import 'package:flutter_app/screens/login.dart';
import 'package:flutter_app/screens/support_us.dart';
import 'package:flutter_app/screens/terms_and_policies.dart';
import 'screens/newEntry.dart';
import 'package:flutter_app/screens/compareStocks.dart';
import 'package:flutter_app/screens/searchStocks.dart';
import 'package:flutter_app/screens/loading.dart';

///testing
import 'package:flutter_app/screens/searchStocksTest.dart';
import 'package:flutter_app/api/timeSeries.dart';
import 'package:flutter_app/api/crypto.dart';
import 'package:flutter_app/screens/loadingTest.dart';
import 'package:flutter_app/api/search.dart';

void main() => runApp(InvestMe());

class InvestMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //removes debug banner
      debugShowCheckedModeBanner: false,

      title: 'Named Routing',
      onGenerateRoute: router.generateRoute,

      initialRoute: CompareStocksPage.id,

      routes: {
        LoginPage.id: (context) => LoginPage(),
        SignUpPage.id: (context) => SignUpPage(),
        ConfirmationPage.id: (context) => ConfirmationPage(),
        IntroTutorialPage.id: (context) => IntroTutorialPage(),
        PreviousExpendituresPage.id: (context) => PreviousExpendituresPage(),
        HomePage.id: (context) => HomePage(),
        NewEntryPage.id: (context) => NewEntryPage(),
        SettingsPage.id: (context) => SettingsPage(),
        SupportUsPage.id: (context) => SupportUsPage(),
        ReportProblemPage.id: (context) => ReportProblemPage(),
        HelpPage.id: (context) => HelpPage(),
        TermsandPoliciesPage.id: (context) => TermsandPoliciesPage(),
        CompareStocksPage.id: (context) => CompareStocksPage(),
        SearchStocksPage.id: (context) => SearchStocksPage(),
        MyStocksPage.id: (context) => MyStocksPage(),
        LoadingPage.id: (context) => LoadingPage(),

        ///Testing
        SearchStocksTestPage.id: (context) => SearchStocksPage(),
        Crypto.id: (context) => Crypto(),
        TimeSeries.id: (context) => TimeSeries(),
        LoadingTestPage.id: (context) => LoadingTestPage(),
        Search.id: (context) => Search(),
      },
    );
  }
}
