import 'package:flutter/material.dart';
import 'package:flutter_app/slider_destination.dart';
class DemoImage extends StatelessWidget {
  const DemoImage({Key? key}) : super(key: key);

  
  
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: null ,
      child: new Scaffold(
        appBar: AppBar(
          title: new Text("Complicated image slider demo"),
        ),
        body: Column(
          children: [
            SingleChildScrollView(child: SliderDestination()),

          ],
        ),
      ),
    );
  }
}
