class UserModel {
  String name;
  String email;
  String uid;
  String profilePictureUrl;
  UserModel({
    required this.name,
    required this.email,
    required this.uid,
    required this.profilePictureUrl,
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      profilePictureUrl: map['profilePictureUrl'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
