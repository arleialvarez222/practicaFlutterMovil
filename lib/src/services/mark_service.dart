import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:handling_cupboard/src/models/mark_model.dart';
import 'package:http/http.dart' as http;

class MarkService extends ChangeNotifier{

  final List<Mark> marks = [];
  late Mark selectMark;

  bool isloading = true;
  bool isSaving = false;

  MarkService(){
    getMark();
  }

  Future<List<Mark>> getMark()async{

    isloading = true;
    notifyListeners();

    final url = Uri.parse('https://10.0.2.2:5001/api/Trademarks');
      
    http.Response resp = await http.get(url);

    final List<dynamic> categoriMap = json.decode(resp.body);

    categoriMap.forEach((value) {
      final response = Mark.fromMap(value);
      //resCategori.idcategory = key;
      marks.add(response);
    });

    isloading = false;
    notifyListeners();

    return marks;

  }

  Future saveOrUpdateMark(Mark mark) async {
    isSaving = true;
    notifyListeners();

    if(mark.idTrademark == null){
      await saveMark(mark);
    }else{
      updateMark(mark);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String?> saveMark(Mark mark) async {

    final url = Uri.parse('https://10.0.2.2:5001/api/Trademarks');

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    final resp = await http.post(url, headers: requestHeaders ,body: jsonEncode(mark.toJson()));
    final respuesta = json.decode(resp.body);
    mark.idTrademark = respuesta['name'];

    marks.add(mark);

    notifyListeners();
    return mark.idTrademark;

  }

  Future<String?> updateMark(Mark mark) async {

    final url = Uri.parse('https://10.0.2.2:5001/api/Trademarks/${mark.idTrademark}');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    
    final resp = await http.put(url, headers: requestHeaders, body: jsonEncode(mark.toJson()),);

    final index = marks.indexWhere((element) => element.idTrademark == mark.idTrademark);
    marks[index] = mark;

    //print(resp.body);
    notifyListeners();
    return mark.idTrademark;

  }
  
}