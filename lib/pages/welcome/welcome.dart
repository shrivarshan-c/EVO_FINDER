import 'package:dots_indicator/dots_indicator.dart';
import 'package:evo_finder/common/values/constants.dart';
import 'package:evo_finder/global.dart';
import 'package:evo_finder/pages/welcome/bloc/welcome_bloc.dart';
import 'package:evo_finder/pages/welcome/bloc/welcome_event.dart';
import 'package:evo_finder/pages/welcome/bloc/welcome_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      child: Scaffold(
        backgroundColor: Colors.green[50],
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        1,
                        context,
                        "assets/icons/arrow_right.png",
                        "Welcome to our App",
                        "assets/images/welcome_car_1.png",
                      ),
                      _page(
                        2,
                        context,
                        "assets/icons/tick.png",
                        "Locations made easy",
                        "assets/images/welcome_car_3.png",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 2,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        size: const Size.square(8.0),
                        activeColor: Colors.green,
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonPath, String title,
      String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 300.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 2) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutExpo,
              );
            } else {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => MyHomePage()));
              // Global.storageService
              //     .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              // print(
              //     "the value is ${Global.storageService.getDeviceFirstOpen()}");
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.green[500],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Center(
              child: Image.asset(
                buttonPath,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
