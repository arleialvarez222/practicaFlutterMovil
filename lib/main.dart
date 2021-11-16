import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/pages/Products/product_form.dart';
import 'package:handling_cupboard/src/pages/Products/products_expire.dart';
import 'package:handling_cupboard/src/pages/categories/form_categories.dart';
import 'package:handling_cupboard/src/pages/cupboard/cupboard_form.dart';
import 'package:handling_cupboard/src/pages/home/home_page.dart';
import 'package:handling_cupboard/src/pages/manu_lateral.dart';
import 'package:handling_cupboard/src/pages/Products/products_page.dart';
import 'package:handling_cupboard/src/pages/security/login.dart';
import 'package:handling_cupboard/src/pages/security/register.dart';
import 'package:handling_cupboard/src/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() => runApp( AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
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
      initialRoute: 'login',
      routes: {
        'login' : (_) => LoginScreen(),
        'register' : (_) => RegisterScreen(),
        'home' : (_) => HomePage(),
        'menuLateral': (_) => MenuLateral(),
        'product': (_) => ProductsPage(),
        'formProduct': (_) => ProductForm(),
        'formCategory': (_) => CategoriesForm(),
        'cupboardForm': (_) => CupboardForm(),
        'productExpire': (_) => ProductsExpire(),
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