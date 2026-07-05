import 'package:clean_architacture/core/databases/api/end_points.dart';
import 'package:clean_architacture/feature/user/data/model/sub_model/address_model.dart';
import 'package:clean_architacture/feature/user/data/model/sub_model/campony_model.dart';
import 'package:clean_architacture/feature/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String id;
  final String userName;
  final String website;
  final CamponyModel company;

  UserModel({
    required this.id,
    required this.userName,
    required super.name,
    required super.email,
    required super.address,
    required super.phone,
    required this.website,
    required this.company,
  });
  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      id: json[ApiKey.id],
      userName: json[ApiKey.username],
      name: json[ApiKey.name],
      email: json[ApiKey.email],
      address: AdreessModel.fromjson(json[ApiKey.address]),
      phone: json[ApiKey.phone],
      website: json[ApiKey.website],
      company: CamponyModel.fromJson(json[ApiKey.company]),
    );
  }

  Map<String, dynamic> tojson() {
    return {
      ApiKey.id: id,
      ApiKey.username: userName,
      ApiKey.name: name,
      ApiKey.email: email,
      ApiKey.address: address,
      ApiKey.phone: phone,
      ApiKey.website: website,
      ApiKey.company: company,
    };
  }
}
