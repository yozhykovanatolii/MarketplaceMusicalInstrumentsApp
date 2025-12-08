import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:marketplace_musical_instruments_app/core/navigation/app_router.dart';
import 'package:marketplace_musical_instruments_app/core/theme/app_theme.dart';
import 'package:marketplace_musical_instruments_app/di/dependencies.dart';
import 'package:marketplace_musical_instruments_app/firebase_options.dart';
import 'package:marketplace_musical_instruments_app/generated/l10n.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/author_listing/author_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_overview/booking_overview_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/booking_save/booking_save_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/favourite_listings/favourite_listings_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/listing/listing_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/reset_password/reset_password_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/review/review_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/save_listing/save_listing_cubit.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/settings/settings_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://xwgraskemxbhjtgqrjxn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh3Z3Jhc2tlbXhiaGp0Z3FyanhuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgzNjI0MDIsImV4cCI6MjA3MzkzODQwMn0.8N39PRYkuu8vS0j69ucNSNblXDct7NBT7IrVqBpFK8c',
  );
  Dependencies.setupDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<LoginCubit>()),
        BlocProvider(create: (_) => GetIt.I<RegisterCubit>()),
        BlocProvider(create: (_) => GetIt.I<SaveListingCubit>()),
        BlocProvider(
          create: (_) =>
              GetIt.I<AppBloc>()..add(AppUserSubscriptionRequested()),
        ),
        BlocProvider(
          create: (_) => GetIt.I<ListingBloc>()..add(ListingInitializeEvent()),
        ),
        BlocProvider(
          create: (_) =>
              GetIt.I<FavouriteListingsBloc>()
                ..add(UserFavouriteListingsIdFetchEvent()),
        ),
        BlocProvider(create: (_) => GetIt.I<SettingsCubit>()..fetchSettings()),
        BlocProvider(create: (_) => GetIt.I<ResetPasswordCubit>()),
        BlocProvider(create: (_) => GetIt.I<EditProfileCubit>()),
        BlocProvider(create: (_) => GetIt.I<ReviewBloc>()),
        BlocProvider(create: (_) => GetIt.I<AuthorListingBloc>()),
        BlocProvider(create: (_) => GetIt.I<BookingSaveCubit>()),
        BlocProvider(create: (_) => GetIt.I<BookingOverviewBloc>()),
      ],
      child: const MarketplaceApp(),
    ),
  );
}

class MarketplaceApp extends StatelessWidget {
  const MarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.select(
      (SettingsCubit cubit) => cubit.state.isDarkMode,
    );
    final languageCode = context.select(
      (SettingsCubit cubit) => cubit.state.languageCode,
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppTheme.darkMode : AppTheme.lightMode,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(languageCode),
      routerConfig: AppRouter().router,
    );
  }
}
