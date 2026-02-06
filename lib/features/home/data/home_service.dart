import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeService {
  HomeService._();
  static final instance = HomeService._();
  factory HomeService() => instance;
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
}
