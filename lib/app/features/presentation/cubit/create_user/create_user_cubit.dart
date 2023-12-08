import 'package:bloc/bloc.dart';
import 'package:employee_test/app/core/error/failure.dart';
import 'package:employee_test/app/core/params/user_params.dart';
import 'package:employee_test/app/features/domain/usecase/users_usecase.dart';
import 'package:equatable/equatable.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  late UsersUsecase _usersUsecase;
  CreateUserCubit(this._usersUsecase) : super(CreateUserInitial());

  void createUser({UserParam? param}) async {
    emit(CreateUserLoading());
    final result = await _usersUsecase.createUser(param: param);
    result.fold((e) {
      if (e is ServerFailure) {
        emit(CreateUserError(error: e.errorMessage));
      } else if (e is CacheFailure) {
        emit(CreateUserError(error: e.errorMessage));
      } else if (e is ConnectionFailure) {
        emit(CreateUserError(error: e.errorMessage));
      }
    }, (userResult) {
      emit(CreateUserLoaded(user: userResult));
    });
  }
}
