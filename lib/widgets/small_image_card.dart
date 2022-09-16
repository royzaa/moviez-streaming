import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class SmallImageCard extends StatelessWidget {
  const SmallImageCard({
    Key? key,
    required this.image,
  }) : super(key: key);
  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 125.6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(smallRadius),
        image: DecorationImage(image: image),
      ),
    );
  }
}
