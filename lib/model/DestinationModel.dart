import 'dart:core';

class DestinationModel{
  final String id;
  final String name;
  final String image;
  final List<String> genre;
  final int rating;

  DestinationModel(this.id,this.name,this.image,this.genre,this.rating);

  static List<DestinationModel> MockData(){
    List<DestinationModel> ls = [];
    ls.add(DestinationModel("1", "Lang Khai Dinh", "images/img.png", ['Family','home','school'], 4));
    ls.add(DestinationModel("2", "Lang Minh Mang", "images/img_1.png", ['Family','home','school'], 4));
    ls.add(DestinationModel("3", "Lang Tu Duc", "images/img_2.png", ['Family','home','school'], 4));
    return ls;
  }

}