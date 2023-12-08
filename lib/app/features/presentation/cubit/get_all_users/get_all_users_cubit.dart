import 'package:bloc/bloc.dart';
import 'package:employee_test/app/core/error/failure.dart';
import 'package:employee_test/app/features/data/model/user_model.dart';
import 'package:employee_test/app/features/domain/usecase/users_usecase.dart';
import 'package:equatable/equatable.dart';

part 'get_all_users_state.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  late UsersUsecase _usersUsecase;
  GetAllUsersCubit(this._usersUsecase) : super(GetAllUsersInitial());

  var userList = <UserModel>[];
  var userStar = <String>[];

  void getAllUsers() async {
    emit(GetAllUsersLoading());
    final result = await _usersUsecase.getAllUsers();
    result.fold((e) {
      if (e is ServerFailure) {
        emit(GetAllUsersError(error: e.errorMessage));
      } else if (e is CacheFailure) {
        emit(GetAllUsersError(error: e.errorMessage));
      } else if (e is ConnectionFailure) {
        emit(GetAllUsersError(error: e.errorMessage));
      }
    }, (userListResult) {
      userList = userListResult;
      emit(GetAllUsersLoaded(userList: userList, userStar: userStar));
    });
  }

  void addUserLocal({UserModel? user}) async {
    emit(GetAllUsersLoading());
    userList.add(user!);
    emit(GetAllUsersLoaded(userList: userList, userStar: userStar));
  }

  void addStar({String? name}) async {
    emit(GetAllUsersLoading());
    userStar.add(name!);
    emit(GetAllUsersLoaded(userList: userList, userStar: userStar));
  }

  void removeStar({String? name}) async {
    emit(GetAllUsersLoading());
    userStar
        .removeWhere((element) => element.toLowerCase() == name!.toLowerCase());
    emit(GetAllUsersLoaded(userList: userList, userStar: userStar));
  }
}
