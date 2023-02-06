import 'package:flutter/material.dart';
import 'package:news_provider_app/models/news_models.dart';

class NewsService extends ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() {
    print('Cargando headlines...');
  }
}
