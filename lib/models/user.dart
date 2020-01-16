import 'package:flutter/cupertino.dart';

class User {
  bool isAdmin;
  bool isEnabled;
  String token;
  String userId;
  String userEmail;
  String entryId;

  User({
    @required this.isAdmin,
    @required this.isEnabled,
    @required this.token,
    @required this.userId,
    @required this.userEmail,
    @required this.entryId,
  });
}
