import 'package:flutter/material.dart';
class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildNavigation(context),
                SizedBox(height: 20,),
                buildTitle(context),
                buildText(context),
                buildGrid(context),
                buildTextPlace(context),
                buildPlaceList(context),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search))
          ],
        )
      ],
    );
  }

  buildTitle(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Today's Speacial",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
          Container(
            margin: EdgeInsets.all(7),
            padding: EdgeInsets.all(7),
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:
              (
                Colors.green
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart,color: Colors.white,),
                Text("CART",
                  style: TextStyle(fontSize: 13,color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  buildText(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      child: Text(
        "Find out what's cooking today!",
        style: TextStyle(
          color: Colors.grey
        ),
      ),
    );
  }

  buildGrid(BuildContext context) {
    return Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.all(7),
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:
                (
                  Colors.lightBlue[100]
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:
                      (
                          Colors.lightBlueAccent
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Image(image: AssetImage('images/food_1.png')),
                        SizedBox(height: 20,),
                        Text("Yoshimasa Sushi",
                          style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),

                        ),
                        SizedBox(height: 4,),
                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.white,size: 13,),
                            Icon(Icons.star,color: Colors.white,size: 13,),
                            Icon(Icons.star,color: Colors.white,size: 13,),
                            Icon(Icons.star,color: Colors.white,size: 13,),
                            Icon(Icons.star,color: Colors.white,size: 13,),
                            Text(" 250 ratings",style: TextStyle(color: Colors.lightBlue[50],fontSize: 10),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Lorem ipsum is a dummy text used for printing", style: TextStyle(color: Colors.lightBlue[50],fontSize: 12),),


                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(7),
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                  (
                      Colors.lightGreen[100]
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                        (
                            Colors.lightGreenAccent
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(image: AssetImage('images/food_2.png')),
                          Text("Yoshimasa Sushi",
                            style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),

                          ),
                          SizedBox(height: 4,),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.white,size: 13,),
                              Icon(Icons.star,color: Colors.white,size: 13,),
                              Icon(Icons.star,color: Colors.white,size: 13,),
                              Icon(Icons.star,color: Colors.white,size: 13,),
                              Icon(Icons.star,color: Colors.white,size: 13,),

                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(7),
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                  (
                      Colors.grey[300]
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                        (
                            Colors.grey
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(image: AssetImage('images/food_3.png')),
                          Text("Parato Sushi",
                            style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),

                          ),
                          SizedBox(height: 4,),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.white,size: 13,),
                              Icon(Icons.star,color: Colors.white,size: 13,),
                              Icon(Icons.star,color: Colors.white,size: 13,),
                              Icon(Icons.star,color: Colors.white,size: 13,),
                              Icon(Icons.star,color: Colors.white,size: 13,),

                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),

            ],
          )
          ],
    );
  }

  buildTextPlace(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Places",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),

        ],
      ),
    );
  }

  buildPlaceList(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(7),
          padding: EdgeInsets.all(7),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Container(child: Image(image: AssetImage("images/food_4.png"))),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                // padding: EdgeInsets.all(7),
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sushi Den",
                      style: TextStyle(
                        fontSize: 18,height: 1
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.orange,size: 15,),
                        Icon(Icons.star,color: Colors.orange,size: 15,),
                        Icon(Icons.star,color: Colors.orange,size: 15,),
                        Icon(Icons.star,color: Colors.orange,size: 15,),
                        Icon(Icons.star,color: Colors.orange,size: 15,),

                      ],
                    ),
                    Text("Lorem ipsum sits dolar amet is for publishing", style: TextStyle(fontSize: 11,height: 1),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.all(7),
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                  (
                      Colors.green
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Order Now",
                      style: TextStyle(fontSize: 10,color: Colors.lightGreen[100]),
                    )
                  ],
                ),
              )
            ],

          ),

        ),
        Container(
          margin: EdgeInsets.all(7),
          padding: EdgeInsets.all(7),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Container(child: Image(image: AssetImage("images/food_5.png"))),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                // padding: EdgeInsets.all(7),
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hatsuhana Sushi",
                      style: TextStyle(
                          fontSize: 18,height: 1
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.orange,size: 15,),
                        Icon(Icons.star,color: Colors.orange,size: 15,),
                        Icon(Icons.star,color: Colors.orange,size: 15,),
                        Icon(Icons.star,color: Colors.orange,size: 15,),
                        Icon(Icons.star,color: Colors.orange,size: 15,),

                      ],
                    ),
                    Text("Lorem ipsum sits dolar amet is for publishing", style: TextStyle(fontSize: 11,height: 1),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.all(7),
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                  (
                      Colors.green
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Order Now",
                      style: TextStyle(fontSize: 10,color: Colors.lightGreen[100]),
                    )
                  ],
                ),
              )
            ],

          ),

        ),
        Container(
          margin: EdgeInsets.all(7),
          padding: EdgeInsets.all(7),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Container(child: Image(image: AssetImage("images/food_6.png"))),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                // padding: EdgeInsets.all(7),
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sushi VipPro",
                      style: TextStyle(
                          fontSize: 18,height: 1
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.orange,size: 15,),
                        Icon(Icons.star,color: Colors.orange,size: 15,),
                        Icon(Icons.star,color: Colors.orange,size: 15,),
                        Icon(Icons.star,color: Colors.orange,size: 15,),
                        Icon(Icons.star,color: Colors.orange,size: 15,),

                      ],
                    ),
                    Text("Lorem ipsum sits dolar amet is for publishing", style: TextStyle(fontSize: 11,height: 1),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.all(7),
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                  (
                      Colors.green
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Order Now",
                      style: TextStyle(fontSize: 10,color: Colors.lightGreen[100]),
                    )
                  ],
                ),
              )
            ],

          ),

        ),

      ],
    );
  }
}

