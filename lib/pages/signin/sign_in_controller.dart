import 'package:evo_finder/common/widgets/flutter_toast.dart';
import 'package:evo_finder/pages/signin/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninController {
  final BuildContext context;
  const SigninController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill your email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill your password");
          return;
        }
        try {
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credentials.user == null) {
            toastInfo(msg: "User not exists");
            return;
          }
          if (!credentials.user!.emailVerified) {
            toastInfo(msg: "User not verified");
            return;
          }
          var user = credentials.user;
          if (user != null) {
            print("User Exists");

            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
            return;
          } else {}
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No User found for that email");
            return;
          } else if (e.code == "wrong-password") {
            toastInfo(msg: "Wrong Password");
            return;
          } else if (e.code == "invalid-email") {
            toastInfo(msg: "Your email format is wrong");
            return;
          }
        }
      }
    } catch (e) {}
  }
}
