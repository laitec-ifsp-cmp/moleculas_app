import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_theme.dart';

class DropdownWidget<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final bool disabled;

  const DropdownWidget({
    Key? key,
    required this.label,
    this.value,
    required this.items,
    this.onChanged,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      icon: const FittedBox(
          fit: BoxFit.scaleDown, child: Icon(Icons.expand_more)),
      menuMaxHeight: 200.r,
      itemHeight: kMinInteractiveDimension,
      iconEnabledColor: const Color(0xFFB3B3B3),
      decoration: InputDecoration(
        helperMaxLines: 1,
        hintMaxLines: 1,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
        fillColor: AppTheme.colors.background,
        isDense: true,
        filled: true,
        border: const OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
      style: AppTheme.textStyles.titleSmall,
      isDense: true,
      value: value,
      items: items,
      onChanged: disabled ? null : onChanged,
      hint: Text(disabled ? '- - -' : label),
    );
  }
}
