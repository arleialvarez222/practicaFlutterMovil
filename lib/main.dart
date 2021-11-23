import 'dart:io';

import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/pages/Products/product_form.dart';
import 'package:handling_cupboard/src/pages/Products/products_expire.dart';
import 'package:handling_cupboard/src/pages/categories/categories.dart';
import 'package:handling_cupboard/src/pages/categories/form_categories.dart';
import 'package:handling_cupboard/src/pages/cupboard/cupboard_form.dart';
import 'package:handling_cupboard/src/pages/home/home_page.dart';
import 'package:handling_cupboard/src/pages/manu_lateral.dart';
import 'package:handling_cupboard/src/pages/Products/products_page.dart';
import 'package:handling_cupboard/src/pages/marks/form_mark.dart';
import 'package:handling_cupboard/src/pages/marks/mark.dart';
import 'package:handling_cupboard/src/pages/security/login.dart';
import 'package:handling_cupboard/src/pages/security/register.dart';
import 'package:handling_cupboard/src/services/auth_service.dart';
import 'package:handling_cupboard/src/services/categori_service.dart';
import 'package:handling_cupboard/src/services/mark_service.dart';
import 'package:provider/provider.dart';

void main(){
  HttpOverrides.global = MyHttpOverrides();
  runApp( AppState());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => CategoriService()),
        ChangeNotifierProvider(create: (_) => MarkService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      //home: MenuLateral(),
      initialRoute: 'menuLateral',
      routes: {
        'login' : (_) => LoginScreen(),
        'register' : (_) => RegisterScreen(),
        'home' : (_) => HomePage(),
        'menuLateral': (_) => MenuLateral(),
        'categories' : (_) => CategoriesPage(),
        'product': (_) => ProductsPage(),
        'formProduct': (_) => ProductForm(),
        'formCategory': (_) => CategoriesForm(),
        'cupboardForm': (_) => CupboardForm(),
        'productExpire': (_) => ProductsExpire(),
        'mark': (_) => MarkPage(),
        'formMark': (_) => FormMark(),
      },

      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.blue
        )
      ),
    );
  }
}