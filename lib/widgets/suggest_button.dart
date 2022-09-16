import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class SuggestButton extends StatelessWidget {
  const SuggestButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = const Color.fromRGBO(13, 8, 70, 1);
    Color shadowColor = const Color.fromRGBO(196, 200, 215, 1);
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shadowColor: shadowColor,
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 30.w),
        primary: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
      ),
      child: Text(
        'Suggest Movie',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
