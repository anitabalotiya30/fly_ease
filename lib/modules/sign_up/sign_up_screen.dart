import 'dart:developer';

import 'package:flutter/material.dart';

import '../../helper/global.dart';
import '../../utils/constants/str_const.dart';
import '../../utils/widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      //
      body: Stack(children: [
        //
        Image.asset(StrConst.signIn),

        //
        Align(
          alignment: Alignment.topCenter,

          //
          child: Padding(
            padding: EdgeInsets.only(
                top: mq.height * .18,
                right: mq.width * .14,
                left: mq.width * .04),

            //
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              //
              children: [
                //signup
                const Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // for giving some space
                SizedBox(height: mq.height * .02),

                //
                const Text(
                  'Connect with DadJoke API and place the joke here to test API connectivity.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),

        /// container inside container
        Stack(
          children: [
            Align(
              child: Container(
                margin: EdgeInsets.only(top: mq.height * .38),
                height: mq.height,
                width: mq.width,

                //
                decoration: const BoxDecoration(
                  //
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34)),

                  //
                  gradient: SweepGradient(colors: [
                    Colors.white,
                    Colors.amber,
                    Colors.blue,
                    Colors.purple,
                    Colors.orange,
                    Colors.green,
                  ], center: Alignment.center, startAngle: 3.2, endAngle: 5.4),
                ),
              ),
            ),

            //
            Align(
              child: Container(
                margin: EdgeInsets.only(top: mq.height * .39),
                padding: EdgeInsets.symmetric(horizontal: mq.width * .04),

                //
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(38),
                        topRight: Radius.circular(38))),

                //
                child: ListView(
                  children: [
                    //
                    CustomTextField(
                      etText: TextEditingController(),
                      label: 'FIRST NAME',
                    ),
                    SizedBox(height: mq.height * .02),

                    //
                    CustomTextField(
                      label: 'LAST NAME',
                      etText: TextEditingController(),
                    ),
                    SizedBox(height: mq.height * .02),

                    //
                    CustomTextField(
                      label: 'EMAIL',
                      etText: TextEditingController(),
                    ),
                    SizedBox(height: mq.height * .02),

                    //
                    CustomTextField(
                      label: 'PASSWORD',
                      etText: TextEditingController(),
                    ),
                    SizedBox(height: mq.height * .02),

                    //
                    CustomTextField(
                      label: 'CONFIRM PASSWORD',
                      etText: TextEditingController(),
                    ),
                  ],
                ),
              ),
            ),

            //
            Align(
              alignment: Alignment.centerRight,

              //
              child: Padding(
                padding: EdgeInsets.only(bottom: mq.height * .17),

                //
                child: InkWell(
                    onTap: () {
                      // var a = [1, 2, 3];
                      // var b = [4, 5, 6];
                      // a.addAll(b);
                      // a.sort();
                      log('numbers ----');

                      final numbers = <int>[2, 4, 3];
                      // Sort from shortest to longest.
                      numbers.sort((a, b) => a.compareTo(b));

                      log('numbers ---- $numbers');

                      // int temp = a[0];
                      // for (int i = 0; i < a.length; i++) {
                      //   for (int j = i + 1; j < a.length; j++) {
                      //     if (a[i] > a[j]) {
                      //       temp = a[i];
                      //       a[i] = a[j];
                      //       a[j] = temp;
                      //     }
                      //   }
                      // }
                    },
                    //
                    child:
                        Image.asset(StrConst.colors, height: mq.height * .16)),
              ),
            ),
          ],
        ),

        //
      ]),
    );
  }
}
