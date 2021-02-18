import 'package:flutter/material.dart';

import 'package:bit_app/data/news_api_service.dart';
import 'package:bit_app/presenter/build_news_item_list.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildView extends StatelessWidget {
  final String viewName;
  final int tipoDeNew;

  BuildView({@required this.viewName, @required this.tipoDeNew});

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;

    var snapshotSaved;

    switch (viewName) {
      case 'NewsList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                  future: ApiService().getDio(optionUrl: tipoDeNew),
                  builder: (context, snapshot) {
                    snapshotSaved = snapshot;
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: (snapshot.data).articlesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BuildNewsCardWidget(
                              infoDeLaNoticia:
                                  (snapshot.data).articlesList[index]);
                        },
                      );
                    } else if (snapshot.hasError) {
                      return _SomethingWentWrongWidget();
                    } //
                    //else
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ),
        );

      case 'NewsZoom':

      case 'FavoriteList':
        return Container();

      //TODO: por defecto debemos retornar algo
      default:
        return Container();
    }
  }
}

class _SomethingWentWrongWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: _altura * 0.25),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          height: _altura * 0.4,
          width: _ancho,
          decoration: BoxDecoration(
            image: DecorationImage(
              //OJO que esta imagen no tiene referencia como tal, como es una app privada no deberíamos tener problemas
              image: AssetImage('assets/img/went_wrong.png'),
            ),
          ),
        ),
        Text(
          'Ooops Something went wrong...',
          style: GoogleFonts.signika(
              fontSize: _altura * 0.02,
              color: Colors.black87,
              fontWeight: FontWeight.normal),
        ),
      ]),
    );
  }
}
