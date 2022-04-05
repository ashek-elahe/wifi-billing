import 'dart:async';
import 'package:real_state/localization/app_localization.dart';
import 'package:real_state/provider/customer_provider.dart';
import 'package:real_state/provider/package_provider.dart';
import 'package:real_state/provider/auth_provider.dart';
import 'package:real_state/provider/localization_provider.dart';
import 'package:real_state/provider/onboarding_provider.dart';
import 'package:real_state/provider/profile_provider.dart';
import 'package:real_state/provider/theme_provider.dart';
import 'package:real_state/theme/dark_theme.dart';
import 'package:real_state/theme/light_theme.dart';
import 'package:real_state/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<OnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<LocalizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CustomerProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<PackageProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wifi Billing',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      locale: Provider.of<LocalizationProvider>(context).locale,
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('bn', 'BD'),
      ],
      home: SplashScreen(),
    );
  }
}
