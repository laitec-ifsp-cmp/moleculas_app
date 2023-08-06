import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:moleculas_ar/shared/res/app_res.dart';
import 'package:moleculas_ar/shared/theme/app_theme.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRequiredDialog extends StatelessWidget {
  const PermissionRequiredDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("permission_required".i18n()).title,
      content: Text(
        "permission_required_description".i18n(),
        style: AppTheme.textStyles.summary,
      ),
      actions: [
        TextButton(
          onPressed: () {
            openAppSettings();
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24.w)
          ),
          child: Text(("app_info".i18n()).toUpperCase()).textButton,
        ),
      ],
      backgroundColor: AppTheme.colors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
    );
  }
}
