import 'package:flutter/material.dart';

import '../../helper/global.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController etText;
  final String label;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final Function(String)? onChanged;

  const CustomTextField(
      {super.key,
      required this.etText,
      required this.label,
      this.prefixIcon,
      this.textInputType,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      //
      children: [
        Text(
          label,
          style: const TextStyle(
              color: textColor, fontSize: 12, fontWeight: FontWeight.w500),
        ),

        //
        Container(
          margin: EdgeInsets.only(top: mq.height * .012),

          //
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color(0Xffedf6f9),
                blurRadius: 8,
                blurStyle: BlurStyle.outer,
                spreadRadius: 4,
                offset: Offset(1, 1))
          ]),

          //
          child: TextField(
            cursorColor: Colors.black45,
            keyboardType: textInputType ?? TextInputType.text,
            controller: etText,
            onChanged: onChanged,
            style: const TextStyle(fontWeight: FontWeight.bold),

            //
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}
