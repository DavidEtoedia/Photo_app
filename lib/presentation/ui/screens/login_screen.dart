import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/services/auth/auth_state.dart';
import 'package:photo_app/Data/services/auth/supabase_services.dart';
import 'package:photo_app/presentation/helper/image_provider.dart';
import 'package:photo_app/presentation/helper/space_widget.dart';
import 'package:photo_app/presentation/ui/screens/widget/image_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends AuthState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BackGroundImage(
      image: const AssetImage(AppImages.unsplashBg),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: HookConsumer(
            builder: (context, ref, child) {
              final signIn = ref.watch(supaBaseProvider);
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Space(
                      70,
                    ),
                    Image.asset(
                      AppImages.unsplashLogo,
                      color: Colors.white,
                      // height: 100,
                      width: 250,
                    ),

                    const Space(
                      10,
                    ),
                    Text(
                        'Explore the world through collections\nof beautiful HD pictures',
                        style: Theme.of(context).textTheme.bodyText1),
                    const Space(450),
                    InkWell(
                      onTap: () {
                        signIn.googleSignIn();
                      },
                      child: Container(
                        height: 50,
                        width: 500,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [
                                0.6,
                                0.9,
                              ],
                              colors: [
                                Colors.indigo,
                                Colors.teal,
                              ],
                            )),
                        child: const Center(
                          child: Text('Sign In with Google',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                    // Button(
                    //   title: "Sign In",
                    //   onClick: () {
                    //     signIn.googleSignIn();
                    //   },
                    // ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
