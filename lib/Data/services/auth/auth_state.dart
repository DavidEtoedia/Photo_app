import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverPod;
import 'package:photo_app/presentation/ui/home_page.dart';
import 'package:photo_app/presentation/ui/screens/login_screen.dart';
import 'package:photo_app/presentation/utils/navigator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void onUnauthenticated() {
    context.navigate(const LoginScreen());
  }

  @override
  void onAuthenticated(Session session) {
    print(session.user!.userMetadata.keys);
    context.navigate(const HomePage());
  }

  @override
  void onErrorAuthenticating(String message) {
    print('***** onErrorAuthenticating: $message');
  }

  @override
  void onPasswordRecovery(Session session) {
    // TODO: implement onPasswordRecovery
  }
}
