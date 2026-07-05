import 'package:clean_architacture/feature/user/domain/entities/sub_entities/address_sub_entity.dart';

class UserEntity {
  final String name;
  final String email;
  final AddressEntity address;
  final String phone;

  UserEntity({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
  });
}
