import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_auth/components/custom_dialogbox.dart';
import 'package:email_auth/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:email_auth/utils/util_functions.dart';

class AuthController {
  //Firebase Auth Instance Create
  FirebaseAuth auth = FirebaseAuth.instance;

  //User Registration Create
  Future<void> registerUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      DialogBox().dialogbox(
        context,
        "Congratulations, Your Registration Success",
        'Dialog description here.............',
        DialogType.SUCCES,
        () {
          utilFunction.navigateTo(
            context,
            const LoginScreen(),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogBox().dialogbox(
          context,
          'The password provided is too weak.',
          'Dialog description here.............',
          DialogType.ERROR,
          () {},
        );
      } else if (e.code == 'email-already-in-use') {
        DialogBox().dialogbox(
          context,
          'The account already exists for that email.',
          'Dialog description here.............',
          DialogType.ERROR,
          () {},
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
