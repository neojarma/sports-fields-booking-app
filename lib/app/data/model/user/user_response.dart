class UserResponse {
  String idUser;
  String name;
  String address;
  String phoneNumber;
  String email;
  String image;

  UserResponse({
    required this.idUser,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.image,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      idUser: json['idUser'],
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      image: json['imageProfile'].replaceAll('\n', ''),
    );
  }
}
