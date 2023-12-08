import 'package:dio/dio.dart';
import 'package:employee_test/app/core/params/login_params.dart';
import 'package:employee_test/app/features/data/model/login_model.dart';

abstract class LoginRemote {
  Future<LoginModel> login({LoginParams? params});
}

class LoginRemoteImpl implements LoginRemote {
  late Dio _dio;
  LoginRemoteImpl(this._dio);
  @override
  Future<LoginModel> login({LoginParams? params}) async {
    final response = await _dio.post("login", data: params!.toJson());
    if (response.statusCode == 200) {
      return LoginModel.fromJson(response.data);
    }
    throw DioException(requestOptions: response.requestOptions);
  }
}
