import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/widgets/AppBigText.dart';

import '../app_color/app_color.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool isResponsive;

  const AppButton({Key? key, this.isResponsive=false, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.only(left:isResponsive? 20.w :0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: isResponsive? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
        children: [
          isResponsive? AppBigText(text: text, size: 20, weight: FontWeight.w500, textColor: Colors.white, maxLine: 1) : Container(),
          Image.asset('img/button-one.png',)
        ],
      ),
    );
  }
}
