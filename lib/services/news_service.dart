import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_provider_app/models/news_models.dart';

final _URL_NEWS = 'newsapi.org';
final _APIKEY = '19aabb787b1c4ae8b318e360f3fa1d21';

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.https(
        _URL_NEWS, '/v2/top-headlines', {'apiKey': _APIKEY, 'country': 'us'});
    print(url);
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
