import 'package:ecommerce/pages/auth/sign_up_page.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widget/app_text_field.dart';
import 'package:ecommerce/widget/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();

    var SignUpImages = [
     " wa.png",
     "fa.png",
    ];

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: Dimensions.screenHeight*0.05),
            Container(
              height: Dimensions.screenHeight*0.25,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  "assets/images/avatar.png"
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bonjour",
                    style: TextStyle(
                      fontSize: Dimensions.font20*3 + Dimensions.font20/2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Connectez-vous à votre compte",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      color: Colors.grey.shade500
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: Dimensions.height20),
            // phone
            AppTextField(
              textController: phoneController, 
              hinText: "Phone", 
              icon: Icons.phone
            ),
            SizedBox(height: Dimensions.height20),
            // password
            AppTextField(
              textController: passwordController, 
              hinText: "Mot de passe", 
              icon: Icons.password
            ),
            SizedBox(height: Dimensions.height10),
            Row(
              children:[
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                    text: "Connectez-vous à votre compte ? ",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: Dimensions.font20
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.width20),
              ]
            ),
            SizedBox(height: Dimensions.screenHeight*0.05),
          // bouton inscription
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor
              ),
              child: Center(
                child: BigText(
                  text: "Connexion", 
                  size: Dimensions.font20 + Dimensions.font20/2,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: Dimensions.screenHeight*0.05),
            // options inscription
            RichText(
              text: TextSpan(
                text: "Aucun Compte ? ",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: Dimensions.font20
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=() => Get.to(()=> SignUpPage(), transition: Transition.fade),
                    text: "Créer en Un",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ]
              ),
            ),

      
          ]
        ),
      ),
    );
  }
}