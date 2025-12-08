import 'package:get_it/get_it.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/local/settings_shared_preference.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firebase_auth/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/booking_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/listing_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/review_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/storage/supabase_storage.dart';
import 'package:marketplace_musical_instruments_app/data/repository/auth_repository.dart';
import 'package:marketplace_musical_instruments_app/data/repository/booking_repository.dart';
import 'package:marketplace_musical_instruments_app/data/repository/geolocation_repository.dart';
import 'package:marketplace_musical_instruments_app/data/repository/listing_repository.dart';
import 'package:marketplace_musical_instruments_app/data/repository/review_repository.dart';
import 'package:marketplace_musical_instruments_app/data/repository/settings_repository.dart';
import 'package:marketplace_musical_instruments_app/data/repository/user_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_overview/booking_overview_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/settings/settings_cubit.dart';

class Dependencies {
  static final _getIt = GetIt.instance;

  static void setupDependencies() {
    _setupDataSources();
    _setupRepositories();
    _setupBloc();
  }

  static void _setupDataSources() {
    _setupFirestore();
    _getIt.registerSingleton<UserAuth>(UserAuth());
    _getIt.registerSingleton<SupabaseStorage>(SupabaseStorage());
    _getIt.registerSingleton<SettingsSharedPreference>(
      SettingsSharedPreference(),
    );
  }

  static void _setupFirestore() {
    _getIt.registerSingleton<UserFirestore>(UserFirestore());
    _getIt.registerSingleton<ListingFirestore>(ListingFirestore());
    _getIt.registerSingleton<BookingFirestore>(BookingFirestore());
    _getIt.registerSingleton<ReviewFirestore>(ReviewFirestore());
  }

  static void _setupRepositories() {
    final userFirestore = _getIt<UserFirestore>();
    final userAuth = _getIt<UserAuth>();
    final bookingFirestore = _getIt<BookingFirestore>();
    final listingFirestore = _getIt<ListingFirestore>();
    final supabaseStorage = _getIt<SupabaseStorage>();
    final reviewFirestore = _getIt<ReviewFirestore>();
    _getIt.registerFactory<GeolocationRepository>(
      () => GeolocationRepository(),
    );
    _getIt.registerFactory<SettingsRepository>(
      () => SettingsRepository(_getIt<SettingsSharedPreference>()),
    );
    _getIt.registerFactory<AuthRepository>(
      () => AuthRepository(userFirestore, userAuth),
    );
    _getIt.registerFactory<BookingRepository>(
      () => BookingRepository(bookingFirestore, userAuth, userFirestore),
    );
    _getIt.registerFactory<ListingRepository>(
      () => ListingRepository(
        supabaseStorage,
        listingFirestore,
        userAuth,
        userFirestore,
      ),
    );
    _getIt.registerFactory<UserRepository>(
      () => UserRepository(
        supabaseStorage,
        userFirestore,
        userAuth,
        listingFirestore,
      ),
    );
    _getIt.registerFactory<ReviewRepository>(
      () => ReviewRepository(
        userFirestore,
        listingFirestore,
        userAuth,
        reviewFirestore,
      ),
    );
  }

  static void _setupBloc() {
    final authRepository = _getIt<AuthRepository>();
    final userRepository = _getIt<UserRepository>();
    final bookingRepository = _getIt<BookingRepository>();
    final listingRepository = _getIt<ListingRepository>();
    final geolocationRepository = _getIt<GeolocationRepository>();
    _getIt.registerFactory<SettingsCubit>(
      () => SettingsCubit(_getIt<SettingsRepository>()),
    );
    _getIt.registerFactory<AppBloc>(
      () => AppBloc(userRepository),
    );
    _getIt.registerFactory<AuthorListingBloc>(
      () => AuthorListingBloc(listingRepository),
    );
    _getIt.registerFactory(
      () => BookingOverviewBloc(bookingRepository),
    );
    _getIt.registerFactory<BookingSaveCubit>(
      () => BookingSaveCubit(
        bookingRepository,
        userRepository,
      ),
    );
    _getIt.registerFactory<FavouriteListingsBloc>(
      () => FavouriteListingsBloc(
        userRepository,
      ),
    );
    _getIt.registerFactory<LoginCubit>(
      () => LoginCubit(authRepository),
    );
    _getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(
        userRepository,
        authRepository,
      ),
    );
    _getIt.registerFactory<ResetPasswordCubit>(
      () => ResetPasswordCubit(
        authRepository,
      ),
    );
    _getIt.registerFactory<ReviewBloc>(
      () => ReviewBloc(
        _getIt<ReviewRepository>(),
      ),
    );
    _getIt.registerFactory<SaveListingCubit>(
      () => SaveListingCubit(
        listingRepository,
        geolocationRepository,
      ),
    );
    _getIt.registerFactory<EditProfileCubit>(
      () => EditProfileCubit(
        userRepository,
        authRepository,
      ),
    );
    _getIt.registerFactory<ListingBloc>(
      () => ListingBloc(
        listingRepository,
        geolocationRepository,
      ),
    );
  }
}
