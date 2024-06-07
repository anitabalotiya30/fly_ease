import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/services/api_services.dart';
import '../../utils/services/pref.dart';
import '../../utils/widgets/custom_loading.dart';
import '../../utils/widgets/logo.dart';
import '../auth/sign_up/sign_up_screen.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool exists = false;
  final userToken = Pref.userToken;

  //
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), () async {
      await authenticateUser();
      Get.off(() => exists ? const HomeScreen() : SignupScreen());
    });
  }

  Future<void> authenticateUser() async {
    if (userToken.isNotEmpty) {
      exists = await ApiServices.getUserProfile(accessToken: userToken);
    }
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
