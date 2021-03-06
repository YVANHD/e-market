import 'package:ecommerce/widget/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconsAndTextWidgets extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconsAndTextWidgets({
    Key? key, 
    required this.icon, 
    required this.text, 
    required this.iconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(width: 5),
        SmallText(
          text: text,
        )
      ],
    );
  }
}