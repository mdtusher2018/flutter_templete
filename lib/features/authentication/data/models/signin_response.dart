// features/authentication/data/models/login_response.dart

class SigninResponse {
  final String status;
  final int statusCode;
  final String message;
  final LoginData? data;
  final List<dynamic> errors;

  SigninResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory SigninResponse.fromJson(Map<String, dynamic> json) {
    return SigninResponse(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
      errors: json['errors'] ?? [],
    );
  }
}

class LoginData {
  final String accessToken;

  LoginData({required this.accessToken});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(accessToken: json['accessToken'] ?? '');
  }
}
