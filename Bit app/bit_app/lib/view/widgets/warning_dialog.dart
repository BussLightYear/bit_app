import 'package:flutter/material.dart';

showWarningDialog({@required context, @required String message}) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) => new AlertDialog(
            title: Text("Warning!"),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('Close me!'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.pop(context);
                },
              )
            ],
          ));
}
