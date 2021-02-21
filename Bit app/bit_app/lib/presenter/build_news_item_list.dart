import 'package:flutter/material.dart';

import 'package:bit_app/model/news_model.dart';
import 'package:bit_app/view/widgets/news_card_widget.dart';

class BuildNewsCardWidget extends StatelessWidget {
  final News infoDeLaNoticia;
  final Function(News) onTapFav;
  final Function(News) onTapMore;

  BuildNewsCardWidget(
      {Key key, @required this.infoDeLaNoticia, this.onTapFav, this.onTapMore});

  @override
  Widget build(BuildContext context) {
    return NewsCardWidget(
      noticia: infoDeLaNoticia,
      onTapFav: onTapFav,
      onTapMore: onTapMore,
    );
  }
}
