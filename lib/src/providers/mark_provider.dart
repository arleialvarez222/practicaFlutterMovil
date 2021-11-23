import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:handling_cupboard/src/models/mark_model.dart';

class MarkProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late Mark mark;

  MarkProvider(this.mark);

  /* categoriU( value){
    print(value);

    this.categoria = value;
    notifyListeners();
  } */

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  } 
}