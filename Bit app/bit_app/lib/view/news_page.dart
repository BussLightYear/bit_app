import 'package:flutter/material.dart';

import 'package:bit_app/presenter/build_news_view.dart';
import 'package:bit_app/view/widgets/alert_dialog.dart';
import 'package:bit_app/view/widgets/drawer_option.dart';
import 'package:scaled_animated_scaffold/scaled_animated_scaffold.dart';
import 'package:bit_app/utils/firebaseController.dart' as AuthController;

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int tipoDeNoticias = 1;
  String nombreDeVista = 'NewsList';

  static const drawerOptions = <Map<String, dynamic>>[
    {
      'value': 1,
      'text':
          'All articles about Tesla from the last month, sorted by recent first'
    },
    {'value': 2, 'text': 'Top business headlines in the US right now'},
    {'value': 3, 'text': 'Top business headlines in the US right now'},
    {'value': 4, 'text': 'Top headlines from TechCrunch right now'},
    {
      'value': 5,
      'text':
          'All articles published by the Wall Street Journal in the last 6 months, sorted by recent first'
    },
  ];

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    final double _drawerUsefullHeight = _altura - _statusBarHeight;
    return ScaledAnimatedScaffold(
      appBar: ScaledAnimatedScaffoldAppBar(
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
      menuConfiguration: ScaledAnimatedScaffoldMenuConfiguration(
        header: ScaledAnimatedScaffoldMenuButton(
          label: _CabeceraBit(),
          onPressed: () {},
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...drawerOptions
                .map((option) => DrawerOption(
                      text: option['text'],
                      onTap: () {
                        setState(() {
                          tipoDeNoticias = option['value'];
                          // Navigator.pop(context);
                        });
                      },
                    ))
                .toList(),
          ],
        ),
        footer: IntrinsicHeight(
          child: ScaledAnimatedScaffoldMenuButton(
            icon: Icon(
              Icons.logout,
            ),
            label: Text('Log out'),
            onPressed: () {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (_) => AlertDial(
                  text: 'Are you sure you want to log out?',
                  onPressedYes: () {
                    AuthController.signOut(context: context);
                  },
                  onPressedNo: () {
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: BuildView(viewName: nombreDeVista, tipoDeNew: tipoDeNoticias),
      ),
    );

//old
    // Scaffold(
    //   // extendBodyBehindAppBar: true,
    //   appBar: AppBarCustom(
    //     appBarText: 'BIT News',
    //   ),
    //   drawer: Padding(
    //     padding: EdgeInsets.only(top: _statusBarHeight),
    //     //Colocamos esquinas redondeades del drawer
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.only(
    //         bottomRight: Radius.circular(30),
    //         topRight: Radius.circular(30),
    //       ),
    //       child: Drawer(
    //         elevation: 50,
    //         child: SizedBox(
    //           height: _drawerUsefullHeight,
    //           // width: _ancho,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               _CabeceraBit(),
    //               //El ... descompone la lista
    //               //Basicamente recorremos todo el mapa drawerOptions
    //               //y con cada dato del mapa construimos el widget DrawerOption
    //               ...drawerOptions
    //                   .map((option) => DrawerOption(
    //                         text: option['text'],
    //                         onTap: () {
    //                           setState(() {
    //                             tipoDeNoticias = option['value'];
    //                             // Navigator.pop(context);
    //                           });
    //                         },
    //                       ))
    //                   .toList(),
    //               SizedBox(
    //                 height: _drawerUsefullHeight * 0.28,
    //               ),
    //               ListTile(
    //                 leading: Icon(
    //                   Icons.logout,
    //                 ),
    //                 title: Text(
    //                   'Log out',
    //                   style: TextStyle(
    //                     color: Colors.black45,
    //                     fontSize: _ancho * 0.045,
    //                   ),
    //                 ),
    //                 onTap: () {
    //                   showDialog(
    //                     barrierDismissible: true,
    //                     context: context,
    //                     builder: (_) => AlertDial(
    //                       text: 'Are you sure you want to log out?',
    //                       onPressedYes: () {
    //                         Navigator.pushReplacementNamed(context, './login');
    //                       },
    //                       onPressedNo: () {
    //                         Navigator.pop(context);
    //                       },
    //                     ),
    //                   );
    //                 },
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   body: Padding(
    //     padding: EdgeInsets.only(right: 10, left: 10),
    //     child: BuildView(viewName: nombreDeVista, tipoDeNew: tipoDeNoticias),
    //   ),
    // );
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
          padding: EdgeInsets.only(top: _drawerUsefullHeight * 0.03),
          child: SizedBox(
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
