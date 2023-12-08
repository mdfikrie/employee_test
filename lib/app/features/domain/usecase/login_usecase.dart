import 'package:dartz/dartz.dart';
import 'package:employee_test/app/core/error/failure.dart';
import 'package:employee_test/app/core/params/login_params.dart';
import 'package:employee_test/app/features/data/model/login_model.dart';
import 'package:employee_test/app/features/domain/repositories/login_repository.dart';

class LoginUsercase {
  late LoginRepository _repository;
  LoginUsercase(this._repository);

  Future<Either<Failure, LoginModel>> login({LoginParams? param}) {
    return _repository.login(param);
  }
}
