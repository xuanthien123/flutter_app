import 'package:flutter/material.dart';
import 'package:flutter_app/ReadNews.dart';
import 'package:flutter_app/provider/NewsProvider.dart';
import 'package:provider/provider.dart';
class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  String key = "tesla";
  
  selectedButton(String key){
    return Container(
      margin: EdgeInsets.all(5),
      width: 120,
      height: 40,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.green)
              ),

            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),

          ),
          onPressed: (){
            setState(() {
              this.key = key;
            });
          },
          child: Text(key, style: TextStyle(fontSize: 12),)

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<NewsProvider>(context);
    newsProvider.getList(this.key);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text("Flutter", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            Text("News",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  selectedButton("Apple"),
                  selectedButton("Samsung"),
                  selectedButton("Xiaomi")
                ],
              ),

            ),
            Container(

              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ...newsProvider.list.map((e) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ReadNews(news: e))
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(7),
                            child: Column(
                              children: [
                                Image.network(e.urlToImage??"hello"),
                                Text(e.title??"" ,style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(e.content??""),

                              ],
                            ),
                        ),
                      );
                      // return Text(e.title??"hello");
                    }).toList()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
