import 'package:flutter/material.dart';
import 'package:mihan_s_application1/Vet/lib/core/app_export_vet.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHomeErrorcontainer,
      activeIcon: ImageConstant.imgHomeErrorcontainer,
      type: BottomBarEnum.Homeerrorcontainer,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgTimeLimit34x34,
      activeIcon: ImageConstant.imgTimeLimit34x34,
      type: BottomBarEnum.Timelimit34x34,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgAudit,
      activeIcon: ImageConstant.imgAudit,
      type: BottomBarEnum.Audit,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgLock,
      activeIcon: ImageConstant.imgLock,
      type: BottomBarEnum.Lock,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89.v,
      decoration: BoxDecoration(
        color: appTheme.lightGreen500,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.h),
        ),
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                imagePath: bottomMenuList[index].icon,
                height: 34.adaptSize,
                width: 34.adaptSize,
              ),
              activeIcon: CustomImageView(
                imagePath: bottomMenuList[index].activeIcon,
                height: 20.v,
                width: 19.h,
                color: theme.colorScheme.errorContainer.withOpacity(1),
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Homeerrorcontainer,
  Timelimit34x34,
  Audit,
  Lock,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
