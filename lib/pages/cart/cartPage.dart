import 'package:ecommerce/utils/appIcon.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widget/big_text.dart';
import 'package:ecommerce/widget/small_text.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24
                ),
                SizedBox(width: Dimensions.width20*5 ),
               AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24
                ),
              ],
            )
          ),
           Positioned(
            top: Dimensions.height20*4,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.height15),
              //color: Colors.blueAccent,
              child: MediaQuery.removePadding(
                context: context,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Container(
                      width: double.maxFinite,
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            width: Dimensions.height20*4,
                            height: Dimensions.height20*4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/sucrés.png"),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(Dimensions.radius20)
                            ),
                          ),
                          SizedBox(width: Dimensions.width10,),
                          Expanded(
                            child: Container(
                              height: Dimensions.height20*5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(text: "sucres foures", color: Colors.black54),
                                  SmallText(text: "lorem ipsum"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(text: "600.0 \Fcfa ", color: Colors.redAccent),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: Dimensions.height10, horizontal: Dimensions.height10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.remove, color: AppColors.mainBlackColor,),
                                            SizedBox(width: Dimensions.width10/2,),
                                            BigText(text: "0"),
                                            SizedBox(width: Dimensions.width10/2,),
                                            Icon(Icons.add, color: AppColors.mainBlackColor,)
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                ),
              ),
            )
          ),
        ]
      )
    );
  }
}