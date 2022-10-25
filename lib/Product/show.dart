import 'package:flutter/material.dart';
import 'package:flutter_app/MyCart.dart';
import 'package:flutter_app/Product/showproduct.dart';
import 'package:flutter_app/model/CartModel.dart';
import 'package:flutter_app/model/ProductModel.dart';
import 'package:flutter_app/provider/CartProvider.dart';
import 'package:flutter_app/provider/ProductProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class ShowProduct extends StatefulWidget {
  const ShowProduct({Key? key}) : super(key: key);

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  Map<String, bool> values = {
    "electronics" : true,
    "jewelery" : true,
    "men's clothing" : true,
    "women's clothing" : true
  };
  List<String> categories = ["electronics","jewelery","men's clothing","women's clothing"];
  final TextEditingController _search = TextEditingController();
  int countCart = 0;
  bool showGrid = true;
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    if(_search.text.isEmpty){
      productProvider.getListEmptySearch(categories);
    }
    else{
      productProvider.getListFilter(_search.text.toString(), categories);
    }
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getList();
    countCart = cartProvider.count;
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = 148 + (size.height - kToolbarHeight - 24) / 4.4;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Text("Flutter", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            Text("Shop",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),)
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),

                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCart())
                  );
                },
                child: Row(
                  children: [
                    Text(countCart.toString() + "  | ",style: TextStyle(fontWeight: FontWeight.bold),),
                    Icon(Icons.shopping_cart)
                  ],
                )

            ),
          )
        ],
      ),
      drawer: Drawer(
        child: new ListView(

          children: [
            Container(
              margin: EdgeInsets.all(15),
                child: Text("Categories", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),)
            ),
              ...values.keys.map((String key) {
              return new CheckboxListTile(
                title: new Text(key),
                value: values[key],
                onChanged: (bool? value) {
                  setState(() {
                    values[key] = value??false;
                    categories = [];
                    values.forEach((key, value1) {
                      if(value1 == true)
                        categories.add(key);
                    });
                  });
                },
              );
            }).toList(),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "View:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),

                  ),
                  Row(

                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                          showGrid = !showGrid;
                          Navigator.pop(context);
                        });

                      }, icon: Icon(showGrid?Icons.grid_on:Icons.list_outlined,size: 30)),


                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    // CustomScrollView(
                    //   slivers: [
                    //     SliverAppBar(
                    //       pinned: false,
                    //       snap: true,
                    //       floating: true,
                    //       flexibleSpace: const FlexibleSpaceBar(
                    //         title: Text('SliverAppBar'),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    TextFormField(
                      controller: _search,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text("Search",style: TextStyle(color: Colors.grey)),
                        hintText: "Search",

                        prefixIcon: Icon(Icons.search),
                      ),
                      // onChanged: (String? value){ setState(() {
                      //   categories = [];
                      //   values.forEach((key, value) {
                      //     if(value == true)
                      //       categories.add(key);
                      //   });
                      //
                      // });},
                    ),

                  ],
                ),

              ),
              showGrid?buildGrid(itemWidth, itemHeight, productProvider, cartProvider, size):buildList(itemWidth,itemHeight,productProvider, cartProvider),

            ],
          ),
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to Cart'),
        action: SnackBarAction(label: 'Hide', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  buildGrid(double itemWidth,double itemHeight,ProductProvider productProvider,CartProvider cartProvider,Size size){
    return Expanded(
      child: GridView.count(
        childAspectRatio: (itemWidth/itemHeight),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          ...productProvider.list.map((e){
            return Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                (
                    Colors.white
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductDisplay(product: e))
                      );
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Image(image: NetworkImage(e.imageLink??""),height: (size.height - kToolbarHeight - 24) / 5,fit: BoxFit.contain),
                          SizedBox(height: 20,),
                          SizedBox(
                            child: Text(e.title??"",
                              style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            height: 40,
                          ),
                          SizedBox(height: 4,),
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: e.rating?.rate??5.0,
                                minRating: 0.1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                                itemSize: 14,

                              ),
                              Text((e.rating?.count??0.0).toString() + " ratings", overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontSize: 10),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text("\$",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text((e.price??"").toString(),style: TextStyle(fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Container(
                        width: itemWidth/3,
                        height: itemHeight/10,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    side: BorderSide(color: Colors.lightBlueAccent)
                                ),

                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),

                            ),
                            onPressed: (){
                              cartProvider.Add(e);
                              cartProvider.countCart();
                              setState(() {
                                countCart = cartProvider.count;
                              });
                              _showToast(context);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.add_shopping_cart,color: Colors.white,size: 14,),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            )

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList()
        ],

      ),
    );
  }
  buildList(double itemWidth,double itemHeight,ProductProvider productProvider,CartProvider cartProvider){
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ...productProvider.list.map((e){
            return Container(
                margin: EdgeInsets.all(2),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductDisplay(product: e))
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.all(3),
                      height: 80,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Container(child: Image(image: NetworkImage(e.imageLink??""),width: 70,fit: BoxFit.contain,)),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              // padding: EdgeInsets.all(7),
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Text(e.title??"",
                                      style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    height: 40,

                                  ),
                                  Row(
                                    children: [
                                      RatingBar.builder(
                                        initialRating: e.rating?.rate??5.0,
                                        minRating: 0.1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                        itemSize: 14,

                                      ),
                                      Text((e.rating?.count??0.0).toString() + " ratings", overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontSize: 10),),
                                    ],
                                  ),


                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Text("\$",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text((e.price??"").toString(),style: TextStyle(fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: itemWidth/3,
                                    height: itemHeight/10,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(40),
                                                side: BorderSide(color: Colors.lightBlueAccent)
                                            ),

                                          ),
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),

                                        ),
                                        onPressed: (){
                                          cartProvider.Add(e);
                                          cartProvider.countCart();
                                          setState(() {
                                            countCart = cartProvider.count;
                                          });
                                          _showToast(context);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.add_shopping_cart,color: Colors.white,size: 14,),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.center,
                                        )

                                    ),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.fromLTRB(35, 10, 0, 0),
                            ),

                          ]
                      )
                  ),
                )
            );
          }).toList()
        ],
      ),
    );
  }
}
