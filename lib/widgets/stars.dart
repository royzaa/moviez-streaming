import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Stars extends StatelessWidget {
  const Stars({
    Key? key,
    required this.rating,
  }) : super(key: key);
  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: true,
      maxRating: 5,
      minRating: 0,
      initialRating: rating / 2.0,
      itemSize: 18.r,
      allowHalfRating: true,
      itemCount: 5,
      unratedColor: Colors.grey.shade200,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (_) {},
    );
  }
}
