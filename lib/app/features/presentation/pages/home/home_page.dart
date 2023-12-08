import 'package:employee_test/app/config/route.dart';
import 'package:employee_test/app/features/presentation/cubit/get_all_users/get_all_users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<GetAllUsersCubit>().getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
        builder: (context, state) {
          if (state is GetAllUsersLoaded) {
            return ListView.builder(
                itemCount: state.userList!.length,
                itemBuilder: (context, index) {
                  final user = state.userList![index];
                  final isStar = state.userStar!
                          .where((element) =>
                              element.toLowerCase() ==
                              user.firstName!.toLowerCase())
                          .toList()
                          .isNotEmpty
                      ? true
                      : false;
                  return ListTile(
                    onTap: () {
                      context.goNamed(Routes.detail_user, extra: user.id);
                    },
                    leading: CircleAvatar(
                      child: Text(user.firstName![0]),
                    ),
                    title: Text("${user.firstName} ${user.lastName}"),
                    subtitle: Text("${user.email}"),
                    trailing: isStar == true
                        ? IconButton(
                            onPressed: () {
                              context
                                  .read<GetAllUsersCubit>()
                                  .removeStar(name: user.firstName);
                            },
                            icon: const Icon(Icons.star))
                        : IconButton(
                            onPressed: () {
                              context
                                  .read<GetAllUsersCubit>()
                                  .addStar(name: user.firstName);
                            },
                            icon: const Icon(Icons.star_border)),
                  );
                });
          } else if (state is GetAllUsersError) {
            return Center(
              child: Text(state.error ?? "Error unknown"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(Routes.create_user);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
