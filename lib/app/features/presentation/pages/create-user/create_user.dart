import 'package:employee_test/app/core/params/user_params.dart';
import 'package:employee_test/app/features/data/model/user_model.dart';
import 'package:employee_test/app/features/presentation/cubit/create_user/create_user_cubit.dart';
import 'package:employee_test/app/features/presentation/cubit/get_all_users/get_all_users_cubit.dart';
import 'package:employee_test/app/features/presentation/pages/create-user/components/text_field_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  late TextEditingController _name;
  late TextEditingController _nickname;
  late TextEditingController _job;
  late TextEditingController _telp;
  late TextEditingController _email;
  late TextEditingController _site;

  @override
  void initState() {
    _name = TextEditingController();
    _nickname = TextEditingController();
    _job = TextEditingController();
    _telp = TextEditingController();
    _email = TextEditingController();
    _site = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _nickname.dispose();
    _job.dispose();
    _telp.dispose();
    _email.dispose();
    _site.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Contact"),
        actions: [
          BlocListener<CreateUserCubit, CreateUserState>(
            listener: (context, state) {
              if (state is CreateUserLoaded) {
                Fluttertoast.showToast(msg: "Create user successfull");

                context
                    .read<GetAllUsersCubit>()
                    .addUserLocal(user: state.user!.toUserModel());
                context.pop();
              } else if (state is CreateUserError) {
                Fluttertoast.showToast(msg: state.error ?? "Error unknown");
              }
            },
            child: TextButton(
              onPressed: () {
                final param = UserParam(
                  name: _name.text,
                  nickname: _nickname.text,
                  job: _job.text,
                  telp: _telp.text,
                  email: _email.text,
                  site: _site.text,
                );
                context.read<CreateUserCubit>().createUser(param: param);
              },
              child: const Text(
                "SAVE",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFieldWithIcon(
              controller: _name,
              label: "Name",
              icon: Icons.person,
            ),
            const SizedBox(height: 10),
            TextFieldWithIcon(
              controller: _nickname,
              label: "Nick Name",
              icon: Icons.person,
            ),
            const SizedBox(height: 10),
            TextFieldWithIcon(
              controller: _job,
              label: "Job",
              icon: Icons.business_center_rounded,
            ),
            const SizedBox(height: 10),
            TextFieldWithIcon(
              controller: _telp,
              label: "Telephone",
              icon: Icons.phone,
            ),
            const SizedBox(height: 10),
            TextFieldWithIcon(
              controller: _email,
              label: "Email",
              icon: Icons.email,
            ),
            const SizedBox(height: 10),
            TextFieldWithIcon(
              controller: _site,
              label: "Site Web",
              icon: Icons.web,
            ),
          ],
        ),
      ),
    );
  }
}
