import 'package:get/get.dart';

import '../modules/auto_policy/bindings/auto_policy_binding.dart';
import '../modules/auto_policy/views/auto_policy_view.dart';
import '../modules/canopy_login/bindings/canopy_login_binding.dart';
import '../modules/canopy_login/views/canopy_login_view.dart';
import '../modules/car_dashboard/bindings/car_dashboard_binding.dart';
import '../modules/car_dashboard/views/car_dashboard_view.dart';
import '../modules/car_details/bindings/car_details_binding.dart';
import '../modules/car_details/views/car_details_view.dart';
import '../modules/check_offer/bindings/check_offer_binding.dart';
import '../modules/check_offer/views/check_offer_view.dart';
import '../modules/connect_car/bindings/connect_car_binding.dart';
import '../modules/connect_car/views/connect_car_view.dart';
import '../modules/driver_licence/bindings/driver_licence_binding.dart';
import '../modules/driver_licence/views/driver_licence_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_policy/bindings/home_policy_binding.dart';
import '../modules/home_policy/views/home_policy_view.dart';
import '../modules/insurance_provider/bindings/insurance_provider_binding.dart';
import '../modules/insurance_provider/views/insurance_provider_view.dart';
import '../modules/life_policy/bindings/life_policy_binding.dart';
import '../modules/life_policy/views/life_policy_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/manual_vehical_details/bindings/manual_vehical_details_binding.dart';
import '../modules/manual_vehical_details/views/manual_vehical_details_view.dart';
import '../modules/my_family/bindings/my_family_binding.dart';
import '../modules/my_family/views/my_family_view.dart';
import '../modules/onboard/bindings/onboard_binding.dart';
import '../modules/onboard/views/onboard_view.dart';
import '../modules/policy_dashboard/bindings/policy_dashboard_binding.dart';
import '../modules/policy_dashboard/views/policy_dashboard_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/search_by_vin/bindings/search_by_vin_binding.dart';
import '../modules/search_by_vin/views/search_by_vin_view.dart';
import '../modules/set_mile_password/bindings/set_mile_password_binding.dart';
import '../modules/set_mile_password/views/set_mile_password_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/statement_notice/bindings/statement_notice_binding.dart';
import '../modules/statement_notice/views/statement_notice_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARD,
      page: () => const OnboardView(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: _Paths.STATEMENT_NOTICE,
      page: () => const StatementNoticeView(),
      binding: StatementNoticeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_POLICY,
      page: () => const HomePolicyView(),
      binding: HomePolicyBinding(),
    ),
    GetPage(
      name: _Paths.LIFE_POLICY,
      page: () => const LifePolicyView(),
      binding: LifePolicyBinding(),
    ),
    GetPage(
      name: _Paths.CONNECT_CAR,
      page: () => const ConnectCarView(),
      binding: ConnectCarBinding(),
    ),
    GetPage(
      name: _Paths.AUTO_POLICY,
      page: () => const AutoPolicyView(),
      binding: AutoPolicyBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_BY_VIN,
      page: () => const SearchByVinView(),
      binding: SearchByVinBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.POLICY_DASHBOARD,
      page: () => const PolicyDashboardView(),
      binding: PolicyDashboardBinding(),
    ),
    GetPage(
      name: _Paths.DRIVER_LICENCE,
      page: () => const DriverLicenceView(),
      binding: DriverLicenceBinding(),
    ),
    GetPage(
      name: _Paths.CAR_DETAILS,
      page: () => const CarDetailsView(),
      binding: CarDetailsBinding(),
    ),
    GetPage(
      name: _Paths.MANUAL_VEHICAL_DETAILS,
      page: () => const ManualVehicalDetailsView(),
      binding: ManualVehicalDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_OFFER,
      page: () => const CheckOfferView(),
      binding: CheckOfferBinding(),
    ),
    GetPage(
      name: _Paths.INSURANCE_PROVIDER,
      page: () => const InsuranceProviderView(),
      binding: InsuranceProviderBinding(),
    ),
    GetPage(
      name: _Paths.CAR_DASHBOARD,
      page: () => const CarDashboardView(),
      binding: CarDashboardBinding(),
    ),
    GetPage(
      name: _Paths.CANOPY_LOGIN,
      page: () => const CanopyLoginView(),
      binding: CanopyLoginBinding(),
    ),
    GetPage(
      name: _Paths.MY_FAMILY,
      page: () => const MyFamilyView(),
      binding: MyFamilyBinding(),
    ),
    GetPage(
      name: _Paths.SET_MILE_PASSWORD,
      page: () => const SetMilePasswordView(),
      binding: SetMilePasswordBinding(),
    ),
  ];
}
