import 'package:dio/dio.dart';
import 'package:employee_test/app/core/utils/dio_logging_interceptor.dart';
import 'package:employee_test/app/features/data/datasource/login_remote.dart';
import 'package:employee_test/app/features/data/datasource/user_remote.dart';
import 'package:employee_test/app/features/data/repositories/login_repository_impl.dart';
import 'package:employee_test/app/features/data/repositories/user_repository_impl.dart';
import 'package:employee_test/app/features/domain/repositories/login_repository.dart';
import 'package:employee_test/app/features/domain/repositories/user_repository.dart';
import 'package:employee_test/app/features/domain/usecase/login_usecase.dart';
import 'package:employee_test/app/features/domain/usecase/users_usecase.dart';
import 'package:employee_test/app/features/presentation/cubit/create_user/create_user_cubit.dart';
import 'package:employee_test/app/features/presentation/cubit/get_all_users/get_all_users_cubit.dart';
import 'package:employee_test/app/features/presentation/cubit/get_one_user/get_one_user_cubit.dart';
import 'package:employee_test/app/features/presentation/cubit/login/login_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // dio logging
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(DioLoggingInterceptor());
    return dio;
  });

  // remote
  sl.registerLazySingleton<LoginRemote>(() => LoginRemoteImpl(sl()));
  sl.registerLazySingleton<UserRemote>(() => UserRemoteImpl(sl()));

  // repository
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // usecase
  sl.registerLazySingleton<LoginUsercase>(() => LoginUsercase(sl()));
  sl.registerLazySingleton<UsersUsecase>(() => UsersUsecase(sl()));

  // cubit
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  sl.registerFactory<GetAllUsersCubit>(() => GetAllUsersCubit(sl()));
  sl.registerFactory<CreateUserCubit>(() => CreateUserCubit(sl()));
  sl.registerFactory<GetOneUserCubit>(() => GetOneUserCubit(sl()));
}
