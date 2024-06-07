import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';
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
  final isDataLoaded = false.obs;

  @override
  void initState() {
    super.initState();
    _getJoke();
  }

  Future<void> _getJoke() async {
    final data = await ApiServices.getApi(endpoint: ApiConstants.randomJoke);

    if (data != null) {
      if (data['attachments'].isNotEmpty) {
        _joke.value = data['attachments'][0]['text'];
        isDataLoaded.value = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today\'s Joke'),
      ),
      //
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.height * .04),

        //
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          //
          children: [
            Obx(() => isDataLoaded.value
                ? Text(
                    _joke.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  )
                : const CustomLoading(color: Colors.black)),
          ],
        ),
      ),

      //
    );
  }
}
