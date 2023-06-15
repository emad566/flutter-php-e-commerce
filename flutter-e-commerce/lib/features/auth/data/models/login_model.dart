import 'dart:convert';

class LoginModel {
  final String usersId;
  final String usersName;
  final String usersEmail;
  final String usersPhone;
  final String usersApprove;
  final String createdAt;
  final String updatedAt;

  const LoginModel({
    required this.usersId,
    required this.usersName,
    required this.usersEmail,
    required this.usersPhone,
    required this.usersApprove,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LoginModel.fromMap(Map<String, dynamic> data) => LoginModel(
        usersId: data['users_id'] as String,
        usersName: data['users_name'] as String,
        usersEmail: data['users_email'] as String,
        usersPhone: data['users_phone'] as String,
        usersApprove: data['users_approve'] as String,
        createdAt: data['created_at'] as String,
        updatedAt: data['updated_at'] as String,
      );

  Map<String, dynamic> toMap() => {
        'users_id': usersId,
        'users_name': usersName,
        'users_email': usersEmail,
        'users_phone': usersPhone,
        'users_approve': usersApprove,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  /// Parses the string and returns the resulting Json object as [LoginModel].
  factory LoginModel.fromJson(String data) {
    return LoginModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoginModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
