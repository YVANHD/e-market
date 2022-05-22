import 'package:ecommerce/pages/account/accountPage.dart';
import 'package:ecommerce/pages/splash/splash_page.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helpers/dependencies.dart' as dep;
import 'pages/auth/sign_up_page.dart';
import 'pages/home/main_food_page.dart';

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      // debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.getSplashPage(),
      //home: SplashScreen(),
      getPages: RouteHelper.routes,
    );
  }
}