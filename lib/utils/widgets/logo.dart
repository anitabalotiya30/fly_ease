import 'package:flutter/material.dart';

import '../constants/str_const.dart';

class Logo extends StatelessWidget {
  final double? height;
  const Logo({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        //
        child: Image(
            image: const AssetImage(StrConst.logo), height: height ?? 80));
  }
}
