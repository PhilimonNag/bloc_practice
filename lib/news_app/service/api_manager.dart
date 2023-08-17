import 'dart:convert';
import 'package:bloc_practice/news_app/constant/constant.dart';
import 'package:bloc_practice/news_app/model/articles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiManger {
  var client = http.Client();

  Future<List<Article>> getNews() async {
    final List<Article> articles = [];
    try {
      final data = await client.get(Uri.parse(headlineEndPoint));
      if (data.statusCode == 200) {
        final map = json.decode(data.body);
        for (var element in map['articles']) {
          articles.add(Article.fromJson(element));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return articles;
  }
}
