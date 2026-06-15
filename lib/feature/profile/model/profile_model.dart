class ProfileModel {
  bool? success;
  String? message;
  Data? data;

  ProfileModel({this.success, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? id;
  String? authId;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  Auth? auth;

  Data({
    this.id,
    this.authId,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.auth,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authId = json['authId'];
    name = json['name'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    auth = json['auth'] != null ? Auth.fromJson(json['auth']) : null;
  }
}

class Auth {
  String? email;
  String? status;
  String? role;

  Auth({this.email, this.status, this.role});

  Auth.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    status = json['status'];
    role = json['role'];
  }
}
