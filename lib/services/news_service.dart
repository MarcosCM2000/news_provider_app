import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:news_provider_app/models/models.dart';

final _URL_NEWS = 'newsapi.org';
final _APIKEY = '19aabb787b1c4ae8b318e360f3fa1d21';

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  NewsService() {
    getTopHeadlines();
    categories.forEach((element) {
      categoryArticles[element.name] = [];
    });
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

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category]!;
    }
    final url = Uri.https(_URL_NEWS, '/v2/top-headlines',
        {'apiKey': _APIKEY, 'country': 'us', 'category': category});
    print(url);
    final resp = await http.get(url);
    final newsResponse = NewsResponse.fromJson(resp.body);

    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}
