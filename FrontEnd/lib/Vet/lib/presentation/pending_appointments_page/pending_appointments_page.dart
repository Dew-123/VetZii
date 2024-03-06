import 'package:mihan_s_application1/Vet/lib/widgets/app_bar/custom_app_bar.dart';
import 'package:mihan_s_application1/Vet/lib/widgets/app_bar/appbar_subtitle.dart';
import 'widgets/pendingappointments_item_widget.dart';
import 'models/pendingappointments_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mihan_s_application1/Vet/lib/core/app_export_vet.dart';
import 'controller/pending_appointments_controller.dart';
import 'models/pending_appointments_model.dart';

class PendingAppointmentsPage extends StatelessWidget {
  PendingAppointmentsPage({Key? key})
      : super(
          key: key,
        );

  PendingAppointmentsController controller =
      Get.put(PendingAppointmentsController(PendingAppointmentsModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              SizedBox(height: 17.v),
              _buildPendingAppointments(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarSubtitle(
        text: "msg_pending_appointments".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildPendingAppointments() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: Obx(
        () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 26.v,
            );
          },
          itemCount: controller.pendingAppointmentsModelObj.value
              .pendingappointmentsItemList.value.length,
          itemBuilder: (context, index) {
            PendingappointmentsItemModel model = controller
                .pendingAppointmentsModelObj
                .value
                .pendingappointmentsItemList
                .value[index];
            return PendingappointmentsItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
