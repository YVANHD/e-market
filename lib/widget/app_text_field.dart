import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final TextEditingController textController;
  final String hinText;
  final IconData icon;
  
  const AppTextField({Key? key, required this.textController, required this.hinText, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 7,
            offset: Offset (1, 10),
            color: Colors.grey.withOpacity(0.2)
          )
        ]
      ),
      child:TextField(
        controller: textController,
        decoration: InputDecoration(
          // hintext
          hintText: hinText,
          //prefixicon
          prefixIcon: Icon(icon, color: AppColors.yellowColor),
          //focusedBorder
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          //enabledBorder
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          //border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
        )
      )
    );
  }
}