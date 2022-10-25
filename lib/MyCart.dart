import 'package:flutter/material.dart';
import 'package:flutter_app/model/CartModel.dart';
import 'package:flutter_app/provider/CartProvider.dart';
import 'package:provider/provider.dart';
class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<CartModel> items = [];
  double total = 0;

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getList();
    total = cartProvider.TotalPrice();
    items = cartProvider.list;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Row(
          children: [
            Text("My", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            Text("Cart",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),)
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item.id.toString()),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                cartProvider.delete(item.id??0);

              });

              // Then show a snackbar.
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(item.product?.title??"" +'removed')));
            },
            // Show a red background as the item is swiped away.
            background: Container(color: Colors.red),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Container(
                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(7),
                  height: 80,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        Container(child: Image(image: NetworkImage(item.product?.imageLink??""),width: 70,fit: BoxFit.contain,)),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          // padding: EdgeInsets.all(7),
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(item.product?.title??"",
                                  style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                height: 40,

                              ),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
                                      iconSize: 18.0,
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        setState(() {
                                          if (item.count > 1) {
                                            cartProvider.downQuantity(item.id??0);
                                          };
                                        });
                                      },
                                    ),
                                    Text(
                                      item.count.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Theme.of(context).accentColor,
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
                                      iconSize: 18.0,
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        setState(() {
                                          if (item.count < 99) {
                                            cartProvider.upQuantity(item.id??0);
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 60,
                                child: Text("\$" + (item.product?.price??0).toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        )
                      ]
                    )
                  )
                )
          );
        },
      ),
      bottomNavigationBar: Container(
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(

            color: Colors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Text("Total: " + total.toStringAsFixed(2) + "\$", style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 120,
                decoration: BoxDecoration(

                  color: Colors.lightBlue,
                ),
                child: Text(
                  "Pay",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
  upDownQuantity(CartModel item){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            Icons.remove,
            color: Theme.of(context).accentColor,
          ),
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
          iconSize: 18.0,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              if (item.count > 1) {
                item.count--;
              };
            });
          },
        ),
        Text(
          item.count.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            color: Theme.of(context).accentColor,
          ),
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
          iconSize: 18.0,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              if (item.count > 99) {
                item.count++;
              }
            });
          },
        ),
      ],
    );
  }
}
