class SignupResponse {
  final String status;
  final int statusCode;
  final String message;
  final Data? data;
  final List<dynamic> errors;

  SignupResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    this.data,
    required this.errors,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      status: json['status'] as String,
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] ?? {}),
      errors: json['errors'] as List<dynamic>,
    );
  }
}

class Data {
  final String type;
  final String signUpToken;

  Data({required this.type, required this.signUpToken});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      type: json['type'] as String,
      signUpToken: json['signUpToken'] as String,
    );
  }
}
