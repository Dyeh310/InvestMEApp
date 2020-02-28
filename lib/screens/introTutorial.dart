//import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/reusableWidgets.dart';
import 'home.dart';

class IntroTutorialPage extends StatefulWidget {
  static const String id = 'introtutorial';

  IntroTutorialPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _IntroTutorialPageState createState() => _IntroTutorialPageState();
}

class _IntroTutorialPageState extends State<IntroTutorialPage> {
  /// The TextStyle widget applies general text styles to parts of the app.
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  /// This style is used for the caption below the sentiment_satisfied icon.
  ///
  /// A decreased size and lighter color (grey) to avoid unnecessary visual clutter
  /// for the user
  TextStyle captionStyle =
      TextStyle(color: Colors.grey, fontFamily: 'Montserrat', fontSize: 12.0);

  /// Icon of a happy face used on the welcome slide
  static const IconData sentiment_satisfied =
      IconData(0xe815, fontFamily: 'MaterialIcons');

  /// Icon of some books used on the second slide to symbolize the different things
  /// that InvestME can do.
  static const IconData storage = IconData(0xe1db, fontFamily: 'MaterialIcons');

  /// Icon of a cloud to symbolize the cloud storage feature.
  static const IconData cloud_done =
      IconData(0xe2bf, fontFamily: 'MaterialIcons');

  /// Icon of a dollar sign to symbolize the idea of investing/saving.
  static const IconData attach_money =
      IconData(0xe227, fontFamily: 'MaterialIcons');

  /// Icon of a building to symbolize the idea of comparing stock data to
  /// expenditures
  static const IconData business =
      IconData(0xe0af, fontFamily: 'MaterialIcons');

  /// Icon of a forward arrow used for bullet points.
  static const IconData arrow_forward =
      IconData(0xe5c8, fontFamily: 'MaterialIcons', matchTextDirection: true);

  @override
  Widget build(BuildContext context) {
    var _controller = new PageController(initialPage: 2);

    var slides = new List();

    // --------------------------FIRST SLIDE---------------------------
    /// The first slide of the Introduction tutorial.
    ///
    /// This slides welcomes the user to the application and summarizes
    /// the purpose of the app. The SingleChildScrollView renders the slide
    ///  and contains an Icon and two text fields. Swiping in either direction
    ///  also moves the user to the next slide.
    final firstSlide = SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                  // Happy face icon to welcome to the user.
                  child: Icon(
                    Icons.sentiment_satisfied,
                    size: 200,
                  ),
                ),
                getSizedBox(60),
                Text(
                  "Welcome!",
                  style: TextStyle(fontSize: 45),
                ),
                Text(
                  'This tutorial will help you understand the purpose, goals, and features of InvestME.',
                  style: captionStyle,
                ),
                getSizedBox(35.0),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(0.0),
                  color: Color(0xFF43A047),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    // TODO
                    // allow for the the user to go to the next slide
                    onPressed: () {
                      _controller.jumpToPage(1);
                    },
                    child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                getSizedBox(30),
              ],
            ),
          ),
        ),
      ),
    );

    // --------------------------SECOND SLIDE---------------------------
    /// The second slide gives a more detailed overview of InvestME.
    ///
    /// This slide is rendered by the SingleChildScrollView widget. It
    /// contains an icon and two text widgets to describe, in detail,
    /// what exactly this app is and does.
    final secondSlide = SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // book-looking icon
                Material(
                  child: Icon(
                    Icons.storage,
                    size: 100,
                  ),
                ),
                getSizedBox(35),
                Text(
                  "What is InvestME?",
                  style: TextStyle(fontSize: 35),
                ),
                // add spacing
                getSizedBox(15),
                Text(
                  'To put it simply, this app was designed to encourage people to spend their money better. Do you ever look in your bank '
                  'account and see a list of charges on things that, let’s be honest, you don’t really need? Are you so used to it you don\'t even care?'
                  ' Or do you ask yourself, '
                  '“Imagine what I could have done if I saved this money?” '
                  'That is the question we are here to answer. And the answer is A LOT! This app is here to provide a place to not only log your recent expenditures, but also show a better way to spend!',
                  style: TextStyle(fontSize: 15),
                  // justify left
                  textAlign: TextAlign.left,
                ),
                // add spacing
                getSizedBox(35.0),
                Material(
                  // raise the bottom for depth
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(0.0),
                  color: Color(0xFF43A047),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    // TODO
                    // allow for the the user to go to the next slide
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // add spacing
                getSizedBox(30),
              ],
            ),
          ),
        ),
      ),
    );

    // --------------------------THIRD SLIDE---------------------------
    /// The third slide contains a brief explanation of useful features
    /// for InvestME.
    ///
    /// The entire slide is rendered by the SingleChildView widget. This
    /// slide implements the Row widget three times in order to show
    /// visually descriptive icons and the feature list side-by-side.
    /// The purpose of this slide is to describe some of the most important
    /// features, and a brief description, of the application.
    final thirdSlide = SingleChildScrollView(
      child: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Features",
                  style: TextStyle(fontSize: 45),
                ),
                // add spacing
                getSizedBox(25),

                /// First Feature: contains information on the "Log
                /// Your Expenditures" feature.
                Row(
                  children: <Widget>[
                    Container(
                      child: Material(
                        child: Icon(
                          Icons.cloud_done,
                          size: 50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 250,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Log Your Expenditures",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                            Text(
                              'Bought something frivolous? Make a new entry and add it to your log! '
                              'Our database will keep a record of the time, date, and amount spent.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                getSizedBox(10),

                /// Second Feature: Contains information on the "Check
                /// Current Stock Data" feature.
                Row(
                  children: <Widget>[
                    Container(
                      child: Material(
                        child: Icon(
                          Icons.attach_money,
                          size: 50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 250,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Check Current Stock Data",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              'Learning about saving and investing is exactly what this app is about! '
                              'You can easily search for up-to-date stock prices to help improve your investing.',
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                getSizedBox(10),

                /// Third Feature: Contains information on the "Compare
                /// Stock Data" feature.
                Row(
                  children: <Widget>[
                    Container(
                      child: Material(
                        child: Icon(
                          Icons.business,
                          size: 50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 250,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Compare Stock Data",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              'Wouldn’t you like to know just how much money you wasted? Easy! Set up a time frame and the '
                              'app will show you. Let’s take it one step further: '
                              'compare that money to current stock data to see just how much you could have invested! ',
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                getSizedBox(35.0),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(0.0),
                  color: Color(0xFF43A047),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    // TODO
                    // allow for the the user to go to the next slide
                    // TODO
                    // Keep next button in the same spot on all slides
                    onPressed: () {
                      _controller.jumpToPage(3);
                    },
                    child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // add spacing
                getSizedBox(30),
              ],
            ),
          ),
        ),
      ),
    );

    // --------------------------Fourth SLIDE---------------------------
    /// The fourth slide of the Introduction Tutorial contains detailed
    /// information on how to get started with InvestME.
    ///
    /// This slide is rendered by the SingleChildScrollView widget. It
    /// contains several Row widgets in order to place the icons and
    /// information side-by-side.
    final fourthSlide = SingleChildScrollView(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Get Started!',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                getSizedBox(45),

                /// First Bullet: this describes how/where to go for adding
                /// a new expenditure to the user's log.
                Row(
                  children: <Widget>[
                    Container(
                      child: Material(
                        child: Icon(
                          Icons.arrow_forward,
                          size: 50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 250,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Where to Start?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              'To start, why not click the “New Entry” button. This will bring you to our Expenditure page where you can '
                              'add the amount of a recent purchase, name the purchase, and tack on any additional information. '
                              'That’s it! Click Save. This entry will now be logged and saved to your account. Do this for anything you want to keep track of!',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // add spacing
                getSizedBox(10),

                /// Second Bullet: This explains how to see the Recordsings
                /// Page, which shows past expendtures.
                Row(
                  children: <Widget>[
                    Container(
                      child: Material(
                        child: Icon(
                          Icons.arrow_forward,
                          size: 50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 250,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Past Expenditures",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              'Anytime that you want to see where your money is going, '
                              'take a look! Press the Menu Icon at the top left corner and then touch '
                              '"Previous Expenditures." From here you can select a date range to show all '
                              'expenditures during that time.',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                getSizedBox(10),

                /// Third Bullet: This shows to get to the Compare Stock
                /// Market Data Page.
                Row(
                  children: <Widget>[
                    Container(
                      child: Material(
                        child: Icon(
                          Icons.arrow_forward,
                          size: 50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        width: 250,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Compare Data",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              'Press the menu icon, again. This time try “Compare Stock Data.” This page will give you a way to compare your expenditures to up-to-date stock prices. '
                              'Our goal is to show you exactly what you could be doing with your money.',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                getSizedBox(15.0),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(0.0),
                  color: Color(0xFF43A047),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    // TODO
                    // allow for the the user to go to the next slide
                    onPressed: () {
                      Navigator.pushNamed(context, HomePage.id);
                    },
                    child: Text(
                      'Start!',
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                getSizedBox(60),
              ],
            ),
          ),
        ),
      ),
    );

    slides.add(firstSlide);
    slides.add(secondSlide);
    slides.add(thirdSlide);
    slides.add(fourthSlide);

    /// The entire rendered screen is wrapped in a Material App widget.
    ///
    /// The MaterialApp widget is employed to change the ThemeData of the app
    /// to white. In other applications, the default color has been set to a
    /// green.
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              }
              // Below code can be implemented for back functionality
              // => Navigator.pop(context, false),
              ),
          // right hand side of the app bar.
          actions: <Widget>[
            Padding(
              // add padding to center 'InvestME'
              padding: const EdgeInsets.all(20.0),
              child: Text('InvestME'),
            ),
          ],
        ),
        body: PageView.builder(
          controller: _controller,
          itemBuilder: (context, position) => slides[position],
          itemCount: slides.length,
        ),
      ),
    );
  }
}
