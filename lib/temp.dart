import 'package:flutter/material.dart';
import 'package:flutter_app/genre_slider.dart';
import 'package:flutter_app/slider_destination.dart';
class Temp extends StatelessWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SliderDestination(),
                GenreSlider(),
                blockImage(),
                blockTitle(),
                blockButton()

              ],
            ),
          ),
        ),
    );
  }

  blockImage(){
    return Image.asset("images/img_1.png");
  }

  blockTitle(){
    return Container(
      margin: EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hue university of Science",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
              Text("77 Nguyen Hue, Hue city"),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.red,),
              Text("41")
            ],
          )
        ],
      ),
    );
  }

  blockButton(){
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Icon(Icons.star, color: Colors.red,),
                  Text("Vote")
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Icon(Icons.star, color: Colors.red,),
                  Text("Like")
                ],
              )
              
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Icon(Icons.star, color: Colors.red,),
                  Text(":V")
                ],
              )
            ],
          ),
        ],

      ),

    );
  }

  buttonAction(String title, IconData icon){
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(icon),
          Text(title),
        ],
      ),
    );
  }

  blockDescription(){

  }

}
