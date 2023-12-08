import 'package:employee_test/app/config/route.dart';
import 'package:employee_test/app/core/params/login_params.dart';
import 'package:employee_test/app/features/presentation/cubit/login/login_cubit.dart';
import 'package:employee_test/app/features/presentation/pages/login/components/custom_form_field.dart';
import 'package:employee_test/app/features/presentation/pages/login/components/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _email;
  late TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController(text: "eve.holt@reqres.in");
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              CustomFormField(
                controller: _email,
                label: "Email",
              ),
              const SizedBox(height: 15),
              CustomFormField(
                controller: _password,
                label: "Password",
              ),
              const SizedBox(height: 15),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoaded) {
                    context.goNamed(Routes.home);
                    Fluttertoast.showToast(msg: "Login successfull");
                  } else if (state is LoginError) {
                    Fluttertoast.showToast(msg: state.error ?? "Error unknown");
                  }
                },
                child: LoginButton(
                  onTap: () {
                    final param = LoginParams(
                      email: _email.text,
                      password: _password.text,
                    );
                    context.read<LoginCubit>().login(params: param);
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
