import 'package:flutter_app/model/ProductModel.dart';

class CartModel{
  int? id;
  ProductModel? product;
  int count = 1;

  CartModel({this.id,this.product});

}