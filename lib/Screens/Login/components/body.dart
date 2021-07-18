
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/components/alert_message.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:get/get.dart';
import '../login_controller.dart';

class Body extends StatelessWidget {
  
  final controller = Get.put(LogInController());
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  
  @override
  Widget build(BuildContext context){
    return GetBuilder<LogInController>(builder: (controller) {
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
              "LOG IN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset("assets/images/login-image.png" ,height: size.height * 0.25,),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              icon: Icons.email_rounded,
              controller: controllerEmail,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
              controller: controllerPassword,
            ),
            RoundedButton(
              text: "LOG IN",
              isLoading: controller.isLogIn,
              press: () {
                controller.logIn(controllerEmail.text, controllerPassword.text).then((value) {
                  value != null ? 
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  )) :
                  showAlertDialog(context, "Log In", "Log In Failed");
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
