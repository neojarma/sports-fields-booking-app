class UserRequest {
  String idUser;
  String name;
  String address;
  String phoneNumber;
  String email;
  String image;

  UserRequest({
    required this.idUser,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'name': name,
      'address': address,
      'phone_number': phoneNumber,
      'email': email,
      'image': image,
    };
  }
}
