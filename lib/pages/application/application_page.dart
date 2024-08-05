import 'package:evo_finder/common/values/colors.dart';
import 'package:evo_finder/pages/application/bloc/app_bloc.dart';
import 'package:evo_finder/pages/application/bloc/app_event.dart';
import 'package:evo_finder/pages/application/bloc/app_state.dart';
import 'package:evo_finder/pages/application/widgets/application_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.h),
                      topRight: Radius.circular(20.h)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 0.8,
                      spreadRadius: 0.4,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.green[50],
                  selectedItemColor: Colors.green[500],
                  unselectedItemColor: AppColors.primaryFourthElementText,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: state.index,
                  onTap: (value) {
                    context.read<AppBloc>().add(TriggerAppEvent(value));
                  },
                  elevation: 0,
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
