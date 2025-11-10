class OtpVerifiedResponse {
  final String status;
  final int statusCode;
  final String message;
  final OtpVerifiedData data;
  final List<dynamic> errors;

  OtpVerifiedResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory OtpVerifiedResponse.fromJson(Map<String, dynamic> json) {
    return OtpVerifiedResponse(
      status: json['status'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: OtpVerifiedData.fromJson(json['data'] ?? {}),
      errors: json['errors'] ?? [],
    );
  }
}

class OtpVerifiedData {
  final String type;
  final String accessToken;

  OtpVerifiedData({required this.type, required this.accessToken});

  factory OtpVerifiedData.fromJson(Map<String, dynamic> json) {
    return OtpVerifiedData(
      type: json['type'] ?? '',
      accessToken: json['accessToken'] ?? '',
    );
  }
}
