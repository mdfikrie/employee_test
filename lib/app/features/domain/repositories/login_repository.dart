import 'package:dartz/dartz.dart';
import 'package:employee_test/app/core/error/failure.dart';
import 'package:employee_test/app/core/params/login_params.dart';
import 'package:employee_test/app/features/data/model/login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginModel>> login(LoginParams? params);
}
