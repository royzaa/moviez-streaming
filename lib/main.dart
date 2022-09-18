import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './screens/home.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ((context, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
        );
        return Theme(
          data: ThemeData(
            fontFamily: 'Avenir',
            primarySwatch: Colors.blueGrey,
          ),
          child: const MaterialApp(
            home: Home(),
          ),
        );
      }),
      title: 'Moviez Streaming',
    );
  }
}
