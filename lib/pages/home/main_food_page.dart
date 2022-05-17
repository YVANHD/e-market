import 'package:ecommerce/pages/home/food_page_body.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
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
      //print("hauteur courante est " + MediaQuery.of(context).size.height.toString());
      body: Column(
        children: [
          // Header
          Container(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Langue",
                        color: AppColors.mainColor,
                        size: 20,
                      ),
                      Row(
                        children: [
                          SmallText(
                          text: "Francais",
                          color: Colors.black45,
                          ),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search, color: Colors.white,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // body
          Expanded(child: SingleChildScrollView(
             physics: const BouncingScrollPhysics(),
            child: FoodPageBody(),
          )),
          SizedBox(height: 10),
          // Center(
          // child: ElevatedButton(
          // onPressed: () {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(
          //       content: Stack(
          //         children: [
          //           Container(
          //             height: 90,
          //             padding: EdgeInsets.all(16),
          //             decoration: BoxDecoration(
          //               color: Color(0xFFC72C41),
          //               borderRadius: BorderRadius.circular(20)
          //             ),
          //             child: Row(
          //               children: [
          //                 SizedBox(width: 48,),
          //                 Expanded(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         "title",
          //                         style: TextStyle(
          //                           fontSize: 18,
          //                           color: Colors.white
          //                         ),
          //                       ),
          //                       Text(
          //                         "Lorem ipsum dolore sanctum",
          //                         style: TextStyle(
          //                           fontSize: 12,
          //                           color: Colors.white
          //                         ),
          //                         maxLines: 2,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             )
          //           ),
          //           Positioned(
          //             child: ClipRect(
                        
          //               child: Icon(
          //                 Icons.abc,
          //                 size: 40,
          //                 color: Colors.white
          //               ),
          //             ),
          //           )
          //         ],
          //       ),
          //       behavior: SnackBarBehavior.floating,
          //       backgroundColor: Colors.transparent,
          //       elevation: 0,
          //     ),
          //   );
          // },
          //   child: const Text(" Montrer"),
          // ))
        
        ],
      ),
    );
  }
}