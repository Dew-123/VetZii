import 'widgets/hourstabs_item_widget.dart';
import 'controller/book_appointment_controller.dart';
import 'models/hourstabs_item_model.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/core/app_export.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:mihan_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:mihan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class BookAppointmentScreen extends GetWidget<BookAppointmentController> {
  const BookAppointmentScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 9.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text(
                  "lbl_select_date".tr,
                  style: CustomTextStyles.titleMediumMedium,
                ),
              ),
              SizedBox(height: 14.v),
              _buildDatepickerDropdown(),
              SizedBox(height: 23.v),
              Padding(
                padding: EdgeInsets.only(left: 17.h),
                child: Text(
                  "lbl_select_hour".tr,
                  style: CustomTextStyles.titleLargeBluegray900,
                ),
              ),
              SizedBox(height: 16.v),
              _buildHoursTabs(),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildConfirm(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 56.v,
      leadingWidth: 47.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowDown,
        margin: EdgeInsets.only(
          left: 22.h,
          top: 11.v,
          bottom: 19.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "msg_book_apoointment".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotification,
          margin: EdgeInsets.fromLTRB(20.h, 18.v, 20.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildDatepickerDropdown() {
    return Obx(
      () => SizedBox(
        height: 269.v,
        width: 342.h,
        child: CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.single,
            firstDate: DateTime(DateTime.now().year - 5),
            lastDate: DateTime(DateTime.now().year + 5),
            selectedDayHighlightColor: Color(0XFFA8CE50),
            firstDayOfWeek: 0,
            weekdayLabelTextStyle: TextStyle(
              color: appTheme.blueGray700,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
            selectedDayTextStyle: TextStyle(
              color: Color(0XFFFFFFFF),
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
            dayTextStyle: TextStyle(
              color: appTheme.gray60002,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
            disabledDayTextStyle: TextStyle(
              color: appTheme.gray60002,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
            weekdayLabels: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
            dayBorderRadius: BorderRadius.circular(
              8.h,
            ),
          ),
          value: controller.selectedDatesFromCalendar1.value,
          onValueChanged: (dates) {
            controller.selectedDatesFromCalendar1.value = dates;
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildHoursTabs() {
    return Align(
      alignment: Alignment.center,
      child: Obx(
        () => Wrap(
          runSpacing: 8.v,
          spacing: 8.h,
          children: List<Widget>.generate(
            controller
                .bookAppointmentModelObj.value.hourstabsItemList.value.length,
            (index) {
              HourstabsItemModel model = controller
                  .bookAppointmentModelObj.value.hourstabsItemList.value[index];

              return HourstabsItemWidget(
                model,
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirm() {
    return CustomElevatedButton(
      text: "lbl_confirm".tr,
      margin: EdgeInsets.only(
        left: 50.h,
        right: 49.h,
        bottom: 42.v,
      ),
    );
  }
}
