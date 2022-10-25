import 'package:flutter/material.dart';
import 'package:flutter_app/model/DestinationModel.dart';
class SliderDestination extends StatelessWidget {
  SliderDestination({Key? key}) : super(key: key);

  List<DestinationModel> _list = DestinationModel.MockData();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ..._list.map((e) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 300,
                      width: MediaQuery.of(context).size.width/1.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(e.image),
                          fit: BoxFit.cover
                        )
                      ),
                    ),

                    Container(
                      child: Column(
                        children: [
                          Text(e.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              ...e.genre.map((e) {
                                return Text(e+" ",style: TextStyle(fontSize: 12));
                              })
                            ],
                          ),
                          Row(
                            children: [
                              ...e.genre.map((e) {
                                return Text(e+" ",style: TextStyle(fontSize: 12));
                              })
                            ],
                          )

                        ],
                      ),
                    )

                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
