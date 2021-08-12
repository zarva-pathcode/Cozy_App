import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/city.dart';
import 'package:flutter_cozy/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18.w),
      child: Container(
        height: double.infinity,
        width: 120.w,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                city.imageUrl,
                width: 120.h,
                height: 102.w,
                fit: BoxFit.cover,
              ),
              city.isPopular
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.w)),
                            color: purpleColor),
                        child: Center(
                            child: Image.asset(
                          "assets/icons/Icon_star_solid.png",
                          width: 22,
                          height: 22,
                        )),
                      ),
                    )
                  : Container()
            ]),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blackTextStyle.copyWith(
                fontSize: 16.sp,
              ),
              textScaleFactor: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
