import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../helper/global.dart';
import '../../../utils/constants/str_const.dart';
import '../../../utils/widgets/custom_btn.dart';
import '../../../utils/widgets/custom_text_field.dart';
import '../sign_in/sign_in_screen.dart';
import 'sign_up_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _c = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    //enter full-screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    //
    return DecoratedBox(
      //
      decoration: const BoxDecoration(

          //
          image: DecorationImage(
              image: AssetImage(StrConst.signupPage), fit: BoxFit.fill)),

      //
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,

        //
        body: Padding(
          padding: EdgeInsets.only(
              left: mq.width * .04,
              right: mq.width * .04,
              top: mq.height * .16),

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
              SizedBox(height: mq.height * .1),

              //
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),

                  padding: EdgeInsets.only(bottom: mq.height * .01),
                  //
                  children: [
                    //
                    CustomTextField(
                      etText: _c.user.etFName,
                      label: 'FIRST NAME',
                    ),
                    SizedBox(height: mq.height * .02),

                    //
                    CustomTextField(
                      label: 'LAST NAME',
                      etText: _c.user.etLName,
                    ),
                    SizedBox(height: mq.height * .02),

                    //
                    CustomTextField(
                        label: 'EMAIL',
                        etText: _c.user.etEmail,
                        textInputType: TextInputType.emailAddress),
                    SizedBox(height: mq.height * .02),

                    //
                    CustomTextField(
                      label: 'PASSWORD',
                      etText: _c.user.etPassword,
                    ),
                    SizedBox(height: mq.height * .02),

                    //
                    CustomTextField(
                      label: 'CONFIRM PASSWORD',
                      etText: _c.etConfirmPw,
                    ),
                    SizedBox(height: mq.height * .03),

                    //
                    CustomBtn(onTap: _c.onClick, text: 'Next'),

                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      //
                      children: [
                        const Text('Already have an account?'),

                        //register btn
                        TextButton(
                            onPressed: () => Get.to(() => SigninScreen()),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
