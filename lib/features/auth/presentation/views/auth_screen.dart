import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tdd_clean_architecture/core/localization/localization_extensions.dart';
import 'package:tdd_clean_architecture/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tdd_clean_architecture/features/auth/presentation/widgets/add_user_dialog.dart';
import 'package:tdd_clean_architecture/features/auth/presentation/widgets/loading_column.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController nameController = TextEditingController();

  void getUsers() {
    context.read<AuthCubit>().getUsers();
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is UserCreated) {
          getUsers();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is GettingUsers
              ? LoadingColumn(message: localization.fetchingUsers)
              : state is CreatingUser
                  ? LoadingColumn(message: localization.creatingUser)
                  : state is UsersLoaded
                      ? Center(
                          child: ListView.builder(
                            itemCount: state.users.length,
                            itemBuilder: (context, index) {
                              final user = state.users[index];
                              return ListTile(
                                leading: Image.network(user.avatar),
                                title: Text(user.name),
                                subtitle: Text(user.createdAt.substring(10)),
                              );
                            },
                          ),
                        )
                      : const SizedBox.shrink(),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await showDialog<void>(
                context: context,
                builder: (context) => AddUserDialog(
                  nameController: nameController,
                ),
              );
            },
            icon: const Icon(Icons.add),
            label: Text(localization.addUser),
          ),
        );
      },
    );
  }
}
