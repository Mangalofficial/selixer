import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selixer/Animation/animation.dart';

class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
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

class _SignUPState extends State<SignUP> {
  var authc = FirebaseAuth.instance;
  FirebaseFirestore fsconnect = FirebaseFirestore.instance;
  GlobalKey<NavigatorState> _yourKey = GlobalKey<NavigatorState>();

  Future<bool> _backPressed(GlobalKey<NavigatorState> _yourKey) async {
    if (_yourKey.currentState.canPop()) {
      _yourKey.currentState.maybePop();
      return Future<bool>.value(false);
    }
    return Future<bool>.value(true);
  }

  var _islogged = false;
  bool error = false;
  bool invalid = false;
  String email, password, username, usermob;

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _backPressed(_yourKey),
      child: Scaffold(
        body: Center(
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
                    height: 60,
                  ),
                  FadeAnimation(
                    1,
                    Container(
                      height: 120,
                      width: 380,
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
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                    2,
                    Container(
                      height: MediaQuery.of(context).size.height * 0.55,
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
                              1.4,
                              TextField(
                                keyboardType: TextInputType.text,
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
                                  hintStyle:
                                  TextStyle(color: Colors.grey.shade400),
                                  //errorText: invalid ? 'Invalid user' : null,

                                  labelText: 'Full Name',
                                  prefixIcon: Icon(
                                    Icons.person,
                                    size: 20,
                                  ),
                                  suffixStyle:
                                  const TextStyle(color: Colors.black),
                                ),
                                onChanged: (value) {
                                  username = value;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FadeAnimation(
                              1.8,
                              TextField(
                                keyboardType: TextInputType.number,
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
                                  hintStyle:
                                  TextStyle(color: Colors.grey.shade400),
                                  //errorText: invalid ? 'Invalid user' : null,

                                  labelText: 'Phone Number',
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    size: 20,
                                  ),
                                  suffixStyle:
                                  const TextStyle(color: Colors.black),
                                ),
                                onChanged: (value) {
                                  usermob = value;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FadeAnimation(
                              2.2,
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
                                  hintStyle:
                                  TextStyle(color: Colors.grey.shade400),
                                  errorText: error ? 'Invalid email' : null,
                                  labelText: 'Email Address',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    size: 20,
                                  ),
                                  suffixStyle:
                                  const TextStyle(color: Colors.black),
                                ),
                                onChanged: (value) {
                                  email = value;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FadeAnimation(
                              2.6,
                              TextField(
                                obscureText: !_passwordVisible,
                                keyboardType: TextInputType.text,
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
                                  hintStyle:
                                  TextStyle(color: Colors.grey.shade400),
                                  //errorText: invalid ? 'Invalid user' : null,
                                  labelText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: 20,
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
                                  suffixStyle:
                                  const TextStyle(color: Colors.black),
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
                          SizedBox(
                            height: 15,
                          ),
                          FadeAnimation(
                            2.9,
                            RaisedButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: () async {
                                if (usermob != null &&
                                    username != null &&
                                    password != null &&
                                    email != null) {
                                  setState(() {
                                    _islogged = true;
                                  });
                                  print(password);
                                  var result;

                                  try {
                                    result = await authc
                                        .createUserWithEmailAndPassword(
                                      email: email,
                                      password: password,
                                    );
                                    print(authc.currentUser.uid);
                                    await fsconnect
                                        .collection("user")
                                        .doc(authc.currentUser.uid)
                                        .set(
                                      {
                                        "Name": username,
                                        "mob": usermob,
                                        "mail": email,
                                      },
                                    );

                                    print('logged in');
                                    setState(() {
                                      _islogged = false;
                                    });
                                  } catch (e) {
                                    print(e);
                                    setState(() {
                                      error = true;
                                      _islogged = false;
                                    });
                                  }
                                  print("RESULT = $result");
                                  if (result != null) {
                                    setState(() {
                                      _islogged = true;
                                      invalid = true;
                                    });
                                    Navigator.pop(context);
                                  }
                                } else {
                                  AppToast("No Credentials found");
                                }
                              },
                              elevation: 8,
                              highlightColor: Colors.grey[50],
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                              child: _islogged
                                  ? Transform.scale(
                                  scale: 0.6,
                                  child: CircularProgressIndicator(
                                      backgroundColor: Colors.white))
                                  : Ink(
                                padding:
                                EdgeInsets.only(left: 30, right: 30),
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
                                  borderRadius:
                                  BorderRadius.circular(30.0),
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 62.0, minHeight: 37.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "SIGN UP",
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
                            height: 15,
                          ),
                          FadeAnimation(
                            3.1,
                            Container(
                                margin: EdgeInsets.only(top: 15),
                                child: GestureDetector(
                                  child: Text(
                                    "Go back to login page",
                                    style:
                                    TextStyle(color: Colors.grey.shade100),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
