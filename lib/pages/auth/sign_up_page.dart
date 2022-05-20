import 'package:ecommerce/base/show_custom_snackbar.dart';
import 'package:ecommerce/data/controllers/auth_controller.dart';
import 'package:ecommerce/models/signup_body_model.dart';
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
    var passwordController = TextEditingController();

    var SignUpImages = [
     "fbk.png",
     "wa.png",
    ];

    void _registration() {
      var authController = Get.find<AuthController>();

      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(name.isEmpty) {
        showCustomSnackbar("Ecrire un nom", title: "Nom");
      } else if(phone.isEmpty) {
        showCustomSnackbar("Ecrire un numero de telephone", title: "Telephone");
      } else if(email.isEmpty) {
        showCustomSnackbar("Ecrire une adresse Email valide", title: "Email");
      } else if(password.isEmpty) {
        showCustomSnackbar("Ecrire un mot de passe valide", title: "Mot de passe");
      } else if(password.length<6) {
        showCustomSnackbar("Ecrire un mot de passe à 6 caracteres", title: "Mot de passe");
      }else {
        showCustomSnackbar("Tout est parfait", title: "Parfait");
        SignupBody signupBody = SignupBody
        (
          name: name, 
          phone: phone, 
          email: email, 
          password: password
        );

        authController.registration(signupBody).then((status) {
          if(status.isSuccess) {
            print("Succes")
          } else {
            showCustomSnackbar(status.message);
          }
        });

        // print(signupBody.toString());
      }
    }

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
                  "assets/images/avatar.png"
                ),
              ),
      
            ),
            // Nom
            AppTextField(
              textController: nameController, 
              hinText: "Nom", 
              icon: Icons.person
            ),
            SizedBox(height: Dimensions.height20),
            // phone
            AppTextField(
              textController: phoneController, 
              hinText: "Phone", 
              icon: Icons.phone
            ),
            SizedBox(height: Dimensions.height20),
            // email
            AppTextField(
              textController: emailController, 
              hinText: "Email", 
              icon: Icons.email
            ),
            SizedBox(height: Dimensions.height20),
            // password
            AppTextField(
              textController: passwordController, 
              hinText: "Mot de passe", 
              icon: Icons.password
            ),
            SizedBox(height: Dimensions.height20),
          // bouton inscription
            GestureDetector(
              onTap: () {
                _registration();
              },
              child: Container(
                width: Dimensions.screenWidth/2,
                height: Dimensions.screenHeight/13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor
                ),
                child: Center(
                  child: BigText(
                    text: "Inscription", 
                    size: Dimensions.font20 + Dimensions.font20/2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=() => Get.back(),
                text: "\j'ai deja un compte",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: Dimensions.font20
                ),
              )
            ),
            SizedBox(height: Dimensions.screenHeight*0.05),
            // options inscription
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=() => Get.back(),
                text: "ou utilisez",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: Dimensions.font20
                ),
              )
            ),
            Wrap(
              children: List.generate(2, (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: Dimensions.radius30,
                  backgroundImage: AssetImage(
                    "assets/images/" + SignUpImages[index],
                  ),
                ),
              ))
            )
      
          ]
        ),
      ),
    );
  }
}