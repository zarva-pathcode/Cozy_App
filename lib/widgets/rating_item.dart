import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  RatingItem({this.index, this.rating});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating
          ? "assets/icons/Icon_star_solid.png"
          : "assets/icons/icon_star.png",
      width: 20.w,
    );
  }
}
