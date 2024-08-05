import 'package:evo_finder/pages/common_widgets.dart';
import 'package:evo_finder/pages/register/bloc/register_bloc.dart';
import 'package:evo_finder/pages/register/bloc/register_event.dart';
import 'package:evo_finder/pages/register/bloc/register_state.dart';
import 'package:evo_finder/pages/register/register_cotroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const SizedBox(height: 10),
                  Center(
                      child: reusableText(
                          "Enter your Email below and free Sign Up")),
                  Container(
                    margin: EdgeInsets.only(top: 16.h),
                    padding: EdgeInsets.only(left: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("User Name"),
                        buildTextField(
                          "Enter your User name",
                          "name",
                          "user",
                          (value) {
                            context.read<RegisterBloc>().add(EmailEvent(value));
                          },
                        ),
                        reusableText("Email"),
                        buildTextField(
                          "Enter your email address",
                          "email",
                          "user",
                          (value) {
                            context.read<RegisterBloc>().add(EmailEvent(value));
                          },
                        ),
                        reusableText("Password"),
                        buildTextField(
                          "Enter your password",
                          "password",
                          "lock",
                          (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordEvent(value));
                          },
                        ),
                        reusableText("Confirm Password"),
                        buildTextField(
                          "Re-enter your password to confirm",
                          "password",
                          "lock",
                          (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordEvent(value));
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child:
                        reusableText("Enter your Email below and free Sign Up"),
                  ),
                  buildLogInAdnRegButton(
                    "Sign Up",
                    "login",
                    () {
                      //Navigator.of(context).pushNamed("register");
                      RegisterController(context: context)
                          .handleEmailRegister();
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
