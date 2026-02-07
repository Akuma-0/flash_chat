import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/core/helpers/constants.dart';
import '../../../core/models/user_model.dart';

class SearchServices {
  SearchServices._();
  static final SearchServices instance = SearchServices._();
  factory SearchServices() => instance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<UserModel>> searchUsers(String query) async {
    final data = await _db
        .collection(FirebaseConstants.usersCollection)
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: '$query\uf8ff')
        .get();
    final res = data.docs.map((doc) => UserModel.fromMap(doc.data())).toList();
    return res;
  }
}
