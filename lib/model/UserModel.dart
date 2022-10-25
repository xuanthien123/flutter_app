import 'dart:core';
import 'dart:js_util/js_util_wasm.dart';

class UserModel
{
  final String userName;
  final String password;

  UserModel(this.userName,this.password);
  //
  // factory UserModel.fromJson(Map<String,dynamic> json) {
  //   return UserModel(
  //     userName: json['username'],
  //     password: json['password']
  //   );


}