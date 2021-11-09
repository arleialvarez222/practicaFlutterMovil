import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/widgets/cupboard/cupboard_card.dart';


class CupboardPage extends StatelessWidget {
  const CupboardPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [

          CupboardCard(
            nombre: 'Arroz', 
            marca: 'Diana', 
            cantidad: 10, 
            height: 120
          ),

          CupboardCard(
            nombre: 'Harina', 
            marca: 'Haz de oros', 
            cantidad: 5, 
            height: 120
          ),
          CupboardCard(
            nombre: 'Hojuelas', 
            marca: 'La reina', 
            cantidad: 8, 
            height: 120
          ),

          CupboardCard(
            nombre: 'Huevos', 
            marca: 'Mi gallina', 
            cantidad: 30, 
            height: 120
          ),

          CupboardCard(
            nombre: 'Pescado', 
            marca: 'Salmón', 
            cantidad: 12, 
            height: 120
          ),
        ],
      ),

     floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          
          Navigator.pushNamed(context, 'cupboardForm');
        },
      ),
   );
  }
}