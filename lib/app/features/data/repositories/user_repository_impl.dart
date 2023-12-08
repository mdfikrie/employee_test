import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_test/app/core/error/failure.dart';
import 'package:employee_test/app/core/params/user_params.dart';
import 'package:employee_test/app/features/data/datasource/user_remote.dart';
import 'package:employee_test/app/features/data/model/user_model.dart';
import 'package:employee_test/app/features/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  late UserRemote _remote;
  UserRepositoryImpl(this._remote);
  @override
  Future<Either<Failure, UserParam>> createUser({UserParam? user}) async {
    try {
      final result = await _remote.createUser(param: user);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getAllUsers() async {
    try {
      final result = await _remote.getAllUsers();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getOneUser({int? id}) async {
    try {
      final result = await _remote.getOneUser(id: id);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(errorMessage: e.message));
    }
  }
}
