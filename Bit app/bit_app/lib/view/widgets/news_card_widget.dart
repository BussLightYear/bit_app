import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bit_app/model/news_model.dart';

class NewsCardWidget extends StatelessWidget {
  final News noticia;
  final Function(News) onTapFav;
  final Function(News) onTapMore;

  NewsCardWidget(
      {Key key, @required this.noticia, this.onTapFav, this.onTapMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;

    return Container(
      // width: 1,
      height: _altura * 0.75,
      margin: EdgeInsets.only(top: _altura * 0.023),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)
        ],
      ),
      child: Column(
        children: [
          Container(
            height: _altura * 0.4,
            width: _ancho,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: noticia.urlToImage != null
                    ? NetworkImage(noticia.urlToImage)
                    : AssetImage('assets/img/bitback.jpg'),
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(_altura * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noticia.title ?? 'Title not found',
                    maxLines: 2,
                    style: GoogleFonts.signika(
                        fontSize: _altura * 0.028,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    noticia.author ?? 'Author not found',
                    maxLines: 2,
                    style: GoogleFonts.signika(
                        fontSize: _altura * 0.019,
                        color: Colors.black45,
                        fontWeight: FontWeight.normal),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    noticia.description ?? 'Description not found',
                    maxLines: 4,
                    style: GoogleFonts.signika(
                        fontSize: _altura * 0.017,
                        color: Colors.black87,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 13, left: 13),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.favorite_border_outlined),
                      onPressed: () {
                        onTapFav(noticia);
                      }),
                  InkWell(
                    onTap: () {
                      onTapMore(noticia);
                    },
                    child: Text(
                      'MORE >',
                      style: GoogleFonts.signika(
                          fontSize: _altura * 0.023,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
