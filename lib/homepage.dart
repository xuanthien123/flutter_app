import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String src = "https://images.unsplash.com/photo-1662436267762-56fe105cbf6e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "hello world",
            style: TextStyle(

            ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                  "Wellcome to my class",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 20, 20, 200),
                  ),
              ),
              Text("Moblie Programing Group 1"),
              Image.network(src),
              Image.network(src),
              Image.asset('images/img.png'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("xin chao");
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Icon(Icons.home),
      ),
    );
  }
}
