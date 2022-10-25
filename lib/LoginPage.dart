import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
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
                  label: Text("Tên đăng nhập:"),
                  hintText: "Vui lòng nhập tên dăng nhập",
                  prefixIcon: Icon(Icons.person)
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()){

                    }
                    else{

                    };
                  },
                  child: Text("OK")
              )
            ],
          ),
        ),
      ),
    );
  }
}
