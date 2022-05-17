import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  
  BigText({
    Key? key, 
    this.color = AppColors.mainBlackColor,
    required this.text,
    this.size = 0,
    this.overFlow = TextOverflow.ellipsis

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        //fontFamily: "Roboto",
        color: color,
        fontWeight: FontWeight.w400, 
        fontSize: size == 0 ? Dimensions.font20 : size,
      ),
    );
  }
}