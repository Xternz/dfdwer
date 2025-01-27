import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/screens/splash/splashScreen2.dart';
import 'package:page_transition/page_transition.dart';

class splashScreenPage extends StatelessWidget {
  const splashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height - 35,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 55, 67),
              Color.fromARGB(255, 0, 91, 111),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(60.r),
                    child: Row(
                      children: [
                        // Image(image: AssetImage('assets/icons/appIcon.png')),
                        Icon(Icons.ac_unit_sharp,
                            color: Colors.amberAccent, size: 100.sp),
                        SizedBox(
                          width: 30.w,
                        ),
                        Text(
                          "MindCare",
                          style: TextStyle(color: color1, fontSize: 80.sp),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Skip",
                    style: TextStyle(color: color1, fontSize: 40.sp),
                  )
                ],
              ),
            ),
            Divider(
              height: 10.h,
              thickness: 1.r,
              indent: 50.h,
              endIndent: 50.h,
              color: color1,
            ),
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Your Mental Wellness Companion",
                style: TextStyle(color: color1, fontSize: 80.sp),
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: Text("Empowering You for a Healthier Mind", style: TextStyle(color: lightTextColor2, fontSize: 55.sp),)),
            SizedBox(
              height: 100.h,
            ),
            Image(image: const AssetImage('assets/images/illustration_3.jpg', ),height: 900.h, width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
            SizedBox(
              height: 100.h,
            ),
            Text(
              "Let's get started",
              style: TextStyle(color: color1, fontSize: 60.sp),
            ),
            SizedBox(
              height: 90.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/login');
                //   },
                //   child: Text(
                //     "< Previous",
                //     style: TextStyle(color: color1, fontSize: 60.sp),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     primary: color2,
                //     // padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 20.h),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30.r),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(right:16.0),
                  child: ElevatedButton(
                    
                    onPressed: () {
                      Navigator.pushReplacement(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 400),
                        type: PageTransitionType.fade,
                        child: const splashScreenPage2(),));},
                    child: Text(
                      "Next >",
                      style: TextStyle(color: color1, fontSize: 60.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightTextColor3,
                      
                      padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 20.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
