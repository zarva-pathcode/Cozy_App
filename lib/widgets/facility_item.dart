import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int total;

  FacilityItem({this.imageUrl, this.name, this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 30.h,
        ),
        SizedBox(
          height: 8.w,
        ),
        Text.rich(
          TextSpan(
            text: '$total',
            style: purpleTextStyle.copyWith(fontSize: 14.sp),
            children: [
              TextSpan(
                  text: " $name",
                  style: greyTextStyle.copyWith(fontSize: 14.sp)),
            ],
          ),
          textScaleFactor: 1.0,
        ),
      ],
    );
  }
}
