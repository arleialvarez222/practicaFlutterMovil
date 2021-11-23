import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/models/categories_model.dart';

class CategoriProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late Categories categoria;

  CategoriProvider(this.categoria);

  /* categoriU( value){
    print(value);

    this.categoria = value;
    notifyListeners();
  } */

  bool isValidForm(){
    print(categoria.name);
    print(categoria.idcategory);
    return formKey.currentState?.validate() ?? false;
  } 
}