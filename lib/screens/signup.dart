import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/reusableWidgets.dart';
import 'home.dart';
import 'package:flutter_app/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'signup';

  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  // required for all forms
  final formKey = GlobalKey<FormState>();

  String email;
  String password;
  String name;

  /// Works with FireBase database to save user information.
  /// If the validate method returns true, call save() and return true. Otherwise
  /// do nothing and return false.
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  /// An asynchronous method that registers a new user to the FireBase database.
  /// If the validateAndSave() method returns true, a new user is created using
  /// the email and password string variables. Otherwise an error is thrown.
  void validateAndRegister() async {
    if (validateAndSave()) {
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: email, password: password))
            .user;
        print('Registered user: ${user.uid}');
        Navigator.pushNamed(context, LoginPage.id);
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    /// Controls starting point for content widgets
    double startHeight = MediaQuery.of(context).size.height / 8;

    /// This Material widget is used to create an account and subsequently log
    /// the user into it.
    /// This will be one of three ways for users to log into InvestME.
    /// Creates a Material Widget with an immediate child of MaterialButton widget
    final registerButton = Material(
      // how dimensional the button is (high up it is)
      elevation: 5.0,
      // rounded button
      borderRadius: BorderRadius.circular(0.0),
      color: Color(0xFF3ec28f),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        // function to log the user into the account
        onPressed: () {
          validateAndRegister();
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(color: Colors.white)),
      ),
    );
    // END LOGIN BUTTON

    /// This Material widget is used to log the user in with a Facebook account.
    /// This will be one of three ways for users to log into InvestME.
    /// Creates a Material Widget with an immediate child of MaterialButton
    /// Widget.
    final loginWithFBButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(0.0),
      color: Colors.blue[800],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        // Routes to the home page for now. Will need to be changed to FB.
        onPressed: () {
          Navigator.pushNamed(context, HomePage.id);
        },
        child: Text(
          "Log in with Facebook",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );

    /// This Material widget is used to log the user in with a Google account.
    /// This will be one of three ways for users to log into InvestME.
    /// Creates a Material Widget with an immediate child of MaterialButton
    /// Widget.
    final loginWithGoogleButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(0.0),
      color: Colors.red[900],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        // Routes to the home page for now. Will need to be changed to FB.
        onPressed: () {
          Navigator.pushNamed(context, HomePage.id);
        },
        child: Text(
          "Log in with Google",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );

    /// This align widget is used to properly align the text "or."
    final linkToSocialMediaConnect = Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          "OR",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
    Widget getRegistrationEmailField() {
      return TextFormField(
        validator: (value) =>
            value.isEmpty ? 'Email Address cannot be empty' : null,
        onSaved: (value) => email = value,
        // only needed for passwords
        obscureText: false,
        // implement app style
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          // background color
          fillColor: Colors.white,
          // fill with background color
          filled: true,
          hintText: "Email Address",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
          // when border is clicked
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      );
    }

    Widget getPasswordField() {
      return TextFormField(
        validator: (value) => value.isEmpty ? 'Password cannot be empty' : null,
        onSaved: (value) => password = value,
        // used to * password
        obscureText: true,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          fillColor: Colors.white,
          filled: true,
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      );
    }

    Widget getReenterPasswordField() {
      return TextFormField(
        validator: (value) => value.isEmpty ? 'Password cannot be empty' : null,
        onSaved: (value) => password = value,
        // used to * password
        obscureText: true,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          fillColor: Colors.white,
          filled: true,
          hintText: "Re-enter password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      );
    }

    Widget getNameField() {
      return TextFormField(
        validator: (value) => value.isEmpty ? 'Name cannot be empty' : null,
        onSaved: (value) => name = value,
        // used to * password
        obscureText: false,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          fillColor: Colors.white,
          filled: true,
          hintText: "Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      );
    }

    /// This Scaffold Widget renders the entire screen.
    /// The contents are contained with a SingleChildScrollView widget with its
    /// immediate child as a Center widget. The child of the Center widget is
    /// a container for the entire screen; this sets the background image for
    /// the page. The form then uses the widget variables to render the proper
    /// buttons and fields.
    return Scaffold(
      /* Back arrow to implemented after discussion
           leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.id);
              },*/
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background_login.png"),
                  fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getSizedBox(startHeight),
                  getTitle(),
                  getTextCaption(),
                  Form(
                    // MUST have form key for validation
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        getSizedBox(10.0),
                        getNameField(),
                        getRegistrationEmailField(),
                        getPasswordField(),
                        getReenterPasswordField(),
                        getSizedBox(10.0),
                        registerButton,
                        getSizedBox(7.0),
                        getSizedBox(12.5),
                        linkToSocialMediaConnect,
                        getSizedBox(12.5),
                      ],
                    ),
                  ),
                  loginWithFBButton,
                  getSizedBox(7.0),
                  loginWithGoogleButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
