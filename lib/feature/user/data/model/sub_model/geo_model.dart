import 'package:clean_architacture/core/databases/api/end_points.dart';
import 'package:clean_architacture/feature/user/domain/entities/sub_entities/geo_sub_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({required super.lat, required super.lng});
  factory GeoModel.fromjson(Map<String, dynamic> json) {
    return GeoModel(lat: json[ApiKey.lat], lng: json[ApiKey.lng]);
  }

  Map<String, dynamic> tojson() {
    return {ApiKey.lat: lat, ApiKey.lng: lng};
  }
}
