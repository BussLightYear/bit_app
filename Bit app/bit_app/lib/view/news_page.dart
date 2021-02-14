import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    //Bloqueamos orientación
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black38),
        title: Text(
          'BIT News',
          style: TextStyle(color: Colors.black38),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.favorite),
          )
        ],
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Drawer(
          elevation: 50,
          child: SizedBox(
            height: _altura,
            // width: _ancho,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _altura * 0.17,
                  child: DrawerHeader(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.only(top: _altura * 0.05),
                      child: SizedBox(
                        // height: _altura * 0.1,
                        width: _ancho * 0.45,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: ColorFiltered(
                            child: Image.asset('assets/img/bit.png'),
                            colorFilter: ColorFilter.mode(
                                Colors.black38, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    '> All articles about Bitcoint from the last month, sorted by recent first',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: _ancho * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: _altura * 0.04,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    '> Top business headlines in the US right now',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: _ancho * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: _altura * 0.04,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    '> Top headlines from TechCrunch right now',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: _ancho * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: _altura * 0.04,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    '> All articles published by the Wall Street Journal in the last 6 months, sorted by recent first',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: _ancho * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: _altura * 0.38,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                      ),
                      SizedBox(
                        width: _ancho * 0.03,
                      ),
                      Text(
                        'Log out',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: _ancho * 0.045,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
