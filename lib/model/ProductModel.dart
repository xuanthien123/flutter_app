import 'package:flutter_app/model/RatingModel.dart';

class ProductModel{
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? imageLink;
  RatingModel? rating;

  ProductModel({this.id,this.title,this.price,this.description,this.category,this.imageLink,this.rating});

  factory ProductModel.fromJson(Map<String,dynamic> obj){
    return ProductModel(
      id: obj["id"],
      title: obj["title"],
      price: obj["price"],
      description: obj["description"],
      category: obj["category"],
      imageLink: obj["image"],
      rating: RatingModel.fromJson(obj["rating"])
    );
  }
}