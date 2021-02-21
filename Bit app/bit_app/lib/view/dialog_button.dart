import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const DialogButton({Key key, this.text, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _ancho = MediaQuery.of(context).size.width;
    return Card(
      child: FlatButton(
        minWidth: 100,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: _ancho * 0.045,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
