import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/widgets/categories/category_card.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        //physics: const ClampingScrollPhysics(),
        children: const [

          CategoryCard(name: "Granos", height: 70,),
          CategoryCard(name: "Legunbres", height: 70,),
          CategoryCard(name: "Aceites", height: 70,),
          CategoryCard(name: "Carnes", height: 70,),
          CategoryCard(name: "Farmaceuticos", height: 70,),
          CategoryCard(name: "Enlatados", height: 70,)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          
          Navigator.pushNamed(context, 'formCategory');
        },
      ),
     
    );
  }
}