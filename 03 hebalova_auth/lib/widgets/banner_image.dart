import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg_img.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
