import 'package:clean_architacture/core/errors/failure.dart';
import 'package:clean_architacture/core/params/params.dart';
import 'package:clean_architacture/feature/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
    Future<Either<Failure,UserEntity>> getUser({required UserParams params});
}