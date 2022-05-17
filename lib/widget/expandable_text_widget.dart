import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimensions.dart';
import 'package:ecommerce/widget/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  @override
  Widget build(BuildContext context) {
    late String firstHalf;
    late String secondHalf;

    bool hiddenText = true;

    double textHeight = Dimensions.screenHeight/5.63;

    @override
    void initState() {
      super.initState();
      if(widget.text.length > textHeight) {
        firstHalf = widget.text.substring(0, textHeight.toInt());
        secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
      } else {
        firstHalf = widget.text;
        secondHalf = "";
      }
    }
    
    return Container(
      child: secondHalf.isEmpty ? SmallText(text: firstHalf) : Column(
        children: [
          SmallText(text: hiddenText ? (firstHalf + "....") : (firstHalf + secondHalf)),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Voir plus", color: AppColors.mainColor,),
                Icon(Icons.arrow_drop_down, color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}