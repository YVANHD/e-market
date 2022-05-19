import 'package:ecommerce/data/api/apiClient.dart';
import 'package:ecommerce/data/controllers/popular_product_controller.dart';
import 'package:ecommerce/data/repositories/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {

// for apiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: "appBaseUrl"));

//for repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //for controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}