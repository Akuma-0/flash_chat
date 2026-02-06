import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/core/models/user_model.dart';

class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();
  factory AuthService() => instance;
  final db = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    log('User signed up');
    final user = UserModel(
      name: name,
      email: email,
      uid: credential.user!.uid,
      profilePictureUrl: '',
    ).toMap();
    try {
      await firestore.collection("users").doc(credential.user!.uid).set(user);
      log('User profile created');
    } catch (e) {
      credential.user!.delete();
      throw Exception('Failed to create user profile');
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    log('User signed in');
  }
}
