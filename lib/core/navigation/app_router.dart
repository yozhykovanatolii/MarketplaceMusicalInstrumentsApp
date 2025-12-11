import 'package:go_router/go_router.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_routes.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/edit_profile/edit_profile_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/forgot_password/forgot_password_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/listing_detail/listing_detail_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/login/login_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/main/main_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_bookings/my_bookings_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/my_listings/my_listings_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/register/register_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/save_listing/save_listing_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/settings/settings_page.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/splash/splash_page.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._();

  AppRouter._();

  factory AppRouter() => _instance;

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splashPage,
    debugLogDiagnostics: true,
    routes: _getRoutes(),
  );

  static List<RouteBase> _getRoutes() {
    return [
      GoRoute(
        path: AppRoutes.splashPage,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.loginPage,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.registerPage,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPasswordPage,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.mainPage,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: AppRoutes.editProfilePage,
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.myListingsPage,
        builder: (context, state) => const MyListingsPage(),
      ),
      GoRoute(
        path: AppRoutes.myBookingsPage,
        builder: (context, state) => const MyBookingsPage(),
      ),
      GoRoute(
        path: AppRoutes.settingsPage,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: AppRoutes.listingsDetailPage,
        builder: (context, state) {
          final listing = state.extra as ListingEntity;
          return ListingDetailPage(listing: listing);
        },
      ),
      GoRoute(
        path: AppRoutes.saveListingPage,
        builder: (context, state) {
          final listing = state.extra as ListingEntity;
          return SaveListingPage(listing: listing);
        },
      ),
    ];
  }
}
