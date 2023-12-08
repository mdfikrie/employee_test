import 'package:employee_test/app/features/presentation/cubit/get_one_user/get_one_user_cubit.dart';
import 'package:employee_test/app/features/presentation/pages/detail-user/components/card_detail.dart';
import 'package:employee_test/app/features/presentation/pages/detail-user/components/header_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailUserPage extends StatefulWidget {
  final int? id;
  const DetailUserPage({super.key, this.id});

  @override
  State<DetailUserPage> createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  @override
  void initState() {
    context.read<GetOneUserCubit>().getOneUser(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star_border),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: BlocBuilder<GetOneUserCubit, GetOneUserState>(
        builder: (context, state) {
          if (state is GetOneUserLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  HeaderDetail(
                    fullName:
                        "${state.user!.firstName} ${state.user!.lastName}",
                  ),
                  const SizedBox(height: 15),
                  const CardDetail(
                    label: "087700155523",
                    title: "Telephone",
                    icon: Icons.phone,
                  ),
                  const SizedBox(height: 15),
                  CardDetail(
                    label: "${state.user!.email}",
                    title: "Email",
                    icon: Icons.email,
                  ),
                ],
              ),
            );
          } else if (state is GetOneUserError) {
            return Center(
              child: Text(state.error ?? "Error unknown"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
