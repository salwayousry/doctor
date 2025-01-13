// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? profession;
  String? homeAddress;
  int? age;
  String? region;
  String? nationality;
  String? gender;

  UserProfileModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.profession,
    this.homeAddress,
    this.age,
    this.region,
    this.nationality,
    this.gender,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    profession: json["profession"],
    homeAddress: json["homeAddress"],
    age: json["age"],
    region: json["region"],
    nationality: json["nationality"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "profession": profession,
    "homeAddress": homeAddress,
    "age": age,
    "region": region,
    "nationality": nationality,
    "gender": gender,
  };
}
