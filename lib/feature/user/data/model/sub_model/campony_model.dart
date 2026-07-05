import 'package:clean_architacture/core/databases/api/end_points.dart';

class CamponyModel {
  String name;
  String catchPhrase;
  String bs;

  CamponyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CamponyModel.fromJson(Map<String, dynamic> json) {
    return CamponyModel(
      name: json[ApiKey.name],
      catchPhrase: json[ApiKey.catchPhrase],
      bs: json[ApiKey.bs],
    );
  }

  Map<String, dynamic> toJson() {
    return {ApiKey.name: name, ApiKey.catchPhrase: catchPhrase, ApiKey.bs: bs};
  }
}
