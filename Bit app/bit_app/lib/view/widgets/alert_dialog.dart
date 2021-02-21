import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dialog_button.dart';

class AlertDial extends StatelessWidget {
  final String text;
  final Function onPressedYes;
  final Function onPressedNo;

  AlertDial({Key key, this.onPressedYes, this.onPressedNo, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _ancho = MediaQuery.of(context).size.width;

    return AlertDialog(
      insetPadding: EdgeInsets.all(10),
      content: Text(
        text,
        style: GoogleFonts.signika(
            fontSize: _ancho * 0.042,
            color: Colors.black45,
            fontWeight: FontWeight.normal),
      ),
      actions: [
        DialogButton(
          text: 'NO',
          onPressed: onPressedNo,
        ),
        DialogButton(
          text: 'YES',
          onPressed: onPressedYes,
        ),
      ],
    );
  }
}
