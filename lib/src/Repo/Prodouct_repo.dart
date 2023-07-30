
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductRepo extends ChangeNotifier{

  Future<http.Response> products({int page = 1}) async {
    var response = await http.get(Uri.parse(
        'https://dev2be.oruphones.com/api/v1/global/assignment/getListings?page=$page&limit=10'));
    return response;
  }
}