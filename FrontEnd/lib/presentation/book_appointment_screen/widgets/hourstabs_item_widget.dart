import '../models/hourstabs_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';

// ignore: must_be_immutable
class HourstabsItemWidget extends StatelessWidget {
  HourstabsItemWidget(
    this.hourstabsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HourstabsItemModel hourstabsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 19.h,
          vertical: 12.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          hourstabsItemModelObj.tabVar!.value,
          style: TextStyle(
            color: (hourstabsItemModelObj.isSelected?.value ?? false)
                ? theme.colorScheme.onPrimaryContainer
                : appTheme.gray60002,
            fontSize: 14.fSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        selected: (hourstabsItemModelObj.isSelected?.value ?? false),
        backgroundColor: appTheme.gray50,
        selectedColor: theme.colorScheme.primary,
        shape: (hourstabsItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  8.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  8.h,
                ),
              ),
        onSelected: (value) {
          hourstabsItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
