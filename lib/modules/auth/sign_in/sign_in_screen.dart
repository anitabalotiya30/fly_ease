import 'package:flutter/material.dart';
import 'package:fly_ease/helper/extensions.dart';
import 'package:get/get.dart';

import '../../../helper/global.dart';
import '../../../helper/my_dialog.dart';
import '../../../utils/constants/str_const.dart';
import '../../../utils/services/api_services.dart';
import '../../../utils/widgets/custom_btn.dart';
import '../../../utils/widgets/custom_text_field.dart';
import '../../home/home_screen.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final etEmail = TextEditingController();
  final etPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),

        //
        body: Padding(
          padding: EdgeInsets.only(
              left: mq.width * .04,
              right: mq.width * .04,
              top: mq.height * .05),

          //
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            //
            children: [
              //signup
              const Text(
                'Sign in',
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

                  padding: EdgeInsets.only(
                      bottom: mq.height * .01, top: mq.height * .02),
                  //
                  children: [
                    //
                    CustomTextField(
                        label: 'EMAIL',
                        etText: etEmail,
                        textInputType: TextInputType.emailAddress),
                    SizedBox(height: mq.height * .02),

                    //
                    CustomTextField(
                      label: 'PASSWORD',
                      etText: etPassword,
                    ),

                    SizedBox(height: mq.height * .04),

                    //
                    CustomBtn(onTap: onClick, text: 'Continue'),

                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      //
                      children: [
                        const Text('Don\'t have an Account?'),

                        //register btn
                        TextButton(
                            onPressed: Get.back,
                            child: const Text(
                              'Register',
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

  Future<void> onClick() async {
    final email = etEmail.text;
    final password = etPassword.text;

    if (email.isValid && password.isValid) {
      if (!email.isValid) {
        MyDialog.error(msg: 'Please enter valid email address.');
        return;
      }

      //
      final authenticate = await ApiServices.authenticateUser(
          email: etEmail.text, password: etPassword.text);

      //
      if (authenticate) Get.offAll(() => const HomeScreen());
    } else {
      MyDialog.error(msg: 'Fields are required.');
    }
  }
}
