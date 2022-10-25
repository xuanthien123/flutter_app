import 'package:flutter/material.dart';
import 'package:flutter_app/model/CartModel.dart';
import 'package:flutter_app/model/ProductModel.dart';

class CartProvider extends ChangeNotifier{
  List<CartModel> list = [];
  int count = 0;

  void Add(ProductModel data) async {
    for(CartModel i in list){
      if(i.product?.id == data.id){
        i.count++;
        return;
      }
    }
    if(list.length == 0) {
      list.add(CartModel(id: 1, product: data));
      count ++;
    }
    else {
      int lastId = (list.last.id??1).toInt();
      list.add(CartModel(id: (lastId + 1), product: data));
      count ++;
    }
    notifyListeners();
  }

  void upQuantity(int id){
    for(CartModel i in list){
      if(i.id == id){
        i.count++;
        return;
      }
    }
  }

  void downQuantity(int id){
    for(CartModel i in list){
      if(i.id == id){
        i.count--;
        return;
      }
    }
  }

  double TotalPrice(){
    double total = 0;
    for(var i in list){
      total += i.count*(i.product?.price??0);
    }
    return total;
  }

  void delete(int id) async {
    for(CartModel i in list){
      if(i.id == id){
        list.remove(i);
        count--;
        return;
      }
    }
  }

  void getList() async {
    notifyListeners();
  }

  void countCart() async {
    count = list.length;
    notifyListeners();
  }
}