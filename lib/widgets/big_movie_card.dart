import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './stars.dart';
import './big_image_card.dart';

class BigMovieCard extends StatelessWidget {
  const BigMovieCard({
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
    return SizedBox(
      width: MediaQuery.of(context).size.width - 24.w * 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BigImageCard(image: image),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      "${crew.split(',').sublist(0, 1).first} ${crew.split(',').sublist(0, 1).last}",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ],
              ),
              Stars(
                rating: rating,
              ),
            ],
          )
        ],
      ),
    );
  }
}
