import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:handling_cupboard/src/models/categories_model.dart';
import 'package:http/http.dart' as http;

class CategoriService extends ChangeNotifier{

  //final String _baseUrl = 'https://localhost:44309/Categories';

  final List<Categories> categories = [];
  late Categories selCategorie;

  //final storage = FlutterSecureStorage();

  bool isloading = true;
  bool isSaving = false;

  CategoriService(){
    loadCategories();
  }  

  Future<List<Categories>> loadCategories()async{

    isloading = true;
    notifyListeners();

    final url = Uri.parse('https://10.0.2.2:5001/Categories');
      
    http.Response resp = await http.get(url);

    final List<dynamic> categoriMap = json.decode(resp.body);

    categoriMap.forEach((value) {
      final resCategori = Categories.fromMap(value);
      //resCategori.idcategory = key;
      categories.add(resCategori);
    });

    isloading = false;
    notifyListeners();

    return categories;

  }

  Future saveOrUpdateCategory(Categories category) async {
    isSaving = true;
    notifyListeners();

    if(category.idcategory == null){
      await saveCategory(category);
    }else{
      updateCategory(category);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String?> saveCategory(Categories category) async {

    final url = Uri.parse('https://10.0.2.2:5001/Categories');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    final resp = await http.post(url, headers: requestHeaders, body: jsonEncode(category.toJson()));
    final decodeData = json.decode(resp.body);
    category.idcategory = decodeData['name'];

    categories.add(category);

    notifyListeners();
    return category.idcategory;

  }

  Future<String?> updateCategory(Categories category) async {

    final url = Uri.parse('https://10.0.2.2:5001/Categories/${category.idcategory}');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    
    final resp = await http.put(url, headers: requestHeaders, body: jsonEncode(category.toJson()),);
    //final decodeData = resp.body;

    //actualizar el lstado de productos
    final index = categories.indexWhere((element) => element.idcategory == category.idcategory);
    categories[index] = category;

    //print(resp.body);
    notifyListeners();
    return category.idcategory;

  }

}