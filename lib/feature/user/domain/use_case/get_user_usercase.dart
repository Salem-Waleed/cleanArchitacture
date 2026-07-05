import 'package:clean_architacture/core/errors/failure.dart';
import 'package:clean_architacture/core/params/params.dart';
import 'package:clean_architacture/feature/user/domain/entities/user_entity.dart';
import 'package:clean_architacture/feature/user/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserUsercase {
  final UserRepository repository;

  GetUserUsercase({required this.repository});
  Future<Either<Failure, UserEntity>> call({required UserParams params}) {
    return repository.getUser(params: params);
  }
}
