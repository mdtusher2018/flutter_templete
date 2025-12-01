import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/config/router/app_router.dart';
import 'package:template/core/analytics_and_crashlytics/crashlytics/crashlytics_service.dart';
import '../../../../core/di/dependency_injection.dart';
import 'package:template/core/services/snackbar/snackbar_service.dart';
import 'package:template/core/services/storage/local_storage_service.dart';
import 'package:template/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  CrashlyticsService.initialize();

  LocalStorageService().init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snackBarService = ref.read(snackBarServiceProvider);
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      scaffoldMessengerKey: (snackBarService as SnackBarService).messengerKey,
      title: 'Template App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: router,
    );
  }
}
