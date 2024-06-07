import 'package:flutter/material.dart';

import '../../helper/global.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double fontSize;
  final bool whiteBtn;

  const CustomBtn(
      {super.key,
      this.fontSize = 17,
      required this.onTap,
      required this.text,
      this.whiteBtn = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(mq.width * .5, 50),
        ),
        onPressed: onTap,

        // label
        child: Text(text,
            style: TextStyle(
                fontSize: fontSize,
                letterSpacing: .5,
                fontWeight: FontWeight.bold,
                color: whiteBtn ? pColor : Colors.white)));
  }
}
