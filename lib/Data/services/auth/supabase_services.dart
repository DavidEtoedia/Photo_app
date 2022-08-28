import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_app/Data/model/liked_image_res.dart';
import 'package:photo_app/Data/model/liked_model.dart';
import 'package:photo_app/Data/repository/providers/locators.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class ApiService extends ChangeNotifier {
  final Ref ref;
  ApiService(this.ref);

  final clientt = inject.get<supabase.Supabase>();
  var authRedirectUri = 'io.supabase.flutterdemo://login-callback';

  LikedImages? _likedImages;
  List<Likes>? _likes;
  List<dynamic>? _urls;
  LikedImages? get likedData => _likedImages;
  List<dynamic>? get url => _urls;
  List<Likes>? get like => _likes;

  Future googleSignIn() async {
    // final user = inject.get<User>();
    try {
      final res = await clientt.client.auth.signInWithProvider(
          supabase.Provider.google,
          options: supabase.AuthOptions(redirectTo: authRedirectUri));

      if (res == false) {
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

      // if (res.error == null) {
      //   // print('an error occurred');
      // } else {
      //   print('false');
      // }
      notifyListeners();
      return res;
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

  // Future<PostgrestResponse> getImages() async {
  //   final user = clientt.client.auth.currentUser;

  //   try {
  //     final res = await clientt.client
  //         .from('profiles')
  //         .select('*')
  //         .eq('id', user!.id)
  //         .execute();
  //     _likes = List<Likes>.from(res.data.map((x) => Likes.fromJson(x)));
  //     print(_likes![0].url!.length);

  //     return res;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
}

final supaBaseProvider = ChangeNotifierProvider(((ref) => ApiService(ref)));
