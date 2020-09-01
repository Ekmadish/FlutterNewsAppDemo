import 'dart:convert';
import 'package:NewsApp/models/articale_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c6119b233f4e4113818cb0beaa260d3e';
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            // publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            url: element['url'],
            //articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=cn&category=${category}&apiKey=c6119b233f4e4113818cb0beaa260d3e';
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            // publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            url: element['url'],
            //articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
