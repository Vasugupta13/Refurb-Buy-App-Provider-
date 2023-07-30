import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilicis/src/Repo/Prodouct_repo.dart';
import 'package:mobilicis/src/model/ProductModel.dart';
import 'package:http/http.dart' as http;


class ProductPageService extends ChangeNotifier{
  final ProductRepo repo = ProductRepo();
  int currentPage = 1;
  bool isFetchingData = false;
  List<Listings> listings = [];
  final controller = ScrollController();

  ProductPageService() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        _onLoadMore();
      }
    });
    fetchData();
  }

  void incrementPage() {
    currentPage++;
  }
  Future<void> fetchData({int page = 1})async {
    try{
     isFetchingData = true;
     notifyListeners();
     http.Response response = await ProductRepo().products(page: currentPage);
     if(response.statusCode == 200){
       var data = jsonDecode(response.body.toString());
       final productModel = ProductModel.fromJson(data);
       listings.addAll(productModel.listings!);
       notifyListeners();
     }else{
       throw Exception('Failed to load data. Status code: ${response.statusCode}');
     }
    } catch(e){
      if (kDebugMode) {
        print('Error while fetching data: $e');
      }
    }finally{
      isFetchingData = false;
      notifyListeners();
  }
  }

  Future<void> _onLoadMore() async {
    if (!isFetchingData) {
      incrementPage();
      await fetchData(page: currentPage);
    }
  }

  Future<void> onRefresh() async {
    if (!isFetchingData) {
      currentPage = 1;
      listings.clear();
      await fetchData(page: currentPage);
    }
  }

}