import 'package:flutter/material.dart';
import 'package:flutter_app/EVNLoginPage.dart';
import 'package:flutter_app/LoginPage.dart';
import 'package:flutter_app/Menu.dart';
import 'package:flutter_app/Product/show.dart';
import 'package:flutter_app/demoImage.dart';
import 'package:flutter_app/foodpage.dart';
import 'package:flutter_app/homepage.dart';
import 'package:flutter_app/provider/CartProvider.dart';
import 'package:flutter_app/provider/NewsProvider.dart';
import 'package:flutter_app/provider/ProductProvider.dart';
import 'package:flutter_app/temp.dart';
import 'package:provider/provider.dart';

import 'NewsPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        home: ShowProduct(),
      ),
    )
  );
}





