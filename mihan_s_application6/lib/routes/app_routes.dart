import 'package:get/get.dart';
import '../presentation/user_profile_container_screen/user_profile_container_screen.dart';
import '../presentation/user_profile_container_screen/binding/user_profile_container_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';

class AppRoutes {
  static const String userProfileContainerScreen =
      '/user_profile_container_screen';

  static const String userProfilePage = '/user_profile_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: userProfileContainerScreen,
      page: () => UserProfileContainerScreen(),
      bindings: [
        UserProfileContainerBinding(),
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
      page: () => UserProfileContainerScreen(),
      bindings: [
        UserProfileContainerBinding(),
      ],
    )
  ];
}
