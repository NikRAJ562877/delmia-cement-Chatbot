import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dalmiabot/pages/home_page.dart';

import 'package:dalmiabot/pages/login_page.dart';
import 'package:dalmiabot/pages/main/ai_bot_page.dart';

import 'package:dalmiabot/pages/register_page.dart';
import 'package:dalmiabot/pages/splash_page.dart';
import 'package:dalmiabot/values/app_constants.dart';
import 'package:dalmiabot/values/app_routes.dart';
import 'package:dalmiabot/values/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    authFlowType: AuthFlowType.pkce,
    url: 'https://vnnrlmwzcifgunkzasus.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZubnJsbXd6Y2lmZ3Vua3phc3VzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM3Nzk0OTksImV4cCI6MjAxOTM1NTQ5OX0.SpbWFYjpLNIGujE1w4UStca_R2YZwHFC_j7qEilvu-E',
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dalmia Cement',
      theme: AppTheme.themeData,
      initialRoute: AppRoutes.loading,
      navigatorKey: AppConstants.navigationKey,
      routes: {
        AppRoutes.loginScreen: (context) => const LoginPage(),
        AppRoutes.loading: (context) => const SplashPage(),
        AppRoutes.registerScreen: (context) => const RegisterPage(),
        AppRoutes.home: (context) => const homepage(),
        AppRoutes.bot: (context) => const AIBotScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
