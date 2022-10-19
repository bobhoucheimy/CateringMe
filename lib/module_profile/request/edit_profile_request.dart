
import 'package:dio/dio.dart';

class UpdateProfileRequest {
  String? Name;
  String? PhoneNumber;
  String? BirthDate;
  MultipartFile? image;


  UpdateProfileRequest(
      {required this.Name, this.image ,this.BirthDate ,this.PhoneNumber});

  Map<String, dynamic> toJson() {
    return {
      'Name':Name,
      'PhoneNumber':PhoneNumber,
      'BirthDate':BirthDate,
      "image":image
    };
  }
}
