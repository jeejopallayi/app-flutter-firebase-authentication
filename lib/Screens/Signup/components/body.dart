
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_controller.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/components/alert_message.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final controller = Get.put(SignUpController());
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context){
    return GetBuilder<SignUpController>(builder: (controller) {
      return Scaffold(
        body: getBody(context),
      );
    });
  }

  getBody(context){
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset("assets/images/signup-image.png", height: size.height * 0.25,),
            RoundedInputField(
              hintText: "Your Name",
              controller: controllerName,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Your Email",
              controller: controllerEmail,
              icon: Icons.email_rounded,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              controller: controllerPassword
            ),
            RoundedButton(
              text: "SIGN UP",
              isLoading: controller.isLoading,
              press: () {
                controller.signUp(controllerName.text,  controllerEmail.text, controllerPassword.text).then((value) {
                  value != null ? 
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  )) :
                  showAlertDialog(context, "Sing Up", "Sign Up Failed");
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
              },
            ),
            // OrDivider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SocalIcon(
            //       iconSrc: "assets/icons/facebook.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/twitter.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/google-plus.svg",
            //       press: () {},
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
