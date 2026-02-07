import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/models/user_model.dart';

class HomeService {
  HomeService._();
  static final instance = HomeService._();
  factory HomeService() => instance;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  Future<void> getUserData() async {
    final user = auth.currentUser;
    if (user != null) {
      final data = await db.collection(FirebaseConstants.usersCollection).doc(user.uid).get();
      if (data.exists) {
        currentUser = UserModel.fromMap(data.data()!);
      }
    }
  }
}
