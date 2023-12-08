import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_test/app/core/error/failure.dart';
import 'package:employee_test/app/core/params/login_params.dart';
import 'package:employee_test/app/features/data/datasource/login_remote.dart';
import 'package:employee_test/app/features/data/model/login_model.dart';
import 'package:employee_test/app/features/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  late LoginRemote _remote;
  LoginRepositoryImpl(this._remote);
  @override
  Future<Either<Failure, LoginModel>> login(LoginParams? params) async {
    try {
      final result = await _remote.login(params: params);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }
}
