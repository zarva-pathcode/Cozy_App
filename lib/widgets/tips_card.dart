import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/tips.dart';
import 'package:flutter_cozy/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80.w,
          child: Image.asset(tips.image),
        ),
        SizedBox(
          width: 18.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.headline,
              textScaleFactor: 1.0,
              style: blackTextStyle.copyWith(fontSize: 16.sp),
            ),
            SizedBox(
              height: 15.w,
            ),
            Text(
              tips.updatedAt,
              textScaleFactor: 1.0,
              style: greyTextStyle.copyWith(
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right,
            color: greyColor,
          ),
        )
      ],
    );
  }
}
