import 'package:employee_test/app/config/injector.dart';
import 'package:employee_test/app/config/route.dart';
import 'package:employee_test/app/features/presentation/cubit/create_user/create_user_cubit.dart';
import 'package:employee_test/app/features/presentation/cubit/get_all_users/get_all_users_cubit.dart';
import 'package:employee_test/app/features/presentation/cubit/get_one_user/get_one_user_cubit.dart';
import 'package:employee_test/app/features/presentation/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => sl()),
        BlocProvider<GetAllUsersCubit>(create: (context) => sl()),
        BlocProvider<CreateUserCubit>(create: (context) => sl()),
        BlocProvider<GetOneUserCubit>(create: (context) => sl()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      title: "Employee App",
    );
  }
}
