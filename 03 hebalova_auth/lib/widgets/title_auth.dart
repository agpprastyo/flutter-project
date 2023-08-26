import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_styles.dart';

class TitleAuth extends StatelessWidget {
  final String title;
  final String description;
  const TitleAuth({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles().altHeadingsH2,
            ),
            SizedBox(height: 10.h),
            Text(
              description,
              style: TextStyles().mainBodyRegular,
            ),
          ],
        ),
      ),
    );
  }
}
