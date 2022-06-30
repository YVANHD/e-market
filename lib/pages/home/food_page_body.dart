import 'dart:convert';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce/routes/route_helper.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widget/app_column.dart';
import 'package:ecommerce/widget/big_text.dart';
import 'package:ecommerce/widget/icons_and_text_widgets.dart';
import 'package:ecommerce/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  List brochettes = [];
  List cakes = [];

  PageController brochetteController = PageController(viewportFraction: 0.89);
  PageController cakeController = PageController(viewportFraction: 0.89);
  var _currCakeValue = 0.0;
  var _currBrochetteVal = 0.0;
  double _scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;

  @override
  void initState() {
    _readData();
    super.initState();
    brochetteController.addListener(() {
      setState(() {
        _currBrochetteVal = brochetteController.page!;
        //print("la valeur courante est " + _currentPageValue.toString());
      });
    });
  }

  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/brochettes.json").then((value) {
      setState(() {
        brochettes = json.decode(value);
      });
    });

    await DefaultAssetBundle.of(context).loadString("json/cakes.json").then((value) {
      setState(() {
        cakes = json.decode(value);
      });
    });
  }

  @override
  void dispose() {
    brochetteController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      // produits categorisés
        BigText(text: "Nos Brochettes"),
        SizedBox(height: Dimensions.height10,),
        SizedBox(
          height: Dimensions.pageView,
          // color: Colors.redAccent,
          child: PageView.builder(
            controller: brochetteController,
            itemCount: brochettes == null ? 0 : brochettes.length,
            itemBuilder: (context, index) {
              return Container();
              // _buildPageItem(index);
            }
          ),
        ),
        DotsIndicator(
          dotsCount: brochettes.length,
          position: _currBrochetteVal,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

// produits recommendés
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Nos Cakes"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(text: ":", color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Les plus Recommendés..."),
              ),
            ],
          ),
        ),
        // liste de plats
        SizedBox(
          height: 500,
          child: ListView.builder(
            shrinkWrap: true,
             physics: const BouncingScrollPhysics(),
          itemCount: cakes == null ? 0 : cakes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.recommendedFood);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10),
                child: Row(
                  children: [
                    // image section
                    Container(
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: DecorationImage(
                          image: AssetImage(
                            cakes[index]["img"]
                          ),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    // icon and text section
                    Expanded(
                      child: Container(
                        height: Dimensions.listViewTextSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20)
                          ),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: Dimensions.width10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            BigText(
                              text:   cakes[index]["name"],
                              size: 15,
                            ),
                            SizedBox(height: Dimensions.height10),
                            SmallText(text:  cakes[index]["description"]),
                            SizedBox(height: Dimensions.height10),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconsAndTextWidgets(
                                    icon: Icons.numbers_sharp,
                                    text: "à partir de ${cakes[index]["piece"]} pieces", 
                                    iconColor: AppColors.iconColor1,
                                  ),
                                  IconsAndTextWidgets(
                                    icon: Icons.money_off, 
                                    text: cakes[index]["price"], 
                                    iconColor: AppColors.mainColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
            ),
        ),

      ],
    );
  }
  
  Widget _buildPageItem(int index) {
    // Matrix4 matrix = new Matrix4.identity();
    // if(index == _currentPageValue.floor()) {
    //   var currentScale = 1-(_currentPageValue - index) + (1 - _scaleFactor);
    //   var currTrans = height * (1-currentScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentScale, 0);

    // } else if(index == _currentPageValue.floor() + 1) {
    //   var currentScale = _scaleFactor + (_currentPageValue - index + 1) + (1 - _scaleFactor);
    //   var currTrans = height * (1-currentScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentScale, 0);

    // }else if(index == _currentPageValue.floor() + 1) {
    //   var currentScale = 1-(_currentPageValue - index) + (1 - _scaleFactor);
    //   var currTrans = height * (1-currentScale) / 2;
    //   matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    //   matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentScale, 0);

    // } else {
    //   var currentScale = 0.6;
    //   matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, height * (1 - _scaleFactor)/2, 1);

    // }
     var bro =  brochettes[index];

    return  GestureDetector(
     
      onTap: () {
        Get.toNamed(RouteHelper.recommendedFood,
         arguments: {
            "category": brochettes[index]["category"].toString(),
            "name": bro.name,
            "img": brochettes[index]["img"].toString(),
            "description": brochettes[index]["description"].toString(),
            "price": brochettes[index]["price"].toString(),
            "piece": brochettes[index]["piece"].toString(),
            "stars": brochettes[index]["stars"],
          }
        );
      },
      child: Stack(
        children: [
          Container(
            
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven?Colors.blue : Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                   brochettes[index]["img"],
                )
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextController,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: const Color(0xFFe8e8e8),
                boxShadow: const [ 
                  BoxShadow(
                    color:  Color(0xFFe8e8e8),
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ]
      
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.height15, right: Dimensions.height15),
                child: AppColumn(nameText: brochettes[index]["name"], priceText: brochettes[index]["price"], stars: brochettes[index]["stars"]),
              ),
            ),
          ),
        ]
      ),
    );
  }
}