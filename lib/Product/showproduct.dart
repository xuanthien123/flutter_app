import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/MyCart.dart';
import 'package:flutter_app/model/ProductModel.dart';
import 'package:flutter_app/provider/CartProvider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
class ProductDisplay extends StatelessWidget {
  final ProductModel product;
  const ProductDisplay({
    required this.product
});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 320.0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                product.imageLink??"",
                fit: BoxFit.contain,
              ),
            ),
            actions: [
              IconButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCart())
                  );
                },
                icon: Icon(Icons.shopping_cart,color: Colors.black,),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 5,),
                      Text(product.category??"",),
                      SizedBox(height: 10,),
                      Text("\$" + product.price.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: product.rating?.rate??5.0,
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
                            itemSize: 17,

                          ),
                          Text((product.rating?.count??0.0).toString() + " ratings", style: TextStyle(color: Colors.black,fontSize: 14),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("Description:" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text(product.description??"")

                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),

        ],

      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          cartProvider.Add(product);
          cartProvider.countCart();
          _showToast(context);
        },
        child: Container(
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(

              color: Colors.lightBlueAccent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_shopping_cart),
              Text(" Add to cart", style: TextStyle(fontSize: 15),)
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
}
