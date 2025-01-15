import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moleculas_ar/shared/theme/app_theme.dart';

class IconTextOutlinedButtonWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String? subTitle;
  final VoidCallback onPressed;

  const IconTextOutlinedButtonWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    this.subTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(20.r),
        minimumSize: Size.fromHeight(80.h),
        fixedSize: const Size.fromWidth(double.maxFinite),
        shadowColor: AppTheme.colors.shadow,
        backgroundColor: AppTheme.colors.background,
        foregroundColor: AppTheme.colors.primaryLight,
        elevation: 5,
        side: BorderSide(width: 1, color: AppTheme.colors.stroke),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      ),
      child: Row(children: [
        Image.asset(imagePath, height: 40.h, width: 40.w),
        SizedBox(width: 20.w),
        Expanded(
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(text: title, style: AppTheme.textStyles.itemTitle),
              if (subTitle != null)
                TextSpan(
                  text: "\n$subTitle",
                  style: AppTheme.textStyles.itemSubTitle,
                ),
            ]),
          ),
        ),
      ]),
    );
  }
}
