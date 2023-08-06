import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:moleculas_ar/shared/theme/app_theme.dart';

class DevTopicWidget extends StatelessWidget {
  final List<Widget> devInfoList;

  const DevTopicWidget({
    Key? key,
    required this.devInfoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("developers".i18n()).title,
        SizedBox(height: 10.h),
        ListView.separated(
          itemCount: devInfoList.length,
          itemBuilder: (context, dev) => devInfoList[dev],
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 10.h),
        ),
      ],
    );
  }
}
