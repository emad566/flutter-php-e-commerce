import 'dart:convert';

import 'package:flutter_e_commerce/core/constants/app_chaches.dart';
import 'package:flutter_e_commerce/core/services/cache_helper.dart';

class LoginCachedModel{
  final String usersId;
  final String usersName;
  final String usersEmail;
  final String usersPhone;
  final String usersApprove;
  final String createdAt;
  final String updatedAt;

  const LoginCachedModel({
    required this.usersId,
    required this.usersName,
    required this.usersEmail,
    required this.usersPhone,
    required this.usersApprove,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LoginCachedModel.fromJson(){
    dynamic data = CacheHelper.getData(AppCaches.loginCached);
    data = jsonDecode(data);

    return LoginCachedModel(
      usersId: data['users_id'].toString(),
      usersName: data['users_name'].toString(),
      usersEmail: data['users_email'].toString(),
      usersPhone: data['users_phone'].toString(),
      usersApprove: data['users_approve'].toString(),
      createdAt: data['created_at'].toString(),
      updatedAt: data['updated_at'].toString(),
    );
  }
}