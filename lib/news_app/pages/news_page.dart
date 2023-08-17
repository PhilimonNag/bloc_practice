import 'package:bloc_practice/news_app/bloc/news_bloc.dart';
import 'package:bloc_practice/news_app/model/articles.dart';
import 'package:bloc_practice/news_app/pages/details_page.dart';
import 'package:flutter/material.dart';

import '../widgets/news_tile.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsBloc bloc = NewsBloc();
  @override
  void initState() {
    bloc.eventSink.add(NewsAction.fetch);
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jesus Teach me NewsApp'),
      ),
      body: StreamBuilder(
          stream: bloc.stateStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return NewsTile(
                      data: snapshot.data![index],
                      onclick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const DetailsPage(),
                          ),
                        );
                      },
                    );
                  });
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
