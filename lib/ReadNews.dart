import 'package:flutter/material.dart';
import 'package:flutter_app/model/NewsModel.dart';
import 'package:flutter_html/flutter_html.dart' as html;
class ReadNews extends StatelessWidget {
  final NewsModel news;
  const ReadNews({
    required this.news
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(7),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(news.urlToImage??"hello"),
              Text(news.title??"" ,style: TextStyle(fontWeight: FontWeight.bold),),
              html.Html(
                data: news.description,
              )

            ],
          ),
        ),
      ),
    );
  }
}
