import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widget/app_text_field.dart';
import 'package:ecommerce/widget/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var genreController = TextEditingController();
    var passwordController = TextEditingController();

    var SignUpImages = [
     " wa.png",
     "fa.png",
    ];

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight*0.05),
            Container(
              height: Dimensions.screenHeight*0.25,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  "assets/image/avatar.png"
                ),
              ),
      
            ),
            // Nom
            AppTextField(
              textController: nameController, 
              hinText: "Nom", 
              icon: Icons.email
            ),
            SizedBox(height: Dimensions.height20),
            // phone
            AppTextField(
              textController: phoneController, 
              hinText: "Phone", 
              icon: Icons.email
            ),
            SizedBox(height: Dimensions.height20),
            // email
            AppTextField(
              textController: emailController, 
              hinText: "Email", 
              icon: Icons.email
            ),
            SizedBox(height: Dimensions.height20),
            // genre
            AppTextField(
              textController: genreController, 
              hinText: "Genre", 
              icon: Icons.email
            ),
            SizedBox(height: Dimensions.height20),
            // password
            AppTextField(
              textController: passwordController, 
              hinText: "Mot de passe", 
              icon: Icons.email
            ),
            SizedBox(height: Dimensions.height20),
          // bouton inscription
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor
              ),
              child: BigText(
                text: "Inscription", 
                size: Dimensions.font20 + Dimensions.font20/2,
                color: Colors.white,
              ),
            ),
            SizedBox(height: Dimensions.height10),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=() => Get.back(),
                text: "jai deja un compte",
                style: TextStyle(
                  color: Colors.green.shade500,
                  fontSize: Dimensions.font20
                ),
              )
            ),
            SizedBox(height: Dimensions.screenHeight*0.05),
            // options inscription
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=() => Get.back(),
                text: "Identifiez avec les methodes suivantes",
                style: TextStyle(
                  color: Colors.green.shade500,
                  fontSize: Dimensions.font20
                ),
              )
            ),
            Wrap(
              children: List.generate(2, (index) => CircleAvatar(
                radius: Dimensions.radius30,
                backgroundImage: AssetImage(
                  "" + SignUpImages[index],
                ),
              ))
            )
      
          ]
        ),
      ),
    );
  }
}