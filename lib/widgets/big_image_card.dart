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
  Color? mainColor;

  void getDomColor(ImageProvider image) async {
    final generator = await PaletteGenerator.fromImageProvider(image);
    if (generator.colors.isNotEmpty) {
      setState(() {
        mainColor = generator.colors.first;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDomColor(widget.image);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return mainColor == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            width: size.width,
            height: 160.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.image,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                filterQuality: FilterQuality.high,
                scale: 1.0,
              ),
              borderRadius: BorderRadius.circular(bigRadius),
              boxShadow: [
                BoxShadow(
                  color: mainColor!.withOpacity(0.5),
                  blurRadius: 40,
                  offset: Offset(0, 15.h),
                ),
              ],
            ),
          );
  }
}
