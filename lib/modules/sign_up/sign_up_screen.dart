import 'package:flutter/material.dart';

import '../../helper/global.dart';
import '../../utils/constants/str_const.dart';
import '../../utils/widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //
        Image.asset(StrConst.signIn),

        //
        Align(
          alignment: Alignment.topCenter,

          //
          child: Padding(
            padding: EdgeInsets.only(
                top: mq.height * .2,
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
        Align(
          child: Container(
            margin: EdgeInsets.only(top: mq.height * .38),
            height: mq.height,
            width: mq.width,

            //
            decoration: const BoxDecoration(
              //
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34), topRight: Radius.circular(34)),

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

        Align(
          child: Container(
            margin: EdgeInsets.only(top: mq.width * .84),
            padding: EdgeInsets.symmetric(horizontal: mq.width * .04),

            //
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(38),
                    topRight: Radius.circular(38))),

            //
            child: Stack(
              children: [
                Align(
                    child: Padding(
                  padding: EdgeInsets.only(bottom: mq.height * .8),
                  child: const Text(
                    'data',
                    style: TextStyle(color: Colors.amber),
                  ),
                )),
                Column(
                  // physics: const NeverScrollableScrollPhysics(),

                  //
                  children: [
                    const Text(
                      'FIRST NAME',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: mq.height * .03),

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
                        child: CustomTextField(
                          etText: TextEditingController(),
                        ))
                  ],
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
            child: Image.asset(StrConst.colors, height: mq.height * .16),
          ),
        ),
      ]),
    );
  }
}
