import 'package:clean_architacture/core/connection/network_info.dart';
import 'package:clean_architacture/core/errors/expentions.dart';
import 'package:clean_architacture/core/errors/failure.dart';
import 'package:clean_architacture/core/params/params.dart';
import 'package:clean_architacture/feature/user/data/data%20sourse/user_local_datasourse.dart';
import 'package:clean_architacture/feature/user/data/data%20sourse/user_remote_datesourse.dart';
import 'package:clean_architacture/feature/user/domain/entities/user_entity.dart';
import 'package:clean_architacture/feature/user/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDatesourse userRemoteDatesourse;
  final UserLocalDatasourse userLocalDatasourse;

  UserRepositoryImpl({
    required this.networkInfo,
    required this.userRemoteDatesourse,
    required this.userLocalDatasourse,
  });

  @override
  Future<Either<Failure, UserEntity>> getUser({
    required UserParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await userRemoteDatesourse.getUser(params);
        userLocalDatasourse.cachedUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        throw Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await userLocalDatasourse.getLastUser();
        return Right(localUser);
      } on CacheExeption catch (e) {
        throw Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
