import 'package:clean_architacture/core/databases/api/api_consumer.dart';
import 'package:clean_architacture/core/databases/api/end_points.dart';
import 'package:clean_architacture/core/params/params.dart';
import 'package:clean_architacture/feature/user/data/model/user_model.dart';

class UserRemoteDatesourse {
  final ApiConsumer api;

  UserRemoteDatesourse({required this.api});

  Future<UserModel> getUser(UserParams params)async{
    final response = await api.get('${EndPoints.baserUrl}/${params.id}');
    return UserModel.fromjson(response);
  }

}