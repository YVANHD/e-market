import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widget/big_text.dart';
import 'package:ecommerce/widget/icons_and_text_widgets.dart';
import 'package:flutter/material.dart';

import 'small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: text,
                    size: 15,
                  ),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star_border,
                            color: AppColors.mainColor,
                            size: 15,
                          );
                        }),
                      ),
                      // SizedBox(width: 10),
                      // SmallText(text: "4.5"),
                      SizedBox(width: 10),
                      SmallText(text: "1287"),
                      SizedBox(width: 10),
                      SmallText(text: "Jaime"),
                    ],
                  ),
                  SizedBox(height: Dimensions.height20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconsAndTextWidgets(
                        icon: Icons.numbers_sharp,
                        text: "à partir de 25 pieces", 
                        iconColor: AppColors.iconColor1,
                      ),
                      IconsAndTextWidgets(
                        icon: Icons.money_off_rounded, 
                        text: "600", 
                        iconColor: AppColors.mainColor,
                      ),
                    ],
                  )
                ],
              );
  }
}