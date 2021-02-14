/* Esta clase es la que está expuesta por fuera de este archivo y es
la que recibe el json de forma directa desde el API
*/
class NewsApiModel {
  String status;
  int totalResults;
  List<News> articlesList;

  NewsApiModel(this.status, this.totalResults, this.articlesList);

  NewsApiModel.getDataFromJson(Map<String, dynamic> json) {
    // mapArticles es una lista con los Json de todos los articulos
    var mapArticles = json['articles'] as List;

    status = json['status'];
    totalResults = json['totalResults'];
    //https://stackoverflow.com/questions/57234575/dart-convert-map-to-list-of-objects
    //Hacemos un cast lista de articles --> lista de objetos News
    articlesList =
        mapArticles.map((article) => News.getDataFromJson(article)).toList();
  }
}

//Esta clase es privada, por fuera de este archivo no se utiliza
class News {
  _Source source;
  String urlToImage;
  String title;
  String url;
  String author;
  String publishedAt;
  String content;
  String description;

  News({
    this.source,
    this.urlToImage,
    this.title,
    this.url,
    this.author,
    this.publishedAt,
    this.content,
    this.description,
  });

  News.getDataFromJson(Map<String, dynamic> json) {
    source = _Source.getDataFromJson(json['source']);
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}

//Esta clase es privada, por fuera de este archivo no se utiliza
class _Source {
  String id;
  String name;

  _Source(this.id, this.name);

  //_Source.getDataFromJson recibe el json source que contiene id y name
  _Source.getDataFromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

//Json que se va a obtener
// {
// "status": "ok",
// "totalResults": 9985,
// -"articles": [
// -{
// -"source": {
// "id": null,
// "name": "Business Standard"
// },
// "author": "Joanna Ossinger | Bloomberg",
// "title": "Bitcoin nears $50,000-mark as it hits a record in weekend action",
// "description": "Bitcoin has been buoyed in recent months by endorsements from the likes of Paul Tudor Jones and Stan Druckenmille",
// "url": "https://www.business-standard.com/article/international/bitcoin-nears-50-000-mark-as-it-hits-a-record-in-weekend-action-121021500026_1.html",
// "urlToImage": "https://bsmedia.business-standard.com/_media/bs/img/article/2020-12/30/full/1609351331-1172.jpg",
// "publishedAt": "2021-02-14T19:30:00Z",
// "content": "Bitcoin reached a new record on Sunday, rising above $49,000 for the first time.\r\nThe world’s largest cryptocurrency reached about $49,344 earlier in the day, and was around $49,202 as of 10:20 a.m. … [+2976 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "Cointelegraph"
// },
// "author": "Cointelegraph By Turner Wright",
// "title": "Blockchain firm aims to build crypto city in Nevada desert",
// "description": "Blockchains CEO Jeffrey Berns is petitioning Nevada lawmakers to allow his company's 67,000-acre property to operate as a smart city with a local government.",
// "url": "https://cointelegraph.com/news/blockchain-firm-aims-to-build-crypto-city-in-nevada-desert",
// "urlToImage": "https://images.cointelegraph.com/images/1200_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS91cGxvYWRzLzIwMjEtMDIvMWNkNWY2NTAtODhmZC00M2Y4LWExMTMtMWZmNDgxOGIwNmUzLmpwZw==.jpg",
// "publishedAt": "2021-02-14T19:30:00Z",
// "content": "Blockchain incubator and investment firm Blockchains LLC is stepping up its plans to build a smart city in the Nevada desert east of Reno.\r\nIn an interview with the Associated Press released Saturday… [+1670 chars]"
// },...
