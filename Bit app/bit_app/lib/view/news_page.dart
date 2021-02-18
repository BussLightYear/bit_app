import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bit_app/presenter/build_news_view.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int tipoDeNoticias = 1;
  String nombreDeVista = 'NewsList';

  @override
  Widget build(BuildContext context) {
    //Bloqueamos orientación
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    final double _drawerUsefullHeight = _altura - _statusBarHeight;
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
      drawer: Padding(
        padding: EdgeInsets.only(top: _statusBarHeight),
        //Colocamos esquinas redondeades del drawer
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Drawer(
            elevation: 50,
            child: SizedBox(
              height: _drawerUsefullHeight,
              // width: _ancho,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CabeceraBit(),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        tipoDeNoticias = 1;
                        nombreDeVista = 'NewsList';
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      '> All articles about Tesla from the last month, sorted by recent first',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: _ancho * 0.045,
                      ),
                    ),
                  ),
                  Separator(
                    tamanoContexto: _drawerUsefullHeight,
                    porcentajeDelSeparador: 0.04,
                    axisDelSeparador: 'vertical',
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        tipoDeNoticias = 2;
                        nombreDeVista = 'NewsList';
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      '> Top business headlines in the US right now',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: _ancho * 0.045,
                      ),
                    ),
                  ),
                  Separator(
                    tamanoContexto: _drawerUsefullHeight,
                    porcentajeDelSeparador: 0.04,
                    axisDelSeparador: 'vertical',
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        tipoDeNoticias = 3;
                        nombreDeVista = 'NewsList';
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      '> All articles mentioning Apple from yesterday, sorted by popular publishers first',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: _ancho * 0.045,
                      ),
                    ),
                  ),
                  Separator(
                    tamanoContexto: _drawerUsefullHeight,
                    porcentajeDelSeparador: 0.04,
                    axisDelSeparador: 'vertical',
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        tipoDeNoticias = 4;
                        nombreDeVista = 'NewsList';
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      '> Top headlines from TechCrunch right now',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: _ancho * 0.045,
                      ),
                    ),
                  ),
                  Separator(
                    tamanoContexto: _drawerUsefullHeight,
                    porcentajeDelSeparador: 0.04,
                    axisDelSeparador: 'vertical',
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        tipoDeNoticias = 5;
                        nombreDeVista = 'NewsList';
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      '> All articles published by the Wall Street Journal in the last 6 months, sorted by recent first',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: _ancho * 0.045,
                      ),
                    ),
                  ),
                  Separator(
                    tamanoContexto: _drawerUsefullHeight,
                    porcentajeDelSeparador: 0.27,
                    axisDelSeparador: 'vertical',
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                        ),
                        Separator(
                          tamanoContexto: _ancho,
                          porcentajeDelSeparador: 0.03,
                          axisDelSeparador: 'horizontal',
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
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: BuildView(viewName: nombreDeVista, tipoDeNew: tipoDeNoticias),
      ),
    );
  }
}

class _CabeceraBit extends StatelessWidget {
  _CabeceraBit();

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    final double _drawerUsefullHeight = _altura - _statusBarHeight;

    return SizedBox(
      height: _drawerUsefullHeight * 0.17,
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Padding(
          padding: EdgeInsets.only(top: _drawerUsefullHeight * 0.05),
          child: SizedBox(
            // height: _altura * 0.1,
            width: _ancho * 0.45,
            child: Align(
              alignment: Alignment.topRight,
              child: ColorFiltered(
                child: Image.asset('assets/img/bit.png'),
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Separator extends StatelessWidget {
  final double tamanoContexto;
  final double porcentajeDelSeparador;
  final String axisDelSeparador;

  Separator(
      {@required this.tamanoContexto,
      @required this.porcentajeDelSeparador,
      @required this.axisDelSeparador});

  @override
  Widget build(BuildContext context) {
    switch (axisDelSeparador) {
      case 'horizontal':
        return SizedBox(
          width: tamanoContexto * porcentajeDelSeparador,
        );
      case 'vertical':
        return SizedBox(
          height: tamanoContexto * porcentajeDelSeparador,
        );

      default:
        return SizedBox(
          height: tamanoContexto * porcentajeDelSeparador,
        );
    }
  }
}
