import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/NewsModel.dart';
import 'package:http/http.dart' as http;

class NewsProvider extends ChangeNotifier{
  List<NewsModel> list = [];
  void getList(String text) async{
    String apiURL = "https://newsapi.org/v2/everything?q="+ text +"&from=2022-10-17&sortBy=popularity&apiKey=61bbd62de27744e9b03536ab6dfd5e05";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject["articles"] as List;
    list = newsListObject.map((e) {
      return NewsModel.fromJson(e);
    }).toList();
    notifyListeners();
  }
}