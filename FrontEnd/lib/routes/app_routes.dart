import 'package:mihan_s_application1/presentation/clinic_map_page/clinic_map_page.dart';
import 'package:mihan_s_application1/presentation/main_menu_page/main_menu_page.dart';
import 'package:mihan_s_application1/presentation/my_appointments_page/my_appointments_page.dart';
import 'package:mihan_s_application1/presentation/splash_screen/splash_screen.dart';
import 'package:mihan_s_application1/presentation/splash_screen/binding/splash_binding.dart';
import 'package:mihan_s_application1/presentation/start_page_screen/start_page_screen.dart';
import 'package:mihan_s_application1/presentation/start_page_screen/binding/start_page_binding.dart';
import 'package:mihan_s_application1/presentation/pet_owner_login_screen/pet_owner_login_screen.dart';
import 'package:mihan_s_application1/presentation/pet_owner_login_screen/binding/pet_owner_login_binding.dart';
import 'package:mihan_s_application1/presentation/vet_login_screen/vet_login_screen.dart';
import 'package:mihan_s_application1/presentation/vet_login_screen/binding/vet_login_binding.dart';
import 'package:mihan_s_application1/presentation/user_sign_in_screen/user_sign_in_screen.dart';
import 'package:mihan_s_application1/presentation/user_sign_in_screen/binding/user_sign_in_binding.dart';
import 'package:mihan_s_application1/presentation/pet_owner_create_an_account_screen/pet_owner_create_an_account_screen.dart';
import 'package:mihan_s_application1/presentation/pet_owner_create_an_account_screen/binding/pet_owner_create_an_account_binding.dart';
import 'package:mihan_s_application1/presentation/vet_sign_in_screen/binding/vet_sign_in_binding.dart';
import 'package:mihan_s_application1/presentation/vet_sign_in_screen/vet_sign_in_screen.dart';
import 'package:mihan_s_application1/presentation/veterinarian_create_an_account_screen/veterinarian_create_an_account_screen.dart';
import 'package:mihan_s_application1/presentation/veterinarian_create_an_account_screen/binding/veterinarian_create_an_account_binding.dart';
import 'package:mihan_s_application1/presentation/user_profile_screen/user_profile_screen.dart';
import 'package:mihan_s_application1/presentation/user_profile_screen/binding/user_profile_binding.dart';
import 'package:mihan_s_application1/presentation/main_menu_container_screen/main_menu_container_screen.dart';
import 'package:mihan_s_application1/presentation/main_menu_container_screen/binding/main_menu_container_binding.dart';
import 'package:mihan_s_application1/presentation/clinic_page_vets_tab_container_screen/clinic_page_vets_tab_container_screen.dart';
import 'package:mihan_s_application1/presentation/clinic_page_vets_tab_container_screen/binding/clinic_page_vets_tab_container_binding.dart';
import 'package:mihan_s_application1/presentation/vet_acccount_page_about_tab_container_screen/vet_acccount_page_about_tab_container_screen.dart';
import 'package:mihan_s_application1/presentation/vet_acccount_page_about_tab_container_screen/binding/vet_acccount_page_about_tab_container_binding.dart';
import 'package:mihan_s_application1/presentation/book_appointment_screen/book_appointment_screen.dart';
import 'package:mihan_s_application1/presentation/book_appointment_screen/binding/book_appointment_binding.dart';
import 'package:mihan_s_application1/presentation/payment_page_screen/payment_page_screen.dart';
import 'package:mihan_s_application1/presentation/payment_page_screen/binding/payment_page_binding.dart';
import 'package:mihan_s_application1/presentation/notifications_no_screen/notifications_no_screen.dart';
import 'package:mihan_s_application1/presentation/notifications_no_screen/binding/notifications_no_binding.dart';
import 'package:mihan_s_application1/presentation/notifications_have_screen/notifications_have_screen.dart';
import 'package:mihan_s_application1/presentation/notifications_have_screen/binding/notifications_have_binding.dart';
import 'package:mihan_s_application1/presentation/adoption_and_rehoming_screen/adoption_and_rehoming_screen.dart';
import 'package:mihan_s_application1/presentation/adoption_and_rehoming_screen/binding/adoption_and_rehoming_binding.dart';
import 'package:mihan_s_application1/presentation/rehoming_form_screen/rehoming_form_screen.dart';
import 'package:mihan_s_application1/presentation/rehoming_form_screen/binding/rehoming_form_binding.dart';
import 'package:mihan_s_application1/presentation/disease_prediction_start_screen/disease_prediction_start_screen.dart';
import 'package:mihan_s_application1/presentation/disease_prediction_start_screen/binding/disease_prediction_start_binding.dart';
import 'package:mihan_s_application1/presentation/disease_prediction_enter_symptoms_screen/disease_prediction_enter_symptoms_screen.dart';
import 'package:mihan_s_application1/presentation/disease_prediction_enter_symptoms_screen/binding/disease_prediction_enter_symptoms_binding.dart';
import 'package:mihan_s_application1/presentation/disease_prediction_results_screen/disease_prediction_results_screen.dart';
import 'package:mihan_s_application1/presentation/disease_prediction_results_screen/binding/disease_prediction_results_binding.dart';
import 'package:mihan_s_application1/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:mihan_s_application1/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import '../presentation/book_appointment_confrm_dialog/binding/book_appointment_confrm_controller_binding.dart';
import '../presentation/book_appointment_confrm_dialog/book_appointment_confrm_dialog.dart';
import '../presentation/directory_clinic_page/directory_clinic_page.dart';
import '../presentation/forgot_password_one_screen/forgot_password_one_screen.dart';
import '../presentation/forgot_password_one_screen/binding/forgot_password_one_binding.dart';
import '../presentation/forgot_password_two_screen/forgot_password_two_screen.dart';
import '../presentation/forgot_password_two_screen/binding/forgot_password_two_binding.dart';
import '../presentation/forgot_password_three_screen/forgot_password_three_screen.dart';
import '../presentation/forgot_password_three_screen/binding/forgot_password_three_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String startPageScreen = '/start_page_screen';

  static const String petOwnerLoginScreen = '/pet_owner_login_screen';

  static const String vetLoginScreen = '/vet_login_screen';

  static const String userSignInScreen = '/user_sign_in_screen';

  static const String petOwnerCreateAnAccountScreen =
      '/pet_owner_create_an_account_screen';

  static const String veterinarianCreateAnAccountScreen =
      '/veterinarian_create_an_account_screen';

  static const String vetSignIn='/vet_sign_in__screen';

  static const String userProfileScreen = '/user_profile_screen';

  static const String mainMenuPage = '/main_menu_page';

  static const String mainMenuContainerScreen = '/main_menu_container_screen';

  static const String clinicMapPage = '/clinic_map_page';

  static const String directoryClinicPage = '/directory_clinic_page';

  static const String clinicPage = '/clinic_page';

  static const String clinicPageVetsPage = '/clinic_page_vets_page';

  static const String clinicPageVetsTabContainerScreen =
      '/clinic_page_vets_tab_container_screen';

  static const String directoryVetsPage = '/directory_vets_page';

  static const String vetAcccountPageBookPage = '/vet_acccount_page_book_page';

  static const String vetAcccountPageAboutPage =
      '/vet_acccount_page_about_page';

  static const String vetAcccountPageAboutTabContainerScreen =
      '/vet_acccount_page_about_tab_container_screen';

  static const String vetAcccountPageReviewsPage =
      '/vet_acccount_page_reviews_page';

  static const String bookAppointmentScreen = '/book_appointment_screen';
  static const String bookAppointmentConfirmDialog = '/book_appointment_confirm_dialog';

  static const String paymentPageScreen = '/payment_page_screen';

  static const String myAppointmentsPage = '/my_appointments_page';

  static const String notificationsNoScreen = '/notifications_no_screen';

  static const String notificationsHaveScreen = '/notifications_have_screen';

  static const String adoptionAndRehomingScreen =
      '/adoption_and_rehoming_screen';

  static const String rehomingFormScreen = '/rehoming_form_screen';

  static const String diseasePredictionStartScreen =
      '/disease_prediction_start_screen';

  static const String diseasePredictionEnterSymptomsScreen =
      '/disease_prediction_enter_symptoms_screen';

  static const String diseasePredictionResultsScreen =
      '/disease_prediction_results_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String forgotPasswordOneScreen = '/forgot_password_one_screen';

  static const String forgotPasswordTwoScreen = '/forgot_password_two_screen';

  static const String forgotPasswordThreeScreen =
      '/forgot_password_three_screen';


  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: startPageScreen,
      page: () => StartPageScreen(),
      bindings: [
        StartPageBinding(),
      ],
    ),
    GetPage(
      name: petOwnerLoginScreen,
      page: () => PetOwnerLoginScreen(),
      bindings: [
        PetOwnerLoginBinding(),
      ],
    ),
    GetPage(
      name: vetLoginScreen,
      page: () => VetLoginScreen(),
      bindings: [
        VetLoginBinding(),
      ],
    ),
    GetPage(
      name: vetSignIn,
      page: () => VetSignInScreen(),
      bindings: [
        VetSignInBinding(),
      ],
    ),
    GetPage(
      name: userSignInScreen,
      page: () => UserSignInScreen(),
      bindings: [
        UserSignInBinding(),
      ],
    ),
    GetPage(
      name: petOwnerCreateAnAccountScreen,
      page: () => PetOwnerCreateAnAccountScreen(),
      bindings: [
        PetOwnerCreateAnAccountBinding(),
      ],
    ),
    GetPage(
      name: veterinarianCreateAnAccountScreen,
      page: () => VeterinarianCreateAnAccountScreen(),
      bindings: [
        VeterinarianCreateAnAccountBinding(),
      ],
    ),
    GetPage(
      name: userProfileScreen,
      page: () => UserProfileScreen(),
      binding: UserProfileBinding() ,
    ),
    GetPage(
      name: mainMenuContainerScreen,
      page: () => MainMenuContainerScreen(),
      bindings: [
        MainMenuContainerBinding(),
      ],
    ),
    GetPage(
      name: clinicPageVetsTabContainerScreen,
      page: () => ClinicPageVetsTabContainerScreen(),
      bindings: [
        ClinicPageVetsTabContainerBinding(),
      ],
    ),
    GetPage(
      name: vetAcccountPageAboutTabContainerScreen,
      page: () => VetAcccountPageAboutTabContainerScreen(),
      bindings: [
        VetAcccountPageAboutTabContainerBinding(),
      ],
    ),
    GetPage(
      name: bookAppointmentScreen,
      page: () => BookAppointmentScreen(),
      bindings: [
        BookAppointmentBinding(),
      ],
    ),
    GetPage(
      name: paymentPageScreen,
      page: () => PaymentPageScreen(),
      bindings: [
        PaymentPageBinding(),
      ],
    ),
    GetPage(
      name: bookAppointmentConfirmDialog,
      page: () => BookAppointmentConfrmDialog(),
      bindings: [
        BookAppointmentConfirmBinding(),
      ],

    ),
    GetPage(
      name: notificationsNoScreen,
      page: () => NotificationsNoScreen(),
      bindings: [
        NotificationsNoBinding(),
      ],
    ),
    GetPage(
      name: notificationsHaveScreen,
      page: () => NotificationsHaveScreen(),
      bindings: [
        NotificationsHaveBinding(),
      ],
    ),
    GetPage(
      name: adoptionAndRehomingScreen,
      page: () => AdoptionAndRehomingScreen(),
      bindings: [
        AdoptionAndRehomingBinding(),
      ],
    ),
    GetPage(
      name: rehomingFormScreen,
      page: () => RehomingFormScreen(),
      bindings: [
        RehomingFormBinding(),
      ],
    ),
    GetPage(
      name: diseasePredictionStartScreen,
      page: () => DiseasePredictionStartScreen(),
      bindings: [
        DiseasePredictionStartBinding(),
      ],
    ),
    GetPage(
      name: diseasePredictionEnterSymptomsScreen,
      page: () => DiseasePredictionEnterSymptomsScreen(),
      bindings: [
        DiseasePredictionEnterSymptomsBinding(),
      ],
    ),
    GetPage(
      name: diseasePredictionResultsScreen,
      page: () => DiseasePredictionResultsScreen(),
      bindings: [
        DiseasePredictionResultsBinding(),
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
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),GetPage(
      name: forgotPasswordOneScreen,
      page: () => ForgotPasswordOneScreen(),
      bindings: [
        ForgotPasswordOneBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordTwoScreen,
      page: () => ForgotPasswordTwoScreen(),
      bindings: [
        ForgotPasswordTwoBinding(),
      ],
    ),
    GetPage(
      name: forgotPasswordThreeScreen,
      page: () => ForgotPasswordThreeScreen(),
      bindings: [
        ForgotPasswordThreeBinding(),
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
      page: () => ForgotPasswordOneScreen(),
      bindings: [
        ForgotPasswordOneBinding(),
      ],
    ),
    GetPage(
        name: AppRoutes.clinicMapPage
        , page: () => ClinicMapPage()
    ),
    GetPage(
        name: AppRoutes.directoryClinicPage
        , page: () => DirectoryClinicPage()
    ),
    GetPage(name: AppRoutes.myAppointmentsPage,
        page: () => MyAppointmentsPage()
    ),
    GetPage(
      name: mainMenuPage,
      page: () => MainMenuPage(name: 'TEST'),
      bindings: []
    )


  ];
}
