import 'package:flutter/material.dart';
import 'package:flutter_app/RegisterEVN.dart';
import 'package:flutter_app/foodpage.dart';
import 'package:http/http.dart' as http;
class EVNLoginPage extends StatelessWidget {
  EVNLoginPage({Key? key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();
  var _formUserName = GlobalKey<FormState>();
  var _formPass = GlobalKey<FormState>();

  final TextEditingController _userName = TextEditingController();
  final TextEditingController _pass = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image(image: AssetImage("images/EVN.png"),height: 300,),
            SizedBox(height: 20,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _userName,
                    validator: (value){
                      if (value == null || value.isEmpty)
                        return "Vui lòng nhập tên đăng nhập";
                      else if (value.length<5)
                        return "Tên đăng nhập quá ngăn";
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      label: Text("Tên đăng nhập",style: TextStyle(color: Colors.orange)),
                      hintText: "Vui lòng nhập tên đăng nhập",

                      prefixIcon: Icon(Icons.person),

                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _pass,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    validator: (value){
                      if (value == null || value.isEmpty)
                        return "Vui lòng nhập mật khẩu";
                      else if (value.length<5)
                        return "Mật khẩu quá ngắn";
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      label: Text("Mật khẩu",style: TextStyle(color: Colors.orange),),
                      hintText: "Vui lòng nhập mật khẩu",
                      prefixIcon: Icon(Icons.person),

                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 450,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                            side: BorderSide(color: Colors.orange)
                          ),

                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),

                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()){
                          print("a");
                          await Login(context, _userName.text, _pass.text);
                        }
                        else{

                        };
                      },
                      child: Text("Đăng nhập", style: TextStyle(fontSize: 16),)

                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 450,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                                side: BorderSide(color: Colors.green)
                            ),

                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),

                        ),
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterEVN())
                          );
                        },
                        child: Text("Đăng ký", style: TextStyle(fontSize: 16),)

                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Login(BuildContext context, String _userName, String _passWord) async{
    var url = 'https://fakestoreapi.com/auth/login';
    Map data =
    {
      'username': _userName,
      'password': _passWord,
    };
    // print(userName);
    // print(passWord);
    var response = await http.post(Uri.parse(url), body: data);
    if(response.statusCode == 200){
      Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage()));
      print("success");
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Đăng nhập thất bại!")));
      print("fail");
    }
    // return Future<bool>.value(false);

  }
}
