class CreateUserModel {
  String? id;
  String email;
  String password;
  String address;

  CreateUserModel(this.id, {required this.email, required this.password, required this.address});
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'address': address,
    };
  }
}