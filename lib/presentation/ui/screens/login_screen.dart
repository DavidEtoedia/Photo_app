import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/services/auth/auth_state.dart';
import 'package:photo_app/Data/services/auth/google_auth.dart';
import 'package:photo_app/presentation/helper/space_widget.dart';
import 'package:photo_app/presentation/ui/screens/widget/button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends AuthState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HookConsumer(
      builder: (context, ref, child) {
        final signIn = ref.watch(googleStateProvider);
        return Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const Space(300),
              Button(
                title: "Sign In",
                onClick: () {
                  signIn.googleSignIn();
                },
              ),
            ],
          ),
        );
      },
    ));
  }
}
