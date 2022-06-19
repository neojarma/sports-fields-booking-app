class LoginResponse {
  final int code;
  final String message;

  LoginResponse({required this.code, required this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      code: json['code'],
      message: json['status'],
    );
  }
}
