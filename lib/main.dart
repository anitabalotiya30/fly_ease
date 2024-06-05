import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'helper/global.dart';
import 'modules/intro/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Hive.initFlutter().then((value) async => await Pref.initializeHive());

  //enter full-screen
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  //for setting orientation to portrait only
  await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    const borderRadius = BorderRadius.all(Radius.circular(16));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        color: pColor,

        //
        theme: ThemeData(
            fontFamily: 'Montserrat',
            useMaterial3: false,

            // set default theme for appbar
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),

            // set default theme for textField
            inputDecorationTheme: const InputDecorationTheme(
                isDense: true,
                // filled: true,

                // focus border style
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: borderRadius),

                // focus border style
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                    borderRadius: borderRadius))),

        //
        home: const SplashScreen());
  }
}
