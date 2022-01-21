import 'dart:io';
import 'package:flutter/material.dart';

class ExitDialog extends StatefulWidget {
  const ExitDialog({
    Key key,
  }) : super(key: key);

  @override
  _ExitDialogState createState() => _ExitDialogState();
}

class _ExitDialogState extends State<ExitDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ListTile(
        title: Text(
          "Confirm Exit",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.deepPurple,
          ),
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          "Do you want to quit the App?",
          style: TextStyle(
            //fontSize: 25,
            color: Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      content: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          RaisedButton(
              color: Colors.grey.shade800,
              child: Text(
                'Cancel',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              }),
          SizedBox(
            width: 40,
          ),
          RaisedButton(
              color: Colors.red,
              child: Text(
                'Exit',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              onPressed: () {
                exit(0);
              }),
        ],
      ),
    );
  }
}
