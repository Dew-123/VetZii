import 'package:get/get.dart';
import 'package:mihan_s_application1/Vet/lib/presentation/main_menu_veterinarina_page/main_menu_veterinarina_page.dart';
import 'package:mihan_s_application1/Vet/lib/presentation/pending_appointments_container_screen/pending_appointments_container_screen.dart';
import 'package:mihan_s_application1/Vet/lib/presentation/pending_appointments_container_screen/binding/pending_appointments_container_binding.dart';
import 'package:mihan_s_application1/Vet/lib/presentation/completed_appointments_screen/completed_appointments_screen.dart';
import 'package:mihan_s_application1/Vet/lib/presentation/completed_appointments_screen/binding/completed_appointments_binding.dart';
import 'package:mihan_s_application1/Vet/lib/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:mihan_s_application1/Vet/lib/presentation/app_navigation_screen/binding/app_navigation_binding.dart';

class AppRoutes {
  static const String mainMenuVeterinarinaPage = '/main_menu_veterinarina_page';

  static const String pendingAppointmentsContainerScreen =
      '/pending_appointments_container_screen';

  static const String pendingAppointmentsPage = '/pending_appointments_page';

  static const String completedAppointmentsScreen =
      '/completed_appointments_screen';

  static const String vetProfileScreen = '/vet_profile_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: pendingAppointmentsContainerScreen,
      page: () => PendingAppointmentsContainerScreen(),
      bindings: [
        PendingAppointmentsContainerBinding(),
      ],
    ),GetPage(
      name: mainMenuVeterinarinaPage,
      page: () => MainMenuVeterinarinaPage(),
    ),
    GetPage(
      name: completedAppointmentsScreen,
      page: () => CompletedAppointmentsScreen(),
      bindings: [
        CompletedAppointmentsBinding(),
      ],
    ),

    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => PendingAppointmentsContainerScreen(),
      bindings: [
        PendingAppointmentsContainerBinding(),
      ],
    )
  ];
}
