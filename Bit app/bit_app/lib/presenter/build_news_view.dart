import 'package:flutter/material.dart';

import 'package:bit_app/data/news_api_service.dart';
import 'package:bit_app/presenter/build_news_item_list.dart';

class BuildView extends StatelessWidget {
  final String viewName;
  final int intNews;

  BuildView({@required this.viewName, @required this.intNews});

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;

    switch (viewName) {
      case 'NewsList':
        return Container(
          child: Center(
            child: Container(
              child: FutureBuilder(
                  future: ApiService().getDio(optionUrl: intNews),
                  builder: (context, snapshot) {
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
                      return Container(
                        height: _altura,
                        width: _ancho,
                        child: Center(
                          child: Text('ALGOOOOOOOOO PASOÓOOOO'),
                        ),
                      );
                    }
                    //else
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ),
        );
      case 'FavoriteList':
        return Container();

      //TODO: por defecto debemos retornar algo
      default:
        return Container();
    }
  }
}
