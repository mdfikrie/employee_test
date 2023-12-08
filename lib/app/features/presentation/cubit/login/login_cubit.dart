import 'package:bloc/bloc.dart';
import 'package:employee_test/app/core/error/failure.dart';
import 'package:employee_test/app/core/params/login_params.dart';
import 'package:employee_test/app/features/data/model/login_model.dart';
import 'package:employee_test/app/features/domain/usecase/login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  late LoginUsercase _loginUsecase;
  LoginCubit(this._loginUsecase) : super(LoginInitial());

  void login({LoginParams? params}) async {
    emit(LoginLoading());
    final result = await _loginUsecase.login(param: params);
    result.fold((e) {
      if (e is ServerFailure) {
        emit(LoginError(error: e.errorMessage));
      } else if (e is CacheFailure) {
        emit(LoginError(error: e.errorMessage));
      } else if (e is ConnectionFailure) {
        emit(LoginError(error: e.errorMessage));
      }
    }, (loginModelResult) {
      emit(LoginLoaded(login: loginModelResult));
    });
  }
}
