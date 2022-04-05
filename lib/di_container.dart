import 'package:dio/dio.dart';
import 'package:real_state/data/repository/customer_repo.dart';
import 'package:real_state/data/repository/package_repo.dart';
import 'package:real_state/data/repository/auth_repo.dart';
import 'package:real_state/data/repository/language_repo.dart';
import 'package:real_state/data/repository/profile_repo.dart';
import 'package:real_state/provider/customer_provider.dart';
import 'package:real_state/provider/package_provider.dart';
import 'package:real_state/provider/auth_provider.dart';
import 'package:real_state/provider/localization_provider.dart';
import 'package:real_state/provider/onboarding_provider.dart';
import 'package:real_state/provider/profile_provider.dart';
import 'package:real_state/provider/theme_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:real_state/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => LanguageRepo());
  sl.registerLazySingleton(() => AuthRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => CustomerRepo());
  sl.registerLazySingleton(() => PackageRepo());
  sl.registerLazySingleton(() => ProfileRepo(dioClient: sl(), sharedPreferences: sl()));

  // Provider
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl()));
  sl.registerFactory(() => OnBoardingProvider());
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => CustomerProvider(attendanceRepo: sl()));
  sl.registerFactory(() => PackageProvider(packageRepo: sl()));
  sl.registerFactory(() => ProfileProvider(profileRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
