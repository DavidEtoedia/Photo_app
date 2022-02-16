import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/model/app_user.dart';
import 'package:photo_app/Data/model/liked_model.dart';
import 'package:photo_app/Data/repository/providers/locators.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class ApiService extends ChangeNotifier {
  final Ref ref;
  ApiService(this.ref);

  final clientt = inject.get<supabase.Supabase>();
  var authRedirectUri = 'io.supabase.flutterdemo://login-callback';

  Future googleSignIn() async {
    // final user = inject.get<User>();
    try {
      final res = await clientt.client.auth.signInWithProvider(
          supabase.Provider.google,
          options: supabase.AuthOptions(redirectTo: authRedirectUri));

      if (res == false) {
        print('user is not logged in');
      } else {
        // await clientt.client.from('images').update(
        //     {'id': user.id, 'image': 'david', 'created': 'clami'}).execute();
      }
      notifyListeners();
    } catch (e) {
      throw e.toString();
    }
  }

  Future googleSignOut() async {
    try {
      final res = await clientt.client.auth.signOut();

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

  Future<PostgrestResponse> postImages(
    List imageList,
    DateTime date,
  ) async {
    final user = clientt.client.auth.currentUser;

    try {
      final res = await clientt.client
          .from('profiles')
          .upsert(
              LikedImages(id: user!.id, url: imageList, created: date).toJson())
          .execute();

      notifyListeners();
      return res;
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

final supaBaseProvider = ChangeNotifierProvider(((ref) => ApiService(ref)));
