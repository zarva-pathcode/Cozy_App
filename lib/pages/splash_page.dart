import 'package:flutter/material.dart';
import 'package:flutter_cozy/pages/home_page.dart';
import 'package:flutter_cozy/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/splash-image.png")),
          Padding(
            padding: EdgeInsets.only(top: 30.w, left: edge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48.h,
                  width: 48.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo/logo.png'))),
                ),
                SizedBox(height: 24.w),
                Text(
                  "Find Cozy House\nto Stay and Happy",
                  textScaleFactor: 1.0,
                  style: blackTextStyle.copyWith(
                      fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Text(
                    "Stop membuang banyak waktu\npada tempat yang tidak habitable",
                    textScaleFactor: 1.0,
                    style: greyTextStyle.copyWith(fontSize: 16.sp)),
                SizedBox(
                  height: 40.w,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.height / 14,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => HomePage()));
                    },
                    style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(purpleColor),
                        backgroundColor: MaterialStateProperty.all(purpleColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17.w)))),
                    child: Text(
                      "Explore Now",
                      textScaleFactor: 1.0,
                      style: whiteTextStyle.copyWith(fontSize: 18.sp),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
