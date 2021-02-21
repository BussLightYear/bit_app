import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget {
  final String text;
  final Function onTap;

//Contructor constante construye el widget más rapido en pantalla por memoria "cache"
  const DrawerOption({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(
            '> $text',
            style: TextStyle(
              color: Colors.black45,
              fontSize: _ancho * 0.045,
            ),
          ),
        ),
        SizedBox(
          height: _altura * 0.02,
        ),
      ],
    );
  }
}
