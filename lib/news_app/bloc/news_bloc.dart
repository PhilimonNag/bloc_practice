import 'dart:async';

import 'package:bloc_practice/news_app/model/articles.dart';
import 'package:bloc_practice/news_app/service/api_manager.dart';

enum NewsAction { loading, fetch }

class NewsBloc {
  final _stateController = StreamController<List<Article>>();
  StreamSink<List<Article>> get stateSink => _stateController.sink;
  Stream<List<Article>> get stateStream => _stateController.stream;

  final _evenController = StreamController<NewsAction>();
  StreamSink<NewsAction> get eventSink => _evenController.sink;
  Stream<NewsAction> get eventStream => _evenController.stream;

  NewsBloc() {
    eventStream.listen((event) async {
      switch (event) {
        case NewsAction.loading:
          break;
        case NewsAction.fetch:
          stateSink.add(await ApiManger().getNews());
          break;
        default:
      }
    });
  }
  void dispose() {
    _evenController.close();
    _stateController.close();
  }
}
