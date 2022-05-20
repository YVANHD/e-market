import 'package:ecommerce/data/api/apiClient.dart';
import 'package:ecommerce/data/controllers/auth_controller.dart';
import 'package:ecommerce/data/controllers/popular_product_controller.dart';
import 'package:ecommerce/data/repositories/auth_repo.dart';
import 'package:ecommerce/data/repositories/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

// for apiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: "appBaseUrl"));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences));

//for repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //for controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}