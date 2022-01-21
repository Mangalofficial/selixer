import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:selixer/Authentication/SignIN.dart';
import 'package:selixer/pages/about.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var authc = FirebaseAuth.instance;

  _sendingMails() async {
    const url = 'mailto:manglam235@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _sendingCalls() async {
    const mob = 'tel://6386685428';
    if (await canLaunch(mob)) {
      await launch(mob);
    } else {
      throw 'Could not launch $mob';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade100,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      //   title: Padding(
      //     padding: const EdgeInsets.only(left: 8),
      //     child: Text('Settings'),
      //   ),
      //   // actions: [
      //   //   Padding(
      //   //     padding: const EdgeInsets.only(right: 10),
      //   //     child: IconButton(
      //   //       icon: Icon(
      //   //         Icons.info_outline,
      //   //         size: 27,
      //   //       ),
      //   //       onPressed: () {},
      //   //     ),
      //   //   )
      //   // ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.person_outline_outlined,
                size: 27,
              ),
              title: Text(
                'Profile',
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                size: 28,
              ),
              title: Text("About us"),
              onTap: () {
                Navigator.push(
                    context, CupertinoPageRoute(builder: (context) => About()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.star_border,
                size: 28,
              ),
              title: Text("Rate us"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.people_alt_outlined,
                size: 27,
              ),
              title: const Text("Contact Support"),
              onTap: () {
                return showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                    ),
                    builder: (context) {
                      return Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text('Send email'),
                            onTap: () {
                              print('Send email');
                              _sendingMails();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text('Call phone'),
                            onTap: () {
                              print('Call phone');
                              _sendingCalls();
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
            ListTile(
                leading: Icon(
                  Icons.power_settings_new,
                  size: 27,
                ),
                title: Text(
                  'LogOut',
                ),
                onTap: () async {
                  await authc.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIN(),
                      ));
                }),
            ListTile(
              leading: Icon(
                Icons.category,
                size: 27,
              ),
              title: const Text("Version [ v1.0.0 ]"),
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
