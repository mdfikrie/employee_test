import 'package:dio/dio.dart';
import 'package:employee_test/app/core/params/user_params.dart';
import 'package:employee_test/app/features/data/model/user_model.dart';

abstract class UserRemote {
  Future<List<UserModel>> getAllUsers();
  Future<UserModel> getOneUser({int? id});
  Future<UserParam> createUser({UserParam? param});
}

class UserRemoteImpl implements UserRemote {
  late Dio _dio;
  UserRemoteImpl(this._dio);
  @override
  Future<UserParam> createUser({UserParam? param}) async {
    final response = await _dio.post("users", data: param!.toJson());
    if (response.statusCode == 201) {
      return UserParam.fromJson(response.data);
    }
    throw DioException(requestOptions: response.requestOptions);
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    final response = await _dio.get("users");
    if (response.statusCode == 200) {
      return (response.data["data"] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
    }
    throw DioException(requestOptions: response.requestOptions);
  }

  @override
  Future<UserModel> getOneUser({int? id}) async {
    final response = await _dio.get("users/$id");
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data["data"]);
    }
    throw DioException(requestOptions: response.requestOptions);
  }
}
