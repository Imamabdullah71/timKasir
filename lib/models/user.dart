class UserModel {
  String id;
  String username;
  String name;
  String address;
  String email;
  String gender;
  String phone;
  String photo;
  String password;

  UserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.address,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id_user'],
      username: json['username'],
      name: json['nama'],
      address: json['alamat'],
      email: json['email'],
      gender: json['jenis_kelamin'],
      phone: json['no_hp'],
      photo: json['foto'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': id,
      'username': username,
      'nama': name,
      'alamat': address,
      'email': email,
      'jenis_kelamin': gender,
      'no_hp': phone,
      'foto': photo,
      'password': password,
    };
  }
}
