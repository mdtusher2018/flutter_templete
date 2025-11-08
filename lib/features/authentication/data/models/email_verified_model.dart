// features/authentication/data/models/user_verified_response.dart

class EmailVerifiedResponse {
  final String status;
  final int statusCode;
  final String message;
  final UserVerifiedData data;
  final List<dynamic> errors;

  EmailVerifiedResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory EmailVerifiedResponse.fromJson(Map<String, dynamic> json) {
    return EmailVerifiedResponse(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: UserVerifiedData.fromJson(json['data'] ?? {}),
      errors: json['errors'] ?? [],
    );
  }
}

class UserVerifiedData {
  final String type;
  final String accessToken;

  UserVerifiedData({required this.type, required this.accessToken});

  factory UserVerifiedData.fromJson(Map<String, dynamic> json) {
    return UserVerifiedData(
      type: json['type'] ?? '',
      accessToken: json['accessToken'] ?? '',
    );
  }
}
