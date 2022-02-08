import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/model/app_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class GoogleAuth extends ChangeNotifier {
  final Ref ref;
  GoogleAuth(this.ref);

  final client = supabase.Supabase.instance;
  var authRedirectUri = 'io.supabase.flutterdemo://login-callback';

  Future googleSignIn() async {
    try {
      final res = await client.client.auth.signInWithProvider(
          supabase.Provider.google,
          options: supabase.AuthOptions(redirectTo: authRedirectUri));

      if (res == false) {
        print('user is not logged in');
      } else {
        print('false');
      }
      notifyListeners();
    } catch (e) {
      throw e.toString();
    }
  }

  Future googleSignOut() async {
    try {
      final res = await client.client.auth.signOut();

      if (res.error == null) {
        print('an error occurred');
      } else {
        print('false');
      }
      notifyListeners();
    } catch (e) {
      throw e.toString();
    }
  }

//  Future<AppUser> getProfile(String id) async {
//     try {
//       final res = await a.Supabase.instance.client
//           .from('profiles')
//           .select('id,username,date')
//           .eq('id', id)
//           .single()
//           .execute();
//       final result = AppUser.fromJson(res.data);
//       print(result.id);
//       return result;
//     } on a.GotrueError catch (e) {
//       if (e.message.isEmpty || e.message.isNotEmpty) {
//         ErrorMsg result = ErrorMsg(e.message);
//         throw result;
//       } else {
//         throw e.toString();
//       }
//     }
//   }

}

final googleStateProvider = ChangeNotifierProvider(((ref) => GoogleAuth(ref)));
