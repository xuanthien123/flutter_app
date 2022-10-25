import 'package:flutter/material.dart';
class RegisterEVN extends StatelessWidget {
  RegisterEVN({Key? key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng ký"),

      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
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
                  TextFormField(
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
                      label: Text("Nhập lại mật khẩu",style: TextStyle(color: Colors.orange),),
                      hintText: "Vui lòng nhập lại mật khẩu",
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
                        onPressed: (){
                          if (_formKey.currentState!.validate()){

                          }
                          else{

                          };
                        },
                        child: Text("Đăng ký", style: TextStyle(fontSize: 16),)

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
