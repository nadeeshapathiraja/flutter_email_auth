import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_auth/components/custom_dialogbox.dart';
import 'package:email_auth/controllers/db_controller.dart';
import 'package:email_auth/home_screen/home_screen.dart';
import 'package:email_auth/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:email_auth/utils/util_functions.dart';

class AuthController {
  //Firebase Auth Instance Create
  FirebaseAuth auth = FirebaseAuth.instance;

  //User Registration Create
  Future<void> registerUser(
    BuildContext context,
    String email,
    String password,
    String name,
    String phone,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .whenComplete(() async {
        await DatabaseController().saveUserInformation(name, email, phone);
      });
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

//User Login Function
  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //For secure use
      if (userCredential.user != null) {
        utilFunction.navigateTo(
          context,
          const HomeScreen(),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogBox().dialogbox(
          context,
          'No user found for that email.',
          'You Are Not Registered Member....',
          DialogType.ERROR,
          () {},
        );
      } else if (e.code == 'wrong-password') {
        DialogBox().dialogbox(
          context,
          'Wrong password provided for that user.',
          'Please Enter Correct Password....',
          DialogType.ERROR,
          () {},
        );
      }
    }
  }

//Sed Password reset Email
  Future<void>? sendPasswordResetEmail(
      BuildContext context, String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      DialogBox().dialogbox(
        context,
        'Email Send Success',
        'Check Your Email',
        DialogType.SUCCES,
        () {
          utilFunction.navigateTo(context, LoginScreen());
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        DialogBox().dialogbox(
          context,
          'Invalid Email Address.',
          'Please Enter Valid Email....',
          DialogType.ERROR,
          () {},
        );
      }
      if (e.code == 'user-not-found') {
        DialogBox().dialogbox(
          context,
          'No user found for that email.',
          'You Are Not Registered Member....',
          DialogType.ERROR,
          () {},
        );
      } else {
        DialogBox().dialogbox(
          context,
          'Error.',
          e.toString(),
          DialogType.ERROR,
          () {},
        );
      }
    } catch (e) {}
  }
}
