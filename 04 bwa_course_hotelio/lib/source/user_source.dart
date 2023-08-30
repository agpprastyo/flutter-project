import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../config/session.dart';
import '../models/user.dart';

class UserSource {
  static Future<Map<String, dynamic>> signIn(
    String email,
    String password,
  ) async {
    Map<String, dynamic> response = {};
    try {
      final credential = await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        response['success'] = true;
        response['message'] = 'Sign In Success';
        String uid = credential.user!.uid;
        User? user = await getWhereId(uid);
        if (user != null) {
          Session.saveUser(user);
        }
      }
    } on auth.FirebaseAuthException catch (e) {
      response['success'] = false;

      if (e.code == 'user-not-found') {
        response['message'] = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        response['message'] = 'Wrong password provided for that user';
      } else {
        response['message'] = 'Sign in failed';
      }
    } catch (e) {
      response['success'] = false;
      response['message'] = 'An error occurred: $e';
    }
    return response;
  }

  static Future<User?> getWhereId(String id) async {
    DocumentReference<Map<String, dynamic>> ref =
        FirebaseFirestore.instance.collection('User').doc(id);
    DocumentSnapshot<Map<String, dynamic>> doc = await ref.get();

    if (doc.exists) {
      return User.fromJson(doc.data()!);
    } else {
      return null; // Return null or handle the case when the document doesn't exist
    }
  }
}
