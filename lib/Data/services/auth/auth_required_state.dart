import 'package:flutter/material.dart';
import 'package:photo_app/presentation/ui/screens/login_screen.dart';
import 'package:photo_app/presentation/utils/navigator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRequiredState<T extends StatefulWidget>
    extends SupabaseAuthRequiredState<T> {
  @override
  void onUnauthenticated() {
    context.navigate(const LoginScreen());
  }
}
