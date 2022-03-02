import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/presentation/ui/home_page.dart';
import 'package:photo_app/presentation/ui/route/error_page.dart';
import 'package:photo_app/presentation/ui/screens/login_screen.dart';
import 'package:photo_app/presentation/ui/screens/photo_by_id_screen.dart';
import 'package:photo_app/presentation/ui/screens/photo_by_tag_screen.dart';
import 'package:photo_app/presentation/ui/screens/profile_screen.dart';

final appRouterProvider = Provider((ref) {
  return AppRoute();
});

class AppRoute {
  final route = GoRouter(
    routes: [
      GoRoute(
          name: 'login',
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(key: state.pageKey, child: const LoginScreen());
          }),
      GoRoute(
          name: 'home',
          path: '/home',
          pageBuilder: (context, state) {
            return MaterialPage(key: state.pageKey, child: const HomePage());
          },
          routes: [
            GoRoute(
                name: 'profile',
                path: 'pro',
                pageBuilder: (context, state) {
                  return MaterialPage(
                      key: state.pageKey, child: const ProfileScreen());
                }),
            GoRoute(
                name: 'details',
                path: 'details/:id',
                pageBuilder: (context, state) {
                  final sam = state.params['id'];
                  return MaterialPage(
                      key: state.pageKey,
                      child: SinglePhotoView(
                        photoId: sam!,
                      ));
                },
                routes: [
                  GoRoute(
                    name: 'tags',
                    path: 'tags/:tid',
                    pageBuilder: (context, state) {
                      final sam = state.params['id'];
                      final tagA = state.params['tid'];
                      // final tagB = state.extra[]
                      return MaterialPage(
                          key: state.pageKey,
                          child: PhotoTagScreen(
                            sam!,
                            photoTag: tagA!,
                            description: state.extra as String,
                          ));
                    },
                  )
                ])
          ]),
    ],
    errorBuilder: (context, state) => ErrorPage(error: state.error!),
    debugLogDiagnostics: true,
  );
}
