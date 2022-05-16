import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/widget/big_text.dart';
import 'package:ecommerce/widget/icons_and_text_widgets.dart';
import 'package:ecommerce/widget/small_text.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.89);
  var _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        print("current value is " + _currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      color: Colors.redAccent,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildPageItem(index);
        }
      ),
    );
  }
  
  Widget _buildPageItem(int index) {
    return  Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: index.isEven?Colors.blue : Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/01.png",
              )
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 140,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,

            ),
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "type 1"),
                  SizedBox(height: 10),
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
                      SizedBox(width: 10),
                      SmallText(text: "4.5"),
                      SizedBox(width: 10),
                      SmallText(text: "1287"),
                      SizedBox(width: 10),
                      SmallText(text: "Comments"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      IconsAndTextWidgets(
                        icon: Icons.circle_sharp, 
                        text: "Normal", 
                        iconColor: AppColors.iconColor1,
                      ),
                      IconsAndTextWidgets(
                        icon: Icons.location_on, 
                        text: "1.7Km", 
                        iconColor: AppColors.mainColor,
                      ),
                      IconsAndTextWidgets(
                        icon: Icons.access_time_rounded, 
                        text: "32Min", 
                        iconColor: AppColors.iconColor2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]
    );
  }
}