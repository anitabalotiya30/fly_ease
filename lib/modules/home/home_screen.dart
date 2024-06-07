import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/api_constants.dart';
import '../../utils/services/api_services.dart';
import '../../utils/widgets/custom_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _joke = ''.obs;

  @override
  void initState() {
    super.initState();
    _getJoke();
  }

  Future<void> _getJoke() async {
    _joke.value = await ApiServices.getApi(endpoint: ApiConstants.randomJoke);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => _joke.value.isNotEmpty
              ? Text(_joke.value)
              : const CustomLoading())
        ],
      ),

      //
    );
  }
}
