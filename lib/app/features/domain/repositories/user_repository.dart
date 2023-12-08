import 'package:dartz/dartz.dart';
import 'package:employee_test/app/core/error/failure.dart';
import 'package:employee_test/app/core/params/user_params.dart';
import 'package:employee_test/app/features/data/model/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserModel>>> getAllUsers();
  Future<Either<Failure, UserModel>> getOneUser({int? id});
  Future<Either<Failure, UserParam>> createUser({UserParam? user});
}
