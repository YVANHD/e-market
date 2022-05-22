import 'package:ecommerce/pages/cart/cartPage.dart';
import 'package:ecommerce/pages/food/popular_food_detail.dart';
import 'package:ecommerce/pages/food/recommended_food_detail.dart';
import 'package:ecommerce/pages/home/home_page.dart';
import 'package:ecommerce/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-food";

  static String getInitial() => '$initial';
  static String getSplashPage() => '$splashPage';

  static List<GetPage>  routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(name: popularFood, page: () => PopularFoodDetail(), transition: Transition.circularReveal ),
    GetPage(name: recommendedFood, page: () => RecommendedFoodDetail(), transition: Transition.circularReveal ),
    GetPage(name: cartPage, page: () => CartPage(), transition: Transition.circularReveal ),
  ];
}

