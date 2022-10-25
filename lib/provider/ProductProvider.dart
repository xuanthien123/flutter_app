import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/ProductModel.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<ProductModel> list = [];

  void getList() async {
    String apiURL = "https://fakestoreapi.com/products";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var productListObject = jsonObject as List;
    list = productListObject.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
    notifyListeners();
  }

  void getListEmptySearch(List<String> categories) async{
    getList();
    List<ProductModel> listTemp = [];
    for (var i in list) {
      for (String j in categories) {
        if (i.category == j) {
            listTemp.add(i);
        }
      }
    }
    list = listTemp;
  }

  void getListFilter(String search, List<String> categories) async {
    getList();
    List<ProductModel> listTemp = [];
    for (var i in list) {
      for (String j in categories) {
        if (i.category == j) {
          if(search == ""){
            listTemp.add(i);
          }
          else{
            String name = (i.title ?? "").toLowerCase();
            if (name.contains(search.toLowerCase())) {
              listTemp.add(i);
            }
          }
        }
      }
    }
    list = listTemp;
  }
}