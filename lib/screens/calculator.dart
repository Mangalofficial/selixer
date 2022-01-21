import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AquaCalc extends StatefulWidget {
  AquaCalc({Key key}) : super(key: key);

  @override
  _AquaCalcState createState() => _AquaCalcState();
}

class _AquaCalcState extends State<AquaCalc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
          'Aqua Calculator',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print('tap');
                  },
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: NetworkImage(
                            'https://img.icons8.com/clouds/2x/lake.png'),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 180),
                      child: Text(
                        'Volume & Area',
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
                  },
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: NetworkImage(
                            'https://image.flaticon.com/icons/png/512/2888/2888836.png'),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 180),
                      child: Text(
                        'Disinfection',
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
                  },
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        image: NetworkImage(
                            'https://img.icons8.com/clouds/2x/water.png'),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 180),
                      child: Text(
                        'Liming',
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
                  },
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        image: NetworkImage(
                            'https://image.flaticon.com/icons/png/128/4068/4068556.png'),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 180),
                      child: Text(
                        'Survival & Biomass',
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
                  },
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: NetworkImage(
                            'https://img.icons8.com/clouds/2x/fan-speed.png'),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 180),
                      child: Text(
                        'Aeration',
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
                  },
                  child: Container(
                    // height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: NetworkImage(
                            'https://img.icons8.com/clouds/2x/mine-cart.png'),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 180),
                      child: Text(
                        'Minerals',
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
      ),
    );
  }
}
