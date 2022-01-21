import 'package:flutter/material.dart';

class Technician extends StatefulWidget {
  Technician({Key key}) : super(key: key);

  @override
  _TechnicianState createState() => _TechnicianState();
}

class _TechnicianState extends State<Technician> {
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
          'Find Technician',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
