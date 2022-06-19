class RegisterRequest {
  final String name;
  final String address;
  final String phoneNumber;
  final String email;
  final String username;
  final String password;

  RegisterRequest({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.username,
    required this.password,
  });

  Map<String, String> toJson() {
    return {
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'email': email,
      'username': username,
      'password': password,
    };
  }
}
