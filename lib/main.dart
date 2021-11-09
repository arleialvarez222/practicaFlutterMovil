import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/pages/Products/product_form.dart';
import 'package:handling_cupboard/src/pages/categories/form_categories.dart';
import 'package:handling_cupboard/src/pages/cupboard/cupboard_form.dart';
import 'package:handling_cupboard/src/pages/manu_lateral.dart';
import 'package:handling_cupboard/src/pages/Products/products_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      //home: MenuLateral(),
      initialRoute: 'menuLateral',
      routes: {
        'menuLateral': (_) => MenuLateral(),
        'product': (_) => ProductsPage(),
        'formProduct': (_) => ProductForm(),
        'formCategory': (_) => CategoriesForm(),
        'cupboardForm': (_) => CupboardForm(),
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