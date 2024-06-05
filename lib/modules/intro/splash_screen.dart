import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/widgets/custom_loading.dart';
import '../../utils/widgets/logo.dart';
import '../sign_up/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500),
        () => Get.off(() => const SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Spacer(flex: 2),

            //logo
            Logo(height: 150),

            Spacer(),

            //loading
            CustomLoading(color: Colors.black),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
