import 'package:flutter/material.dart';
//import 'package:handling_cupboard/src/models/categories_model.dart';

class ProductCard extends StatelessWidget {

  //final Categories categories;
  final double height; 

  final dynamic name;
  final dynamic marca;

  const ProductCard({
    Key? key, 
    required this.name,
    this.marca, 
    required this.height,
    /* required this.categories, */
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 0),
        width: double.infinity,
        height: height,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft, 
          children: [
        
             _DetailsProduct(nombre: name, marca: marca, height: height,),

          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0,7),
        blurRadius: 10
      )
    ]
  );
}

class _DetailsProduct extends StatelessWidget {

  final dynamic nombre;
  final double height;
  final dynamic marca;

  const _DetailsProduct( {
    Key? key, 
    required this.nombre, 
    required this.height, 
    this.marca
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        height: height,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(nombre, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 5,),

            Text(marca, style: TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.6),),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() =>  BoxDecoration(
    color: Colors.indigoAccent.shade400,
    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20) ,bottomLeft: Radius.circular(20), topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
    
  );
}