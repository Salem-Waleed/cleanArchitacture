import 'package:clean_architacture/core/databases/api/end_points.dart';
import 'package:clean_architacture/feature/user/data/model/sub_model/geo_model.dart';
import 'package:clean_architacture/feature/user/domain/entities/sub_entities/address_sub_entity.dart';

class AdreessModel extends AddressEntity {
  AdreessModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  factory AdreessModel.fromjson(Map<String, dynamic> json) {
    return AdreessModel(
      street: json[ApiKey.street],
      suite: json[ApiKey.suite],
      city: json[ApiKey.city],
      zipcode: json[ApiKey.zipcode],
      geo: GeoModel.fromjson(json[ApiKey.geo]),
    );
  }

  Map<String, dynamic> tojson() {
    return {
      ApiKey.id: street,
      ApiKey.username: suite,
      ApiKey.name: city,
      ApiKey.email: zipcode,
      ApiKey.address: geo,
    };
  }
}
