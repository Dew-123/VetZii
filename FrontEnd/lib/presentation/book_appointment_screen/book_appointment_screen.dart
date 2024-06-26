
import 'package:mihan_s_application1/http_req/serverHandling.dart';
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
import 'package:mihan_s_application1/http_req/appointment.dart';
import 'package:mihan_s_application1/dataHandling/data.dart';

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
                  "Select Date".tr,
                  style: CustomTextStyles.titleMediumMedium,
                ),
              ),
              SizedBox(height: 14.v),
              _buildDatepickerDropdown(),
              SizedBox(height: 23.v),
              Padding(
                padding: EdgeInsets.only(left: 17.h),
                child: Text(
                  "Select Hour".tr,
                  style: CustomTextStyles.titleLargeBluegray900,
                ),
              ),
              SizedBox(height: 16.v),
              _buildHoursTabs(),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildConfirm(context),
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
        text: "Book Appointment".tr,
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
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year + 1),
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


  Widget _buildHoursTabs() {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Wrap(
              runSpacing: 8.v,
              spacing: 8.h,
              children: List<Widget>.generate(
                controller.bookAppointmentModelObj.value.hourstabsItemList.value.length,
                    (index) {
                  HourstabsItemModel model = controller.bookAppointmentModelObj.value.hourstabsItemList.value[index];
                  return HourstabsItemWidget(
                    model,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildConfirm(BuildContext context) {
    return CustomElevatedButton(
      text: "Confirm".tr,
      margin: EdgeInsets.only(
        left: 50.h,
        right: 49.h,
        bottom: 42.v,
      ),
      onPressed: () => _getData(context),
    );
  }

  Future<void> _getData(BuildContext context) async {
    List<HourstabsItemModel> selectedItems = [];

    for (HourstabsItemModel model in controller.bookAppointmentModelObj.value.hourstabsItemList.value) {
      if (model.isSelected?.value == true) {
        selectedItems.add(model);
      }
    }
    List<String> selectedTimes = selectedItems.map((item) => item.tabVar?.value ?? "").toList();

    List<DateTime?> date = controller.selectedDatesFromCalendar1.value;
    var appointment = Appointment();
    String formattedDate = "${date[0]?.year}-${date[0]?.month.toString().padLeft(2, '0')}-${date[0]?.day.toString().padLeft(2, '0')}";
    var time = selectedTimes[0];
    var patientEmail = UserData.email;
    var petType = UserData.petType;
    var vetEmail =UserData.email_vet;


   await appointment.bookAppointment(formattedDate, time, patientEmail, petType, vetEmail);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: 314.h,
            padding: EdgeInsets.symmetric(
              horizontal: 45.h,
              vertical: 6.v,
            ),
            decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder48,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 25.v),
                Container(
                  height: 131.adaptSize,
                  width: 131.adaptSize,
                  padding: EdgeInsets.all(29.h),
                  decoration: AppDecoration.fillLightGreen.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder64,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheckmark,
                    height: 72.adaptSize,
                    width: 72.adaptSize,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(height: 36.v),
                Text(
                  "msg_congratulations".tr,
                  style: CustomTextStyles.titleLargeInterBluegray900,
                ),
                SizedBox(height: 9.v),
                SizedBox(
                  width: 222.h,
                  child: Text(
                    "Your appointment has been booked for $formattedDate at $time with Dr.${UserData.fullName_vet}\n"
                  "Clinic address:${UserData.addressOfTheClinic_vet}\n",
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumPoppinsGray60002.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
                SizedBox(height: 31.v),
                CustomElevatedButton(
                  height: 48.v,
                  text: "lbl_done".tr,
                  buttonStyle: CustomButtonStyles.fillPrimaryTL24,
                  buttonTextStyle: theme.textTheme.titleMedium!,
                  onPressed: (){
                    Get.offAllNamed(AppRoutes.mainMenuContainerScreen);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
    String msg ="Your appointment has been booked for $formattedDate at $time with Dr.${UserData.fullName_vet}\n"
        "Clinic address:${UserData.addressOfTheClinic_vet}\n";

    ServerHandling serverHandling = new ServerHandling();
    serverHandling.sendEmail(UserData.email,"Appointment booked",msg);


    Future.delayed(Duration(seconds: 100), ()=> {
      Navigator.pop(context)
    });
  }






}
