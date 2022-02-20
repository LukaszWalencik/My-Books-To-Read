import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books_to_read/app/core/enums.dart';
import 'package:my_books_to_read/app/data/remote_data_sources/firebase_data_source.dart';
import 'package:my_books_to_read/app/features/login_page/cubit/login_cubit.dart';
import 'package:my_books_to_read/repositories/account_repositories.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AccountRepository(FirebaseDataSource())),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state.status == Status.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                  ),
                );
              }
            },
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.purple,
                title: const Text(
                  'My Books to Read',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              body: Container(
                color: Colors.black12,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            state.creatingAccount == false
                                ? 'Login'
                                : 'Sign in',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const Flexible(
                          child: SizedBox(
                            height: 50,
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.purple,
                              ),
                              hintText: 'Email',
                            ),
                          ),
                        ),
                        const Flexible(
                          child: SizedBox(
                            height: 15,
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.purple,
                              ),
                              hintText: 'Password',
                            ),
                          ),
                        ),
                        const Flexible(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                        Flexible(
                          child: ElevatedButton(
                              onPressed: state.creatingAccount
                                  ? () {
                                      context.read<LoginCubit>().signUp(
                                          emailController.text,
                                          passwordController.text);
                                    }
                                  : () {
                                      context.read<LoginCubit>().singIn(
                                          emailController.text,
                                          passwordController.text);
                                    },
                              child: Text(
                                state.creatingAccount == false
                                    ? 'Login'
                                    : 'Register',
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.purple)),
                        ),
                        const Flexible(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                        Flexible(
                          child: TextButton(
                            onPressed: () {
                              context
                                  .read<LoginCubit>()
                                  .createAccount(state.creatingAccount);
                            },
                            child: Text(state.creatingAccount == false
                                ? 'Create account'
                                : 'Already have account?'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
