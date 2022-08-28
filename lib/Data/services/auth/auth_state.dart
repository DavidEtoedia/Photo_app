import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void onUnauthenticated() {
    context.go('/');
  }

  @override
  void onAuthenticated(Session session) {
    context.goNamed('home');
  }

  @override
  void onErrorAuthenticating(String message) {
    debugPrint('***** onErrorAuthenticating: $message');
  }

  @override
  void onPasswordRecovery(Session session) {
    // TODO: implement onPasswordRecovery
  }
}
