import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SearchRepo extends ChangeNotifier{

  Future<http.Response> searchRes(String modelName)async{
    var response = await http.post(Uri.parse('https://dev2be.oruphones.com/api/v1/global/assignment/searchModel'),body: {'searchModel':modelName});
    return response;
  }
}