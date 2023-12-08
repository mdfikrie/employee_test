import 'package:dartz/dartz.dart';
import 'package:employee_test/app/core/error/failure.dart';
import 'package:employee_test/app/core/params/user_params.dart';
import 'package:employee_test/app/features/data/model/user_model.dart';
import 'package:employee_test/app/features/domain/repositories/user_repository.dart';

class UsersUsecase {
  late UserRepository _repository;
  UsersUsecase(this._repository);

  Future<Either<Failure, List<UserModel>>> getAllUsers() {
    return _repository.getAllUsers();
  }

  Future<Either<Failure, UserModel>> getOneUser({int? id}) {
    return _repository.getOneUser(id: id);
  }

  Future<Either<Failure, UserParam>> createUser({UserParam? param}) {
    return _repository.createUser(user: param);
  }
}
