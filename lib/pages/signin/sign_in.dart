import 'package:evo_finder/pages/signin/bloc/sign_in_bloc.dart';
import 'package:evo_finder/pages/signin/bloc/sign_in_event.dart';
import 'package:evo_finder/pages/signin/bloc/sign_in_state.dart';
import 'package:evo_finder/pages/signin/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evo_finder/pages/common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(
              "Log In",
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const SizedBox(height: 10),
                  Center(
                      child: reusableText("Use your email account to login")),
                  Container(
                    margin: EdgeInsets.only(top: 66.h),
                    padding: EdgeInsets.only(left: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                          "Enter your email address",
                          "email",
                          "user",
                          (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          },
                        ),
                        reusableText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                          "Enter your your password",
                          "password",
                          "lock",
                          (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          },
                        ),
                      ],
                    ),
                  ),
                  buildLogInAdnRegButton(
                    "Log In",
                    "login",
                    () {
                      SigninController(context: context).handleSignIn("email");
                    },
                  ),
                  buildLogInAdnRegButton(
                    "Sign Up",
                    "register",
                    () {
                      Navigator.of(context).pushNamed("/register");
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
