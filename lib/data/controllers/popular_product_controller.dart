import 'dart:convert';

import 'package:ecommerce/data/repositories/popular_product_repo.dart';
import 'package:ecommerce/models/category_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  List<dynamic> _popularProductList = []; 
   List<dynamic> get popularProductList => _popularProductList;

  PopularProductController({required this.popularProductRepo});

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Category.fromJson(response.body).categories);
      update();
    } else {

    }
  }


}