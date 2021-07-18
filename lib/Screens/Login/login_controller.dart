
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  bool isLogIn = false;
  
  Future<User> logIn(String email, String password) async{
    FirebaseAuth auth = FirebaseAuth.instance;
  
    try {
      if(isLogIn) return null;
      isLogIn = true;
      update();
      User user = (await auth.signInWithEmailAndPassword(email: email, password: password)).user;
      print(user);
      isLogIn = false;
      update();
      return user;
    } catch (e) {
      print(e);
      isLogIn = false;
      update();
      return null;
    }
  }
}