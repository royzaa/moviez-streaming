import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './small_image_card.dart';
import './stars.dart';

class SmallMovieCard extends StatelessWidget {
  const SmallMovieCard({
    Key? key,
    required this.crew,
    required this.image,
    required this.rating,
    required this.title,
  }) : super(key: key);
  final double rating;
  final String crew, title;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SmallImageCard(image: image),
        SizedBox(
          width: 10.w,
        ),
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "${crew.split(',').sublist(0, 1).first} ${crew.split(',').sublist(0, 1).last}",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w300,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Stars(rating: rating),
          ],
        )
      ],
    );
  }
}
