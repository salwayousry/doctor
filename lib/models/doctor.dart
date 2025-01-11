import 'dart:io';

import 'package:file_picker/file_picker.dart';

class Doctor {
  String firstName;
  String lastName;
  String email;
  String password;
  String nationality;
  String work;
  String workAddress;
  String homeAddress;
  String bio;
  String sessionPrice;
  String sessionDuration;
  String specialties;
  PlatformFile? idOrPassport;
  PlatformFile? resume;
  PlatformFile? certificates;
  PlatformFile? ministryLicense;
  PlatformFile? associationMembership;

  Doctor({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.nationality,
    required this.work,
    required this.workAddress,
    required this.homeAddress,
    required this.bio,
    required this.sessionPrice,
    required this.sessionDuration,
    required this.specialties,
    this.idOrPassport,
    this.resume,
    this.certificates,
    this.ministryLicense,
    this.associationMembership,
  });

  Doctor.withoutSpeciality({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.nationality,
    required this.work,
    required this.workAddress,
    required this.homeAddress,
    required this.bio,
    required this.sessionPrice,
    required this.sessionDuration,
    this.idOrPassport,
    this.resume,
    this.certificates,
    this.ministryLicense,
    this.associationMembership,
  }) : specialties = '';

  // From JSON
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      nationality: json['nationality'],
      work: json['work'],
      workAddress: json['workAddress'],
      homeAddress: json['homeAddress'],
      bio: json['bio'],
      sessionPrice: json['sessionPrice'],
      sessionDuration: json['sessionDuration'],
      specialties: json['specialties'],
      idOrPassport: json['idOrPassport'] != null
          ? PlatformFile(
              path: json['idOrPassport'],
              name: '', // Default name if not available in JSON
              size: 0, // Default size if not available in JSON
            )
          : null,
      resume: json['resume'] != null
          ? PlatformFile(
              path: json['resume'],
              name: '', // Default name if not available in JSON
              size: 0, // Default size if not available in JSON
            )
          : null,
      certificates: json['certificates'] != null
          ? PlatformFile(
              path: json['certificates'],
              name: '', // Default name if not available in JSON
              size: 0, // Default size if not available in JSON
            )
          : null,
      ministryLicense: json['ministryLicense'] != null
          ? PlatformFile(
              path: json['ministryLicense'],
              name: '', // Default name if not available in JSON
              size: 0, // Default size if not available in JSON
            )
          : null,
      associationMembership: json['associationMembership'] != null
          ? PlatformFile(
              path: json['associationMembership'],
              name: '', // Default name if not available in JSON
              size: 0, // Default size if not available in JSON
            )
          : null,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'nationality': nationality,
      'work': work,
      'workAddress': workAddress,
      'homeAddress': homeAddress,
      'bio': bio,
      'sessionPrice': sessionPrice,
      'sessionDuration': sessionDuration,
      'specialties': specialties,
      'idOrPassport': idOrPassport?.path,
      'resume': resume?.path,
      'certificates': certificates?.path,
      'ministryLicense': ministryLicense?.path,
      'associationMembership': associationMembership?.path,
    };
  }
}
