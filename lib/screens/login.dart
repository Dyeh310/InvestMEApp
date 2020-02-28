import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/reusableWidgets.dart';
import 'signup.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login';

  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  // required for all forms
  final formKey = GlobalKey<FormState>();

  // email and password variables
  String email;
  String password;

  /* Save user information (needed for firebase authentication) */
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  // Sign in with registered user
  void validateAndSignIn() async {
    if (validateAndSave()) {
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: email, password: password))
            .user;
        print('Signed in: ${user.uid}');
        Navigator.pushNamed(context, HomePage.id);
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    // controls starting point for content widgets
    double startHeight = MediaQuery.of(context).size.height / 4;

    final loginButton = Material(
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
          validateAndSignIn();
        },
        child: Text("Log In",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    /// Text and Inkwell widget used together to navigate to the SignUpPage.
    /// The Text widget has no affect when pressed. It contains the phrase "Don't
    /// have an account?" From here, the Inkwell widget is used as an interactive
    /// widget that will take the user to the SignUpPage when pressed. Both widgets are
    /// wrapped in a Row widget to give the horizontal affect.
    final linkToSignUp = Align(
      // Bring the text  to the left
      alignment: Alignment.centerLeft,
      // Needed for horizontal display
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "Don't have an account?",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            child: Text(
              "Sign up!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            // Function to navigate to the sign up page
            onTap: () {
              Navigator.pushNamed(context, SignUpPage.id);
            },
          ),
        ],
      ),
    );

    /// This Align Widgets wraps an Inkwell to make the text interactive.
    /// The "Forgot your password?" text brings will bring the user to a page
    /// where he/she can retrieve his/her password.
    final linkToForgotPassword = Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          child: Text(
            "Forgot your password?",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          // Ripple effect will appear upon implementation
          // TODO
          // This needs to be implemented to assist the user in recovering a
          // lost account or password.
          onTap: () {},
        ),
      ),
    );

    /// This Scaffold Widget renders the entire screen.
    /// The contents are contained with a SingleChildScrollView widget with its
    /// immediate child as a Center widget. The child of the Center widget is
    /// a container for the entire screen; this sets the background image for
    /// the page. The form contains the two TextInputFields and the MaterialButton
    /// that submits the data for authentication. The purpose of this page is to
    /// allow the user to login to the application, direct the user to account
    /// creation, or help the user in recovering a password.
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            // Container to take up the entire screen
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background_login.png"),
                  fit: BoxFit.fill),
            ),
            // padding for the entire screen, minus the background image
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                // placing of children in layout
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Start app content
                  // widgets are found in widgets/reusableWidgets
                  getSizedBox(startHeight),
                  getTitle(),
                  getTextCaption(),
                  Form(
                    // MUST have form key for validation
                    key: formKey,
                    child: Column(
                      // wigets are found in widgets/reusableWidgets
                      children: <Widget>[
                        // spacing
                        getSizedBox(10.0),
                        // email widget
                        getEmailField(),
                        // spacing
                        getSizedBox(2.0),
                        // email widget
                        getPasswordField(),
                        //Navigate to Forgot Password
                        linkToForgotPassword,
                        // spacing
                        getSizedBox(30.0),
                      ],
                    ),
                  ),
                  loginButton,
                  linkToSignUp,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // EMAIL FIELD
  Widget getEmailField() {
    return TextFormField(
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      onSaved: (value) => email = value,
      // only needed for passwords
      obscureText: false,
      // implement app style
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
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
// END EMAIL FIELD

// PASSWORD FIELD
  Widget getPasswordField() {
    return TextFormField(
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      onSaved: (value) => password = value,
      // used to * password
      obscureText: true,
      // implement text style
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        // set the background color of the field
        fillColor: Colors.white,
        // fill with background color
        filled: true,
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
        focusedBorder: OutlineInputBorder(
          // when border is clicked
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
    );
  }
// END PASSWORD FIELD
}
