import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class BigImageCard extends StatefulWidget {
  const BigImageCard({
    Key? key,
    required this.image,
  }) : super(key: key);
  final ImageProvider image;

  @override
  State<BigImageCard> createState() => _BigImageCardState();
}

class _BigImageCardState extends State<BigImageCard> {
  Color initColor = Colors.grey.shade200;
  late Color mainColor;

  void getDomColor(ImageProvider image) async {
    final generator = await PaletteGenerator.fromImageProvider(image);
    if (generator.colors.isNotEmpty) {
      mainColor = generator.colors.first;
    }
  }

  @override
  void initState() {
    super.initState();
    getDomColor(widget.image);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 200.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: widget.image,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.medium,
        ),
        borderRadius: BorderRadius.circular(bigRadius),
        boxShadow: [
          BoxShadow(
            color: mainColor.withOpacity(0.6),
            blurRadius: 40,
          ),
        ],
      ),
    );
  }
}
