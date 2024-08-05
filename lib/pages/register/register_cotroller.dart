import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evo_finder/common/widgets/flutter_toast.dart';
import 'package:evo_finder/pages/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name cannot be empty");
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty");
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password cannot be empty");
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
    }

    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (FirebaseAuth.instance.currentUser == null) {
        toastInfo(msg: "User is not signed in");
        return;
      }

      FirebaseFirestore.instance
          .collection("Users")
          .doc(credential.user!.email!)
          .set({
        "username": "",
        "vehicle-name": "",
        "vehicle-number": "",
        "mobile-number": ""
      });

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "An email has been sent to your registered email. To activate it, please check your email inbox");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "Your password is too weak");
        return;
      }
      if (e.code == "email-already-in-use") {
        toastInfo(msg: "Your password is too weak");
        return;
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "Your email is invalid");
        return;
      }
    }
  }
}
