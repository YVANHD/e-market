import 'package:ecommerce/utils/appIcon.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widget/big_text.dart';
import 'package:ecommerce/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            color: AppColors.mainColor,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Historique des achats", color: Colors.white,),
                AppIcon(
                  icon: Icons.shopping_cart_outlined, 
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right:  Dimensions.width20
              ),
              child: MediaQuery.removePadding(
                context: context,
                child: ListView(
                  children: [
                    for(int i = 0; i < 5; i++)
                    Container(
                      height: 130,
                      margin: EdgeInsets.only(bottom: Dimensions.height20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "22/05/2022"),
                          SizedBox(height: Dimensions.height10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: List.generate(3, (index) {
              
                                  return Container(
                                   height: 65,
                                   width: 65,
                                   margin: EdgeInsets.only(right: Dimensions.width10/2),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                     image: DecorationImage(
                                       image: AssetImage("assets/images/sucrés.png"),
                                       fit: BoxFit.cover
                                     )
                                   ),
                                  );
                                }),
                              ),
                              Container(
                                height: 70,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SmallText(text: 'Total', color: AppColors.titleColor),
                                    BigText(text: "3 achats", color: AppColors.titleColor,),
                                    GestureDetector(
                                      onTap: () {
                                        Get.snackbar(
                                          "Historique des achats", 
                                          "Sélectionner un nouveau produit",
                                          backgroundColor: AppColors.yellowColor,
                                          colorText: Colors.white
                                        );
                                      },
                                      child: Container(
                                        // color: Colors.red,
                                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10/3),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                          border: Border.all(
                                            width: 1,
                                            color: AppColors.mainColor,
                                          ),
                                        ),
                                        child: SmallText(text: "un de plus", color: AppColors.mainColor,),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}