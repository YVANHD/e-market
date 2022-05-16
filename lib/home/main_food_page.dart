import 'package:ecommerce/home/food_page_body.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/widget/big_text.dart';
import 'package:ecommerce/widget/small_text.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(

            child: Container(
              margin: EdgeInsets.symmetric( horizontal: 15, vertical: 35),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Cameroon",
                        color: AppColors.mainColor,
                        size: 30,
                      ),
                      Row(
                        children: [
                          SmallText(
                          text: "Yaounde",
                          color: Colors.black45,
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search, color: Colors.white,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          FoodPageBody()

        ],
      ),
    );
  }
}