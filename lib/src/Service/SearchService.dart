import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobilicis/src/Repo/SearchRepo.dart';
import 'dart:convert';

import 'package:mobilicis/src/model/SearchModel.dart';

class SearchService extends ChangeNotifier{
  final TextEditingController _search = TextEditingController();

  TextEditingController get searchController => _search;

  Future<SearchModel> showResults(String modelName)async{
    http.Response response = await SearchRepo().searchRes(modelName);
    var data = jsonDecode(response.body.toString());
   try {

     if(response.statusCode == 200){
       return SearchModel.fromJson(data);
     }
   }catch(e){
     print(e);
   }
   return SearchModel.fromJson(data);
  }

  void onChange(BuildContext context, String modelName){
    showResults(modelName);
    notifyListeners();

  }
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

}