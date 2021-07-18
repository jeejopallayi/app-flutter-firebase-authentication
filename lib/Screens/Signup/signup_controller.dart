

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpController extends GetxController{
  bool isLoading = false;
  Future<User> signUp(String name, String email, String password) async{

    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      if(isLoading) return null;
      isLoading = true; 
      update();
      await Future.delayed(Duration(seconds: 1));
      print("signUp");
      print(email);
      print(password);
      User user = (await auth.createUserWithEmailAndPassword(email: email, password: password)).user;
      print(user);
      isLoading = false; 
      update();
      return user;
    } catch (e) {
      isLoading = false; 
      update();
      print(e);
      return null;
    }  
  }

}