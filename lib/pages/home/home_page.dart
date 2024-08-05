import 'package:evo_finder/pages/home/widgets/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hello User"),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              width: 50.w,
              child: Image.asset("assets/images/user.png"),
            ),
            const SizedBox(height: 40),
            Text(
              "Nearby Locations",
              style: TextStyle(fontSize: 20.sp),
            ),
            const SizedBox(height: 10),
            nearbyStationsView(),
          ],
        ),
      ),
    );
  }
}
