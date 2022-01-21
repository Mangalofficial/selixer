import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selixer/media/audio/home.dart';
import 'package:selixer/media/video/video.dart';
import 'package:selixer/pages/exit.dart';
import 'package:selixer/pages/settings.dart';
import 'package:selixer/screens/article.dart';
import 'package:selixer/screens/calculator.dart';
import 'package:selixer/screens/helpdesk.dart';
import 'package:selixer/screens/news.dart';
import 'package:selixer/screens/product.dart';
import 'package:selixer/screens/technician.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> _backPressed(BuildContext context) {
    debugPrint("_popExit");
    showDialog(
        context: context,
        builder: (_) => ExitDialog(),
        barrierDismissible: true);

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    var body = SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('tap');
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => AquaCalc(),
                    ),
                  );
                },
                // child: Container(
                //   width: MediaQuery.of(context).size.width * 0.5,
                //   // height: 150.0,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //     color: Colors.white,
                //   ),
                //   child: Image.network(
                //     'https://img.icons8.com/clouds/2x/apple-calculator.png',
                //     // height: 150.0,
                //     // width: 100.0,
                //   ),
                // ),
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                          'https://img.icons8.com/clouds/2x/apple-calculator.png'),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 180),
                    child: Text(
                      'Aqua Calculator',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tap');
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Help(),
                    ),
                  );
                },
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                          'https://img.icons8.com/clouds/2x/headset.png'),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 180),
                    child: Text(
                      'Help Desk',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('tap');
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => News(),
                    ),
                  );
                },
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                          'https://img.icons8.com/clouds/2x/news.png'),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 180),
                    child: Text(
                      'Aqua News',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tap');
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Articles(),
                    ),
                  );
                },
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                          'https://img.icons8.com/clouds/2x/book.png'),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 180),
                    child: Text(
                      'Aqua Articles',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('tap');
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Products(),
                    ),
                  );
                },
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                          'https://img.icons8.com/clouds/2x/product.png'),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 180),
                    child: Text(
                      'Selixer Prducts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('tap');
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Technician(),
                    ),
                  );
                },
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                          'https://img.icons8.com/clouds/2x/people.png'),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 180),
                    child: Text(
                      'Find Technician',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return WillPopScope(
      onWillPop: () => _backPressed(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBody: true,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => VideoRecorder(),
                    ),
                  ),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => AudioHome(),
                    ),
                  ),
                  child: const Icon(
                    Icons.mic_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: body,
          backgroundColor: Colors.lightGreen.shade50,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              'SELIXER',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Raleway',
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
