import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/firebase_options.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/add_and_edit_listing/add_and_edit_listing_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/register/register_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/page/splash/splash_page.dart';
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
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => RegisterBloc()),
        BlocProvider(create: (_) => AddAndEditListingBloc()),
        BlocProvider(
          create: (_) => AppBloc()..add(AppUserSubscriptionRequested()),
        ),
      ],
      child: const MarketplaceApp(),
    ),
  );
}

class MarketplaceApp extends StatelessWidget {
  const MarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
