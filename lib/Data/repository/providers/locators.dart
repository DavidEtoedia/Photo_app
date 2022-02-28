import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_app/Data/model/liked_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../constant/constant.dart';

final inject = GetIt.instance;

final supaBase = Supabase.instance;
final userr = Supabase.instance.client.auth.user();

Future<void> initialize() async {
  await configureApp();
  _initUser();
  _likedCollection();
}

/// get provider details and metaData
void _initUser() {
  inject.registerLazySingleton<User>(() => User(
      id: userr!.id,
      appMetadata: userr!.appMetadata,
      userMetadata: userr!.userMetadata,
      aud: userr!.aud,
      email: userr!.email,
      phone: userr!.phone,
      createdAt: userr!.createdAt,
      role: userr!.role,
      updatedAt: userr!.updatedAt));

  inject.registerLazySingleton<Supabase>(() => Supabase.instance);
}

void _likedCollection() {
  // final likeCol = supaBase.client.from('profiles').execute();
  inject.registerLazySingleton<LikedImages>(() => LikedImages());
}

//Supabase initialize setup

Future configureApp() async {
  // init Supabase singleton

  await Supabase.initialize(
    url: Constants.supaBaseUrl,
    anonKey: Constants.supaBaseKey,
    authCallbackUrlHostname: 'login-callback',
    debug: true,
    localStorage: SecureLocalStorage(),
  );
}

// user flutter_secure_storage to persist user session
class SecureLocalStorage extends LocalStorage {
  SecureLocalStorage()
      : super(
          initialize: () async {},
          hasAccessToken: () {
            const storage = FlutterSecureStorage();
            return storage.containsKey(key: supabasePersistSessionKey);
          },
          accessToken: () {
            const storage = FlutterSecureStorage();
            return storage.read(key: supabasePersistSessionKey);
          },
          removePersistedSession: () {
            const storage = FlutterSecureStorage();
            return storage.delete(key: supabasePersistSessionKey);
          },
          persistSession: (String value) {
            const storage = FlutterSecureStorage();
            return storage.write(key: supabasePersistSessionKey, value: value);
          },
        );
}
