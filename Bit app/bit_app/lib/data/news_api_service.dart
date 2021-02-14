import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:bit_app/model/news_model.dart';

class ApiService {
  //SelectUrl se utiliza internamente en la clase por lo que no debería exponerse por fuera
  String _selectUrl(optionUrl) {
    //Nicola's API key for news api: fdf81681c9234f3cbfc26e3644fb2b08
    switch (optionUrl) {
      //All articles about Tesla from the last month, sorted by recent first
      case 1:
        return 'http://newsapi.org/v2/everything?q=tesla&from=2021-01-14&sortBy=publishedAt&apiKey=fdf81681c9234f3cbfc26e3644fb2b08';
      //Top business headlines in the US right now
      case 2:
        return 'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=fdf81681c9234f3cbfc26e3644fb2b08';
      //All articles mentioning Apple from yesterday, sorted by popular publishers first
      case 3:
        return 'http://newsapi.org/v2/everything?q=apple&from=2021-02-13&to=2021-02-13&sortBy=popularity&apiKey=fdf81681c9234f3cbfc26e3644fb2b08';
      //Top headlines from TechCrunch right now
      case 4:
        return 'http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=fdf81681c9234f3cbfc26e3644fb2b08';
      //All articles published by the Wall Street Journal in the last 6 months, sorted by recent first
      case 5:
        return 'http://newsapi.org/v2/everything?domains=wsj.com&apiKey=fdf81681c9234f3cbfc26e3644fb2b08';
      //Por defecto retornamos la opción 1
      default:
        return 'http://newsapi.org/v2/everything?q=tesla&from=2021-01-14&sortBy=publishedAt&apiKey=fdf81681c9234f3cbfc26e3644fb2b08';
    }
  }

  getDio({@required int optionUrl}) async {
    var dio = Dio();

    Response response = await dio.get(_selectUrl(optionUrl));

    if (response.statusCode == 200) {
      return NewsApiModel.getDataFromJson(response.data);
    } else {
      //TODO: Tenemos que mostrar al usuario cuando algo salga mal
      print('Algo ha salido mal');
    }
  }
}
