// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {

  String userID;
  String userName;
  String email;
  bool isLogin;
  UserModel({
    required this.userID,
    required this.userName,
    required this.email,
    this.isLogin = false,
  });
}
