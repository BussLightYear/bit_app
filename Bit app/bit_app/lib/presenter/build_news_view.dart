import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bit_app/data/news_api_service.dart';
import 'package:bit_app/presenter/build_news_item_list.dart';
import 'package:bit_app/view/widgets/alert_dialog.dart';
import 'package:bit_app/view/widgets/news_exapnsion_widget.dart';

class BuildView extends StatelessWidget {
  String viewName;
  final int tipoDeNew;

  BuildView({@required this.viewName, @required this.tipoDeNew});

  @override
  Widget build(BuildContext context) {
    switch (viewName) {
      case 'NewsList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                  future: ApiService().getDio(optionUrl: tipoDeNew),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: (snapshot.data).articlesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BuildNewsCardWidget(
                            infoDeLaNoticia:
                                (snapshot.data).articlesList[index],
                            onTapFav: (news) {
                              //Aqui colocamos todo el codigo que debe ser ejecutado luego
                              //de interactuar con el NewsCarWidget
                              showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (_) => AlertDial(
                                  text:
                                      'Are you sure you want to add this news to the favorite list?',
                                  onPressedYes: () {},
                                  onPressedNo: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                            onTapMore: (news) {
                              print(news.title);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsExpand(
                                    newsToExpand: news,
                                  ),
                                ),
                              );
                            },
                          );
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

      case 'FavoriteList':

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: _altura * 0.4,
            width: _ancho,
            decoration: BoxDecoration(
              image: DecorationImage(
                //OJO que esta imagen no tiene referencia como tal, como es una app privada no deberíamos tener problemas de autor
                image: AssetImage('assets/img/went_wrong.png'),
              ),
            ),
          ),
          Text(
            'Ooops something went wrong...',
            style: GoogleFonts.signika(
                fontSize: _altura * 0.02,
                color: Colors.black87,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
