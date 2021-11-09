import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/widgets/products/product_card.dart';


class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);
  //final List<dynamic> _products = ['Arroz', 'Frijol', 'Tomate', 'Panela', 'Aceite'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          ProductCard(name: "Arroz", marca: "Federal", height: 90,),
          ProductCard(name: "Frijol", marca: "Rojo", height: 90,),
          ProductCard(name: "Aceite", marca: "SoySabor", height: 90,),
          ProductCard(name: "Avena", marca: "Quaker", height: 90,),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, 'formProduct');
        },
      ),
    );
   
  }
}