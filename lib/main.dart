import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/repository/providers/locators.dart';
import 'package:photo_app/presentation/helper/app_theme.dart';
import 'package:photo_app/presentation/ui/route/app_route.dart';
import 'package:photo_app/presentation/ui/screens/login_screen.dart';
import 'Data/services/auth/config/config.dart';
import 'presentation/ui/home_page.dart';
import 'presentation/utils/app_observer.dart';
import 'presentation/utils/navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(ProviderScope(observers: [Logger()], child: const MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    final appTheme = ref.watch(appThemeProvider);
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // navigatorKey: navigator.key,
      title: 'Flutter Demo',
      theme: appTheme.appTheme,
      // home: const LoginScreen(),
      routeInformationParser: appRouter.route.routeInformationParser,
      routerDelegate: appRouter.route.routerDelegate,
    );
  }
}
