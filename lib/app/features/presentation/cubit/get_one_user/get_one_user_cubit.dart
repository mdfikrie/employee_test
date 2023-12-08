import 'package:bloc/bloc.dart';
import 'package:employee_test/app/core/error/failure.dart';
import 'package:employee_test/app/features/data/model/user_model.dart';
import 'package:employee_test/app/features/domain/usecase/users_usecase.dart';
import 'package:equatable/equatable.dart';

part 'get_one_user_state.dart';

class GetOneUserCubit extends Cubit<GetOneUserState> {
  late UsersUsecase _usersUsecase;
  GetOneUserCubit(this._usersUsecase) : super(GetOneUserInitial());

  void getOneUser({int? id}) async {
    final result = await _usersUsecase.getOneUser(id: id);
    result.fold((e) {
      print(e);
      if (e is ServerFailure) {
        emit(GetOneUserError(error: e.errorMessage));
      } else if (e is CacheFailure) {
        emit(GetOneUserError(error: e.errorMessage));
      } else if (e is ConnectionFailure) {
        emit(GetOneUserError(error: e.errorMessage));
      }
    }, (userModelResult) {
      emit(GetOneUserLoaded(user: userModelResult));
    });
  }
}
