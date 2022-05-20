import 'package:ecommerce/utils/appIcon.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widget/accountWidget.dart';
import 'package:ecommerce/widget/big_text.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profil user",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(vertical: Dimensions.height20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height45 + Dimensions.height30,
              size: Dimensions.height15*10,
            ),
            SizedBox(height: Dimensions.height30,),
            // nom
            AccountWidget(
              appIcon: AppIcon(
                icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height15*4,
              ), 
              bigText: BigText(text: "Yvan",)
            ),
            SizedBox(height: Dimensions.height15,),
            //phone
            AccountWidget(
              appIcon: AppIcon(
                icon: Icons.phone,
                backgroundColor: AppColors.yellowColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height15*4,
              ), 
              bigText: BigText(text: "6 52 15 32 90",)
            ),
            SizedBox(height: Dimensions.height15,),
            //email
            AccountWidget(
              appIcon: AppIcon(
                icon: Icons.email,
                backgroundColor: AppColors.yellowColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height15*4,
              ), 
              bigText: BigText(text: "yvanmvondo2@gmail.com",)
            ),
            SizedBox(height: Dimensions.height15,),
            //addresse
            AccountWidget(
              appIcon: AppIcon(
                icon: Icons.location_on,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height15*4,
              ), 
              bigText: BigText(text: "Modifier votre adresse",)
            ),
            SizedBox(height: Dimensions.height15,),
            //addresse
            AccountWidget(
              appIcon: AppIcon(
                icon: Icons.settings,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height15*4,
              ), 
              bigText: BigText(text: "Parametres",)
            ),
            SizedBox(height: Dimensions.height15,),
            Column()
          ],
        ),
      ),
    );
  }
}