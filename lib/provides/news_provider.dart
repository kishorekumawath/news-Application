import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_application/models/news_model.dart';

class NewsProvider with ChangeNotifier {
  List<Article> _newsArticles = [];
  List<Article> get newsArticles => _newsArticles;

  Future<void> fetchNews(String country) async {
    final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=$country&apiKey=6bbbe6651528461883b6120dda2414db',
    ));
    if (response.statusCode == 200) {
      final Map result = json.decode(response.body);

      _newsArticles = (result['articles'] as List)
          .map<Article>((json) => Article.fromJson(json))
          .toList();

      notifyListeners();
    } else {
      throw Exception('Failed to load news');
    }
  }
}