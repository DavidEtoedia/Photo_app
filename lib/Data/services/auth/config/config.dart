import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:photo_app/Data/constant/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future configureApp() async {
  // init Supabase singleton

  await Supabase.initialize(
    url: Constants.supaBaseUrl,
    anonKey: Constants.supaBaseKey,
    authCallbackUrlHostname: 'login-callback',
    debug: true,
    localStorage: SecureLocalStorage(),
  );
  // Injector.appInstance.registerSingleton(() => supaBaseClient);
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
