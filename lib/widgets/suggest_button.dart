import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class SuggestButton extends StatelessWidget {
  const SuggestButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = const Color.fromRGBO(13, 8, 70, 0);
    Color shadowColor = const Color.fromRGBO(196, 200, 215, 0);
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shadowColor: shadowColor,
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
