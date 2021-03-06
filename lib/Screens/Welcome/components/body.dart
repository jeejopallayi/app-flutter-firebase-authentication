import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Log Out",
              press: () {
                logOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}


Future logOut(BuildContext context)  async{
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    await auth.signOut().then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ));
    });
  } catch (e) {
    
  }
}