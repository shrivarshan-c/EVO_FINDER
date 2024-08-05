import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget cardView() {
  return Container(
    margin: EdgeInsets.all(20.w),
    width: 325.w,
    height: 200.w,
    child: Card(
      color: Colors.green[50],
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Vehicle Number: ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Vehicle Name: ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Add edit functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget nearbyStationsView() {
  return Column(
    children: [
      Container(
        width: 500.w,
        height: 350.h,
        child: PageView(
          children: [
            Container(
              width: 325.w,
              height: 162.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.h),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/e-station.avif",
                    width: 220.w,
                  ),
                  const Column(
                    children: [
                      Text(
                        "Name : Bolt.Earth EV Charging Station",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Location : "),
                      Text("MGR Main Road, Kandhanchavadi"),
                      Text("Perungudi, Chennai"),
                      Text("600096")
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 325.w,
              height: 162.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.h),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/e-station-2.webp",
                    width: 300.w,
                  ),
                  const Column(
                    children: [
                      Text(
                        "Name : Zeon Charging Station",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Location : "),
                      Text("Holiday Inn, Chennai OMR"),
                      Text("Thiruvanmiyur, Chennai"),
                      Text("600096")
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 325.w,
              height: 162.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.h),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/e-station-3.jpeg",
                    width: 220.w,
                  ),
                  const Column(
                    children: [
                      Text(
                        "Name : SNAK4EV Charging Station",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Location : "),
                      Text("Murugan Nagar, Echangadu Junction"),
                      Text("Keelakattalai, Chennai"),
                      Text("600117")
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 325.w,
              height: 162.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.h),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/e-station-4.jpeg",
                    width: 220.w,
                  ),
                  const Column(
                    children: [
                      Text(
                        "Name : ETRON Charging Station",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Location : "),
                      Text("CTA Garden Main Road"),
                      Text("Mangadu, Chennai"),
                      Text("600122")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
