import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';
import 'package:moleculas_ar/shared/widgets/dropdown_widget/dropdown_widget.dart';

import '../../theme/app_theme.dart';

class StringDropdownWidget extends StatelessWidget {
  final String label;
  final String? value;
  final List<String>? icons;
  final List<String> items;
  final void Function(String?)? onChanged;
  final bool disabled;

  const StringDropdownWidget({
    Key? key,
    required this.label,
    this.value,
    this.icons,
    required this.items,
    this.onChanged,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownWidget(
      label: label,
      disabled: disabled,
      value: value,
      onChanged: onChanged,
      items: items
          .asMap()
          .entries
          .map((option) => DropdownMenuItem<String>(
                value: option.value,
                child: Row(
                  children: [
                    if (icons != null && icons?[option.key] != "")
                      SvgPicture.asset(icons![option.key]),
                    if (icons != null && icons?[option.key] != "")
                      SizedBox(width: 10.r),
                    Text(
                      option.value.i18n(),
                      style: AppTheme.textStyles.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
