import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  final String appBarText;
  final Color backColor;
  final double elevation;

  AppBarCustom({
    Key key,
    @required this.appBarText,
    this.backColor = Colors.white,
    this.elevation = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backColor,
      elevation: elevation,
      iconTheme: IconThemeData(color: Colors.black38),
      title: Text(
        appBarText,
        style: TextStyle(color: Colors.black38),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(Icons.favorite),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
