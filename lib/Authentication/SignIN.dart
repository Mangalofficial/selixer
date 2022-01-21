import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:selixer/Animation/animation.dart';
import 'package:selixer/Authentication/SignUP.dart';
import 'package:selixer/pages/home.dart';

class SignIN extends StatefulWidget {
  @override
  _SignINState createState() => _SignINState();
}

class Authvar {
  static var username1 = "not yet";
  static var usermob1 = "not yet";
  static var usermail1 = "not yet";
  static var userlast;
}

enum Authstatus {
  _signedIn,
  _notsignedIn,
}

// ignore: non_constant_identifier_names
AppToast(String state) {
  Fluttertoast.showToast(
      msg: state,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[300],
      textColor: Colors.black,
      fontSize: 16.0);
}

bool _passwordVisible = false;
@override
void initState() {
  _passwordVisible = false;
}

class _SignINState extends State<SignIN> {
  var authc = FirebaseAuth.instance;
  FirebaseFirestore fsconnect = FirebaseFirestore.instance;
  Authstatus _authstatus = Authstatus._notsignedIn;

  @override
  void initState() {
    super.initState();
    setState(() {
      {
        _authstatus = FirebaseAuth.instance.currentUser != null
            ? Authstatus._signedIn
            : Authstatus._notsignedIn;
      }
    });
  }

  var _islogged = false;
  bool error = false;
  bool invalid = false;
  String email;
  String password;
  String username;
  String usermob;

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var Authbody = Center(
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  .1,
                  .6,
                  .9
                ],
                colors: [
                  Color(0xff2980b9),
                  Color(0xff29dfb7),
                  Color(0xff2980b9)
                ])),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                      1,
                      Container(
                        height: 120,
                        width: 350,
                        child: Image.asset('assets/BlueFishStream.png',
                          // 'https://aquacare.com/wp-content/uploads/2020/04/BlueFishStream.png',
                          alignment: Alignment.center,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.8,
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          child: Center(
                            child: Text(
                              "SELIXER",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 40,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                2,
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.78,
                  decoration: BoxDecoration(
                    color: Colors.grey[50].withOpacity(0.5),
                    borderRadius: BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FadeAnimation(
                          1.6,
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.grey,
                            autofocus: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: 0, left: 35, right: 5, bottom: 0),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              fillColor: Colors.black,
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              errorText: invalid ? 'Invalid user' : null,
                              labelText: 'Email Address',
                              prefixIcon: const Icon(
                                Icons.email,
                              ),
                              suffixStyle: const TextStyle(color: Colors.black),
                            ),
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FadeAnimation(
                          2.1,
                          TextField(
                            obscureText: !_passwordVisible,
                            cursorColor: Colors.grey,
                            autofocus: false,
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: 0, left: 35, right: 5, bottom: 0),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                                  borderSide: BorderSide(color: Colors.black)),
                              labelText: 'Password',
                              fillColor: Colors.black,
                              errorText: invalid ? 'Invalid password' : null,
                              prefixIcon: const Icon(
                                Icons.lock,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              suffixStyle: TextStyle(color: Colors.black),
                            ),
                            onChanged: (value) {
                              setState(() {
                                invalid = false;
                              });
                              password = value;
                            },
                          ),
                        ),
                      ),
                      FadeAnimation(
                        2.2,
                        FlatButton(
                          onPressed: () {
                            print(_authstatus);
                          },
                          //alignment: Alignment.centerRight,
                          //margin:
                          //    EdgeInsets.only(right: 15, top: 10, bottom: 20),
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      FadeAnimation(
                        2.5,
                        RaisedButton(
                          padding: EdgeInsets.all(0.0),
                          onPressed: () async {
                            if (password != null && email != null) {
                              var result;
                              setState(() {
                                _islogged = true;
                              });
                              try {
                                result = await authc.signInWithEmailAndPassword(
                                    email: email, password: password);
                                print(authc.currentUser.uid);
                                var retrived = await fsconnect
                                    .collection("user")
                                    .doc(authc.currentUser.uid)
                                    .get();
                                print(retrived.data());
                                var temp = retrived.data();
                                Authvar.usermob1 = temp['mob'];
                                Authvar.usermail1 = temp['mail'];
                                Authvar.username1 = temp['Name'];
                                Authvar.userlast =
                                    authc.currentUser.metadata.lastSignInTime;
                                setState(() {
                                  _islogged = false;
                                });
                              } catch (e) {
                                print(e);
                                setState(() {
                                  invalid = true;
                                  _islogged = false;
                                });
                              }
                              print(result);
                              if (result != null) {
                                setState(() {
                                  _islogged = false;
                                  invalid = false;
                                });
                                print('logged in');
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return HomePage();
                                  }),
                                );
                              }
                            } else {
                              AppToast("No Credentials found");
                            }
                          },
                          elevation: 8,
                          highlightColor: Colors.grey[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          //backgroundColor: Colors.black,
                          child: _islogged
                              ? Transform.scale(
                              scale: 0.6,
                              child: CircularProgressIndicator(
                                  backgroundColor: Colors.white))
                              : Ink(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            decoration: BoxDecoration(
                              color: Color(0xff622F74),
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xff2980b9),
                                  const Color(0xff29dfb7),
                                ],
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 60.0, minHeight: 37.0),
                              alignment: Alignment.center,
                              child: Text(
                                "LOGIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      FadeAnimation(
                        2.8,
                        Container(
                          child: Center(
                            child: Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FadeAnimation(
                        3,
                        Container(
                          child: GestureDetector(
                            child: Center(
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            onTap: () {
                              print('SignUP');
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUP()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );

    switch (_authstatus) {
      case Authstatus._notsignedIn:
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.black,
            brightness: Brightness.light,
            primarySwatch: Colors.grey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Scaffold(body: Authbody),
        );
      case Authstatus._signedIn:
        return HomePage();
    }
  }
}
