import 'package:flutter/material.dart';

import 'package:bit_app/model/news_model.dart';
import 'package:bit_app/view/widgets/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsExpand extends StatelessWidget {
  final News newsToExpand;

  NewsExpand({Key key, @required this.newsToExpand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _ancho = MediaQuery.of(context).size.width;
    String author = newsToExpand.author ?? 'not found';
    String publishedAt = newsToExpand.publishedAt ?? 'not found';
    // const String testText =
    //     'addddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasdasdasdasddasdasdaasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdassdasdasdasdasdasdasdasdasdaasdasdasdasdassdasdasdddasdasdasdasdadddddddddddasdasdasdasdasdasdasdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd';

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(fit: StackFit.expand, children: [
        Scrollbar(
          child: ListView(
            children: [
              Container(
                height: _altura * 0.4,
                width: _ancho,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: newsToExpand.urlToImage != null
                        ? NetworkImage(newsToExpand.urlToImage)
                        : AssetImage('assets/img/bitback.jpg'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(_altura * 0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsToExpand.title ?? 'Title not found',
                      style: GoogleFonts.signika(
                          fontSize: _altura * 0.028,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: _altura * 0.02,
                    ),
                    Text(
                      newsToExpand.content ?? 'Content not found',
                      // testText,
                      style: GoogleFonts.signika(
                          fontSize: _altura * 0.018,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: _altura * 0.07,
                    ),
                    Text(
                      'Author: ' + '$author',
                      style: GoogleFonts.signika(
                          fontSize: _altura * 0.017,
                          color: Colors.black45,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      'Published at: ' + '$publishedAt',
                      style: GoogleFonts.signika(
                          fontSize: _altura * 0.017,
                          color: Colors.black45,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBarCustom(
            appBarText: 'BIT News',
            backColor: Colors.white.withOpacity(0.75),
            elevation: 0.0,
          ),
        ),
      ]),
    );
  }
}
