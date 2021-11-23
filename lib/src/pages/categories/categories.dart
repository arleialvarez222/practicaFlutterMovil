
import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/models/categories_model.dart';
import 'package:handling_cupboard/src/pages/loading.dart';
import 'package:handling_cupboard/src/services/categori_service.dart';
import 'package:handling_cupboard/src/widgets/categories/category_card.dart';
import 'package:provider/provider.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final categoriService = Provider.of<CategoriService>(context);
    if(categoriService.isloading) return const Loading();

    return Scaffold(

      body: ListView.builder(
        itemCount: categoriService.categories.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () => {
            categoriService.selCategorie = categoriService.categories[index].update(),
            Navigator.pushNamed(context, 'formCategory'),
          },
          child: CategoryCard(categories: categoriService.categories[index], height: 70) ,
        )
      ), 


      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          categoriService.selCategorie = Categories(
            name: '',
          );
          Navigator.pushNamed(context, 'formCategory');
        },
      ),
     
    );
  }
}