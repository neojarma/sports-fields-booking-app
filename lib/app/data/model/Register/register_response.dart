class RegisterResponse {
  int code;
  String message;

  RegisterResponse({
    required this.code,
    required this.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      code: json['code'],
      message: json['status'],
    );
  }
}
