import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/presentation/ui/screens/login_screen.dart';
import 'Data/services/auth/config/config.dart';
import 'presentation/ui/home_page.dart';
import 'presentation/utils/app_observer.dart';
import 'presentation/utils/navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureApp();
  runApp(ProviderScope(observers: [Logger()], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator.key,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
